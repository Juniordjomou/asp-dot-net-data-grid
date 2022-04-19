<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CSs.aspx.cs" MasterPageFile="Dashboard.master" Inherits="CSs" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlx.css"/>
    <form id="form1" >
    Tables:
    <asp:RadioButtonList ID="rbTables" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
        OnSelectedIndexChanged="Tables_Changed">
        <asp:ListItem Text="Customers Table" Value="Customers" Selected="True"></asp:ListItem>
        <asp:ListItem Text="Employees Table" Value="Employees"></asp:ListItem>
    </asp:RadioButtonList>
    <hr />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
         />
    </form>
</asp:Content>
