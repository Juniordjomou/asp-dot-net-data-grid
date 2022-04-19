<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="Dashboard.master" CodeFile="FrmOrderList.aspx.cs" Inherits="FrmOrderList" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>
    <form id="form1" >
    <div>
        <table border="1px solid">
            <tr>
                <td>
                    Enter shipped start date:
                </td>
                <td>
                    <asp:TextBox ID="txtStartDate" Text="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter shipped end date:
                </td>
                <td>
                    <asp:TextBox ID="txtEndDate" Text="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grvOrders" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="OrderID" DataSourceID="SqlDataSource1" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"
                                InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                            <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" SortExpression="ShippedDate"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" SortExpression="RequiredDate"  />
                            <asp:BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName" />
                        </Columns>
                        <PagerSettings FirstPageText="First" LastPageText="Last" 
                             Position="Bottom"                 
                       Mode="NextPreviousFirstLast" 
             
             
            NextPageText="Next" 
            PreviousPageText="Prev"
                         />
                        <PagerStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:getconn %>"
            SelectCommand="SELECT [OrderID]
      ,[CustomerID]
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
  FROM [Orders] Where [ShippedDate] between @startDate and @enddate order by [ShippedDate]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDate" DefaultValue="01/01/1900" Name="startDate"
                    PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEndDate" DefaultValue="01/01/2010" Name="enddate"
                    PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
 </asp:Content>
