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

            //UserApiController usercontrol = new UserApiController();
            //User user = usercontrol.GetUser(2);
            //Debug.WriteLine(user.Firstname + " " + user.Lastname + " " + user.Role.Name);
            //Debug.WriteLine(" ");

            //RoleApiController rc = new RoleApiController();
            //var roles = rc.GetRoles();
            //foreach (Role r in roles)
            //{
            //    Debug.WriteLine(r.Name);
            //}

            //RoleApiController rc = new RoleApiController();
            //Role role = new Role { Name = "Klovn", AccessLevel = 14 };
            //rc.CreateRole(role);

            // RoleApiController rac = new RoleApiController();
            // Debug.WriteLine(rac.DeleteRole(2));

            UserApiController usercontrol = new UserApiController();
            
            Debug.WriteLine(usercontrol.DeleteUser(4));

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