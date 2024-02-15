namespace Session5.Models.Incoming
{
    public class MedicineInvoiceItemDto
    {
        public int Id { get; set; }

        public int Price { get; set; }
        public int Quantity { get; set; }
        public string ExpirationDate { get; set; } = null!;
    }
}
