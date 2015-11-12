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
        //Testet. Udskrev alle emails i en forløkke.
        public List<User> GetUsers()
        {
            var users = (from u in db.users
                         select new User
                         {
                             Id = u.id,
                             Email = u.email,
                             Firstname = u.firstname,
                             Lastname = u.lastname,
                             Password = u.password,
                             Role = new Role { Id = u.role_id, AccessLevel = u.role.access_level, Name = u.role.name },
                             RoleId = u.role_id,
                             Username = u.username
                         }).ToList();
            return users;
        }

        //Testet. Hentet bruger id = 2 ud og aflæst navn og email
        public User GetUser(int userId)
        {
            var user = (from u in db.users
                        where u.id == userId
                        select new User
                        {
                            Id = u.id,
                            Email = u.email,
                            Firstname = u.firstname,
                            Lastname = u.lastname,
                            Password = u.password,
                            Role = new Role { Id = u.role_id, AccessLevel = u.role.access_level, Name = u.role.name },
                            RoleId = u.role_id,
                            Username = u.username
                        }).First();

            return user;
        }

        //Testet. Ændring af fornavn
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

        //Testet ved at lave en bruger og se at den blev tilføjet i databasen
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

        //Testet både for at slette en bruger og at det ikke kan lade sig gøre at slette sin egen bruger
        public string DeleteUser(int userId, int loggedInAsUser = 2)
        {
            if (userId != loggedInAsUser)
            {
                var user = (from u in db.users where u.id == userId select u).First();
                db.users.DeleteOnSubmit(user);
                return Submit("Bruger slettet");
            }
            else
            {
                return "Du kan ikke slette din egen bruger.";
            }
        }


    }
}