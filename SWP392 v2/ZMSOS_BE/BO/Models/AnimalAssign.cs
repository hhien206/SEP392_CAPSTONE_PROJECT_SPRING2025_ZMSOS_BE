﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class AnimalAssign
{
    public int Id { get; set; }

    public int? TaskId { get; set; }

    public int? AnimalCageId { get; set; }

    public string Status { get; set; }

    public virtual AnimalCage AnimalCage { get; set; }

    public virtual Task Task { get; set; }
}