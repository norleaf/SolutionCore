using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SolutionCore.Models
{
    public class User
    {

        public int Id { get; set; }
        [Required]
        [Display(Name = "Brugernavn")]
        public string Username { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Email { get; set; }
        public Role Role { get; set; }
        public int RoleId { get; set; }


        public IEnumerable<SelectListItem> roleList { get; set; }

    }
}