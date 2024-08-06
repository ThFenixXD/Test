using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

namespace AppTest.Util
{
    public class PageBase : System.Web.UI.Page
    {
        public static void EscondePaineis(Control container)
        {
            if (container is Panel)
                container.Visible = false;

            foreach (Control ctrl in container.Controls)
                EscondePaineis(ctrl);
        }
    }
}