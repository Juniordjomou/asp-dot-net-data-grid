<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Defaults.aspx.cs" MasterPageFile="Dashboard.master" Inherits="_Default" EnableEventValidation="false" %>



 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>
<body>
<form id="form1" >
<div>
<table>
<tr>
<td align="right" class="auto-style1">
<asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/ExcelImage.jpg" 
onclick="btnExcel_Click" />
<asp:ImageButton ID="btnWord" runat="server" ImageUrl="~/WordImage.jpg" 
onclick="btnWord_Click" />
</td>
</tr>
    
            <tr>
                <td class="auto-style1">
                    Enter shipped start date:
                <asp:TextBox ID="txtStartDate" Text="" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Enter shipped end date:
                    <asp:TextBox ID="txtEndDate" Text="" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            
<tr>
<td class="auto-style1">
<asp:GridView runat="server" ID="gvdetails" DataSourceID="dsdetails"  AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" PageSize="20">
<RowStyle BackColor="#EFF3FB" />
<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<AlternatingRowStyle BackColor="White" />
<Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"
                                InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />                          
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="{0:dd/MM/yyyy}" />
                              <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" SortExpression="ShippedDate"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName" />
                        </Columns>
   <PagerSettings 
            Position="Bottom" 
            Mode="NextPreviousFirstLast" 
            FirstPageText="First" 
            LastPageText="Last" 
            NextPageText="Next" 
            PreviousPageText="Prev"
             />       
        <PagerStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:GridView>
</td>
</tr>
</table>
<asp:SqlDataSource ID="dsdetails" runat="server" ConnectionString="<%$ConnectionStrings:getconn %>"
SelectCommand="SELECT [OrderID]
      ,ContactName
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Orders],Customers Where Customers.CustomerID=Orders.CustomerID and [ShippedDate] between @startDate and @enddate order by [ShippedDate]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDate" DefaultValue="01/01/1900" Name="startDate"
                    PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDate" DefaultValue="01/01/2050" Name="enddate"
                    PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</form>
</body>
</asp:Content>

