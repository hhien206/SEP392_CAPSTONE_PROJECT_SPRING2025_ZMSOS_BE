﻿using AccountManagement;
using DAO.AddModel;
using DAO.UpdateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Service.IService;

namespace TeamManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeamController : ControllerBase
    {
        private readonly ITeamService service;
        public TeamController(ITeamService service)
        {
            this.service = service;
        }
        [HttpGet("teams")]
        public async Task<IActionResult> GetListTeam()
        {
            var result = await service.GetListTeam();
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("team/id")]
        public async Task<IActionResult> GetTeamById(int id)
        {
            var result = await service.GetTeamById(id);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("team")]
        public async Task<IActionResult> AddTeam(TeamAdd key)
        {
            var result = await service.AddTeam(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPut("team")]
        public async Task<IActionResult> UpdateTeam(TeamUpdate key)
        {
            var result = await service.UpdateTeam(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("team/leader/teamId")]
        public async Task<IActionResult> GetLeaderByTeamId(int teamId)
        {
            var result = await service.GetLeaderByTeamId(teamId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("team/leader")]
        public async Task<IActionResult> AddLeader(LeaderAssignAdd key)
        {
            var result = await service.AddLeaderAssign(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpDelete("team/leader")]
        public async Task<IActionResult> RemoveLeader(int accountId, int teamId)
        {
            var result = await service.RemoveLeader(accountId, teamId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("team/members/teamId")]
        public async Task<IActionResult> GetListMemberByTeamId(int teamId)
        {
            var result = await service.GetListMemberByTeamId(teamId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("team/member")]
        public async Task<IActionResult> AddMember(MemberAssignAdd key)
        {
            var result = await service.AddMemberAssign(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpDelete("team/member")]
        public async Task<IActionResult> RemoveMember(int accountId, int teamId)
        {
            var result = await service.RemoveMember(accountId,teamId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
    }
}
