using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Proforma.Entities.Domain;

namespace ProformaApplication.ViewModel
{
    public class DoctorBasicInfoViewModal
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

        public int AddedBy { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime AddedDateTime { get; set; }
        public DateTime UpdatedDateTime { get; set; }

        public IDesignation Designation { get; set; }
    }
}