using System;
using System.Collections.Generic;

namespace Session5.Models.Db;

public partial class Provider
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Medicine> Medicines { get; set; } = new List<Medicine>();
}
