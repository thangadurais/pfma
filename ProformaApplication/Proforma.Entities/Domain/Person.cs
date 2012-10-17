using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Proforma.Entities.Domain
{
    
    public interface IPerson
    {
        int Id { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string PersonalNumber { get; set; }
        string MobilePhone { get; set; }
        string HomePhone { get; set; }
        string OfficePhone { get; set; }
        string Email { get; set; }
        DateTime DateOfBirth { get; set; }
        string City { get; set; }
    }
    public class Person : IPerson
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
    }
}
