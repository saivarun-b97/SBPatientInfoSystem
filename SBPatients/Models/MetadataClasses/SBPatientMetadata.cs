using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.RegularExpressions;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using SBClassLibrary;

namespace SBPatients.Models
{
    [ModelMetadataType(typeof(PatientMetadata))]
    public partial class Patient : IValidatableObject
    {
        private PatientsContext _context;

        public Patient(PatientsContext context)
        {
            _context = context;
        }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            var patientProvince = new Province();

            if (FirstName == null || FirstName.Trim() == "")
            {
                yield return new ValidationResult("First Name cannot be empty or just blanks", new[] { nameof(FirstName) });
            }
            else
            {
                FirstName = SBValidations.SBCapitaize(FirstName);
            }
            if (LastName == null || LastName.Trim() == "")
            {
                yield return new ValidationResult("Last Name cannot be empty or just blanks", new[] { nameof(LastName) });
            }
            else
            {
                LastName = SBValidations.SBCapitaize(LastName);

            }
            if (ProvinceCode != null)
            {
                if (ProvinceCode.Trim() != "")
                {
                    ProvinceCode = ProvinceCode.Trim().ToUpper();
                    _context = (PatientsContext)validationContext.GetService(typeof(PatientsContext));
                    if (!_context.Province.Any(a => a.ProvinceCode == ProvinceCode))
                    {
                        yield return new ValidationResult("Please enter valid Province Code", new[] { nameof(ProvinceCode) });
                    }
                    else
                    {
                        patientProvince = _context.Province.Where(a => a.ProvinceCode == ProvinceCode).FirstOrDefault();
                    }
                }
            }
            if (PostalCode != null)
            {
                if (patientProvince.CountryCode == "CA")
                {
                    string firstCharInPostalCode = PostalCode.Substring(0, 1).ToUpper();
                    if (!patientProvince.FirstPostalLetter.Contains(firstCharInPostalCode))
                    {
                        yield return new ValidationResult("Please enter suitable Canadian Postal Code for your Province Code", new[] { nameof(PostalCode) });
                        yield return new ValidationResult("Please enter suitable Province Code for your Canadian Postal Code", new[] { nameof(ProvinceCode) });
                    }
                    else if (SBValidations.SBPostalCodeValidation(PostalCode))
                    {
                        PostalCode = SBValidations.SBPostalCodeFormat(PostalCode);
                    }
                    else
                    {
                        yield return new ValidationResult("Please enter valid Canadian Postal Code", new[] { nameof(PostalCode) });
                    }
                }
                else
                {
                    string postalCode = PostalCode;
                    if (SBValidations.SBZipCodeValidation(ref postalCode))
                    {
                        PostalCode = postalCode;
                    }
                    else
                    {
                        yield return new ValidationResult("Please enter valid US Postal Code", new[] { nameof(PostalCode) });
                    }
                }
            }
            if (Ohip != null)
            {
                Ohip = Ohip.ToUpper();
                var _ohipRegEx = @"^\d{4}-\d{3}-\d{3}-[A-Z]{2}$";
                if (!Regex.Match(Ohip, _ohipRegEx).Success)
                {
                    yield return new ValidationResult("OHIP, if provided must match pattern; 1234-123-123-XX", new[] { nameof(Ohip) });
                }
            }
            if (HomePhone != null)
            {
                HomePhone = SBValidations.SBExtractDigits(HomePhone);
                if (HomePhone.Length != 10)
                {
                    yield return new ValidationResult("Enter valid phone number", new[] { nameof(HomePhone) });
                }
                HomePhone = string.Format("{0:###-###-####}", long.Parse(HomePhone));
            }
            if (DateOfBirth != null || DateOfBirth.ToString().Trim() != "")
            {
                if (DateOfBirth > DateTime.Now)
                {
                    yield return new ValidationResult("Date of birth can't be in the future", new[] { nameof(DateOfBirth) });
                }
            }
            if (Deceased)
            {
                if (DateOfDeath == null || DateOfDeath.ToString().Trim() == "")
                {
                    yield return new ValidationResult("Date of death is required if the person is deceased", new[] { nameof(DateOfDeath) });
                }
                else if (DateOfDeath.Value > DateTime.Now || DateOfDeath.Value < DateOfBirth)
                {
                    yield return new ValidationResult("Date of death can't be before date of birth or in the future", new[] { nameof(DateOfDeath) });
                }
            }
            else
            {
                if (!(DateOfDeath == null) || !(DateOfDeath.ToString().Trim() == ""))
                {
                    yield return new ValidationResult("Date of death is not required", new[] { nameof(DateOfDeath) });
                }
            }
            if (Gender == null || Gender.Trim() == "")
            {
                yield return new ValidationResult("Gender cannot be empty or just blanks", new[] { nameof(Gender) });
            }
            else
            {
                Gender = SBValidations.SBCapitaize(Gender).Substring(0, 1);
                if (!Gender.Equals("M") && !Gender.Equals("F") && !Gender.Equals("X"))
                {
                    yield return new ValidationResult("Please enter valid gender among (M, F, X)", new[] { nameof(Gender) });
                }
            }
            if (Address != null)
            {
                if (Address.Trim() != "")
                {
                    Address = SBValidations.SBCapitaize(Address);
                }
            }
            if (City != null)
            {
                if (City.Trim() != "")
                {
                    City = SBValidations.SBCapitaize(City);
                }
            }

            yield return ValidationResult.Success;
        }
        public class PatientMetadata
        {
            public int PatientId { get; set; }
            [Display(Name = "First Name")]
            public string FirstName { get; set; }
            [Display(Name = "Last Name")]
            public string LastName { get; set; }
            [Display(Name = "Street Address")]
            public string Address { get; set; }
            [Display(Name = "City")]
            public string City { get; set; }
            [Display(Name = "Province Code")]
            public string ProvinceCode { get; set; }
            [Display(Name = "Postal Code")]
            public string PostalCode { get; set; }
            [Display(Name = "OHIP")]
            public string Ohip { get; set; }
            [Display(Name = "Date of Birth")]
            [DisplayFormat(DataFormatString = "{0:dd MMM yyyy}", ApplyFormatInEditMode = false)]
            public DateTime? DateOfBirth { get; set; }
            public bool Deceased { get; set; }
            [Display(Name = "Date of Death")]
            [DisplayFormat(DataFormatString = "{0:dd MMM yyyy}", ApplyFormatInEditMode = false)]
            public DateTime? DateOfDeath { get; set; }
            [Display(Name = "Home Phone")]
            public string HomePhone { get; set; }
            [Display(Name = "Gender")]
            public string Gender { get; set; }
        }
    }
} 