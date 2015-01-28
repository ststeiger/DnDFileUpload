using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DnDFileUpload
{



    public partial class DragOut : System.Web.UI.Page
    {

        public static string ToCanonicalUrl(string path)
        {
            if (path.StartsWith("~", StringComparison.InvariantCulture))
                path = System.Web.Hosting.HostingEnvironment.MapPath(path);

            path = System.IO.Path.GetFullPath(path);

            path = path.Substring(
                System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath.Length
            );

            path = path.Replace(System.IO.Path.DirectorySeparatorChar, '/');


            System.Web.HttpRequest req = System.Web.HttpContext.Current.Request;
            string str = String.Format("{0}{1}{2}{3}{4}/{5}"
                        , req.Url.Scheme
                        , System.Uri.SchemeDelimiter
                        , req.Url.Host
                        , req.Url.Port == 80 ? "" : ":" + req.Url.Port.ToString()
                        , req.ApplicationPath
                        ,path
                    );

            return str;
        } // En Function ToCanonicalUrl 


        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}