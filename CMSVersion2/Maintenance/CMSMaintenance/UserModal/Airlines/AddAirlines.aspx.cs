using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;


public partial class _AddAirlines : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["airlineCode"] == null)
            {

            }
            else
            {
                string airlineCode = Request.QueryString["airlineCode"].ToString();
                AirlineCode(airlineCode);
            }
        }
    }

    private void AirlineCode(string airlineCode)
    {
        GlobalCode.globalCode = airlineCode;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string host = HttpContext.Current.Request.Url.Authority;
        Guid ID = new Guid("11111111-1111-1111-1111-111111111111");
        string airlineCode = GlobalCode.globalCode;
        BLL.Airlines.InsertAirlines(txtAirlineName.Text, airlineCode, ID, getConstr.ConStrCMS);

        string script = "<script>CloseOnReload()</" + "script>";
        ClientScript.RegisterStartupScript(this.GetType(), "CloseOnReload", script);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }


}