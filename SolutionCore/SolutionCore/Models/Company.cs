using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SolutionCore.Models
{
    public class Company
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CVR { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string CEO { get; set; }
        public DateTime? StartUpDate { get; set; }
        public bool Active { get; set; }
        public string ReasonNotActive { get; set; }
        public string FinancialReport { get; set; }
        public bool AdverticingProtected { get; set; }
        public int? EmployeeCount { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string City { get; set; }

        public List<Contact> Contacts { get; set; }
    }
}