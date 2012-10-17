using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Proforma.Entities.Domain;

namespace ProformaApplication.ViewModel
{
    public class PatientBasicInfoViewModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PersonalNumber { get; set; }
        public string MobilePhone { get; set; }

        public string HomePhone { get; set; }
        public string OfficePhone { get; set; }
        public string Email { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string City { get; set; }

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

        public string AddedUserName { get; set; }
    }
}