﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class Task
{
    public int Id { get; set; }

    public int? TaskTypeId { get; set; }

    public int? ScheduleId { get; set; }

    public string TaskName { get; set; }

    public string Description { get; set; }

    public string Note { get; set; }

    public string Priority { get; set; }

    public TimeOnly? TimeStart { get; set; }

    public TimeOnly? TimeEnd { get; set; }

    public string Status { get; set; }

    public virtual Schedule Schedule { get; set; }

    public virtual TaskType TaskType { get; set; }
}