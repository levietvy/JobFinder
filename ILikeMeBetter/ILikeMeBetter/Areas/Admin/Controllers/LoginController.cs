using ILikeMeBetter.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using ILikeMeBetter.Areas.Admin.Code;

namespace ILikeMeBetter.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginModel model) {
            var result = new AccountModel().Login(model.UserName, model.Password);
            if (result && ModelState.IsValid )
            {
                SessionHelper.SetSession(new UserSession() { UserName = model.UserName});
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng");
            }
            return View(model);
        }
    }
}