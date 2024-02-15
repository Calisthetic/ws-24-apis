using System;
using System.Collections.Generic;

namespace Session5.Models.Db;

public partial class MedicineWriteoff
{
    public int Id { get; set; }

    public DateTime CreatedAt { get; set; }

    public int MedicineId { get; set; }

    public int Quantity { get; set; }

    public string Reason { get; set; } = null!;

    public virtual Medicine Medicine { get; set; } = null!;
}
