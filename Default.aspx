<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Dashboard.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>


   
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>
        <p>
 Search Product:
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" />

<br />
</p>
    <br />   
    <div>
        <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" PageSize="15"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
        runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" >
           
             <Columns>

            <asp:BoundField HeaderText="Product ID" DataField="ProductID" />
            <asp:BoundField HeaderText="Product Name" DataField="ProductName" />
            <asp:BoundField HeaderText="SupplierID" DataField="SupplierID" />
            <asp:BoundField HeaderText="CategoryID" DataField="CategoryID" />
            <asp:BoundField HeaderText="QuantityPerUnit" DataField="QuantityPerUnit" />
            <asp:BoundField HeaderText="UnitPrice" DataField="UnitPrice" />
            <asp:BoundField HeaderText="UnitsInStock" DataField="UnitsInStock" />
            <asp:BoundField HeaderText="UnitsOnOrder" DataField="UnitsOnOrder" />
            <asp:BoundField HeaderText="ReorderLevel" DataField="ReorderLevel" />




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
        <div>
       &nbsp&nbsp&nbsp <asp:Button ID="Button1" runat="server" Text="Export To Excel" cssclass="Button" onclick="ExportToExcel" />
      
          </div>  
        <asp:SqlDataSource ID="GridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:getconn %>"
        SelectCommand="SELECT  [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [NORTHWND].[dbo].[Products]" FilterExpression="ProductName LIKE '{0}%'">
        <FilterParameters>
            <asp:ControlParameter Name="Country" ControlID="txtSearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
    </div>
    </asp:Content>
   
       

        

