using System;
using System.Collections.Generic;

namespace Session5.Models.Db;

public partial class IssueRequest
{
    public int Id { get; set; }

    public int MedicineId { get; set; }

    public int Quantity { get; set; }

    public bool Completed { get; set; }

    public virtual Medicine Medicine { get; set; } = null!;
}
