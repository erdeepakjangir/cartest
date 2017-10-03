using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CarTest.Models
{
    public class CarModel
    {
        public int CarID { get; set; }
        [Required]
        public string Brand { get; set; }
        [Required]
        public string Model { get; set; }
        [Required]
        [Range(1990,2018)]
        public Nullable<int> Year { get; set; }
        [Required]
        public Nullable<double> Price { get; set; }
        public bool New { get; set; }
        public int UserId { get; set; }
    }
}