using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Globalization;
using System.Threading;
using Proforma.Infrastructure.Configuration;

namespace ProformaApplication
{
    public class LocalizationAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// On Action Executing
        /// </summary>
        /// <param name="filterContext">ActionExecutingContext</param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string culture = WebConfigApplicationSettings.defaultCulture;
            if (filterContext.HttpContext.Session["culture"] != null)
                culture = filterContext.HttpContext.Session["culture"].ToString();
            if (filterContext.HttpContext.Request.UserLanguages[0] != null)
                culture = filterContext.HttpContext.Request.UserLanguages[0];
            if (filterContext.HttpContext.Request.Cookies["proformaCulture"] != null)
                culture = filterContext.HttpContext.Request.Cookies["proformaCulture"].Value;
            if (WebConfigApplicationSettings.allCulture.IndexOf(culture) == -1)
                culture = WebConfigApplicationSettings.defaultCulture;
            if (!WebConfigApplicationSettings.unlockAllCulture)
                culture = WebConfigApplicationSettings.defaultCulture;
            CultureInfo cultureInfo = CultureInfo.CreateSpecificCulture(culture);
            filterContext.HttpContext.Session["culture"] = cultureInfo.Name;
            Thread.CurrentThread.CurrentCulture = cultureInfo;
            Thread.CurrentThread.CurrentUICulture = cultureInfo;
        }
    }
}