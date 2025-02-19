﻿using BO.Models;
using DAO.AddModel;
using Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class AnimalCageRepository : GenericRepository<AnimalCage>, IAnimalCageRepository
    {
        public async Task<List<AnimalCage>?> GetListAnimalCageByCageId(int cageId)
        {
            try
            {
                var animalCages = (await GetAllAsync()).FindAll(l => l.CageId == cageId);
                if (animalCages != null) return null;
                return animalCages;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<AnimalCage?> AddAnimalCage(int animalId, int cageId)
        {
            try
            {
                var animalCage = (await GetAllAsync()).FirstOrDefault(l =>l.AnimalId == animalId && l.ToDate == null);
                if (animalCage != null) return null;
                animalCage = new()
                {
                    AnimalId = animalId,
                    CageId = cageId,
                    FromDate = DateOnly.FromDateTime(DateTime.Now),
                    ToDate = null,
                    Status = "Active"
                };
                await CreateAsync(animalCage);
                return animalCage;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<AnimalCage?> RemoveAnimalCage(int animalId, int cageId)
        {
            try
            {
                var animalCage = (await GetAllAsync()).FirstOrDefault(l => l.CageId == cageId && l.AnimalId == animalId && l.ToDate == null);
                if (animalCage == null) return null;
                animalCage.ToDate = DateOnly.FromDateTime(DateTime.Now);
                animalCage.Status = "InActive";
                await UpdateAsync(animalCage);
                return animalCage;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
