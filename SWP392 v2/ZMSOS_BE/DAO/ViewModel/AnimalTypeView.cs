﻿using BO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static Azure.Core.HttpHeader;

namespace DAO.ViewModel
{
    public class AnimalTypeView
    {
        public int Id { get; set; }
        public string ScientificName { get; set; }
        public string VietnameseName { get; set; }
        public string EnglishName { get; set; }
        public string Family { get; set; }
        public string WeightRange { get; set; }
        public string Characteristics { get; set; }
        public string Distribution { get; set; }
        public string Habitat {  get; set; }
        public string Diet {  get; set; }
        public string Reproduction {  get; set; }
        public string ConservationStatus {  get; set; }
        public string UrlImage {  get; set; }
        public void ConvertAnimalTypeIntoAnimalTypeView(AnimalType key)
        {
            Id = key.Id;
            ScientificName = key.ScientificName;
            VietnameseName = key.VietnameseName;
            EnglishName = key.EnglishName;
            Family = key.Family;
            WeightRange = key.WeightRange;
            Characteristics = key.Characteristics;
            Distribution = key.Distribution;
            Habitat = key.Habitat;
            Diet = Diet;
            Reproduction = key.Reproduction;
            ConservationStatus = key.ConservationStatus;
            UrlImage = key.UrlImage;
        }
    }
}
