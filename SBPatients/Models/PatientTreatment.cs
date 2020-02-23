using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SBPatients.Models
{
    public partial class PatientTreatment
    {
        public PatientTreatment()
        {
            PatientMedication = new HashSet<PatientMedication>();
        }

        public int PatientTreatmentId { get; set; }
        public int TreatmentId { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd MMMM yyyy HH:mm}", ApplyFormatInEditMode = true)]
        public DateTime DatePrescribed { get; set; }
        public string Comments { get; set; }
        public int PatientDiagnosisId { get; set; }

        public PatientDiagnosis PatientDiagnosis { get; set; }
        public Treatment Treatment { get; set; }
        public ICollection<PatientMedication> PatientMedication { get; set; }
    }
}
