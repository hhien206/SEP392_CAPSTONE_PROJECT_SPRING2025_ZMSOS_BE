﻿using DAO.AddModel;
using DAO.UpdateModel;
using DAO.ViewModel;
using Repository.IRepositoyr;
using Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Service
{
    public class ScheduleService : IScheduleService
    {
        public IScheduleRepository repo;
        public IUserRepository userRepo;
        public ScheduleService(IScheduleRepository repo, IUserRepository userRepo)
        {
            this.repo = repo;
            this.userRepo = userRepo;
        }
        public async Task<ServiceResult> GetListScheduleByAccountId(int accountId)
        {
            try
            {
                var schedules = await repo.GetListScheduleByAccountId(accountId);
                if (schedules == null)
                {
                    return new ServiceResult
                    {
                        Status = 404,
                        Message = "Not Found!",
                    };
                }

                List<UserView> users = new List<UserView>();
                for (int i = 0; i < schedules.Count; i++)
                {
                    UserView user = new();
                    user.ConvertUserIntoUserView(await userRepo.GetUserByAccountId((int)schedules[i].AccountId));
                    users.Add(user);
                }

                var result = repo.ConvertListScheduleIntoListScheduleView(schedules, users);
                return new ServiceResult
                {
                    Status = 200,
                    Message = "Schedules",
                    Data = result
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult
                {
                    Status = 501,
                    Message = ex.ToString(),
                };
            }
        }
        public async Task<ServiceResult> GetScheduleById(int id)
        {
            try
            {
                var schedule = repo.GetById(id);
                if (schedule == null)
                {
                    return new ServiceResult
                    {
                        Status = 404,
                        Message = "Not Found!",
                    };
                }
                UserView user = new();
                user.ConvertUserIntoUserView(await userRepo.GetUserByAccountId((int)schedule.AccountId));
                var result = repo.ConvertScheduleIntoScheduleView(schedule, user);
                return new ServiceResult
                {
                    Status = 200,
                    Message = "Schedule",
                    Data = result
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult
                {
                    Status = 501,
                    Message = ex.ToString(),
                };
            }
        }
        public async Task<ServiceResult> AddSchedule(ScheduleAdd key)
        {
            try
            {
                var schedule = await repo.AddSchedule(key);
                return new ServiceResult
                {
                    Status = 200,
                    Message = "Add Success",
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult
                {
                    Status = 501,
                    Message = ex.ToString(),
                };
            }
        }
        public async Task<ServiceResult> UpdateSchedule(ScheduleUpdate key)
        {
            try
            {
                var schedule = await repo.UpdateSchedule(key);
                if (schedule == null)
                {
                    return new ServiceResult
                    {
                        Status = 404,
                        Message = "Not Found"
                    };
                }
                return new ServiceResult
                {
                    Status = 200,
                    Message = "Update Success",
                };
            }
            catch (Exception ex)
            {
                return new ServiceResult
                {
                    Status = 501,
                    Message = ex.ToString(),
                };
            }
        }
    }
}
