using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopClothes.Models
{
    public class Product
    {
        public Product()
        {
        }

        public Product(int id, string tensp, int gia, string loai,string url_img, int sale)
        {
            Id = id;
            Tensp = tensp;
            Gia = gia;
            Loai = loai;
            Url_img = url_img;
            Sale = sale;
        }

        public int Id { get; set;}
        public string Tensp { get; set;}
        public int Gia { get; set;}
        public string Loai { get; set;}
        public string Url_img { get; set;}
        public int Sale { get; set;} 
    }
}