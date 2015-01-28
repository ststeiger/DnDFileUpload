
using System.Web;


namespace DnDFileUpload.ajax
{


    /// <summary>
    /// Zusammenfassungsbeschreibung für GetFile
    /// </summary>
    public class GetFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string name = context.Request.Params["name"];
            string fn = System.Web.Hosting.HostingEnvironment.MapPath("~/downloads/" + name);
            string FileName = System.IO.Path.GetFileName(fn);
            
            context.Response.ClearHeaders();
            context.Response.ClearContent();
            context.Response.Clear();
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
            context.Response.AddHeader("Content-Length", 
                (new System.IO.FileInfo(fn)).Length.ToString()
            );
            context.Response.ContentType = "application/octet-stream";
            context.Response.TransmitFile(fn);
            context.Response.End();
        } // End Sub ProcessRequest 


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


    } // End Class GetFile : IHttpHandler


} // End Namespace DnDFileUpload.ajax
