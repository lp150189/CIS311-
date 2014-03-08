Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SqlDataSource1.SelectCommand = "select * from [Table] where " & DropDownList1.SelectedValue & " like '%" & TextBox1.Text & "%'"
        SqlDataSource1.DataBind()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        SqlDataSource1.SelectCommand = "select * from [Table]"
        SqlDataSource1.DataBind()
    End Sub
End Class