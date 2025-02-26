﻿using BO.Models;
using DAO.OtherModel;
using DAO.ViewModel;
using Repository.IRepository;
using Repository.IRepositoyr;
using Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Service
{
    public class ObjectViewService : IObjectViewService
    {
        public IAnimalRepository animalRepo;
        public IFlockRepository flockRepo;
        public IIndividualRepository individualRepo;
        public IAnimalTypeRepository animalTypeRepo;
        public ICageRepository cageRepo;
        public IZooAreaRepository zooAreaRepo;
        public ITaskRepository taskRepo;
        public ITaskTypeRepository taskTypeRepo;
        public IAnimalCageRepository animalCageRepo;
        public IAnimalAssignRepository animalAssignRepo;
        public IAccountRepository accountRepo;
        public IUserRepository userRepo;
        public ITeamRepository teamRepo;
        public ILeaderAssignRepository leaderRepo;
        public IMemberAssignRepository memberRepo;
        public IReportRepository reportRepo;
        public IReportAttachmentRepository reportAttachmentRepo;
        public IApplicationRepository applicationRepo;
        public IApplicationTypeRepository applicationTypeRepo;
        public ObjectViewService(IAnimalRepository animalRepo, IAnimalTypeRepository animalTypeRepo, 
            ICageRepository cageRepo, IZooAreaRepository zooAreaRepo,
            ITaskRepository taskRepo, ITaskTypeRepository taskTypeRepo, IAnimalCageRepository animalCageRepo, IAnimalAssignRepository animalAssignRepo, 
            IFlockRepository flockRepo, IIndividualRepository individualRepo,
            IAccountRepository accountRepo, IUserRepository userRepo,
            ITeamRepository teamRepo, ILeaderAssignRepository leaderRepo, IMemberAssignRepository memberRepo,
            IReportRepository reportRepo, IReportAttachmentRepository reportAttachmentRepo,
            IApplicationRepository applicationRepo, IApplicationTypeRepository applicationTypeRepo)
        {
            this.animalRepo = animalRepo;
            this.animalTypeRepo = animalTypeRepo;
            this.cageRepo = cageRepo;
            this.zooAreaRepo = zooAreaRepo;
            this.taskRepo = taskRepo;
            this.taskTypeRepo = taskTypeRepo;
            this.animalCageRepo = animalCageRepo;
            this.animalAssignRepo = animalAssignRepo;
            this.flockRepo = flockRepo;
            this.individualRepo = individualRepo;
            this.accountRepo = accountRepo;
            this.userRepo = userRepo;
            this.teamRepo = teamRepo;
            this.leaderRepo = leaderRepo;
            this.memberRepo = memberRepo;
            this.reportRepo = reportRepo;
            this.reportAttachmentRepo = reportAttachmentRepo;
            this.applicationRepo = applicationRepo;
            this.applicationTypeRepo = applicationTypeRepo;
        }
        public async Task<List<AnimalView>> GetListAnimalView(List<Animal> animals)
        {
            List<AnimalView> result = new();
            foreach (var animal in animals)
            {
                result.Add(await GetAnimalView(animal));
            }
            return result;
        }
        public async Task<AnimalView> GetAnimalView(Animal animal)
        {
            AnimalTypeView animalType = new();
            animalType = await GetAnimalTypeView(animalTypeRepo.GetById((int)animal.AnimalTypeId));
            if(animal.Classify == "Flock")
            {
                FlockView flock = new();
                flock = await GetFlockView(await flockRepo.GetFlockByAnimalId((int)animal.Id));
                var result = animalRepo.ConvertAnimalIntoAnimalView(animal, animalType, flock, null);
                return result;
            }
            else if(animal.Classify == "Individual")
            {
                IndividualView individual = new();
                individual = await GetIndividualView(await individualRepo.GetIndividualByAnimalId((int)animal.Id));
                var result = animalRepo.ConvertAnimalIntoAnimalView(animal, animalType, null, individual);
                return result;
            }
            else
            {
                var result = animalRepo.ConvertAnimalIntoAnimalView(animal, animalType, null, null);
                return result;
            }
        }
        public async Task<FlockView> GetFlockView(Flock flock)
        {
            var result = flockRepo.ConvertFlockIntoFlockView(flock);
            return result;
        }
        public async Task<IndividualView> GetIndividualView(Individual individual)
        {
            var result = individualRepo.ConvertIndividualIntoIndividualView(individual);
            return result;
        }
        public async Task<List<AnimalTypeView>> GetListAnimalTypeView(List<AnimalType> animalTypes)
        {
            List<AnimalTypeView> result = new();
            foreach (var animalType in animalTypes)
            {
                result.Add(await GetAnimalTypeView(animalType));
            }
            return result;
        }
        public async Task<AnimalTypeView> GetAnimalTypeView(AnimalType animalType)
        {
            var result = animalTypeRepo.ConvertAnimalTypeIntoAnimalTypeView(animalType);
            return result;
        }
        public async Task<List<CageView>> GetListCageView(List<Cage> cages)
        {
            List<CageView> result = new List<CageView>();
            foreach(var cage in cages)
            {
                result.Add(await GetCageView(cage));
            }
            return result;
        }
        public async Task<CageView> GetCageView(Cage cage)
        {
            ZooAreaView zooArea = new();
            zooArea = await GetZooAreaView(zooAreaRepo.GetById((int)cage.ZooAreaId));
            var result = cageRepo.ConvertCageIntoCageView(cage, zooArea);
            return result;
        }
        public async Task<List<ZooAreaView>> GetListZooAreaView(List<ZooArea> zooAreas)
        {
            List<ZooAreaView> result = new List<ZooAreaView>();
            foreach (var zooArea in zooAreas)
            {
                result.Add(await GetZooAreaView(zooArea));
            }
            return result;
        }
        public async Task<ZooAreaView> GetZooAreaView(ZooArea zooArea)
        {
            var result = zooAreaRepo.ConvertZooAreaIntoZooAreaView(zooArea);
            return result;
        }
        public async Task<List<TaskView>> GetListTaskView(List<BO.Models.Task> tasks)
        {
            List<TaskView> result = new List<TaskView>();
            foreach(var task in tasks)
            {
                result.Add(await GetTaskView(task));
            }
            return result;
        }
        public async Task<TaskView> GetTaskView(BO.Models.Task task)
        {
            TaskTypeView taskType = new();
            taskType = await GetTaskTypeView(taskTypeRepo.GetById((int)task.TaskTypeId));
            var animalAssigns = await animalAssignRepo.GetListAnimalAssignByTaskId(task.Id);
            if(animalAssigns == null)
            {
                var resultTemp = taskRepo.ConvertTaskIntoTaskView(task, null,taskType);
                return resultTemp;
            }
            List<(AnimalView, CageView)> animalCageViews = new();
            List<AnimalCageTask> animalCageTasks = new();
            foreach (var animalAssign in animalAssigns)
            {
                var animalCage = animalCageRepo.GetById(animalAssign.AnimalCageId);
                animalCageViews.Add((await GetAnimalView(animalRepo.GetById(animalCage.AnimalId)), await GetCageView(cageRepo.GetById(animalCage.CageId))));
            }
            animalCageViews.OrderBy(l => l.Item2);
            AnimalCageTask animalCageTask = new();
            for (int i = 0; i < animalCageViews.Count; i++)
            {
                if (i > 0)
                {
                    if (animalCageViews[i].Item2.Id == animalCageViews[i - 1].Item2.Id)
                    {
                        animalCageTask.Animals.Add(animalCageViews[i].Item1);
                    }
                    else
                    {
                        animalCageTasks.Add(animalCageTask);
                        animalCageTask = new()
                        {
                            Cage = animalCageViews[i].Item2,
                            Animals = new()
                        };
                        animalCageTask.Animals.Add(animalCageViews[i].Item1);
                    }
                }
                else
                {
                    animalCageTask = new()
                    {
                        Cage = animalCageViews[i].Item2,
                        Animals = new()
                    };
                    animalCageTask.Animals.Add(animalCageViews[i].Item1);
                }
            }
            animalCageTasks.Add(animalCageTask);
            var result = taskRepo.ConvertTaskIntoTaskView(task, animalCageTasks, taskType);
            return result;
        }
        public async Task<List<TaskTypeView>> GetListTaskTypeView(List<TaskType> taskTypes)
        {
            List<TaskTypeView> result = new List<TaskTypeView>();
            foreach (var taskType in taskTypes)
            {
                result.Add(await GetTaskTypeView(taskType));
            }
            return result;
        }
        public async Task<TaskTypeView> GetTaskTypeView(TaskType taskType)
        {
            var result = taskTypeRepo.ConvertTaskTypeIntoTaskTypeView(taskType);
            return result;
        }
        public async Task<List<AccountView>> GetListAccountView(List<Account> accounts)
        {
            List<AccountView> result = new List<AccountView>();
            foreach (var account in accounts)
            {
                result.Add(await GetAccountView(account));
            }
            return result;
        }
        public async Task<AccountView> GetAccountView(Account account)
        {
            var result = accountRepo.ConvertAccountIntoAccountView(account);
            return result;
        }
        public async Task<UserView> GetUserView(User user)
        {
            var result = userRepo.ConvertUserIntoUserView(user);
            return result;
        }
        public async Task<List<TeamView>> GetListTeamView(List<Team> teams)
        {
            List<TeamView> result = new List<TeamView>();
            foreach (var team in teams)
            {
                result.Add(await GetTeamView(team));
            }
            return result;
        }
        public async Task<TeamView> GetTeamView(Team team)
        {
            var result = teamRepo.ConvertTeamIntoTeamView(team);
            return result;
        }
        public async Task<LeaderAssignView> GetLeaderAssignView(LeaderAssign leaderAssign)
        {
            TeamView team = new();
            team = await GetTeamView(teamRepo.GetById((int)leaderAssign.TeamId));
            UserView user = new();
            user = await GetUserView(userRepo.GetById((int)leaderAssign.LeaderId));
            var result = leaderRepo.ConvertLeaderAssignIntoLeaderAssignView(leaderAssign,team,user);
            return result;
        }
        public async Task<List<MemberAssignView>> GetListMemberAssignView(List<MemberAssign> memberAssigns)
        {
            List<MemberAssignView> result = new List<MemberAssignView>();
            foreach (var memberAssign in memberAssigns)
            {
                result.Add(await GetMemberAssignView(memberAssign));
            }
            return result;
        }
        public async Task<MemberAssignView> GetMemberAssignView(MemberAssign memberAssign)
        {
            TeamView team = new();
            team = await GetTeamView(teamRepo.GetById((int)memberAssign.TeamId));
            UserView user = new();
            user = await GetUserView(userRepo.GetById((int)memberAssign.MemberId));
            var result = memberRepo.ConvertMemberAssignIntoMemberAssignView(memberAssign, team, user);
            return result;
        }
        public async Task<List<ReportView>> GetListReportView(List<Report> reports)
        {
            List<ReportView> result = new List<ReportView>();
            foreach (var report in reports)
            {
                result.Add(await GetReportView(report));
            }
            return result;
        }
        public async Task<ReportView> GetReportView(Report report)
        {
            UserView sender = new();
            sender = await GetUserView(await userRepo.GetUserByAccountId((int)report.SenderId));
            UserView reciever = new();
            reciever = await GetUserView(await userRepo.GetUserByAccountId((int)report.ReceiverId));
            var attachs = await reportAttachmentRepo.GetListReportAttachmentByReportId(report.Id);
            List<string> fileUrl = reportAttachmentRepo.ConvertListReportAttachmentIntoListString(attachs);

            var result = reportRepo.ConvertReportIntoReportView(report, sender, reciever, fileUrl);
            return result;
        }
        public async Task<List<ApplicationView>> GetListApplicationView(List<Application> applications)
        {
            List<ApplicationView> result = new List<ApplicationView>();
            foreach (var application in applications)
            {
                result.Add(await GetApplicationView(application));
            }
            return result;
        }
        public async Task<ApplicationView> GetApplicationView(Application application)
        {
            UserView sender = new();
            sender = await GetUserView(await userRepo.GetUserByAccountId((int)application.SenderId));
            UserView reciever = new();
            reciever = await GetUserView(await userRepo.GetUserByAccountId((int)application.RecieverId));
            ApplicationTypeView applicationType = new();
            applicationType = await GetApplicationTypeView(applicationTypeRepo.GetById(application.Id));

            var result = applicationRepo.ConvertApplicationIntoApplicationView(application, sender, reciever, applicationType);
            return result;
        }
        public async Task<List<ApplicationTypeView>> GetListApplicationTypeView(List<ApplicationType> applicationTypes)
        {
            List<ApplicationTypeView> result = new List<ApplicationTypeView>();
            foreach (var applicationType in applicationTypes)
            {
                result.Add(await GetApplicationTypeView(applicationType));
            }
            return result;
        }
        public async Task<ApplicationTypeView> GetApplicationTypeView(ApplicationType applicationType)
        {
            var result = applicationTypeRepo.ConvertApplicationTypeIntoApplicationTypeView(applicationType);
            return result;
        }
    }
}
