<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Strength.aspx.cs" Inherits="WebApplication1.Strength" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Strength Checker</title>
    <script src="Script/jquery-1.7.1.js"></script>
    <script language="javascript" type="text/javascript">
        function checkStrength() {
            var value = $('#<%=txtPassword.ClientID %>').val();
            var total = 0;
            var status = "";
            var specialChars = "<>@!#$^&*()_=[]{}?:;|'\"\\,./~`-=`"
            if (value.toString().length >= 8) {

                if (/[a-z]/.test(value)) {
                    total += 1;
                }
                if (/[A-Z]/.test(value)) {
                    total += 1;
                }
                if (/\d/.test(value)) {
                    total += 1;
                }
                for (i = 0; i < specialChars.length; i++) {
                    if (value.indexOf(specialChars[i]) > -1) {
                        total += 1;
                    }
                }
            }
            else {
                total = 1;
            }
        
            if (total ==2) {
                status = status = "<span style='color:#CCCC00'>Medium</Span>"
            }
            else if (total ==3){
                status = "<span style='color:#0DFF5B'>Strong</span>"
            }
            else if (total >=4) {
                status = "<span style='color:#009933'>Very Strong</span>"
            }
            else{
                status = "<span style='color:red'>Weak</span>"
            }
            if (value.toString().length >0 {
                $('#<%=lblPasswordStrength.ClientID %>').html("Status : <span> " + status + "</span>");
            }
            else{
                $('#<%=lblPasswordStrength.ClientID %>').html("");
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Login</h3>
        <div>

            <table cellpadding="0" cellspacing="10" border="0">
                <tr>
                    <td>Username:</td>
                    <td><asp:TextBox ID="txtUsername" runat="server" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" onKeyUp="checkPassStrength()" /></td>
                    <td><asp:Label ID="lblPasswordStrength" runat="server" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnSave" runat="server" Text="Submit"/></td>
                    <td></td>
                </tr>
            </table>
        </div>

    </div>
    </form>
</body>
</html>
