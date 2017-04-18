<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountInformation2.aspx.cs" EnableEventValidation="false" Inherits="_AccountInformation2" %>

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
    <form id="form1" runat="server">

        

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

       <%-- <asp:ScriptManager ID="ScriptManager2" runat="server" />--%>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" Skin="Default" DecoratedControls="All" />
       <%-- <asp:Button runat="server" Text="Close" ID="CloseButton"     OnClick="CloseButton_Click1"/>--%>
        <div>
            <form class="form-horizontal" method="post" action="#">

                <div class="col-xs-12">
                    <div class="col-xs-6">
                        
                            <telerik:RadCheckBox runat="server" ID="chkEVM" Text="Applied EVM"></telerik:RadCheckBox>
                            <br />
                            <telerik:RadCheckBox runat="server" ID="chkAWBFee" Text="Has AirwayBill Fee"></telerik:RadCheckBox>
                            <br />
                         <br />
                            <asp:Label ID="Label1" runat="server" Text="Has Freight Collect Fee"></asp:Label>
                            <br />
                        <div style="float: left; position: relative; left: 20%">
                            <telerik:RadCheckBox runat="server" ID="chkFC" Text="FC"></telerik:RadCheckBox>
                           <telerik:RadCheckBox runat="server" ID="chkCC" Text="CC"></telerik:RadCheckBox>
                        </div>
                            <br />
                            <br />
                            <telerik:RadCheckBox runat="server" ID="RadCheckBox1" Text="Has Insurance"></telerik:RadCheckBox>
                        <br />
                             <telerik:RadCheckBox runat="server" ID="RadCheckBox2" Text="Has Fuel Charge"></telerik:RadCheckBox>
                        <br />
                             <telerik:RadCheckBox runat="server" ID="RadCheckBox3" Text="Has Vatable"></telerik:RadCheckBox>
                        </div>

                    <div class="col-xs-6">
                        <telerik:RadCheckBox runat="server" ID="RadCheckBox4" Text="Has Valuation Charge"></telerik:RadCheckBox>
                        <br />
                            <telerik:RadCheckBox runat="server" ID="RadCheckBox5" Text="Has Delivery Fee"></telerik:RadCheckBox>
                            
                            <br />
                            <telerik:RadCheckBox runat="server" ID="RadCheckBox6" Text="Has Perishable Fee"></telerik:RadCheckBox>
                        <br />
                           <telerik:RadCheckBox runat="server" ID="RadCheckBox7" Text="Has Dangerous Fee"></telerik:RadCheckBox>
                        <br />
                            <telerik:RadCheckBox runat="server" ID="RadCheckBox8" Text="Has Weight Charge"></telerik:RadCheckBox>
                        <br />
                             <telerik:RadCheckBox runat="server" ID="RadCheckBox9" Text="Has Charge Invoice"></telerik:RadCheckBox>
                    </div>
                    </div>
            </form>


        </div>
        
        <script type="text/javascript" src="../../../js/bootstrap.js"></script>

        <br />
    </form>
</body>
</html>
