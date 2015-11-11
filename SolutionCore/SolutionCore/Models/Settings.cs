using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SolutionCore.Models
{
    public class Settings
    {
        public int Id { get; set; }
        public string SiteName { get; set; }
        public string Url { get; set; }
        public string Logo { get; set; }
    }
}