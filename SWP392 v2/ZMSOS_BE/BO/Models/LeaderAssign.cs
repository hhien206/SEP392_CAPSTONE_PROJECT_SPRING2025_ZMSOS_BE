﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class LeaderAssign
{
    public int Id { get; set; }

    public int? TeamId { get; set; }

    public int? LeaderId { get; set; }

    public DateOnly? FromDate { get; set; }

    public DateOnly? ToDate { get; set; }

    public string Status { get; set; }

    public virtual ICollection<Evaluation> Evaluations { get; set; } = new List<Evaluation>();

    public virtual Account Leader { get; set; }

    public virtual Team Team { get; set; }
}