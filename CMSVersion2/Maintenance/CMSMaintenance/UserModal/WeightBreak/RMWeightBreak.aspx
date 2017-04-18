<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RMWeightBreak.aspx.cs" Inherits="_RMWeightBreak" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>--%>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>


    <link href="../../../styles/default.css" rel="stylesheet" />
    <script type="text/javascript">
        function StandardConfirm(sender, args) {
            args.set_cancel(!window.confirm("Are you sure you want to submit the page?"));


        }


    </script>

    <script type="text/javascript">
    function fileUploaded(sender, args) {
        document.getElementById("<%= RadButton4.ClientID %>").click();
    }
</script>

    <style>
        div.RadUpload .ruBrowse {
            background-position: 0 -23px;
            width: 180px;
            height: 30px;
        }

        div.RadUpload_Default .ruFileWrap .ruButtonHover {
            background-position: 100% -23px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <telerik:RadScriptManager runat="server"></telerik:RadScriptManager>
    <telerik:RadWindow RenderMode="Lightweight" Behaviors="Close" runat="server" ID="RadWindow1" Height="300px" Width="350px">
    </telerik:RadWindow>
    <%--<asp:Button ID="Button4" Text="open the RadWindow from the server" runat="server" OnClick="Button4_Click" />--%>
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="container">
                <div class="buttons">
                    <br />
                    <telerik:RadAsyncUpload ID="RadAsyncUpload2" OnClientFilesUploaded="fileUploaded" OnFileUploaded="AsyncUpload1_FileUploaded"
                        HideFileInput="True" runat="server" Localization-Select="Import From Excel File" AllowedFileExtensions=".xlsx, .xls" Font-Size="14px"></telerik:RadAsyncUpload>
                    <br />
                    <telerik:RadButton ID="RadButton4" runat="server" Text="Upload" OnClick="RadButton4_Click">

</telerik:RadButton>

                </div>

                    <telerik:RadGrid ID="RadGrid2"
                                runat="server" AllowPaging="True" ExportSettings-Excel-DefaultCellAlignment="Right" 
                                PageSize="10" Skin="Glow" AllowSorting="true" OnItemCreated="RadGrid2_ItemCreated"
                                RenderMode="Mobile"
                                DataKeyNames="ExpressRateId" CommandItemDisplay="Top"
                                OnNeedDataSource="RadGrid2_NeedDataSource"> 
                                <ExportSettings ExportOnlyData="true" IgnorePaging="true"></ExportSettings>
                                <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="ExpressRateId"
                                    AllowFilteringByColumn="false"
                                    DataKeyNames="ExpressRateId" CommandItemDisplay="Top" 
                                    InsertItemPageIndexAction="ShowItemOnFirstPage">
                                   <CommandItemSettings ShowExportToWordButton="true" ShowExportToExcelButton="true" 
            ShowExportToCsvButton="true" ShowExportToPdfButton="true"></CommandItemSettings>
                                    <Columns>

                                        <telerik:GridNumericColumn DataField="OriginCityName" HeaderText="Origin" SortExpression="OriginCityName"
                                            UniqueName="OriginCityName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        
                                        <telerik:GridNumericColumn DataField="DestinationCityName" HeaderText="Destination" SortExpression="DestinationCityName"
                                            UniqueName="DestinationCityName">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="1to5Cost" HeaderText="1 to 5" SortExpression="1to5Cost"
                                            UniqueName="1to5Cost">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                        <telerik:GridNumericColumn DataField="6to49Cost" HeaderText="6 to 49" SortExpression="6to49Cost"
                                            UniqueName="6to49Cost">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                        
                                        <telerik:GridNumericColumn DataField="50to249Cost" HeaderText="50 to 249" SortExpression="50to249Cost"
                                            UniqueName="50to249Cost">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>
                                         
                                        <telerik:GridNumericColumn DataField="250to999Cost" HeaderText="250 to 999" SortExpression="250to999Cost"
                                            UniqueName="250to999Cost">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                                                                 
                                        <telerik:GridNumericColumn DataField="1000-10000Cost" HeaderText="1000 to 10000" SortExpression="1000-10000Cost"
                                            UniqueName="1000-10000Cost">
                                            <HeaderStyle />
                                        </telerik:GridNumericColumn>

                                     <%--  <telerik:GridDateTimeColumn DataField="ModifiedDate" HeaderText="Date Modified" SortExpression="ModifiedDate"
                                            UniqueName="ModifiedDate" PickerType="DatePicker" DataFormatString="{0:MM/dd/yyyy}">
                                            <HeaderStyle --%>

                                        <%--</telerik:GridDateTimeColumn>--%>
                                        <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:HyperLink  ID="EditLink" runat="server" Text="Edit"  ></asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    <%--    <telerik:GridButtonColumn  CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>--%>
                                         <telerik:GridButtonColumn ConfirmText="Are you sure you want to deactivate this user?" ButtonType="LinkButton"
                                            ConfirmDialogType="RadWindow" ConfirmDialogHeight="150px" ConfirmTitle="Deactivate User" 
                                             CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="">
                                            <HeaderStyle />
                                        </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true"></Selecting>
                                    <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
                                </ClientSettings>
                            </telerik:RadGrid>

            </div>

        </div>


    </div>

    </form>
</body>
</html>