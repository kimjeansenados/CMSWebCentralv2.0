using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;
using DAL = DataAccess;

public partial class _RMWeightBreak : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadGrid2.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = false;
        }
        //    //PopulateAssignment();
        //    //populateLocation();
        //    //PopulateEmployeeDDL();

        //    if (Request.QueryString["UserId"] == null)
        //    {

        //    }
        //    else
        //    {
        //        string userId = Request.QueryString["UserId"].ToString();
        //        DataTable UserInfo = GetUsers(new Guid(userId));
        //        int counter = 0;
        //        foreach (DataRow row in UserInfo.Rows)
        //        {
        //            if (counter == 0)
        //            {
        //                string x = row["LocationAssignment"].ToString();
        //                string y = row["RevenueUnitName"].ToString(); 
        //                PopulateAssignment();
        //                populateLocation();
        //                txtUsername.Text = row["Username"].ToString();
        //                txtEmployeeName.Text = row["LastName"].ToString() + ", " + row["FirstName"].ToString();
        //                ddlAssigned.ClearSelection();
        //                ddlAssigned.Items.FindByText(x).Selected = true;
        //                ddlLocation.Items.FindByText(y).Selected = true;

        //                counter++;
        //            }
        //        }

        //        //ddlAssigned.Items.FindByValue(x).Selected = true;
        //        //ddlAssigned.Items.FindByValue(row["LastName"].ToString()).Selected = true;
        //    }
        //}
    }

    private DataTable ReadExcelFile(string sheetName, string path)
    {

        using (OleDbConnection conn = new OleDbConnection())
        {
            DataTable dt = new DataTable();
            string Import_FileName = path;
            string fileExtension = Path.GetExtension(Import_FileName);
            if (fileExtension == ".xls")
                conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 8.0;HDR=YES;'";
            if (fileExtension == ".xlsx")
                conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES;'";
            using (OleDbCommand comm = new OleDbCommand())
            {
                comm.CommandText = "Select * from [" + sheetName + "$]";

                comm.Connection = conn;

                using (OleDbDataAdapter da = new OleDbDataAdapter())
                {
                    da.SelectCommand = comm;
                    da.Fill(dt);
                    return dt;
                }

            }
        }
    }


    protected override void OnInit(EventArgs e)
    {
        RadGrid2.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = false;
        base.OnInit(e);
        this.Page.Title = "Weight Break Maintenance";

    }

    //public DataTable GetUsers(Guid Userid)
    //{
    //    ////DataTable data = new DataTable();
    //    //DataSet data = BLL.Users_Info.GetUserInfo(getConstr.ConStrCMS, Userid);
    //    //DataTable convertdata = new DataTable();
    //    //convertdata = data.Tables[0];
    //    //return convertdata;
    //}


    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "Insert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //logic to truncate long string to prevent SQL error
        for (int i = 1; i < 4; i++)
        {
            string val = e.NewValues[i - 1].ToString();
            int maxLength = i * 10;
            if (val.Length > maxLength) e.NewValues[i - 1] = val.Substring(0, maxLength);
        }
    }

    protected void DetailsView1_ItemCommand1(object sender, DetailsViewCommandEventArgs e)
    {

    }

    protected void DetailsView1_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
    {

    }

    protected void ddlAssigned_SelectedIndexChanged(object sender, EventArgs e)
    {
        //populateLocation();
    }

    protected void ddlAssigned_TextChanged(object sender, EventArgs e)
    {

        //ddlLocation.Items.Clear();

        //populateLocation();
    }

    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {

    }

    protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {

        string ID = Request.QueryString["ID"].ToString();
        if (ID != "")
        {
            RadGrid2.DataSource = DAL.RateMatrix.GetWB(new Guid(ID), getConstr.ConStrCMS);
        }
    }

    protected void RadGrid2_ItemCreated(object sender, GridItemEventArgs e)

    {

        if (e.Item is GridDataItem)
        {
            HyperLink editLink = (HyperLink)e.Item.FindControl("EditLink");
            editLink.Attributes["href"] = "javascript:void(0);";
            editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ExpressRateId"], e.Item.ItemIndex);
        }
    }

    protected void RadButton1_Click(object sender, EventArgs e)
    {

    }
    protected void RadButton4_Click(object sender, EventArgs e)
    {
        DataTable dt;

        foreach (UploadedFile f in RadAsyncUpload2.UploadedFiles)
        {
            string path = Server.MapPath("~/Uploads/");
            //f.File.SaveAs(path + f.File.GetName());
            var filename = f.FileName;

            dt = ReadExcelFile("Sheet1", path + filename);

            RadGrid2.DataSource = dt;
            RadGrid2.DataBind();
            //string path = f.ContentLength
            //f.File.SaveAs(path + e.File.GetName());

            //var getvar = f.GetName();


            //var filesize = Convert.ToInt32(f.ContentLength);
            //var physicalSavePath = MapPath(relativePath) + filename;
            //f.SaveAs("c:\\uploaded files\\" + f.GetName(), true);
        }
    }
    protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        string path = Server.MapPath("~/Uploads/");
        e.File.SaveAs(path + e.File.GetName());
    }

    private DataTable ReadExcelFiles(string sheetName, string path)
    {

        using (OleDbConnection conn = new OleDbConnection())
        {
            DataTable dt = new DataTable();
            string Import_FileName = path;
            string fileExtension = Path.GetExtension(Import_FileName);
            if (fileExtension == ".xls")
                conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 8.0;HDR=YES;'";
            if (fileExtension == ".xlsx")
                conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Import_FileName + ";" + "Extended Properties='Excel 12.0 Xml;HDR=YES;'";
            using (OleDbCommand comm = new OleDbCommand())
            {
                comm.CommandText = "Select * from [" + sheetName + "$]";

                comm.Connection = conn;

                using (OleDbDataAdapter da = new OleDbDataAdapter())
                {
                    da.SelectCommand = comm;
                    da.Fill(dt);
                    return dt;
                }

            }
        }
    }
}