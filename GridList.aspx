<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridList.aspx.cs" Inherits="GridEmployee.GridList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <style type="text/css">
        .delete_cls {
            padding-left: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <h3>Employee Mangement System:</h3>
        </div>
        <section>
            <div class="row">
                <div class="col-4">
                    <div class="border-right-0 border-primary" style="margin-left: 30px;">
                        <table lass="table">
                            <tr>
                                <td>Employee Code</td>
                                <td>
                                    <div class="form-group">  
                                            <input type="text" class="form-control" id="txtEmpcode" runat="server" value="" />
                                    </div>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>First Name</td>
                                <td>
                                    <div class="form-group">
                                            <input type="text" class="form-control" id="txtFirstName" runat="server" value="" />
                                    </div>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>
                                    <div class="form-group">
                               
                                        <input type="text" class="form-control" id="txtLastName" runat="server" value="" />
                                    </div>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="txtPhoneNumber" runat="server" value="" />
                                    </div>
                           
                                </td>
                            </tr>
                            <tr>
                                <td>Email Address</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="txtEmailAddress" runat="server" value="" />
                                    </div>
                            
                                </td>
                            </tr>
                            <tr>
                                <td>Salary</td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="txtSalary" runat="server" value="" />
                                    </div>
                            
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button runat="server"  Text="Add" CssClass="btn btn-primary" OnClick="btnAddEmployee_Click" ValidationGroup="add"/>
                                </td>
                            </tr>
                        </table>
                        <div>
                                <asp:Label runat="server" ID="lblMessage"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
