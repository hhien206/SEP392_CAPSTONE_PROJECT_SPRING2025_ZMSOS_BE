﻿using BO.Models;
using DAO.AddModel;
using DAO.UpdateModel;
using DAO.ViewModel;
using Repository.IRepositoyr;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class NewsRepository : GenericRepository<News>, INewsRepository
    {
        public NewsRepository()
        {
        }
        public async Task<List<News>?> GetListNews()
        {
            try
            {
                var newss = (await GetAllAsync()).OrderByDescending(l => l.Id).ToList();
                return newss;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<News> AddNews(NewsAdd key)
        {
            try
            {
                News news = new()
                {
                    AccountId = key.AccountId,
                    Headline = key.Headlinen,
                    Content = key.Content,
                    Date = DateTime.Now,
                    Status = ""
                };
                await CreateAsync(news);
                return news;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<News?> UpdateNews(NewsUpdate key)
        {
            try
            {
                var news = GetById(key.Id);
                if(news == null)
                {
                    return null;
                }
                news.Headline = key.Headlinen;
                news.Content = key.Content;
                await UpdateAsync(news);
                return news;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<NewsView> ConvertListNewsIntoListNewsView(List<News> newss, List<UserView> users)
        {
            try
            {
                List<NewsView> result = new();
                for(int i =0; i < users.Count; i++)
                {
                    result.Add(ConvertNewsIntoNewsView(newss[i], users[i]));
                }
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public NewsView ConvertNewsIntoNewsView(News news, UserView user)
        {
            try
            {
                NewsView result = new NewsView();
                result.ConvertNewsIntoNewsView(news, user);
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
