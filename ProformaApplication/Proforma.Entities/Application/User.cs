using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Proforma.Entities.Domain;

namespace Proforma.Entities.Application
{
    public interface IUser
    {
        int Id { get; set; }
        string UserName { get; set; }

        string Password { get; set; }


        string MobilePhone { get; set; }
        bool IsActive { get; set; }
        DateTime LastLoginDate { get; set; }
        DateTime AddedDateTime { get; set; }
    }
    public class User : Person, IUser
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime AddedDateTime { get; set; }

        public IEnumerable<Role> RoleList { get; set; }
    }
}
