using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SolutionCore.Models
{
    public class Company
    {
        public String Name { get; set; }
        public String CVR { get; set; }
        public String Address { get; set; }
        public String City { get; set; }

        public List<Contact> Contacts { get; set; }
    }
}