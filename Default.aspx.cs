using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

namespace WebApplication2
{
    public partial class _Default : System.Web.UI.Page
    {
        public string Message = "message";
        public string AccessToken = "";
        public string ArticleTitle = "";
        public string FacebookProfileID = "";
        public string ErrorMessage { get; private set; }
        public string PostID { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}