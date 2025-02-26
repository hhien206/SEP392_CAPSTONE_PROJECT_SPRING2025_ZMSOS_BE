﻿using BO.Models;
using DAO.AddModel;
using DAO.ViewModel;
using Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class MemberAssignRepository : GenericRepository<MemberAssign>, IMemberAssignRepository
    {
        public MemberAssignRepository()
        {
        }
        public async Task<List<MemberAssign>?> GetListMemberAssignByTeamId(int teamId)
        {
            try
            {
                var memberAssign = (await GetAllAsync()).FindAll(l => l.TeamId == teamId && l.ToDate == null);
                if (memberAssign == null) return null;
                return memberAssign;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<MemberAssign?> AddMemberAssign(int teamId, int accountId)
        {
            try
            {
                var memberAssign = (await GetAllAsync()).FirstOrDefault(l => l.MemberId == accountId && l.ToDate == null);
                if (memberAssign != null) return null;
                memberAssign = new()
                {
                    TeamId = teamId,
                    MemberId = accountId,
                    FromDate = DateOnly.FromDateTime(DateTime.Now),
                    ToDate = null,
                    Status = "Active"
                };
                await CreateAsync(memberAssign);
                return memberAssign;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<MemberAssign?> RemoveMemberAssign(int teamId, int accountId)
        {
            try
            {
                var memberAssign = (await GetAllAsync()).FirstOrDefault(l => l.TeamId == teamId && l.MemberId == accountId && l.ToDate == null);
                if (memberAssign == null) return null;
                memberAssign.ToDate = DateOnly.FromDateTime(DateTime.Now);
                memberAssign.Status = "InActive";
                await UpdateAsync(memberAssign);
                return memberAssign;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<MemberAssignView> ConvertListMemberAssignIntoListMemberAssignView(List<MemberAssign> memberAssigns, List<TeamView> teams, List<UserView> users)
        {
            try
            {
                List<MemberAssignView> result = new();
                for (int i = 0; i < memberAssigns.Count; i++)
                {
                    result.Add(ConvertMemberAssignIntoMemberAssignView(memberAssigns[i], teams[i], users[i]));
                }
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public MemberAssignView ConvertMemberAssignIntoMemberAssignView(MemberAssign memberAssign,TeamView team, UserView user)
        {
            try
            {
                MemberAssignView result = new MemberAssignView();
                result.ConvertMemberAssignIntoMemberAssignView(memberAssign,team,user);
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
