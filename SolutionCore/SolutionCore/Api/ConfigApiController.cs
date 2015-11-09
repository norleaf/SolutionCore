using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace SolutionCore.Api
{
    public class ConfigApiController : Api
    {

        public Settings GetSettings()
        {
            var settings = (from s in db.settings select new Models.Settings {
                Id = s.id,
                SiteName = s.site_name,
                Url = s.url,
                Logo = s.logo 
            }).First();
            return settings;
        }

        public string SetSettings(Settings newSettings)
        {
            var settings = (from s in db.settings select s).First();

            settings.site_name = newSettings.SiteName;
            settings.logo = newSettings.Logo;
            settings.url = newSettings.Url;

            try
            {
                db.SubmitChanges();
                return "Indstillingerne er gemt.";
            }
            catch
            {
                return "Indstillingerne blev ikke gemt. Kontakt IT-support hvis problemet forsætter.";
            }
        }
    }
}