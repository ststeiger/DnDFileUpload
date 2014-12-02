
using System.Runtime.InteropServices;

// http://stackoverflow.com/questions/15663066/converting-icon-to-png-file-on-a-web-server-c-sharp
// IconAsSizedPng
// I am trying to convert an icon to png on a web server with the following code. 
// But I always get the "GDI+ generic error", when saving the bitmap. What am I missing?

// I had to change the Identity of AppPoolUser to "LocalSystems". 
// Now it works. Seems like it is somehow a "permission" problem.


// http://www.codeproject.com/Articles/29137/Get-Registered-File-Types-and-Their-Associated-Ico

namespace FileTypeAndIcon
{
    /// <summary>
    /// Structure that encapsulates basic information of icon embedded in a file.
    /// </summary>
    public struct EmbeddedIconInfo
    {
        public string FileName;
        public int IconIndex;
    }

    public class RegisteredFileType
    {

        public static System.Collections.Hashtable ht = FileTypeAndIcon.RegisteredFileType.GetFileTypeAndIcon();

        public static bool IconExists(string ext)
        {
            if (!ext.StartsWith("."))
                ext = "." + ext;

            return ht.ContainsKey(ext);
        }


        public static string GetIconAsBase64(string ext)
        {
            if (!ext.StartsWith("."))
                ext = "." + ext;

            byte[] ico = GetIconImageBytes(ext);
            if (ico == null)
                return null;

            return System.Convert.ToBase64String(ico);
            // System.Convert.FromBase64String(temp_inBase64); // And back
        }



        public static void AddMimes(System.Collections.Generic.Dictionary<string, string> dictMimes)
        {
            foreach (object x in ht.Keys)
            {
                string key = (string)x;
                string str = GetIconAsBase64(key);

                if (key.StartsWith("."))
                    key = key.Substring(1);

                if (!string.IsNullOrEmpty(str))
                    dictMimes[key] = str;
            }
        }

        
        public static string GetAllMimes()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            foreach(object x in ht.Keys)
            {
                string key = (string)x;
                string str = GetIconAsBase64(key);

                if(!string.IsNullOrEmpty(str))
                    sb.AppendFormat("dictImages.Add(\"{0}\", \"{1}\");" + System.Environment.NewLine, key, str);

            }

            return sb.ToString();
        }

                

        public static byte[] GetIconImageBytes(string ext)
        {
            if (!ext.StartsWith("."))
                ext = "." + ext;

            string fn = (string)ht[ext];


            System.Drawing.Icon ico = FileTypeAndIcon.RegisteredFileType.ExtractIconFromFile(fn, true);
            if (ico == null)
                return null;

            byte[] baIcon = null;
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            {
                ico.Save(ms);
                baIcon = ms.ToArray();
            }

            byte[] bapng = IconAsSizedPng(baIcon, ico.Size.Width);


            // System.IO.File.WriteAllBytes(@"C:\Users\Administrator\Downloads\FileTypeAndIcon\FileTypeAndIcon\FileTypeAndIcon\obj\lala.ico", baIcon);
            // System.IO.File.WriteAllBytes(@"C:\Users\Administrator\Downloads\FileTypeAndIcon\FileTypeAndIcon\FileTypeAndIcon\obj\lala.png", bapng);
            return bapng;
        }



