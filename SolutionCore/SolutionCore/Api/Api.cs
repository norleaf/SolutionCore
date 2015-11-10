using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace SolutionCore.Api
{
    public class Api : ApiController
    {
        public DBDataContext db = new DBDataContext();

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