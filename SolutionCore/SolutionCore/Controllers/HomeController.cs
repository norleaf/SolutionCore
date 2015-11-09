using SolutionCore.Api;
using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SolutionCore.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //UserApiController usercontrol = new UserApiController();
            //User user = new User { Email = "sdfhsdf", Firstname = "Frode", Lastname = "Glad", Password = "1235", Role = new Role { Id = 1 }, Username = "FrodeG" };
            //Debug.WriteLine(usercontrol.CreateUser(user));

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}