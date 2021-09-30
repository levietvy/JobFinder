using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ILikeMeBetter.Models
{
    public class UserEmployeeModel
    {
        private UserEntities context = null;

        public UserEmployeeModel()
        {
            context = new UserEntities();
        }

        public bool Login(string username, string password)
        {
            object[] sqlParams =
            {
                new SqlParameter("@Username", username),
                new SqlParameter("@Password", password),
            };
            var res = 
                context.Database.SqlQuery<bool>("User_Employee_Login @Username, @Password", sqlParams).SingleOrDefault();
            return res;
        }
    }
}