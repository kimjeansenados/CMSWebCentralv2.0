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
using DAL = DataAccess;


public partial class _CompanyInformation : System.Web.UI.Page
{
    Tools.DataAccessProperties getConstr = new Tools.DataAccessProperties();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitLoad();
        }
    }

    #region InitLoad
    private void InitLoad()
    {
        LoadCity();
       // LoadMotherCompany();
    }
    #endregion

    #region DataSource
    private void LoadCity()
    {
        rcbCompInfoCity.DataSource = BLL.City.GetCity(getConstr.ConStrCMS);
        rcbCompInfoCity.DataValueField = "CityId";
        rcbCompInfoCity.DataTextField = "CityName";
        rcbCompInfoCity.DataBind();
    }

    //private void LoadMotherCompany()
    //{
    //    rcbCompInfoMotherCompany.DataSource = BLL.Company.GetCompanies(getConstr.ConStrCMS);
    //    rcbCompInfoMotherCompany.DataValueField = "CompanyId";
    //    rcbCompInfoMotherCompany.DataTextField = "CompanyName";
    //    rcbCompInfoMotherCompany.DataBind();
    //}
    #endregion



}