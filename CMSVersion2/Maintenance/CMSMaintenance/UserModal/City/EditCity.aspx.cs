﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using BLL = BusinessLogic;
using Tools = utilities;


public partial class _EditCity : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            LoadBranchCorpOffice();
            if (Request.QueryString["ID"] == null)
            {

            }
            else
            {
             
                string CityID = Request.QueryString["ID"].ToString();
                DataTable GroupInfo = GetCityDetails(new Guid(CityID));
                int counter = 0;
                foreach (DataRow row in GroupInfo.Rows)
                {
                    if (counter == 0)
                    {

                        
                        string Id = row["CityID"].ToString();
                        string CityName = row["CityName"].ToString();
                        string CityCode = row["CityCode"].ToString();
                        string BCOId= row["BranchCorpOfficeId"].ToString();
                        string ContactNo1 = row["ContactNo1"].ToString();
                        string ContactNo2 = row["ContactNo2"].ToString();
                        string street = row["StreetAddress"].ToString();
                        string fax = row["fax"].ToString();
                        string zipcode = row["ZipCode"].ToString();

                        ////Use RadComboBoxItem.Selected
                        RadComboBoxItem item = rcbGroup.FindItemByValue(BCOId);
                        item.Selected = true;

                        txtCityName.Text = CityName;
                        txtCityCode.Text = CityCode;
                        txtContactNo1.Text = ContactNo1;
                        txtContactNo2.Text = ContactNo2;
                        txtFax.Text = fax;
                        txtStreet.Text = street;
                        txtzipcode.Text = zipcode;
                        lblGroupID.Text = Id;
                                                counter++;
                    }
                }

            }
        }
    }


    private void LoadBranchCorpOffice()
    {
        rcbGroup.DataSource = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        rcbGroup.DataValueField = "BranchCorpOfficeId";
        rcbGroup.DataTextField = "BranchCorpOfficeName";
        rcbGroup.DataBind();
    }


    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.Page.Title = "Edit City";
    }

    public DataTable GetCityDetails(Guid ID)
    {
        //DataTable data = new DataTable();
        DataSet data = BLL.City.GetCityById(ID, getConstr.ConStrCMS);
        DataTable convertdata = new DataTable();
        convertdata = data.Tables[0];
        return convertdata;
    }


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


    protected void btnSave_Click(object sender, EventArgs e)
    {
        Guid BCOID = new Guid(rcbGroup.SelectedItem.Value.ToString());
        Guid CityId = new Guid(lblGroupID.Text);
        Guid ModifiedBy = new Guid("11111111-1111-1111-1111-111111111111");
        string host = HttpContext.Current.Request.Url.Authority;
        string CityName = txtCityName.Text;
        string CityCode = txtCityCode.Text;

        BLL.City.UpdateCity(CityId, BCOID, ModifiedBy, CityName, CityCode,txtStreet.Text, txtContactNo1.Text, txtContactNo2.Text,txtFax.Text, txtzipcode.Text, getConstr.ConStrCMS);
        string script = "<script>CloseOnReload()</" + "script>";
        ClientScript.RegisterStartupScript(this.GetType(), "CloseOnReload", script);

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
    }

    protected void CloseButton_Click(object sender, EventArgs e)
    {
        string script = "<script>RefreshParentPage()</" + "script>";
        //RadScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshParentPage", script, false);
        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParentPage", script);
            
           }

 
}