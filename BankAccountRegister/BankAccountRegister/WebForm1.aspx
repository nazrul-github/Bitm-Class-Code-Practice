<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BankAccountRegister.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function isValid(source,args) {
            if (args.value.length<3) {
                return false;
            } else if (args.value = "") {
                return false;
            } else {
                return true;
            }
            
        }
    </script>
    
    <fieldset style="width: 500px; margin: 20px; border: 1px solid black;">
        <legend style="border: 1px solid black">Create Bank Account</legend>

        <table class="nav-justified ">
            <tr>
                <td style="height: 48px; width: 185px; font-size: medium; padding-right: 10px" class="text-right"><strong>Account Name</strong></td>
                <td style="height: 48px; ">
                    <asp:TextBox ID="accountNameTextBox" CssClass="form-control" runat="server" style="margin-left: 0" ValidationGroup="createAccountValidation"></asp:TextBox></td>
                <td style="height: 48px">
                    <asp:CustomValidator ID="accountNameTextBoxValidator" ForeColor="red" ClientValidationFunction="isValid" ControlToValidate="accountNameTextBox" Display="Dynamic" SetFocusOnError="True" ValidateEmptyText="True"  runat="server" ErrorMessage="Account name should be more than 3 character" Text="*" OnServerValidate="accountNameTextBoxValidator_ServerValidate" ValidationGroup="createAccountValidation"></asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="height: 48px; width: 185px; padding-right: 10px; font-size: medium;" class="text-right"><strong>Account Number</strong></td>
                <td style="height: 48px">
                    <asp:TextBox ID="accountNumberTextBox" CssClass="form-control" runat="server" style="margin-left: 0" ValidationGroup="createAccountValidation"></asp:TextBox></td>
                <td style="height: 48px">
                    <asp:CustomValidator ID="accountNumberTextBoxValidator" ForeColor="red" ClientValidationFunction="isValid" ControlToValidate="accountNumberTextBox" Display="Dynamic" SetFocusOnError="True" ValidateEmptyText="True"  runat="server" ErrorMessage="Account number should only be number and more than 8 digit" Text="*" OnServerValidate="accountNumberTextBoxValidator_ServerValidate" ValidationGroup="createAccountValidation"></asp:CustomValidator></td>

            </tr>
            <tr>
                <td class="text-right">
                    <asp:Button ID="saveButton" CssClass="btn btn-primary" runat="server" Text="Save" ValidationGroup="createAccountValidation" OnClick="saveButton_Click" /></td>
                <td colspan="2" style="padding: 10px">
                    <asp:Label ID="msgLabel" runat="server"></asp:Label></td>
            </tr> <tr>
                <td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary" ForeColor="red" DisplayMode="List"  runat="server" ValidationGroup="createAccountValidation" />
                </td>
                
            </tr>
        </table>

    </fieldset>
    <fieldset style="width: 500px; border: 1px solid black;">
        <legend>Account Transaction</legend>

        <table class="nav-justified">
            <tr>
                <td style="height: 48px; font-size: medium; padding-right: 10px" class="text-right"><strong>Amount: </strong> </td>
                <td style="height: 48px">
                    <asp:TextBox ID="amountTextBox" CssClass="form-control" runat="server" ValidationGroup="transactionBoxValidator"></asp:TextBox></td>
                <td style="height: 48px">
                    <asp:RequiredFieldValidator ID="amountTextBoxValidator" ForeColor="red" runat="server" ErrorMessage="Amount is required" ControlToValidate="amountTextBox" Display="Dynamic" SetFocusOnError="True" ValidationGroup="transactionBoxValidator" ></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="amountTextBoxIntegerValidator" ForeColor="red" Display="Dynamic" ControlToValidate="amountTextBox" SetFocusOnError="True" Operator="DataTypeCheck"  Type="Double" runat="server" ValidationGroup="transactionBoxValidator" ErrorMessage="Amount must be in digits"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right" style="height: 36px; padding: 10px;">
                    <asp:Button ID="depositButton" runat="server" Text="Deposit" CssClass="btn btn-primary" OnClick="depositButton_Click" ValidationGroup="transactionBoxValidator" /></td>
                <td class="text-center" style="height: 36px; padding: 10px" >
                    <asp:Button ID="withdrawalButton" runat="server" Text="Withdraw" OnClick="withdrawalButton_OnClick" CssClass="btn btn-primary " ValidationGroup="transactionBoxValidator" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="transactionConfirmartionLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding: 10px">
                    <asp:Button ID="reportButton" Width="100%" runat="server" Text="Report" OnClick="reportButton_OnClick" CssClass="btn btn-info" />
                </td>
            </tr>
        </table>

    </fieldset>

</asp:Content>
