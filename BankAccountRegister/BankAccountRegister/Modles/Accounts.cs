using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Services;
using System.Web;
namespace BankAccountRegister.Modles
{
[Serializable]
    public class Accounts
    {
        public string AccountName { get; set; }
        public long AccountNumber { get; set; }
        public double Balance { get; private set; }

        public string GetDeposit(double amount)
        {
            if (amount>0)
            {
            Balance += amount;
                return "Balance updated successfully";
            }
            else
            {
                return "Please enter a valid amount";
            }
        }

        public string GetWithdrawal(double amount)
        {
            if (amount>0)
            {
                if (Balance>amount)
                {
                    Balance -= amount;
                    return "Withdrawal successful; Balance has been updated.";
                }else if (amount > Balance)
                {
                    return "Insufficent Balance";
                }
                else
                {
                    return "Withdrawal is not possible";
                }
            }
            else
            {
                return "Please enter a valid digit";
            }
        }
    }
}