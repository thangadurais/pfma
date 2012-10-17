using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Proforma.Entities.Application;

namespace Proforma.Entities.Domain
{
    public enum Gender
    {
        Male,
        Female
    }
    public interface IPatient
    {
        string ListComments { get; set; }
        string Comment { get; set; }
        string Address { get; set; }
        string PostalNumber { get; set; }

        Doctor ResponsibleDoctor { get; set; }

        string PasswordId { get; set; }
        string Email1 { get; set; }
        string Email2 { get; set; }
        Gender Gender { get; set; }

        string Relative { get; set; }
        string WarningMessage { get; set; }
        string Cave { get; set; }

        bool SMS { get; set; }
        bool ThemeEveningSMS { get; set; }
        bool Deceased { get; set; }
        bool OPShortNotice { get; set; }

        Application.User AddedUser { get; set; }
        Application.User UpdatedUser { get; set; }

        DateTime AddedDateTime { get; set; }
        DateTime UpdatedDateTime { get; set; }
    }
    public class Patient : Person
    {
        public string ListComments { get; set; }
        public string Comment { get; set; }
        public string Address { get; set; }
        public string PostalNumber { get; set; }

        public Doctor ResponsibleDoctor { get; set; }

        public string PasswordId { get; set; }
        public string Email1 { get; set; }
        public string Email2 { get; set; }
        public Gender Gender { get; set; }

        public string Relative { get; set; }
        public string WarningMessage { get; set; }
        public string Cave { get; set; }

        public bool SMS { get; set; }
        public bool ThemeEveningSMS { get; set; }
        public bool Deceased { get; set; }
        public bool OPShortNotice { get; set; }

        public Application.User AddedUser { get; set; }
        public Application.User UpdatedUser { get; set; }

        public DateTime AddedDateTime { get; set; }
        public DateTime UpdatedDateTime { get; set; }


    }
}
