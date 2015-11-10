using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SolutionCore.Api
{
    public class RoleApiController : Api
    {
        public Role GetRole(int roleId)
        {
            Role role = (from r in db.roles 
                         where r.id == roleId
                         select new Role
                         {
                             Id = r.id,
                             AccessLevel = r.access_level,
                             Name = r.name
                         }).First();
            return role;
        }

        public List<Role> GetRoles()
        {
            var roles = (from r in db.roles
                         select new Role
                         {
                             Id = r.id,
                             AccessLevel = r.access_level,
                             Name = r.name
                         }).ToList();

            return roles;

        }

        public string UpdateRole(Role newRole)
        {
            var role = (from r in db.roles
                        where r.id == newRole.Id
                        select r).First();
            role.access_level = newRole.AccessLevel;
            role.name = newRole.Name;
            return Submit("Rolle opdateret.");
        }

        public string CreateRole(Role newRole)
        {
            role role = new role
            {
                name = newRole.Name,
                access_level = newRole.AccessLevel
            };

            db.roles.InsertOnSubmit(role);

            return Submit("Rolle oprettet.");
        }

        public string DeleteRole(int roleId)
        {
            if (roleId != 1)
            {
                var role = (from r in db.roles where r.id == roleId select r).First();
                db.roles.DeleteOnSubmit(role);

                return Submit("Rolle slettet.");
            }
            else
            {
                return "Kan ikke slette administrator rollen.";
            }
        }
    }
}