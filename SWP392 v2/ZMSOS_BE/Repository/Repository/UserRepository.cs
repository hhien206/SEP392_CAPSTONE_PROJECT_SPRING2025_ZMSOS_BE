﻿using BO.Models;
using DAO.ViewModel;
using Repository.IRepositoyr;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        public UserRepository()
        {
        }
        public UserView ConvertUserIntoUserView(User user)
        {
            try
            {
                UserView result = new UserView();
                result.ConvertUserIntoUserView(user);
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<User?> GetUserByAccountId(int accountId)
        {
            try
            {
                var user = (await GetAllAsync()).FirstOrDefault(l => l.AccountId == accountId);
                return user;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
