using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BankAccountRegister.BLL
{
    public class accountManagement
    {
        public void GetAccountNumberValidate(ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            else
            {
                long number;
                bool intTryParse = long.TryParse(args.Value, out number);
                if (intTryParse && args.Value.Length > 8)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
        }
        public void GetAccountNameValidate(ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            else if (args.Value.Length < 3)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}