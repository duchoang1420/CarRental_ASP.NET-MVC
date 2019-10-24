using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarRental_System.Models;


namespace CarRental_System.Controllers
{
    public class UserController : Controller
    {
        dbCarRental2DataContext data = new dbCarRental2DataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, Customer Cus)
        {
            var name = collection["Name"];
            var account = collection["Account"];
            var pass = collection["PassWords"];
            var email = collection["Email"];
            var address = collection["Addressed"];
            var phonenum = collection["Phonenumber"];
            var dob = string.Format("{0:MM/dd/yyyy}", collection["Dateofbirth"]);
            if (string.IsNullOrEmpty(name))
            {
                ViewData["error1"] = "What is your name?";
            }
            else if (string.IsNullOrEmpty(account))
            {
                ViewData["error2"] = "You will use this when log in";
            }
            else if (string.IsNullOrEmpty(pass))
            {
                ViewData["error3"] = "Please fill password";
            }
            else if (string.IsNullOrEmpty(email))
            {
                ViewData["error4"] = "Please enter a valid email address";
            }
            if (string.IsNullOrEmpty(address))
            {
                ViewData["error5"] = "Please fill here";
            }
            if (string.IsNullOrEmpty(phonenum))
            {
                ViewData["error6"] = "Please enter a valid mobile number";
            }
            else
            {
                Cus.NameCus= name;
                Cus.Account = account;
                Cus.pass = pass;
                Cus.Email = email;
                Cus.AddCustomer = address;
                Cus.phoneNum = phonenum;
                Cus.dob = DateTime.Parse(dob);
                data.Customers.InsertOnSubmit(Cus);
                data.SubmitChanges();
                return RedirectToAction("SignUp");
            }

            return this.Register();
        }
        [HttpGet]
        public ActionResult SignUp()
        {

            return View();
        }
        [HttpPost]
        public ActionResult SignUp(FormCollection collection)
        {
            var id = collection["ID"];
            var password = collection["Password"];
            if (string.IsNullOrEmpty(id))
            {
                ViewData["error7"] = "You must enter your account";
            }
            else if (String.IsNullOrEmpty(password))
            {
                ViewData["error8"] = "Your must enter your password";
            }
            else
            {
                Customer Cus = data.Customers.SingleOrDefault(n => n.Account == id && n.pass == password);
                if (Cus != null)
                {
                    ViewBag.nofitication = "Login successfull!!!";
                    Session["ID"] = Cus;
                    return RedirectToAction("Index", "CarRental");
                }
                else
                {
                    ViewBag.nofitication = "Account or Password is incorrect! Please try again";
                }
            }
            return View();
        }
    }


}