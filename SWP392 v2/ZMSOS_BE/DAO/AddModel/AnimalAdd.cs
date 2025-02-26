﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.AddModel
{
    public class AnimalAdd
    {
        public int AnimalTypeId { get; set; }
        public string Description { get; set; }
        public string Classify {  get; set; }
        public FlockAdd? Flock { get; set; }
        public IndividualAdd? Individual { get; set; }
        public string UrlImage {  get; set; }
    }
}
