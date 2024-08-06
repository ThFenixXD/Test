using System;
using System.Web;
using System.Linq;
using System.Net.Mail;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace AppTest.Util
{
    public class Framework
    {
        public static string FormatWithMask(string input, string mask)
        {
            if (string.IsNullOrEmpty(input)) return input;
            var output = string.Empty;
            var index = 0;
            foreach (var m in mask)
            {
                if (m == '#')
                {
                    if (index < input.Length)
                    {
                        output += input[index];
                        index++;
                    }
                }
                else
                    output += m;
            }
            return output;
        }

        public static DataTable GetDataTable(string query)
        {
            String ConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);
            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }
            return myDataTable;
        }

        public static void Alerta(string _titulo, string _msg, string _tipo)
        {
            Page p = HttpContext.Current.CurrentHandler as Page;
            ScriptManager.RegisterStartupScript(p, p.GetType(), "Popup", "Alerta('" + _titulo + "','" + _msg + "','" + _tipo + "');", true);
        }
    }
}