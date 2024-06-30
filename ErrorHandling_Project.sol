// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorHandling {
    address public owner;
    mapping (address => uint) private balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint amount) public payable {
        require(amount > 0 , "Deposit Amount must be greater than 0.");
        balances[msg.sender] += amount;
    }

    function withdraw(uint amount) public payable {
        if (amount <= 0) {
            revert("Amount must be greater than 0.");
        }
        
        require(amount <= balances[msg.sender], "Entered Amount is not valid!");
        balances[msg.sender] -= amount;
    }

    function checkBalance(address account) public view returns (uint) {
        uint balance = balances[account];
        assert(balance >= 0);
        return balance;
    }
}