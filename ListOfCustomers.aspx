<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Dashboard.master" CodeFile="ListOfCustomers.aspx.cs" Inherits="ListOfCustomers" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>

<form id="form1">
    Search Customer:
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" />
    <hr />
    <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" DataSourceID="GridDataSource" AllowPaging="True" DataKeyNames="CustomerID">
        <Columns>
            <asp:BoundField DataField="ContactName" HeaderText="ContactName" ItemStyle-Width="150" SortExpression="ContactName" />
            <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="150" SortExpression="City" />
            <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150" SortExpression="Country" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" SortExpression="ContactTitle" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
            <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="GridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:getconn %>"
        SelectCommand="SELECT [ContactName], [City], [Country], [CustomerID], [CompanyName], [ContactTitle], [Address], [Region], [PostalCode], [Phone] FROM [Customers] ORDER BY [CustomerID]" FilterExpression="ContactName LIKE '{0}%'">
        <FilterParameters>
            <asp:ControlParameter Name="Country" ControlID="txtSearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
    </form>
     </asp:Content>