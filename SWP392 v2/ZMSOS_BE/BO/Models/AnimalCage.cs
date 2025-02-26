﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class AnimalCage
{
    public int Id { get; set; }

    public int? AnimalId { get; set; }

    public int? CageId { get; set; }

    public DateOnly? FromDate { get; set; }

    public DateOnly? ToDate { get; set; }

    public string Status { get; set; }

    public virtual Animal Animal { get; set; }

    public virtual ICollection<AnimalAssign> AnimalAssigns { get; set; } = new List<AnimalAssign>();

    public virtual Cage Cage { get; set; }
}