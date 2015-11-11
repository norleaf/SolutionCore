using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace SolutionCore.Api
{
    public class UserApiController : Api
    {
        public string EditUser(int userId, User newUser)
        {
            var user = (from u in db.users where u.id == userId select u).First();
            user.firstname = newUser.Firstname;
            user.lastname = newUser.Lastname;
            user.username = newUser.Username;
            user.password = newUser.Password;
            user.role_id = newUser.Role.Id;
            user.email = newUser.Email;

            return Submit("Bruger opdateret.");
        }

        public string CreateUser(User newUser)
        {
            Models.user user = new user();
            user.firstname = newUser.Firstname;
            user.lastname = newUser.Lastname;
            user.username = newUser.Username;
            user.password = newUser.Password;
            user.role_id = newUser.Role.Id;
            user.email = newUser.Email;
            
            db.users.InsertOnSubmit(user);

            return Submit("Ny bruger oprettet.");
        }

        public string DeleteUser(int userId)
        {
            var user = (from u in db.users where u.id == userId select u).First();
            db.users.DeleteOnSubmit(user);
            return Submit("Bruger slettet");
        }

        public string Submit(string successMessage)
        {
            try
            {
                db.SubmitChanges();
                return successMessage;
            }
            catch (Exception e)
            {
                return "Operationen mislykkedes. Hvis problemet forsætter kontakt IT-support med følgende fejlbesked: " + e.Message;
            }
        }
    }
}