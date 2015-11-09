using SolutionCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SolutionCore.Api
{
    public class ZipCodeApiController : Api
    {

        public List<ZipCode> PullZipCodes()
        {
            var zips = (from z in db.zip_codes

                             
                             select new Models.ZipCode
                             {
                                 Id = z.id,
                                 Zip = z.zip_code1,
                                 City = z.city
                             }
                             ).ToList();
            return zips;
        }

        public ZipCode PullZipCode(int zipId)
        {
            var zip = (from z in db.zip_codes
                       where z.id == zipId
                       select new ZipCode
                       {
                           Id = z.id,
                           Zip = z.zip_code1,
                           City = z.city
                       }).First();
            return zip;
        }

        public ZipCode PullZipCode(string zipCode)
        {
            var zip = (from z in db.zip_codes
                       where z.zip_code1 == zipCode
                       select new ZipCode
                       {
                           Id = z.id,
                           Zip = z.zip_code1,
                           City = z.city
                       }).First();
            return zip;
        }

        public ZipCode PullZipCode(Company company)
        {
            var zip = (from z in db.zip_codes
                       where z.zip_code1 == company.ZipCode
                       select new ZipCode
                       {
                           Id = z.id,
                           Zip = z.zip_code1,
                           City = z.city
                       }).First();

            if (zip == null)
            {
                ZipCode newZip = new ZipCode();
                newZip.Zip = company.ZipCode;
                newZip.City = company.City;
                CreateZipCode(newZip);
                zip = PullZipCode(company);
            }

            return zip;
        }

         


    public string CreateZipCode(ZipCode zipCode)
        {
            Models.zip_code zip = new zip_code();
            zip.zip_code1 = zipCode.Zip;
            zip.city = zipCode.City;

            db.zip_codes.InsertOnSubmit(zip);
            try
            {
                db.SubmitChanges();
                return "Ny zip code oprettet: "+ zip.zip_code1;
            }
            catch (Exception e)
            {
                return "Oprettelsen af ny zip mislykkedes. Kontakt IT-support med følgende fejlkode: " + e.Message; 
            }
        }
    }
}