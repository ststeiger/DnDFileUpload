
namespace DnDFileUpload
{


	public class FileUpload 
        : System.Web.IHttpHandler
	{


		public void ProcessRequest (System.Web.HttpContext context)
		{
            string path = context.Server.MapPath("~/Uploads");
            context.Response.ContentType = "text/plain";

            System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);

            if (!di.Exists)
                di.Create();

            // throw new Exception(System.Environment.UserName);


            if (context.Request.Form == null)
            {
                context.Response.Write("Error, not a POST-request."); 
                return;
            } // End if (context.Request.Form == null) 


            if (!string.IsNullOrEmpty(context.Request.Headers["X-File-Name"]))
            {
                string file = System.IO.Path.Combine(path, context.Request.Headers["X-File-Name"]);

                context.Response.Write(file);
                context.Response.Write(System.Environment.NewLine);

                using (System.IO.FileStream fileStream = new System.IO.FileStream(file, System.IO.FileMode.OpenOrCreate))
                {
                    CopyStream(context.Request.InputStream, fileStream);
                    fileStream.Close();
                } // End Using fileStream

            } // End if (!string.IsNullOrEmpty(context.Request.Headers["X-File-Name"]))
            else
            {
                for (int i = 0; i < context.Request.Files.Count; ++i)
                {
                    if (context.Request.Files[i].ContentLength == 0)
                        continue;

                    string file = System.IO.Path.Combine(path, System.IO.Path.GetFileName(context.Request.Files[i].FileName));

                    context.Response.Write(file);
                    context.Response.Write(System.Environment.NewLine);

                    // System.Console.WriteLine(context.Request.Files[i].ContentLength);
                    // System.Console.WriteLine(context.Request.Files[i].ContentType);

                    context.Request.Files[i].SaveAs(file);
                } // Next i 

            } // End Else of if (!string.IsNullOrEmpty(context.Request.Headers["X-File-Name"])) 


            context.Response.Write(System.Environment.NewLine);
            context.Response.Write(System.Environment.NewLine);
            context.Response.Write(System.Environment.NewLine);


            string headers = "";

            foreach (string key in context.Request.Headers.AllKeys)
            {
                context.Response.Write(key);
                context.Response.Write(": ");
                context.Response.Write(context.Request.Headers[key]);
                context.Response.Write(System.Environment.NewLine);

                headers += key + ": " + context.Request.Headers[key] + System.Environment.NewLine;
            } // Next key 

            System.Console.WriteLine(headers);
            context.Response.Write("processed");
        } // End Sub ProcessRequest 
        

        public static void CopyStream(System.IO.Stream input, System.IO.Stream output)
        {
            byte[] buffer = new byte[32768];

            int read;
            while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
            {
                output.Write(buffer, 0, read);
            } // Whend 

        } // End Sub CopyStream 


        public bool IsReusable
        {
            get
            {
                return false;
            }
        } // End Property IsReusable


	} // End Class FileUpload : System.Web.IHttpHandler


} // End Namespace DnDFileUpload
