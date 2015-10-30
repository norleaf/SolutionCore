using SolutionCore.Api;
using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SolutionCore.Controllers
{
    public class CompaniesController : Controller
    {
        // GET: Companies
        public ActionResult CompView()
        {
            CompanyApiController ctrl = new CompanyApiController();
            List<Company> companies = ctrl.PullCompanies();

            return View(companies);
        }
    }
}