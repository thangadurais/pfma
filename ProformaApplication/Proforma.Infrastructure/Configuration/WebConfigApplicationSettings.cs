using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Proforma.Infrastructure.Configuration
{
    public class WebConfigApplicationSettings : IApplicationSettings 
    {        
        public int NumberOfResultsPerPage
        {
            get { return int.Parse(ConfigurationManager.AppSettings["NumberOfResultsPerPage"]); }
        }    
 
        public string PayPalBusinessEmail
        {
            get { return ConfigurationManager.AppSettings["PayPalBusinessEmail"]; }
        }

        public string PayPalPaymentPostToUrl
        {
            get { return ConfigurationManager.AppSettings["PayPalPaymentPostToUrl"]; }
        }

        public string LoggerName
        {
            get { return ConfigurationManager.AppSettings["LoggerName"]; }
        }

        public string RpxApiKey
        {
            get { return ConfigurationManager.AppSettings["RpxApiKey"]; }
        }

        /// Default Culture
        /// </summary>
        public static string defaultCulture = ConfigurationManager.AppSettings["defaultCulture"];
        /// <summary>
        /// All Culture
        /// </summary>
        public static string allCulture = ConfigurationManager.AppSettings["allCulture"];
        /// <summary>
        /// Unlock All Culture
        /// </summary>
        public static bool unlockAllCulture = bool.Parse(ConfigurationManager.AppSettings["unlockAllCulture"]);
        /// <summary>
        /// All Culture Massive
        /// </summary>
    }
}
