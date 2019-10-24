using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BankAccountRegister.BLL;
using BankAccountRegister.Modles;

namespace BankAccountRegister
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        accountManagement accountManager = new accountManagement();
        Accounts newAccount = new Accounts();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                newAccount.AccountName = accountNameTextBox.Text;
                newAccount.AccountNumber = (int)Convert.ToInt64(accountNumberTextBox.Text);
                ViewState["NewAccount"] = newAccount;
                msgLabel.Text = "Account created successfully";
                msgLabel.ForeColor = Color.Green;
                GetClear();
            }
        }
        protected void depositButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                newAccount = (Accounts)ViewState["NewAccount"];
                if (newAccount != null)
                {
                    transactionConfirmartionLabel.Text = newAccount.GetDeposit(Convert.ToDouble(amountTextBox.Text));
                    GetClear();
                    msgLabel.Text = string.Empty;

                }
                else
                {
                    transactionConfirmartionLabel.Text = "Please create account first";
                }
            }
        }
        protected void withdrawalButton_OnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                newAccount = (Accounts)ViewState["NewAccount"];
                if (newAccount !=null)
                {
                    if (newAccount.Balance <= 0)
                    {
                        transactionConfirmartionLabel.Text = "Please Deposit some amount";
                        msgLabel.Text = string.Empty;

                    }
                    else
                    {
                        transactionConfirmartionLabel.Text = newAccount.GetWithdrawal(Convert.ToDouble(amountTextBox.Text));
                        GetClear();
                        msgLabel.Text = string.Empty;
                    }
                    ;
                }
                else
                {
                    transactionConfirmartionLabel.Text = "Please create account firs";
                    transactionConfirmartionLabel.ForeColor = Color.Red;
                    msgLabel.Text = string.Empty;
                }
          



            }
        }
        protected void reportButton_OnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                newAccount = (Accounts)ViewState["NewAccount"];
                if (newAccount != null)
                {
                    transactionConfirmartionLabel.Text =
                        $"Your account name is {newAccount.AccountName}, Your account number is {newAccount.AccountNumber}, Your account balace is {newAccount.Balance}";

                }
            }
        }
        protected void accountNameTextBoxValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            accountManager.GetAccountNameValidate(args);

        }



        protected void accountNumberTextBoxValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            accountManager.GetAccountNumberValidate(args);
        }

        private void GetClear()
        {
            accountNameTextBox.Text = string.Empty;
            accountNumberTextBox.Text = string.Empty;
            amountTextBox.Text = string.Empty;
        }

    }
}