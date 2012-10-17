using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProformaApplication.ViewModel;

namespace ProformaApplication.Controllers
{
    public class PatientController : Controller
    {
        //
        // GET: /Patient/

        public ActionResult Index()
        {
            return View();

        }

        public ActionResult GetBasicDetails(int? id)
        {
            PatientBasicInfoViewModel basicInfoModel = new PatientBasicInfoViewModel();

            return View(basicInfoModel);
        }

    }
}
