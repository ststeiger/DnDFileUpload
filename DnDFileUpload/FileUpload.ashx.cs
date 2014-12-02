
namespace DnDFileUpload
{


	public class FileUpload : System.Web.IHttpHandler
	{
		

		public void ProcessRequest (System.Web.HttpContext context)
		{
			if (!string.IsNullOrEmpty(context.Request.Headers["X-File-Name"]))
			{
				string path = context.Server.MapPath("~/Uploads");
				string file = System.IO.Path.Combine(path, context.Request.Headers["X-File-Name"]);

				// throw new Exception(System.Environment.UserName);
				int cnt = context.Request.Files.Count;
				System.Console.WriteLine (cnt);


                System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
				if (!di.Exists) di.Create();

                using (System.IO.FileStream fileStream = new System.IO.FileStream(file, System.IO.FileMode.OpenOrCreate))
				{
					// context.Request.InputStream.CopyTo(fileStream);
                    CopyStream(context.Request.InputStream, fileStream);
					fileStream.Close();
                } // End Using fileStream

            } // End if (!string.IsNullOrEmpty(context.Request.Headers["X-File-Name"]))

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
