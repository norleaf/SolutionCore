using SolutionCore.Api;
using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SolutionCore.Controllers
{
    public class ConfigController : Controller
    {
        // GET: Config
        public ActionResult Settings()
        {
            ConfigApiController config = new ConfigApiController();
            Settings settings = config.GetSettings();
            return View(settings);
        }
    }
}