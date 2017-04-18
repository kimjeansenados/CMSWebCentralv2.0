<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAwbSeries.aspx.cs" EnableEventValidation="false" Inherits="_AddAwbSeries" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <!-- Website CSS style -->
    <%--<link rel="stylesheet" type="text/css" href="assets/css/main.css">--%>
    <link href="../../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Website Font style -->

    <link href="../../../css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'/>

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
            right: 10px;
            bottom: 10px;
        }

        .page{
            margin-top: 10px;
            margin-right: 15px;
            margin-left: 15px;
        }

        .center {
           margin:0 auto;
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
        <div class="center">
            <form class="form-horizontal" method="post" action="#">
               
                 <div class="page">
                    <div class="col-xs-12">
                        <div>
                           <telerik:RadLabel ID="lblDateAssigned" runat="server" Text="Date Assigned" Width="30%"></telerik:RadLabel>
                           <telerik:RadDatePicker ID="rdDateAssigned" Width="230px" MinDate="1950/1/1" ZIndex="11000"  runat="server"></telerik:RadDatePicker>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdDateAssigned"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           <br />
                           <br />
                          
                           <telerik:RadLabel ID="lblBCO" runat="server" Text="BCO" Width="30%"></telerik:RadLabel>
                            <telerik:RadComboBox ID="rdcBCO" runat="server"  Width="230px" AutoPostBack="true" OnSelectedIndexChanged="rdcBCO_SelectedIndexChanged"></telerik:RadComboBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdcBCO"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           <br />
                           <br />
                             
                           
                           <telerik:RadLabel ID="lblRUType" runat="server" Text="Revenue Type" Width="30%"></telerik:RadLabel>
                           <telerik:RadComboBox ID="rcbRevenueType" runat="server" Width="230px" AutoPostBack="true" OnTextChanged="rcbRevenueType_TextChanged" OnSelectedIndexChanged="rcbRevenueType_SelectedIndexChanged"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rcbRevenueType"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           <br />
                           <br />
                           <telerik:RadLabel ID="lblAreaBranch" runat="server" Text="Area/Branch" Width="30%"></telerik:RadLabel>
                           <telerik:RadComboBox ID="rdcArea" runat="server" Width="230px"  AutoPostBack="true" OnSelectedIndexChanged="rdcArea_SelectedIndexChanged"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rdcArea"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                            <br />
                            <br />
                            <telerik:RadLabel ID="lblName" runat="server" Text="Name" Width="30%"></telerik:RadLabel>
                           <telerik:RadComboBox ID="rcbName" runat="server" Width="230px"></telerik:RadComboBox>
                           <br />
                           <br />
                           
                           <telerik:RadLabel ID="lblStart" runat="server" Text="Series Start" Width="30%"></telerik:RadLabel>
                          <telerik:RadTextBox ID="txtStartSeries" runat="server" Width="230px"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStartSeries"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           <br />
                           <br />

                           <telerik:RadLabel ID="lblEnd" runat="server" Text="Series End" Width="30%"></telerik:RadLabel>
                           <telerik:RadTextBox ID="txtEndSeries" runat="server" Width="230px"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEndSeries"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    </div>
        
                <div id="footer">
                 <telerik:RadButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClicked=""></telerik:RadButton>
                 <telerik:RadButton ID="btnCancel" runat="server" AutoPostBack="true" Text="Cancel" OnClick="btnCancel_Click"></telerik:RadButton>
                 </div>
            </form>


        </div>
        
        <br />
    </form>

</body>
</html>
