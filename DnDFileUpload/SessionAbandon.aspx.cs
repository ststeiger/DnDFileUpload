
namespace DnDFileUpload
{


    public partial class SessionAbandon : System.Web.UI.Page
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
        }


    }


}
