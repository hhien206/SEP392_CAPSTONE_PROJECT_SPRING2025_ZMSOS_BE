﻿using DAO.AddModel;
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
    public class NotificationService : INotificationService
    {
        public INotificationRepository repo;
        public NotificationService(INotificationRepository repo)
        {
            this.repo = repo;
        }
        public async Task<ServiceResult> GetListNotification(int accountId)
        {
            try
            {
                var notifications = await repo.GetListNotificationByAccountId(accountId);
                if (notifications == null)
                {
                    return new ServiceResult
                    {
                        Status = 404,
                        Message = "Not Found!",
                    };
                }
                var result = repo.ConvertListNotificationIntoListNotificationView(notifications);
                return new ServiceResult
                {
                    Status = 200,
                    Message = "Notifications",
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
        public async Task<ServiceResult> AddListNotification(List<NotificationAdd> key)
        {
            try
            {
                foreach (var item in key)
                {
                    await repo.AddNotification(item);
                }
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
    }
}
