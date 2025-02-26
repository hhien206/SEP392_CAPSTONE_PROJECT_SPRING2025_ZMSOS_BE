﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.UpdateModel
{
    public class IndividualUpdate
    {
        public DateOnly BirthDate { get; set; }
        public string Name { get; set; }
        public string Age { get; set; }
        public string Gender { get; set; }
        public string Weight { get; set; }
        public string Height { get; set; }
        public DateOnly ArrivalDate { get; set; }
        public string Note { get; set; }
    }
}
