﻿using Session5.Models.Db;

namespace Session5.Models.Outcoming
{
    public class MedicineWithoutWirehouseDto
    {
        public MedicineWithoutWirehouseDto(Medicine x)
        {
            Id = x.Id;
            ProviderName = x.Provider.Name;
            Price = x.Price;
            Quantity = x.Quantity;
            ExpirationDate = x.ExpirationDate;
        }
        public int Id { get; set; }

        public string ProviderName { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }

        public DateTime ExpirationDate { get; set; }
    }
}
