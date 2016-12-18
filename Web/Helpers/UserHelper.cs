using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Helpers
{
    public static class UserHelper
    {
        public static UserSet Current()
        {
            return (UserSet)HttpContext.Current.Session["user"];
        }

        public static bool isAdmin()
        {
            return Current() != null && Current().UserTypeSet.Title == "Admin";
        }

        public static bool isMember()
        {
            return Current() != null;
        }

        public static bool isGuest()
        {
            return Current() == null;
        }
    }
}