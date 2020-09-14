using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Configuration;
using System.Web;
using System.Web.Services;

namespace FGEI
{
    /// <summary>
    /// Summary description for Admin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Admin : System.Web.Services.WebService
    {
        string connectionStr = ConfigurationManager.ConnectionStrings["FGEICon"].ConnectionString;

        [WebMethod]
        public string StoreDB(string id1, string ad1, string caseno1, string posts1, string fee1, string dept1, string adate1, string cdate1)
        {
            string[] arid = id1.Split(',').Select(i => i.Trim()).ToArray();
            string[] arad = ad1.Split(',').Select(i => i.Trim()).ToArray();
            string[] arcase = caseno1.Split(',').Select(i => i.Trim()).ToArray();
            string[] arpost = posts1.Split(',').Select(i => i.Trim()).ToArray();
            string[] arfee = fee1.Split(',').Select(i => i.Trim()).ToArray();
            string[] ardept = dept1.Split(',').Select(i => i.Trim()).ToArray();
            string[] aradate = adate1.Split(',').Select(i => i.Trim()).ToArray();
            string[] arcdate = cdate1.Split(',').Select(i => i.Trim()).ToArray();
            int Cnt = 0;
            for (Cnt = 0; Cnt <= arid.Length - 1; Cnt++)
            {
                using (SqlConnection connection = new SqlConnection(connectionStr))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("insert into Ad_TBL(id,ad,caseno,post,fee,department,ad_date,close_date) values('" + arid[Cnt] + "','" + arad[Cnt] + "','" + arcase[Cnt] + "','" + arpost[Cnt] + "','" + arfee[Cnt] + "','" + ardept[Cnt] + "','" + aradate[Cnt] + "','" + arcdate[Cnt] + "')", connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            return "0";
        }
    }
}
