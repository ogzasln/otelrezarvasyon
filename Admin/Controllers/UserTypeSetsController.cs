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
    public class UserTypeSetsController : Controller
    {
        private dbEntities db = new dbEntities();

        // GET: UserTypeSets
        public ActionResult Index()
        {
            return View(db.UserTypeSet.ToList());
        }

        // GET: UserTypeSets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeSet userTypeSet = db.UserTypeSet.Find(id);
            if (userTypeSet == null)
            {
                return HttpNotFound();
            }
            return View(userTypeSet);
        }

        // GET: UserTypeSets/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserTypeSets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title")] UserTypeSet userTypeSet)
        {
            if (ModelState.IsValid)
            {
                db.UserTypeSet.Add(userTypeSet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userTypeSet);
        }

        // GET: UserTypeSets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeSet userTypeSet = db.UserTypeSet.Find(id);
            if (userTypeSet == null)
            {
                return HttpNotFound();
            }
            return View(userTypeSet);
        }

        // POST: UserTypeSets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title")] UserTypeSet userTypeSet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userTypeSet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userTypeSet);
        }

        // GET: UserTypeSets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserTypeSet userTypeSet = db.UserTypeSet.Find(id);
            if (userTypeSet == null)
            {
                return HttpNotFound();
            }
            return View(userTypeSet);
        }

        // POST: UserTypeSets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserTypeSet userTypeSet = db.UserTypeSet.Find(id);
            db.UserTypeSet.Remove(userTypeSet);
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
