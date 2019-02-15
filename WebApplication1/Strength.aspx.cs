using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;

namespace WebApplication1
{
    public partial class Strength : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int total = PassStr(txtPassword.Text);
            string status = "";
            switch (total)
            {
                case 1:
                    status = "Very Weak";
                    break;
                case 2:
                    status = "Weak";
                    break;
                case 3:
                    status = "Medium";
                    break;
                case 4:
                    status = "Strong";
                    break;
                case 5:
                    status = "Very Strong";
                    break;
                default:
                    break;
            }

            lblPasswordStrength.Text = "Status : " + status;
            if (total < 4)
            {
                lblPasswordStrength.ForeColor = Color.Red;
                return;
            }
            lblPasswordStrength.ForeColor = Color.Green;

        }

        private int PassStr(string password)
        {
            int total = 0;
            if (password.Length < 6)
            {
                return 1;
            }
            else
            {
                total = 1;
            }
            if (Regex.IsMatch(password,"[a-z]"))
            {
                total++;
            }
            if (Regex.IsMatch(password, "[A-Z]"))
            {
                total++;
            }
            if (Regex.IsMatch(password, "[0-9]"))
            {
                total++;
            }
            if (Regex.IsMatch(password, "[<,>,@,!,#,$,%,^,&,*,(,),_,-,=,+,{,},\\[,\\],?,:,;,|,`,',.,~,=]"))
            {
                total++;
            }
            return total;
        }
    }
}