﻿using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Filters;
using Web.Helpers;
using Web.ViewModel;

namespace Web.Controllers
{
    [MemberAuthorize]
    public class CreditController : BaseController
    {
        // GET: Credit
        public ActionResult Index(int Id)
        {
            var project = db.ProjectSet.FirstOrDefault(q => q.Id == Id);
            ViewBag.project = project;

            return View();
        }

        [HttpPost]
        public ActionResult Pay(int Id, CreditViewModel credit)
        {
            Ads project = db.ProjectSet.FirstOrDefault(q => q.Id == Id);

            if (ModelState.IsValid)
            {
                Ads access = new AdsAccess();
                access.UserId = UserHelper.Current().Id;
                access.ProjectId = project.Id;

                Payment payment = new Payment();
                payment.Amount = Ads.Price;
                payment.Date = DateTime.Now;
                payment.UserSetId = UserHelper.Current().Id;
                payment.AdsAccess = access;
                db.PaymentSet.Add(payment);

                db.SaveChanges();

                return RedirectToAction("Success");
            }

            ViewBag.project = project;

            return View("Index");
        }

        public ActionResult Success()
        {
            return View();
        }

        public ActionResult List()
        {
            var UserId = UserHelper.Current().Id;
            var payments = db.PaymentSet.Where(q => q.UserId == UserId).AsEnumerable();
            return View(payments);
        }
    }
}