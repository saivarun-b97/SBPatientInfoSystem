using System;
using System.Collections.Generic;

namespace SBPatients.Models
{
    public partial class PatientMedication
    {
        public int PatientMedicationId { get; set; }
        public int PatientTreatmentId { get; set; }
        public string Din { get; set; }
        public double? Dose { get; set; }
        public int? Frequency { get; set; }
        public string FrequencyPeriod { get; set; }
        public string ExactMinMax { get; set; }
        public string Comments { get; set; }

        public Medication DinNavigation { get; set; }
        public PatientTreatment PatientTreatment { get; set; }
    }
}
