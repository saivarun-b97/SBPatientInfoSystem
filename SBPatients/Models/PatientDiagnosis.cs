using System;
using System.Collections.Generic;

namespace SBPatients.Models
{
    public partial class PatientDiagnosis
    {
        public PatientDiagnosis()
        {
            PatientTreatment = new HashSet<PatientTreatment>();
        }

        public int PatientDiagnosisId { get; set; }
        public int PatientId { get; set; }
        public int DiagnosisId { get; set; }
        public string Comments { get; set; }

        public Diagnosis Diagnosis { get; set; }
        public Patient Patient { get; set; }
        public ICollection<PatientTreatment> PatientTreatment { get; set; }
    }
}
