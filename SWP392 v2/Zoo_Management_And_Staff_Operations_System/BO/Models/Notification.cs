﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BO.Models;

public partial class Notification
{
    public int Id { get; set; }

    public int? AccountId { get; set; }

    public string Content { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string Status { get; set; }

    public virtual Account Account { get; set; }
}