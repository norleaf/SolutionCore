using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace SolutionCore.Api
{
    public class ContactApiController : Api
    {
        DBDataContext db = new DBDataContext();
    }
}