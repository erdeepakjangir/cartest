using CarTest.Filters;
using CarTest.Logic;
using CarTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
namespace CarTest.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class CarsController : Controller
    {
        private CarLogic carLogic = new CarLogic();
        public CarsController()
        {

        }

        //
        // GET: /Cars/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        public ActionResult List(string q="")
        {
            ViewBag.SearchQuery = q;
            return View(carLogic.SearcgCarListByUser(WebSecurity.GetUserId(User.Identity.Name),q));
        }
        //
        // GET: /Cars/upsert/5

        public ActionResult Upsert(int id)
        {
            CarModel details = new CarModel();
            if (id>0)
            {
                details = carLogic.GetCarDetailByUser(id, WebSecurity.GetUserId(User.Identity.Name));    
            }
            
            return View(details);
        }
        [HttpPost]
        public ActionResult Upsert(CarModel carModel)
        {

            if (ModelState.IsValid)
            {
                carModel.UserId = WebSecurity.GetUserId(User.Identity.Name);
                if (carModel.CarID > 0)
                {
                    carLogic.UpdateCar(carModel);
                }
                else
                {
                    carLogic.AddCar(carModel);
                }
                //do stuff
                return Json(new { status = "success" });
            }
            return Json(new
            {
                status = "failure",
                formErrors = ModelState.Select(kvp => new { key = kvp.Key, errors = kvp.Value.Errors.Select(e => e.ErrorMessage) })
            });
        }







        //
        // GET: /Cars/Delete/5

        public ActionResult Delete(int id)
        {
            var result = carLogic.DeleteCar(id);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        //
        // POST: /Cars/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
