using Data;
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
    public class CartController : BaseController
    {
        // GET: Cart
        public ActionResult Index()
        {
            var carts = getCarts();
            return View(carts);
        }

        public ActionResult PayForm()
        {
            var carts = getCarts();
            if (carts.Count() > 0)
            {
                ViewBag.Amount = carts.Sum(q => q.Project.Price);
                return View();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Pay(CreditViewModel credit)
        {
            var carts = getCarts();

            if (ModelState.IsValid)
            {
                foreach (var cart in carts)
                {
                    AdsAccess access = new AdsAccess();
                    access.UserSetId = UserHelper.Current().Id;
                    access.AdsId = cart.;

                    Payment payment = new Payment();
                    payment.Amount = cart.Project.Price;
                    payment.Date = DateTime.Now;
                    payment.UserSetId = UserHelper.Current().Id;
                    payment.AdsAccess = access;
                    db.PaymentSet.Add(payment);

                    cart.Status = CartStatus.Paid;
                }

                db.SaveChanges();

                return RedirectToAction("Success");
            }

            ViewBag.Amount = carts.Sum(q => q.Project.Price);
            return View("PayForm");
        }

        public ActionResult Success()
        {
            return View();
        }

        private IQueryable<Cart> getCarts()
        {
            int userId = UserHelper.Current().Id;
            return db.CartSet.Where(q => q.UserId == userId && q.Status == Data.CartStatus.New);
        }
    }
}