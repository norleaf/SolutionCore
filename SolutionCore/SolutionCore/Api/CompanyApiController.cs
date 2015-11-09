using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using SolutionCore.Models;

namespace SolutionCore.Api
{
    public class CompanyApiController : Api
    {

        public string DeleteCompany(int companyId)
        {
            var company = (from c in db.companies
                           where c.id == companyId
                           select c).First();

            db.companies.DeleteOnSubmit(company);
            try
            {
                db.SubmitChanges();
                return company.name + " blev slettet.";
            }
            catch (Exception e)
            {
                return "sletning mislykkedes pga databaseproblemer. Kontakt IT-support og videregiv efterfølgende fejlbesked: " + e.Message;
            }
        }

        public string UpdateCompany(int companyId, Company newCompany)
        {
            var company = (from c in db.companies
                           where c.id == companyId
                           select c).First();

            company.name = newCompany.Name;

            ZipCodeApiController zipControl = new ZipCodeApiController();


            var zip = zipControl.PullZipCode(newCompany);
            
           


            company.cvr = Int32.Parse(newCompany.CVR);
            company.phone = Int32.Parse(newCompany.Phone);
            company.email = newCompany.Email;
            company.ceo = newCompany.CEO;
            company.startup_date = newCompany.StartUpDate;
            company.is_activ = newCompany.Active;
            company.description = newCompany.ReasonNotActive;
            company.financial_report = newCompany.FinancialReport;
            company.advertising_protected = newCompany.AdverticingProtected;
            company.empoye_count = newCompany.EmployeeCount;
            company.address = newCompany.Address;
            company.zip_code_id = zip.Id;
            try
            {
                db.SubmitChanges();
                return newCompany.Name + " opdateret.";
            }
            catch (Exception e)
            {
                return "Operationen mislykkedes. Kontakt IT-Support med følgende fejlbesked: " + e.Message;
            }
        }


        public List<Models.Company> PullCompanies()
        {
            var companies = (from c in db.companies
                             from z in db.zip_codes
                             where z.id == c.zip_code_id
                             select new Models.Company
                             {
                                 Id = c.id,
                                 Name = c.name,
                                 CVR = c.cvr.ToString(),
                                 Phone = c.phone.ToString(),
                                 Email = c.email,
                                 CEO = c.ceo,
                                 StartUpDate = c.startup_date,
                                 Active = c.is_activ.GetValueOrDefault(false),
                                 ReasonNotActive = c.description,
                                 FinancialReport = c.financial_report,
                                 AdverticingProtected = c.advertising_protected.GetValueOrDefault(true),
                                 EmployeeCount = c.empoye_count,
                                 ZipCode = z.zip_code1,
                                 City = z.city,
                                 Address = c.address
                             }
                             ).ToList();
            return companies;
        }

        public Company PullCompany(int v)
        {
            Company company = (from c in db.companies
                               from z in db.zip_codes
                               where c.id == v && z.id == c.zip_code_id
                               select new Company
                               {
                                   Id = c.id,
                                   Name = c.name,
                                   CVR = c.cvr.ToString(),
                                   Phone = c.phone.ToString(),
                                   Email = c.email,
                                   CEO = c.ceo,
                                   StartUpDate = c.startup_date,
                                   Active = c.is_activ.GetValueOrDefault(false),
                                   ReasonNotActive = c.description,
                                   FinancialReport = c.financial_report,
                                   AdverticingProtected = c.advertising_protected.GetValueOrDefault(true),
                                   EmployeeCount = c.empoye_count,
                                   ZipCode = z.zip_code1,
                                   City = z.city,
                                   Address = c.address
                               }).First();

            return company;
        }
    }
}