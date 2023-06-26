// SPDX-License-Identifier: MIT

// Intension use lower version.
pragma solidity >= 0.8.14;


contract ExceptionRequired {
    mapping(address => uint) public balanceReceived;


    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }


    function withdrawMoney(address payable target, uint amount) public {
        // Traditional way:
        //if(amount <= balanceReceived[msg.sender]) {
        //    balanceReceived[msg.sender] -= amount;
        //    target.transfer(amount);
        //}

        // Exception way:
        require(amount <= balanceReceived[msg.sender], "Not enough fund!");
        balanceReceived[msg.sender] -= amount;
        target.transfer(amount);
    }
}