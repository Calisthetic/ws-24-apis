using Session5.Models.Db;

namespace Session5.Models.Outcoming
{
    public class WarehouseDto
    {
        public WarehouseDto(Warehouse x)
        {
            Id = x.Id;
            Name = x.Name;
            Adress = x.Adress;
        }
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Adress { get; set; } = null!;
    }
}
