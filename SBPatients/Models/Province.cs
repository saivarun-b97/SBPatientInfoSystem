using System;
using System.Collections.Generic;

namespace SBPatients.Models
{
    public partial class Province
    {
        public Province()
        {
            Patient = new HashSet<Patient>();
        }

        public string ProvinceCode { get; set; }
        public string Name { get; set; }
        public string CountryCode { get; set; }
        public string SalesTaxCode { get; set; }
        public double SalesTax { get; set; }
        public bool IncludesFederalTax { get; set; }
        public string FirstPostalLetter { get; set; }

        public Country CountryCodeNavigation { get; set; }
        public ICollection<Patient> Patient { get; set; }
    }
}
