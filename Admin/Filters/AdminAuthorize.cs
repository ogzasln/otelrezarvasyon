using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;


namespace Admin.Filters
{
    public class AdminAuthorize : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["user"] != null)
            {
                Data.UserSet user = (Data.UserSet)httpContext.Session["user"];
                if (user.UserTypeSet.Title == "Admin")
                {
                    return true;
                }
            }

            httpContext.Response.Redirect("Home/Login");
            return false;
        }
    }
}