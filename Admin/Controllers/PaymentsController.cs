﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class PaymentsController : Controller
    {
        private dbEntities db = new dbEntities();

        // GET: Payments
        public ActionResult Index()
        {
            var paymentSet = db.PaymentSet.Include(p => p.UserSet).Include(p => p.Ads);
            return View(paymentSet.ToList());

        }

        // GET: Payments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Payment payment = db.PaymentSet.Find(id);
            if (payment == null)
            {
                return HttpNotFound();
            }
            return View(payment);
        }

        // GET: Payments/Create
        public ActionResult Create()
        {
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name");
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name");
            return View();
        }

        // POST: Payments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserSetId,AdsId,Pay,Method")] Payment payment)
        {
            if (ModelState.IsValid)
            {
                db.PaymentSet.Add(payment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", payment.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", payment.AdsId);
            return View(payment);
        }

        // GET: Payments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Payment payment = db.PaymentSet.Find(id);
            if (payment == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", payment.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", payment.AdsId);
            return View(payment);
        }

        // POST: Payments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserSetId,AdsId,Pay,Method")] Payment payment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", payment.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", payment.AdsId);
            return View(payment);
        }

        // GET: Payments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Payment payment = db.PaymentSet.Find(id);
            if (payment == null)
            {
                return HttpNotFound();
            }
            return View(payment);
        }

        // POST: Payments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Payment payment = db.PaymentSet.Find(id);
            db.PaymentSet.Remove(payment);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
