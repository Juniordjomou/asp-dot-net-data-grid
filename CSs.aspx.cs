using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class CSs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindReport();
        }
    }

    private void BindReport()
    {
        string query = "SELECT TOP 500 ";
        if (rbTables.Items[0].Selected)
        {
            query += "CustomerId, ContactName, City, Country, PostalCode FROM Customers";
        }
        else
        {
            query += "EmployeeId, FirstName, LastName, City, Country FROM Employees";
        }
        ReportDocument crystalReport = new ReportDocument();
        CrystalReportViewer1.DisplayGroupTree = false;
        crystalReport.Load(Server.MapPath("CrystalReport.rpt"));
        CustomDataSet dsCustom = GetData(query, crystalReport);
        crystalReport.SetDataSource(dsCustom);
        CrystalReportViewer1.ReportSource = crystalReport;
    }

    private CustomDataSet GetData(string query, ReportDocument crystalReport)
    {
        string conString = ConfigurationManager.ConnectionStrings["getconn"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            CustomDataSet dsCustom = new CustomDataSet();
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                //Get the List of all TextObjects in Section2.
                List<TextObject> textObjects = crystalReport.ReportDefinition.Sections["Section2"].ReportObjects.OfType<TextObject>().ToList();
                for (int i = 0; i < textObjects.Count; i++)
                {
                    //Set the name of Column in TextObject.
                    textObjects[i].Text = string.Empty;
                    if (sdr.FieldCount > i)
                    {
                        textObjects[i].Text = sdr.GetName(i);
                    }
                }
                //Load all the data rows in the Dataset.
                while (sdr.Read())
                {
                    DataRow dr = dsCustom.Tables[0].Rows.Add();
                    for (int i = 0; i < sdr.FieldCount; i++)
                    {
                        dr[i] = sdr[i];
                    }
                }
            }
            con.Close();
            return dsCustom;
        }
    }

    protected void Tables_Changed(object sender, EventArgs e)
    {
        this.BindReport();
    }
}