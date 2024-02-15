namespace Session5.Models.Incoming
{
    public class MedicineWriteOffDto
    {
        public int MedicineId { get; set; }

        public int Quantity { get; set; }

        public string? Reason { get; set; }
    }
}
