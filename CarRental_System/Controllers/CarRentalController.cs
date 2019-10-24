using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using CarRental_System.Models;
using PagedList;
using PagedList.Mvc;

namespace CarRental_System.Controllers
{
    public class CarRentalController : Controller
    {
        // GET: CarRental
        dbCarRental2DataContext data = new dbCarRental2DataContext();

        private List<CAR> takeNewCar(int count)
        {
            return data.CARs.OrderByDescending(a => a.Updatedate).Take(count).ToList();
        }
        public ActionResult Index(int? page)
        {
            int pageSize = 5;
            int numPage = (page ?? 1);
            var newcar = takeNewCar(20);
            return View(newcar.ToPagedList(numPage, pageSize));
        }
        public ActionResult Car_Category()
        {
            var Car_Category = from cd in data.Car_Categories select cd;
            return PartialView(Car_Category);
        }
        public ActionResult BRANCH()
        {
            var branch = from br in data.BRANCHes select br;
            return PartialView(branch);
        }
        public ActionResult SPCateCar(int id)
        {
            var CAR = from s in data.CARs where s.CateID == id select s;
            return View(CAR);
        }
        public ActionResult SPBRANCH(int id)
        {
            var CAR = from s in data.CARs where s.BranchID == id select s;
            return View(CAR);
        }

        public ActionResult Details(int id)
        {
            var CAR = from s in data.CARs where s.CarID == id select s;
            return View(CAR.Single());
        }

    }
}