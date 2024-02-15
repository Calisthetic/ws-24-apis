using Session5.Models.Db;

namespace Session5.Models.Outcoming
{
    public class IssueRequestDto
    {
        public IssueRequestDto(IssueRequest x)
        {
            Id = x.Id;
            Medicine = new MedicineDto(x.Medicine);
            Quantity = x.Quantity;
            Completed = x.Completed;
        }
        public int Id { get; set; }

        public int Quantity { get; set; }

        public bool Completed { get; set; }

        public MedicineDto Medicine { get; set; }

    }
}
