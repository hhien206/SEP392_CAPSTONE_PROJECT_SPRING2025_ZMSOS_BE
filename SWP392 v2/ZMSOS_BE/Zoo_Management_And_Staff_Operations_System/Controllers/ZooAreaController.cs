﻿using AccountManagement;
using DAO.AddModel;
using DAO.UpdateModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Service.IService;

namespace AnimalAndCageManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ZooAreaController : ControllerBase
    {
        private readonly IZooAreaService service;
        public ZooAreaController(IZooAreaService service)
        {
            this.service = service;
        }
        [HttpGet("zooAreas")]
        public async Task<IActionResult> GetListZooArea()
        {
            var result = await service.GetListZooArea();
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpGet("zooArea/id")]
        public async Task<IActionResult> GetZooAreaById(int id)
        {
            var result = await service.GetZooAreaById(id);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPost("zooArea")]
        public async Task<IActionResult> AddZooArea(ZooAreaAdd key)
        {
            var result = await service.AddZooArea(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
        [HttpPut("zooArea")]
        public async Task<IActionResult> UpdateZooArea(ZooAreaUpdate key)
        {
            var result = await service.UpdateZooArea(key);
            StatusResult statusResult = new StatusResult();
            return statusResult.Result(result);
        }
    }
}
