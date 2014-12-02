
namespace DnDFileUpload
{


    public partial class Default : System.Web.UI.Page
    {


        /// <summary>
        /// Page Load
        /// </summary>
        protected void Page_Load(object sender, System.EventArgs e)
        {
        } // End Sub Page_Load 


        /// <summary>
        /// The max file size in bytes
        /// </summary>
        protected long maxRequestLength
        {
            get
            {
                System.Web.Configuration.HttpRuntimeSection section = System.Configuration.
                    ConfigurationManager.GetSection("system.web/httpRuntime")
                    as System.Web.Configuration.HttpRuntimeSection;

                if (section != null)
                    return (long)section.MaxRequestLength * (long)1024; // Default Value
                else
                    return 4096 * 1024; // Default Value
            } // End Get 
        } // End Property maxRequestLength 


    } // End Class Default : System.Web.UI.Page


} // End Namespace DnDFileUpload
