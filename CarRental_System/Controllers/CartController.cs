//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using CarRental_System.Models;

//namespace CarRental_System.Controllers
//{
//    public class CartController : Controller
//    {
//        // GET: Cart
//        dbCarRental2DataContext data = new dbCarRental2DataContext();
//        public List<Cart> takeCart()
//        {
//            List<Cart> lstCart = Session["Cart"] as List<Cart>;
//            if (lstCart == null)
//            {
//                lstCart = new List<Cart>();
//                Session["Cart"] = lstCart;
//            }

//            return lstCart;
//        }
//        public ActionResult AddMoreCart(int iCarID, string strURL)
//        {
//            List<Cart> lstCart = takeCart();
//            Cart product = lstCart.Find(n => n.iCarID == iCarID);
//            if (product == null)
//            {
//                product = new Cart(iCarID);
//                lstCart.Add(product);
//                return Redirect(strURL);
//            }
//            else
//            {
//                product.iQuantity++;
//                return Redirect(strURL);
//            }
//        }
//        private int Total()
//        {
//            int iTotal = 0;
//            List<Cart> lstCart = Session["Cart"] as List<Cart>;
//            if (lstCart != null)
//            {
//                iTotal = lstCart.Sum(n => n.iQuantity);
//            }
//            return iTotal;
//        }
//        private double TotalMoney()
//        {
//            double dTotalMoney = 0;
//            List<Cart> lstCart = Session["Cart"] as List<Cart>;
//            if (lstCart != null)
//            {
//                dTotalMoney = lstCart.Sum(n => n.dInto_money);
//            }
//            return dTotalMoney;
//        }

//        public ActionResult Cart()
//        {
//            List<Cart> lstCart = takeCart();
//            if (lstCart.Count == 0)
//            {
//                return RedirectToAction("Index", "Rentalcar");
//            }
//            ViewBag.Total = Total();
//            ViewBag.Totalmoney = TotalMoney();
//            return View(lstCart);
//        }
//        public ActionResult CartPartial()
//        {
//            ViewBag.Total = Total();
//            ViewBag.Totalmoney = TotalMoney();
//            return PartialView();
//        }
//        public ActionResult DeleteCart(int iProID)
//        {
//            List<Cart> lstCart = takeCart();
//            Cart product = lstCart.SingleOrDefault(n => n.iCarID == iProID);
//            if (product != null)
//            {
//                lstCart.RemoveAll(n => n.iCarID == iProID);
//                return RedirectToAction("Cart");
//            }
//            if (lstCart.Count == 0)
//            {
//                return RedirectToAction("Index", "Rentalcar");
//            }
//            return RedirectToAction("Cart");
//        }
//        public ActionResult UpdateCart(int iProID, FormCollection f)
//        {
//            List<Cart> lstCart = takeCart();
//            Cart product = lstCart.SingleOrDefault(n => n.iCarID == iProID);
//            if (product != null)
//            {
//                product.iQuantity = int.Parse(f["txtSoluong"].ToString());
//            }
//            return RedirectToAction("Cart");
//        }
//        public ActionResult DeleteAllCart()
//        {
//            List<Cart> lstCart = takeCart();
//            lstCart.Clear();
//            return RedirectToAction("Index", "RentalCar");
//        }
//        [HttpGet]
//        public ActionResult Order()
//        {

//            if (Session["ID"] == null || Session["ID"].ToString() == "")
//            {
//                return RedirectToAction("SignUp", "User");
//            }
//            if (Session["Cart"] == null)
//            {
//                return RedirectToAction("Index", "Rentalcar");
//            }

//            List<Cart> lstCart = takeCart();
//            ViewBag.Total = Total();
//            ViewBag.Totalmoney = TotalMoney();
//            return View(lstCart);
//        }
//        [HttpPost]
//        public ActionResult Order(FormCollection collection)
//        {
//            OrderBill odb = new OrderBill();
//            Customer Cus = (Customer)Session["ID"];
//            List<Cart> ca = takeCart();
//            odb.CusID = Cus.CusID;
//            odb.DateOrder = DateTime.Now;
//            var timerent = String.Format("{0:MM/dd/yyyy}", collection["Time_Rent"]);
//            odb.Time_Rent = DateTime.Parse(timerent);
//            odb.orderDetails = false;
//            odb.paid = false;
//            db.OrderBills.InsertOnSubmit(odb);
//            db.SubmitChanges();
//            foreach (var item in ca)
//            {
//                OrderDetail odd = new OrderDetail();
//                odd.OrderID = odb.OrderID;
//                odd.CarID = item.iCarID;
//                odd.Quantity = item.iQuantity;
//                odd.unitPrice = (decimal)item.dUnitPrice;
//                db.OrderDetails.InsertOnSubmit(odd);
//            }
//            db.SubmitChanges();
//            Session["Cart"] = null;
//            return RedirectToAction("OrderConfirmation", "Cart");
//        }

//        public ActionResult OrderConfirmation()
//        {
//            return View();
//        }
//    }
//}