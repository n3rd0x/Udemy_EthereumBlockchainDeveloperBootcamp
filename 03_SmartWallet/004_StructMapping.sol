// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


contract Wallet {
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint total;
        uint numDeposits;
        uint numWithdrawals;
        mapping(uint => Transaction) deposits;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;


    function depositTransaction(address target, uint index) public view returns(Transaction memory) {
        return balances[target].deposits[index];
    }


    function depositMoney() public payable {
        balances[msg.sender].total += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        
        uint index = balances[msg.sender].numDeposits;
        balances[msg.sender].deposits[index] = deposit;
        balances[msg.sender].numDeposits++;
    }


    function withdrawMoney(address payable target, uint amount) public {
        balances[msg.sender].total -= amount;

        Transaction memory withdraw = Transaction(amount, block.timestamp);

        uint index = balances[msg.sender].numWithdrawals;
        balances[msg.sender].withdrawals[index] = withdraw;
        balances[msg.sender].numWithdrawals++;

        target.transfer(amount);
    }
}