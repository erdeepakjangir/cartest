using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CarTest.DBEntity;
using CarTest.Models;
namespace CarTest.Logic
{
    public class CarLogic
    {
        public List<CarModel> SearchCarListByUser(int userID, string q)
        {
            List<CarModel> carList = new List<CarModel>();
            using (var context = new CarTestEntities())
            {
                var allData =context.Cars.Where(w => w.UserId == userID);
                if (!string.IsNullOrWhiteSpace(q))
                {
                    allData = allData.Where(w => w.Model.Contains(q) || w.Brand.Contains(q));
                }
                carList = allData.Select(s => new CarModel()
                     {
                         Brand = s.Brand,
                         CarID = s.CarID,
                         Model = s.Model,
                         New = s.New,
                         Price = s.Price,
                         Year = s.Year,

                     }).ToList();

                return carList;
            }

        }
        public CarModel GetCarDetailByUser(int carId, int userID)
        {
            CarModel detail = new CarModel();
            using (var context = new CarTestEntities())
            {
                detail = context.Cars.Where(w => w.UserId == userID && w.CarID == carId).Select(s => new CarModel()
                {
                    Brand = s.Brand,
                    CarID = s.CarID,
                    Model = s.Model,
                    New = s.New,
                    Price = s.Price,
                    Year = s.Year,

                }).FirstOrDefault();

                return detail;
            }
        }
        public bool AddCar(CarModel model)
        {
            try
            {
                Car car = new Car();
                car.Brand = model.Brand;
                car.Model = model.Model;
                car.Year = model.Year;
                car.Price = model.Price;
                car.New = model.New;
                car.UserId = model.UserId;

                using (var context = new CarTestEntities())
                {
                    context.Cars.Add(car);
                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception  )
            {
                return false;
            }
        }
        public bool UpdateCar(CarModel model)
        {
            try
            {
                using (var context = new CarTestEntities())
                {
                    Car car = context.Cars.Where(w => w.CarID == model.CarID).FirstOrDefault();
                    car.Brand = model.Brand;
                    car.Model = model.Model;
                    car.Year = model.Year;
                    car.Price = model.Price;
                    car.New = model.New;
                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception  )
            {
                return false;
            }
        }
        public bool DeleteCar(int carId)
        {
            try
            {
                using (var context = new CarTestEntities())
                {
                    Car car = context.Cars.Where(w => w.CarID == carId).FirstOrDefault();
                    context.Cars.Remove(car);
                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception  )
            {
                return false;
            }
        }
    }
}