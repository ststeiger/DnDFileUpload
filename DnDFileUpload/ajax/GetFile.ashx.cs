using System;
using System.Collections.Generic;
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
            string fn = context.Server.MapPath("~/downloads/" + name);
            string FileName = System.IO.Path.GetFileName(fn);
            System.IO.FileInfo fi = new System.IO.FileInfo(fn);

            context.Response.ClearHeaders();
            context.Response.ClearContent();
            context.Response.Clear();
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
            context.Response.AddHeader("Content-Length", fi.Length.ToString());
            context.Response.ContentType = "application/octet-stream";
            context.Response.TransmitFile(fn);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}