using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Proforma.Entities.Application;

namespace Proforma.Repository.Authentication
{
    public interface IAuthenticationRepository
    {
        User GetUserLoginDetail(string userName);
    }
    public class AuthenticationRepository : IAuthenticationRepository
    { 

        public User GetUserLoginDetail(string userName)
        { 
            SelectCommand cmd = new SelectCommand("GetUserLoginDetail");

            cmd["@UserName"] = userName;
            User user = new User();
            using (DBDataReaderWrapper reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {

                    user.Id = reader.Int["UserId"];
                    user.UserName = reader.String["UserName"];
                    user.Password = reader.String["Password"];
                    user.IsActive = reader.Bool["IsActive"];
                    user.MobilePhone = reader.String["MobilePhone"];
                    user.Email = reader.String["EmailId"];
                    user.LastLoginDate = reader.Date["LastLoginDate"];
                    user.RoleList = reader.String["RoleList"].Split(',').Skip(1).Select(r => new Role { RoleName = r });
                } 
            }

            return user;
        }
    }
}
