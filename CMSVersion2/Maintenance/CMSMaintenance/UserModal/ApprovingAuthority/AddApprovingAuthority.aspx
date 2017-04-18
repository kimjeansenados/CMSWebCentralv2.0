<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddApprovingAuthority.aspx.cs" EnableEventValidation="false" Inherits="_AddApprovingAuthority" %>

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
        right:0;
        bottom: 0;
   
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
               
                 <div class="page">
                    <div class="col-xs-6">
                        <div class="">
                           <telerik:RadLabel ID="lbl_Fname" runat="server" Text="First Name" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtFname" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtFname"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br /> 
                            <br /> 

                            <telerik:RadLabel ID="lbl_Lname" runat="server" Text="Last Name" Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtLname" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtLname"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Title" runat="server" Text="Title" Width="30%"></telerik:RadLabel>
                              <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtTitle" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtTitle"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Position" runat="server" Text="Position" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtPosition" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtPosition"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                             <telerik:RadLabel ID="lbl_Department" runat="server" Text="Department" Width="30%"></telerik:RadLabel>
                              <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtDepartment" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="txtDepartment"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-xs-6">
                         <div class="">
                           <telerik:RadLabel ID="lbl_ContactNo" runat="server" Text="Contact No" Width="30%"></telerik:RadLabel>
                          <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtContactNumber" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtContactNumber"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br /> 
                            <br /> 

                            <telerik:RadLabel ID="lbl_Mobile" runat="server" Text="Mobile" Width="30%"></telerik:RadLabel>
                             <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtMobile" Enabled="true" runat="server"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                ControlToValidate="txtMobile"
                                ErrorMessage="*"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Fax" runat="server" Text="Fax" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtFax" Enabled="true" runat="server"></telerik:RadTextBox>
                            <br />
                            <br /> 

                            <telerik:RadLabel ID="lbl_Email" runat="server" Text="Email" Width="30%"></telerik:RadLabel>
                            <telerik:RadTextBox Width="230px" RenderMode="Mobile" ID="txtEmail" Enabled="true" runat="server"></telerik:RadTextBox>
                             <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>  
                            <br />
                            
                            <telerik:RadLabel ID="lbl_Company" runat="server" Text="Company" Width="30%"></telerik:RadLabel>
                              <telerik:RadComboBox ID="rcbComapny" runat="server" Width="230px"></telerik:RadComboBox>
                           
                             
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
