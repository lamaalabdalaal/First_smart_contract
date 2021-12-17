pragma solidity ^0.8.0;


// First Contract
contract FinTech2030{}


//Second Contract
contract BankName {


    string public Bank_Name = " ";
    
    

    constructor (string memory Bank_Name)  {
      
        Bank_Name = "Bank Of Saudi FinTech";

    } 
    
}

// Third Contract
contract Bank {

    mapping (address => uint) public account_balances;


    function transfer (address acct_to_transfer_to,uint _amount) external {
         require(_amount <= account_balances[msg.sender], 'Insufficient balance');
         account_balances[msg.sender] -= _amount;
         account_balances[acct_to_transfer_to] +=_amount;
         

    }

    function withdraw(uint _amount) external {
         require(_amount <= account_balances[msg.sender], 'Insufficient balance');
         account_balances[msg.sender] -= _amount;
         payable(msg.sender).transfer(_amount);
       
    }
 

    receive() external payable {
         account_balances[msg.sender] += msg.value;
    }

}
