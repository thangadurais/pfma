using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ProformaApplication.ViewModel;
using Proforma.Services.Authentication;
using Proforma.Infrastructure;
using Proforma.Services.Exceptions;
using Proforma.Entities.Application;

namespace ProformaApplication.Controllers
{
    [Localization]
    public class HomeController : Controller
    {
        private readonly IAuthenticationService AuthenticationService;

        public HomeController(IAuthenticationService _authenticationSetvice)
        {
            AuthenticationService = _authenticationSetvice;
        }

        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to Proforma Clinic!";

            return View("Login");
        }

        public ActionResult Login()
        {
            return View(); 
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    User user = AuthenticationService.GetUserDetails(model.UserName);
                    if (string.IsNullOrEmpty(user.UserName))
                    {
                        UserNotFoundException userNotFoundException = new UserNotFoundException();
                        throw userNotFoundException;
                    }
                    if (user.Password == model.Password)
                    {
                        Session["LoggedInUser"] = user;
                        FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                        if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                            && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                        {
                            return Redirect(returnUrl);
                        }
                        else
                        {
                            return View("ShowUserDetail", model);
                        }
                    }
                    else
                    {
                        PasswordMismatchException passwordException = new PasswordMismatchException();
                        passwordException.UserName = user.UserName;
                        throw passwordException;
                    }
                }
                catch (UserNotFoundException)
                {
                    ModelState.AddModelError("UserName", Resources.Global.UserNotFound);
                }
                catch (PasswordMismatchException)
                {
                    ModelState.AddModelError("Password", Resources.Global.InvalidPassword);
                }
                catch (Exception)
                {
                    ViewBag.FatalError = Resources.Global.FatalError;
                }
            }
            else
            {
                ModelState.AddModelError("", "The user name or password provided is incorrect.");
            }

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult ShowUserDetail()
        {
            return View();
        }
    }
}
