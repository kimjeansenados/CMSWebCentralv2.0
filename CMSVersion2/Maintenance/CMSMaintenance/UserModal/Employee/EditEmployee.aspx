<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditEmployee.aspx.cs" EnableEventValidation="false" Inherits="_EditEmployee" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>
    <link href="../../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->

    <link href="../../../css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <style type="text/css">
        /*
/* Created by Filipe Pina
 * Specific styles of signin, register, component
 */
        http://localhost:54977/font-awesome/css/font-awesome.min.css
        /*
 * General styles
 */
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            background-color: #fff;
            font-family: 'Oxygen', sans-serif;
            overflow: hidden;
        }

        .main {
            margin-top: 70px;
        }

        h1.title {
            font-size: 50px;
            font-family: 'Passion One', cursive;
            font-weight: 400;
        }

        /*hr {
            width: 10%;
            color: #fff;
        }*/

        /*.form-group {
            margin-bottom: 15px;
        }*/

        /*label {
            margin-bottom: 15px;
        }*/

        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #fff;
            /* shadows and rounded borders */
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 330px;
            padding: 40px 40px;
        }

        .login-button {
            margin-top: 5px;
        }

        .login-register {
            font-size: 11px;
            text-align: center;
        }

        input:required:hover {
            opacity: 1;
        }

         #footer {
        position: fixed;
        right:10px;
        bottom: 10px;
        }

          .page{
            margin-top: 30px;
            margin-right: 15px;
            margin-left: 15px;
        }
    </style>
    <script type="text/javascript">

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;//Will work in Moz in all cases, including clasic dialog
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz az well)
            return oWindow;
        }

        function CloseOnReload() {
            //GetRadWindow().Close();
            var oWnd = GetRadWindow();
            oWnd.close();
            top.location.href = top.location.href;
        }

        function RefreshParentPage() {
            var oWnd = GetRadWindow();
            oWnd.close();
            top.location.href = top.location.href;

        }
    </script>

</head>
<body>
    <form id="form2" runat="server">
<telerik:RadScriptManager ID="RadScriptManager2" runat="server"></telerik:RadScriptManager>
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator2" runat="server" Skin="Default" DecoratedControls="All" />
        
         <div class="">
            <form class="form-horizontal" method="post" action="#">
               <asp:Label ID="lblEmployeeID" runat="server" Text="" Visible="false"></asp:Label>
                 <div class="page">
                    <div class="col-xs-6">
                        <div class="">
                           <telerik:RadLabel ID="lbl_Fname" runat="server" Text="First Name" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtFirstname" Enabled="True" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br /> 
                            <br /> 

                            <telerik:RadLabel ID="lbl_Mname" runat="server" Text="Middle Name" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtMiddlename" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Lname" runat="server" Text="Last Name" Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtLastname" Enabled="True" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Birthday" runat="server" Text="Birthday" Width="30%"></telerik:RadLabel>
                             <telerik:RadDatePicker ID="txtBirthdate" MinDate="1950/1/1" ZIndex="11000"  runat="server" Width="230px"></telerik:RadDatePicker>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_TelNo" runat="server" Text="Tel. No." Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtTel" Enabled="True" runat="server"></telerik:RadTextBox>
                            <br />
                            <br /> 

                             <telerik:RadLabel ID="lbl_MobNo" runat="server" Text="Mobile No." Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtMobile" Enabled="True" runat="server"></telerik:RadTextBox>
                             <br />
                             <br /> 

                             <telerik:RadLabel ID="lbl_Email" runat="server" Text="Email" Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtEmail" Enabled="True" runat="server"></telerik:RadTextBox>
                             
                        </div>
                    </div>

                    <div class="col-xs-6">
                         <div class="">
                           <telerik:RadLabel ID="lbl_Bco" runat="server" Text="BCO" Width="30%"></telerik:RadLabel>
                           <telerik:RadComboBox Width="230px" ID="rcbBranchCorpOffice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rcbBranchCorpOffice_SelectedIndexChanged"></telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rcbBranchCorpOffice"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                            <br /> 
                            <br /> 

                            <telerik:RadLabel ID="lbl_AssignedTo" runat="server" Text="Assigned To" Width="30%"></telerik:RadLabel>
                            <telerik:RadComboBox Width="230px" ID="rcbRevenueUnitType" runat="server" AutoPostBack="true" OnTextChanged="rcbRevenueUnitType_TextChanged" OnSelectedIndexChanged="rcbRevenueUnitType_SelectedIndexChanged"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rcbRevenueUnitType"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Location" runat="server" Text="Location" Width="30%"></telerik:RadLabel>
                             <telerik:RadComboBox ID="rcbRevenueUnitName" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rcbRevenueUnitName"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="--Select Assignment--"></asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Department" runat="server" Text="Department" Width="30%"></telerik:RadLabel>
                             <telerik:RadComboBox ID="rcbDepartment" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Position" runat="server" Text="Position" Width="30%"></telerik:RadLabel>
                             <telerik:RadComboBox ID="rcbPosition" runat="server" Width="230px" Height="200px"></telerik:RadComboBox>
                            <br />
                            <br /> 

                             <telerik:RadLabel ID="lbl_DLNum" runat="server" Text="Driver License Number" Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtLicense" Enabled="True" runat="server"></telerik:RadTextBox>
                             <br />
                             <br /> 

                             <telerik:RadLabel ID="lbl_DLNumExp" runat="server" Text="Driver License Expiration" Width="30%"></telerik:RadLabel>
                             <telerik:RadDatePicker ID="txtLicenseExpiration" Width="230px" MinDate="2017/1/1"  ZIndex="1100000" AutoPostBack ="false" runat="server"></telerik:RadDatePicker>
                             
                        </div>
                        </div>
                    </div>
                 <div id="footer">
                    <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClicked=""></telerik:RadButton>
                    <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click" OnClientClicked="redirect"></telerik:RadButton>
                </div>
            </form>


        </div>
        
       <%-- <script type="text/javascript" src="../../../js/bootstrap.js"></script>--%>

        <br />
    </form>

</body>
</html>
