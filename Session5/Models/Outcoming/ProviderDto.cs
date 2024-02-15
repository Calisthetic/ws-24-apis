using Session5.Models.Db;

namespace Session5.Models.Outcoming
{
    public class ProviderDto
    {
        public ProviderDto(Provider x)
        {
            Id = x.Id;
            Name = x.Name;
        }

        public int Id { get; set; }

        public string Name { get; set; } = null!;
    }
}
