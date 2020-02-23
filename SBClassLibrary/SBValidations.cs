using System;
using System.Text.RegularExpressions;

namespace SBClassLibrary
{
    public static class SBValidations
    {
        public static string SBCapitaize(string inputString)
        {
            if (inputString.Equals(null))
            {
                return string.Empty;
            }
            else
            {
                string alteredInput = inputString.ToLower().Trim();
                return System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(alteredInput);
            }
        }

        public static string SBExtractDigits(string inputString)
        {
            // Split on one or more non-digit characters.
            string[] numbers = Regex.Split(inputString, @"\D+");
            string outputString = "";
            foreach (string value in numbers)
            {
                if (!string.IsNullOrEmpty(value))
                {
                    outputString += value;
                }
            }
            return outputString;
        }

        public static bool SBPostalCodeValidation(string inputString)
        {
            var _caZipRegEx = @"^([ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9])$";

            var validPostalCode = true;
            if (String.IsNullOrWhiteSpace(inputString))
            {
                if (!String.IsNullOrEmpty(inputString))
                {
                    validPostalCode = false;
                }
            }
            else if (!Regex.Match(inputString.ToUpper(), _caZipRegEx).Success)
            {
                validPostalCode = false;
            }
            return validPostalCode;
        }

        public static string SBPostalCodeFormat(string inputString)
        {
            string outputString;
            if (String.IsNullOrEmpty(inputString))
            {
                return string.Empty;
            }
            else if (inputString.Length == 6)
            {
                outputString = inputString.Substring(0, 3).ToUpper() + " " + inputString.Substring(3, 3).ToUpper();
                return outputString;
            }
            else
                return inputString.ToUpper();
        }

        public static bool SBZipCodeValidation(ref string inputString)
        {
            var _usZipRegEx = @"^\d{5}(?:[-\s]?\d{4})?$";

            var validZipCode = false;
            if (String.IsNullOrWhiteSpace(inputString))
            {
                if (String.IsNullOrEmpty(inputString))
                {
                    validZipCode = true;
                }
            }
            else if (Regex.Match(inputString, _usZipRegEx).Success)
            {
                validZipCode = true;

                if (inputString.Length == 9)
                {
                    inputString = inputString.Substring(0, 5) + "-" + inputString.Substring(5, 4);
                }
            }
            return validZipCode;
        }
    }
}
