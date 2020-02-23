using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SBPatients.Models
{
    public partial class Medication
    {
        public Medication()
        {
            PatientMedication = new HashSet<PatientMedication>();
            TreatmentMedication = new HashSet<TreatmentMedication>();
        }

        [Required]
        public string Din { get; set; }
        [Required]
        [RegularExpression(@"^[A-Za-z][A-Za-z][A-Za-z]+", ErrorMessage = "Atleast 3 characters expected")]
        public string Name { get; set; }
        [Required]
        [RegularExpression(@"^[A-Za-z][A-Za-z][A-Za-z]+", ErrorMessage = "Atleast 3 characters expected")]
        public string Image { get; set; }
        [Required]
        public int MedicationTypeId { get; set; }
        [Required]
        public string DispensingCode { get; set; }
        [Required]
        public double Concentration { get; set; }
        [Required]
        public string ConcentrationCode { get; set; }

        public ConcentrationUnit ConcentrationCodeNavigation { get; set; }
        public DispensingUnit DispensingCodeNavigation { get; set; }
        public MedicationType MedicationType { get; set; }
        public ICollection<PatientMedication> PatientMedication { get; set; }
        public ICollection<TreatmentMedication> TreatmentMedication { get; set; }
    }
}
