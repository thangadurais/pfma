using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web;

namespace ProformaApplication.ViewModel
{
    public class LoginViewModel
    { 
        [Required]
        [Display(Name = "UserName", ResourceType = typeof(Resources.Global))]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password", ResourceType = typeof(Resources.Global))]
        public string Password { get; set; }

        [Display(Name = "RememberMe", ResourceType = typeof(Resources.Global))]
        public bool RememberMe { get; set; }
    }
}