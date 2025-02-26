﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class Evaluation
{
    public int Id { get; set; }

    public int? LeaderId { get; set; }

    public int? MemberId { get; set; }

    public string Title { get; set; }

    public string Details { get; set; }

    public double? Score { get; set; }

    public double? MaxScore { get; set; }

    public DateOnly? Date { get; set; }

    public string Status { get; set; }

    public virtual LeaderAssign Leader { get; set; }

    public virtual MemberAssign Member { get; set; }
}