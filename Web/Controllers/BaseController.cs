﻿using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class BaseController : Controller
    {
        public dbEntities db = new dbEntities();

        public BaseController()
        {
            var httpContext = System.Web.HttpContext.Current;

            if (httpContext.Application["categories"] == null)
            {
                httpContext.Application["categories"] = db.CategorySet.ToList();
            }
        }
    }
}