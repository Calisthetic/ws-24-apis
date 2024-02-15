using System;
using System.Collections.Generic;

namespace Session5.Models.Db;

public partial class Medicine
{
    public int Id { get; set; }

    public int WarehouseId { get; set; }

    public int ProviderId { get; set; }

    public decimal Price { get; set; }

    public int Quantity { get; set; }

    public DateTime ExpirationDate { get; set; }

    public virtual ICollection<IssueRequest> IssueRequests { get; set; } = new List<IssueRequest>();

    public virtual ICollection<MedicineWriteoff> MedicineWriteoffs { get; set; } = new List<MedicineWriteoff>();

    public virtual Provider Provider { get; set; } = null!;

    public virtual Warehouse Warehouse { get; set; } = null!;
}
