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


public partial class _AccountInformation : System.Web.UI.Page
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
        LoadAccountType();
        LoadAccountStatus();
        LoadOrganizationType();
        LoadBusinessType();
        LoadBillingPeriod();
        LoadPaymentTerm();
        LoadApprovedBy();
        LoadBCO();
        LoadAllRevenueUnit();
        loadDataMotherCompany();
    }
    #endregion

    #region DataSource
    private void LoadAccountType()
    {
        rcbAccountType.DataSource = BLL.AccountType.GetAccountType(getConstr.ConStrCMS);
        rcbAccountType.DataValueField = "AccountTypeId";
        rcbAccountType.DataTextField = "AccountTypeName";
        rcbAccountType.DataBind();
    }

    private void LoadAccountStatus()
    {
        rcbAccountStatus.DataSource = BLL.AccountStatus.GetAccountStatus(getConstr.ConStrCMS);
        rcbAccountStatus.DataValueField = "AccountStatusId";
        rcbAccountStatus.DataTextField = "AccountStatusName";
        rcbAccountStatus.DataBind();
    }

    private void LoadOrganizationType()
    {
        rcbAcctInfoOrganizationType.DataSource = BLL.OrganizationType.GetOrganizationType(getConstr.ConStrCMS);
        rcbAcctInfoOrganizationType.DataValueField = "OrganizationTypeId";
        rcbAcctInfoOrganizationType.DataTextField = "OrganizationTypeName";
        rcbAcctInfoOrganizationType.DataBind();
    }

    private void LoadBusinessType()
    {
        rcbBusinessType.DataSource = BLL.BusinessType.GetBusinessType(getConstr.ConStrCMS);
        rcbBusinessType.DataValueField = "BusinessTypeId";
        rcbBusinessType.DataTextField = "BusinessTypeName";
        rcbBusinessType.DataBind();
    }

    private void LoadBillingPeriod()
    {
        rcbBillingPeriod.DataSource = BLL.BillingPeriod.GetBillingPeriod(getConstr.ConStrCMS);
        rcbBillingPeriod.DataValueField = "BillingPeriodId";
        rcbBillingPeriod.DataTextField = "BillingPeriodName";
        rcbBillingPeriod.DataBind();
    }

    private void LoadPaymentTerm()
    {
        rcbApprovedBy.DataSource = BLL.PaymentTerm.GetPaymentTerm(getConstr.ConStrCMS);
        rcbApprovedBy.DataValueField = "PaymentTermId";
        rcbApprovedBy.DataTextField = "PaymentTermName";
        rcbApprovedBy.DataBind();
    }

    private void LoadApprovedBy()
    {
        rcbPaymentTerm.DataSource = BLL.Employee_Info.GetEmployeeName(getConstr.ConStrCMS);
        rcbPaymentTerm.DataValueField = "EmployeeId";
        rcbPaymentTerm.DataTextField = "EmployeeName";
        rcbPaymentTerm.DataBind();
    }

    private void LoadBCO()
    {
        rcbBCO.DataSource = BLL.BranchCorpOffice.GetBranchCorpOffice(getConstr.ConStrCMS);
        rcbBCO.DataValueField = "BranchCorpOfficeId";
        rcbBCO.DataTextField = "BranchCorpOfficeName";
        rcbBCO.DataBind();
    }

    private void LoadAllRevenueUnit()
    {
        rcbArea.DataSource = BLL.Revenue_Info.getAllRevenueUnit(getConstr.ConStrCMS);
        rcbArea.DataValueField = "RevenueUnitId";
        rcbArea.DataTextField = "RevenueUnitName";
        rcbArea.DataBind();
    }

    private void populateRevenueUnitNameByBCOId()
    {
        DataTable LocationList = BLL.Revenue_Info.getRevenueUnitByBCOId(new Guid(rcbBCO.SelectedValue.ToString()), getConstr.ConStrCMS).Tables[0];
        rcbArea.DataSource = LocationList;
        rcbArea.DataValueField = "RevenueUnitId";
        rcbArea.DataTextField = "RevenueUnitName";
        rcbArea.DataBind();
    }

    private void LoadMotherCompany()
    {
        rcbAcctInfoMotherCompany.DataSource = BLL.Company.GetCompanies(getConstr.ConStrCMS);
        rcbAcctInfoMotherCompany.DataValueField = "CompanyId";
        rcbAcctInfoMotherCompany.DataTextField = "CompanyName";
        rcbAcctInfoMotherCompany.DataBind();
    }

    private void loadDataMotherCompany()
    {
        if(rcbAcctInfoOrganizationType.SelectedIndex >=0)
        {
            string organizationType = rcbAcctInfoOrganizationType.SelectedItem.ToString();
            if (organizationType.Equals("Head Office"))
            {
                rcbAcctInfoMotherCompany.Enabled = false;
                rcbAcctInfoMotherCompany.Items.Clear();
            }
            else if(organizationType.Equals("Branch Office"))
            {
                rcbAcctInfoMotherCompany.Enabled = true;
                LoadMotherCompany();
            }
        }
        
    }
    #endregion

    #region Events
    protected void rcbBCO_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        populateRevenueUnitNameByBCOId();
    }

    protected void rcbOrganizationType_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if(rcbAcctInfoOrganizationType.Text.Equals("Head Office"))
        {
            rcbAcctInfoMotherCompany.Enabled = false;
        }else
        {
            rcbAcctInfoMotherCompany.Enabled = true;
            LoadMotherCompany();
        }
    }
    #endregion


}