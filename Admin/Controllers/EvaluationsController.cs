using System;
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
    public class EvaluationsController : Controller
    {
        private dbEntities db = new dbEntities();

        // GET: Evaluations
        public ActionResult Index()
        {
            var evaluationSet = db.EvaluationSet.Include(e => e.UserSet).Include(e => e.Ads);
            return View(evaluationSet.ToList());
        }

        // GET: Evaluations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Evaluation evaluation = db.EvaluationSet.Find(id);
            if (evaluation == null)
            {
                return HttpNotFound();
            }
            return View(evaluation);
        }

        // GET: Evaluations/Create
        public ActionResult Create()
        {
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name");
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name");
            return View();
        }

        // POST: Evaluations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserSetId,AdsId,Name,Title")] Evaluation evaluation)
        {
            if (ModelState.IsValid)
            {
                db.EvaluationSet.Add(evaluation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", evaluation.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", evaluation.AdsId);
            return View(evaluation);
        }

        // GET: Evaluations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Evaluation evaluation = db.EvaluationSet.Find(id);
            if (evaluation == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", evaluation.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", evaluation.AdsId);
            return View(evaluation);
        }

        // POST: Evaluations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserSetId,AdsId,Name,Title")] Evaluation evaluation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(evaluation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserSetId = new SelectList(db.UserSet, "Id", "Name", evaluation.UserSetId);
            ViewBag.AdsId = new SelectList(db.Ads, "Id", "Name", evaluation.AdsId);
            return View(evaluation);
        }

        // GET: Evaluations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Evaluation evaluation = db.EvaluationSet.Find(id);
            if (evaluation == null)
            {
                return HttpNotFound();
            }
            return View(evaluation);
        }

        // POST: Evaluations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Evaluation evaluation = db.EvaluationSet.Find(id);
            db.EvaluationSet.Remove(evaluation);
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
