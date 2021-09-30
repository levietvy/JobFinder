using ILikeMeBetter.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ILikeMeBetter.Areas.Admin.Code;

namespace ILikeMeBetter.Controllers
{
    public class UserController : Controller
    {

        // GET: User
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(User_Employee uEm)
        {
            var result = new UserEmployeeModel().Login(uEm.Username, uEm.Password);
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { UserName = uEm.Username });
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng");

            }
            return View(uEm);
        }
    }
}