        private static byte[] IconAsSizedPng(byte[] iconBytes, int iSize)
        {
            System.Drawing.Icon icon;
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream(iconBytes))
                icon = new System.Drawing.Icon(ms, iSize, iSize);
            using (icon)
            {
                using (System.Drawing.Bitmap bmp = icon.ToBitmap())
                {
                    //bmp.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);
                    using (var ms = new System.IO.MemoryStream())
                    {
                        bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                        return ms.ToArray();
                    }
                }
            }
        }



        #region APIs

        [DllImport("shell32.dll", EntryPoint = "ExtractIconA", CharSet = CharSet.Ansi, SetLastError = true, ExactSpelling = true)]
        private static extern System.IntPtr ExtractIcon(int hInst, string lpszExeFileName, int nIconIndex);

        [DllImport("shell32.dll", CharSet = CharSet.Auto)]
        private static extern uint ExtractIconEx(string szFileName, int nIconIndex, System.IntPtr[] phiconLarge, System.IntPtr[] phiconSmall, uint nIcons);

        [DllImport("user32.dll", EntryPoint = "DestroyIcon", SetLastError = true)]
        private static unsafe extern int DestroyIcon(System.IntPtr hIcon);

        #endregion        

        #region CORE METHODS

        /// <summary>
        /// Gets registered file types and their associated icon in the system.
        /// </summary>
        /// <returns>Returns a hash table which contains the file extension as keys, the icon file and param as values.</returns>
        public static System.Collections.Hashtable GetFileTypeAndIcon()
        {
            try
            {
                // Create a registry key object to represent the HKEY_CLASSES_ROOT registry section
                Microsoft.Win32.RegistryKey rkRoot = Microsoft.Win32.Registry.ClassesRoot;

                //Gets all sub keys' names.
                string[] keyNames = rkRoot.GetSubKeyNames();
                System.Collections.Hashtable iconsInfo = new System.Collections.Hashtable();

                //Find the file icon.
                foreach (string keyName in keyNames)
                {
                    if (string.IsNullOrEmpty(keyName))
                        continue;
                    int indexOfPoint = keyName.IndexOf(".");
                    
                    //If this key is not a file exttension(eg, .zip), skip it.
                    if (indexOfPoint != 0)
                        continue;

                    Microsoft.Win32.RegistryKey rkFileType = rkRoot.OpenSubKey(keyName);
                    if (rkFileType == null)
                        continue;

                    //Gets the default value of this key that contains the information of file type.
                    object defaultValue = rkFileType.GetValue("");
                    if (defaultValue == null)
                        continue;

                    //Go to the key that specifies the default icon associates with this file type.
                    string defaultIcon = defaultValue.ToString() + "\\DefaultIcon";
                    Microsoft.Win32.RegistryKey rkFileIcon = rkRoot.OpenSubKey(defaultIcon);
                    if (rkFileIcon != null)
                    {
                        //Get the file contains the icon and the index of the icon in that file.
                        object value = rkFileIcon.GetValue("");
                        if (value != null)
                        {
                            //Clear all unecessary " sign in the string to avoid error.
                            string fileParam = value.ToString().Replace("\"", "");
                            iconsInfo.Add(keyName, fileParam);
                        }
                        rkFileIcon.Close();
                    }
                    rkFileType.Close();
                }
                rkRoot.Close();
                return iconsInfo;
            }
            catch (System.Exception exc)
            {
                throw exc;
            }
        }

        /// <summary>
        /// Extract the icon from file.
        /// </summary>
        /// <param name="fileAndParam">The params string, 
        /// such as ex: "C:\\Program Files\\NetMeeting\\conf.exe,1".</param>
        /// <returns>This method always returns the large size of the icon (may be 32x32 px).</returns>
        public static System.Drawing.Icon ExtractIconFromFile(string fileAndParam)
        {
            try
            {
                EmbeddedIconInfo embeddedIcon = getEmbeddedIconInfo(fileAndParam);

                //Gets the handle of the icon.
                System.IntPtr lIcon = ExtractIcon(0, embeddedIcon.FileName, embeddedIcon.IconIndex);

                //Gets the real icon.
                return System.Drawing.Icon.FromHandle(lIcon);
            }
            catch (System.Exception exc)
            {
                throw exc;
            }
        }

        /// <summary>
        /// Extract the icon from file.
        /// </summary>
        /// <param name="fileAndParam">The params string, 
        /// such as ex: "C:\\Program Files\\NetMeeting\\conf.exe,1".</param>
        /// <param name="isLarge">
        /// Determines the returned icon is a large (may be 32x32 px) 
        /// or small icon (16x16 px).</param>
        public static System.Drawing.Icon ExtractIconFromFile(string fileAndParam, bool isLarge)
        {
            unsafe
            {
                uint readIconCount = 0;
                System.IntPtr[] hDummy = new System.IntPtr[1] { System.IntPtr.Zero };
                System.IntPtr[] hIconEx = new System.IntPtr[1] { System.IntPtr.Zero };

                try
                {
                    EmbeddedIconInfo embeddedIcon = getEmbeddedIconInfo(fileAndParam);

                    if (isLarge)
                        readIconCount = ExtractIconEx(embeddedIcon.FileName, 0, hIconEx, hDummy, 1);
                    else
                        readIconCount = ExtractIconEx(embeddedIcon.FileName, 0, hDummy, hIconEx, 1);

                    if (readIconCount > 0 && hIconEx[0] != System.IntPtr.Zero)
                    {
                        // Get first icon.
                        System.Drawing.Icon extractedIcon = (System.Drawing.Icon)
                            System.Drawing.Icon.FromHandle(hIconEx[0]).Clone();

                        return extractedIcon;
                    }
                    else // No icon read
                        return null;
                }
                catch (System.Exception exc)
                {
                    // Extract icon error.
                    throw new System.ApplicationException("Could not extract icon", exc);
                }
                finally
                {
                    // Release resources.
                    foreach (System.IntPtr ptr in hIconEx)
                        if (ptr != System.IntPtr.Zero)
                            DestroyIcon(ptr);

                    foreach (System.IntPtr ptr in hDummy)
                        if (ptr != System.IntPtr.Zero)
                            DestroyIcon(ptr);
                }
            }
        }

        #endregion

        #region UTILITY METHODS

        /// <summary>
        /// Parses the parameters string to the structure of EmbeddedIconInfo.
        /// </summary>
        /// <param name="fileAndParam">The params string, 
        /// such as ex: "C:\\Program Files\\NetMeeting\\conf.exe,1".</param>
        /// <returns></returns>
        protected static EmbeddedIconInfo getEmbeddedIconInfo(string fileAndParam)
        {
            EmbeddedIconInfo embeddedIcon = new EmbeddedIconInfo();

            if (string.IsNullOrEmpty(fileAndParam))
                return embeddedIcon;

            //Use to store the file contains icon.
            string fileName = string.Empty;

            //The index of the icon in the file.
            int iconIndex = 0;
            string iconIndexString = string.Empty;

            int commaIndex = fileAndParam.IndexOf(",");
            //if fileAndParam is some thing likes that: "C:\\Program Files\\NetMeeting\\conf.exe,1".
            if (commaIndex > 0)
            {
                fileName = fileAndParam.Substring(0, commaIndex);
                iconIndexString = fileAndParam.Substring(commaIndex + 1);
            }
            else
                fileName = fileAndParam;

            if (!string.IsNullOrEmpty(iconIndexString))
            {
                //Get the index of icon.
                iconIndex = int.Parse(iconIndexString);
                if (iconIndex < 0)
                    iconIndex = 0;  //To avoid the invalid index.
            }

            embeddedIcon.FileName = fileName;
            embeddedIcon.IconIndex = iconIndex;

            return embeddedIcon;
        }

        #endregion
    }
}
