﻿using AccountManagement;
using DAO.AddModel;
using DAO.UpdateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Service.IService;

namespace Zoo_Management_And_Staff_Operations_System.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaskEstimateController : ControllerBase
    {
        private readonly ITaskEstimateService service;
        public TaskEstimateController(ITaskEstimateService service)
        {
            this.service = service;
        }
        [HttpGet("taskEstimates")]
        public async Task<IActionResult> GetListTaskEstimate()
        {
            var result = await service.GetListTaskEstimate();
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("taskEstimates/taskTypeId")]
        public async Task<IActionResult> GetListTaskEstimateByTaskTypeId(int taskTypeId)
        {
            var result = await service.GetListTaskEstimateByTaskTypeId(taskTypeId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("taskEstimates/animalTypeId")]
        public async Task<IActionResult> GetListTaskEstimateByAnimalTypeId(int animalTypeId)
        {
            var result = await service.GetListTaskEstimateByAnimalTypeId(animalTypeId);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("taskEstimate/id")]
        public async Task<IActionResult> GetTaskEstimateById(int id)
        {
            var result = await service.GetTaskEstimateById(id);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("taskEstimate")]
        public async Task<IActionResult> AddTaskEstimate(TaskEstimateAdd key)
        {
            var result = await service.AddTaskEstimate(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPut("taskEstimate")]
        public async Task<IActionResult> UpdateTaskEstimate(TaskEstimateUpdate key)
        {
            var result = await service.UpdateTaskEstimate(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
    }
}
