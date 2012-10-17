using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Proforma.Infrastructure.Configuration;
using System.Text;
using System.Web.Mvc;

namespace ProformaApplication.Helpers
{
    public static class UIHelper
    {
        public static MvcHtmlString LanguageMenu()
        {
            string[] allCultureMassive = WebConfigApplicationSettings.allCulture.Split(',');

            if (WebConfigApplicationSettings.unlockAllCulture)
            {


                TagBuilder ul = new TagBuilder("ul");
                ul.Attributes["class"] = "languages";
                StringBuilder _result = new StringBuilder();
                foreach (string item in allCultureMassive)
                {
                    TagBuilder li = new TagBuilder("li");
                    string a = RedirectLanguage(item, string.Empty);
                    li.InnerHtml = a;
                    _result.AppendLine(li.ToString(TagRenderMode.Normal));
                }
                ul.InnerHtml = _result.ToString();
                return MvcHtmlString.Create(ul.ToString(TagRenderMode.Normal));

            }
            else { return MvcHtmlString.Create(string.Empty); }
        }
        public static string RedirectLanguage(string culture, string cssClass)
        {
            string path = HttpContext.Current.Request.Path.ToString();
            path = path.Replace("/", "(x)");
            StringBuilder result = new StringBuilder();
            TagBuilder _result = new TagBuilder("a");
            _result.MergeAttribute("href", "/Language/Index/" + culture + "/" + path);
            if (!String.IsNullOrEmpty(cssClass))
                _result.AddCssClass(cssClass);
            _result.InnerHtml = GetLanguageString(culture);
            result.AppendLine(_result.ToString());
            return result.ToString();
        }

        private static string GetLanguageString(string culture)
        {

            return System.Globalization.CultureInfo.GetCultureInfo(culture).DisplayName;
        }
    }
}