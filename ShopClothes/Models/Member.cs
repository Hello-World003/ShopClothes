using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopClothes.Models
{
    public class Member
    {
        public Member()
        {
        }

        public Member(int id, string nickName, string pass)
        {
            Id = id;
            NickName = nickName;
            Pass = pass;
        }

        public int Id { get; set; }
        public string NickName { get; set; }
        public string Pass { get; set; }
 
    }
}