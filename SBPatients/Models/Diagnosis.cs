using System;
using System.Collections.Generic;

namespace SBPatients.Models
{
    public partial class Diagnosis
    {
        public Diagnosis()
        {
            PatientDiagnosis = new HashSet<PatientDiagnosis>();
            Treatment = new HashSet<Treatment>();
        }

        public int DiagnosisId { get; set; }
        public string Name { get; set; }
        public int DiagnosisCategoryId { get; set; }

        public DiagnosisCategory DiagnosisCategory { get; set; }
        public ICollection<PatientDiagnosis> PatientDiagnosis { get; set; }
        public ICollection<Treatment> Treatment { get; set; }
    }
}