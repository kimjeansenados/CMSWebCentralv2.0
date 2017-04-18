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


public partial class _EditAirlines : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] == null)
            {

            }
            else
            {
                string airlineId = Request.QueryString["ID"].ToString();


                DataTable GroupInfo = GetAirlineByAirlineId(new Guid(airlineId));
                int counter = 0;
                foreach (DataRow row in GroupInfo.Rows)
                {
                    if (counter == 0)
                    {
                        string x = row["AirlineID"].ToString();
                        string y = row["AirlineName"].ToString();

                        txtAirlineName.Text = y;
                        lblAirlineID.Text = x;
                        counter++;
                    }
                }

            }
        }
    }



    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Page.Title = "Edit Airlines";
    }

    public DataTable GetAirlineByAirlineId(Guid ID)
    {
        DataSet data = BLL.Airlines.GetAirlineByAirlineID(getConstr.ConStrCMS, ID);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string host = HttpContext.Current.Request.Url.Authority;
        BLL.Airlines.UpdateAirlines(new Guid(lblAirlineID.Text), txtAirlineName.Text, getConstr.ConStrCMS);

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