<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Dashboard.master" CodeFile="CS.aspx.cs" Inherits="CS" %>


     <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>


    <form id="form1" >
   
          <asp:GridView ID="GridView2" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" PageSize="24"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
        runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" >
        
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
             <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" />
             <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" />
             <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" />
             <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" />
             <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" />
             <asp:BoundField DataField="ShipVia" HeaderText="ShipVia" />
             <asp:BoundField DataField="Freight" HeaderText="Freight" />
             <asp:BoundField DataField="ShipName" HeaderText="ShipName" />
             <asp:BoundField DataField="ShipCity" HeaderText="ShipCity" />
             <asp:BoundField DataField="ShipCountry" HeaderText="ShipCountry" />
        </Columns>
              <PagerSettings 
            Position="Bottom" 
            Mode="NextPreviousFirstLast" 
            FirstPageText="First" 
            LastPageText="Last" 
            NextPageText="Next" 
            PreviousPageText="Prev"
             />

    </asp:GridView>
    <br />
    <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" />
    </form>
</asp:Content>

