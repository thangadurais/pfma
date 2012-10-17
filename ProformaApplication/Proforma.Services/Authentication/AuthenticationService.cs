using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Proforma.Entities.Application;
using Proforma.Repository.Authentication;
using Proforma.Services.Exceptions;
using Proforma.Entities.Application;

namespace Proforma.Services.Authentication
{
    public interface IAuthenticationService
    {
       
        User GetUserDetails(string userName);
    }
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IAuthenticationRepository AuthenticationRepository;

        public AuthenticationService(IAuthenticationRepository _authRepository)
        {
            AuthenticationRepository = _authRepository;
        }        


        public User GetUserDetails(string userName)
        {
            return AuthenticationRepository.GetUserLoginDetail(userName);
        }
    }
}
