<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section k-header">
    <%:Html.Kendo().TreeList<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>()
        .Name("treelist")
        .Toolbar(tb => tb.Add().Name("create"))
        .Columns(columns =>
        {
            columns.Add().Field("FirstName").Title("First Name").Width("220px");
            columns.Add().Field("LastName").Title("Last Name").Width("160px");
            columns.Add().Field("Position");
            columns.Add().Field("HireDate").Title("Hire Date").Format("{0:MMMM d, yyyy}");
            columns.Add().Field("Phone");
            columns.Add().Field("Extension").Title("Ext").Format("{0:#}");
            columns.Add().Title("Edit").Width("200px").Command(c =>
            {
                c.Add().Name("edit");
                c.Add().Name("destroy");
            })
            .Attributes(new {
                style = "text-align: center;"
            });
        })
        .DataSource(dataSource => dataSource
            .Create(create => create.Action("Create", "EmployeeDirectory"))
            .Read(read => read.Action("All", "EmployeeDirectory"))
            .Update(update => update.Action("Update", "EmployeeDirectory"))
            .Destroy(delete => delete.Action("Destroy", "EmployeeDirectory"))
            .Model(m => {
                m.Id(f => f.EmployeeId);
                m.ParentId(f => f.ReportsTo);
                m.Field(f => f.FirstName);
                m.Field(f => f.LastName);
                m.Field(f => f.ReportsTo);
                m.Field(f => f.HireDate);
                m.Field(f => f.BirthDate);
                m.Field(f => f.Extension);
                m.Field(f => f.Position);
            })
        )
        .Height(540)
     %>
</div>
</asp:Content>
