using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProformaApplication.Controllers
{
    public class LanguageController : Controller
    {
        //
        // GET: /Language/

        public ActionResult Index(string culture, string path)
        {
            Session["culture"] = culture;
            HttpCookie cookie = new HttpCookie("proformaCulture", culture);
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
            path = path.Replace("(x)", "/");
            return Redirect(path);
        }

    }
}
