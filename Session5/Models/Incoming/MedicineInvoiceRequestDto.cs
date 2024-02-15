namespace Session5.Models.Incoming
{
    public class MedicineInvoiceRequestDto
    {
        public string DocumentDate { get; set; } = null!;
        public string Provider { get; set; } = null!;
        public List<MedicineInvoiceItemDto> Medicines { get; set; } = new List<MedicineInvoiceItemDto>();
    }
}
