// SPDX-License-Identifier: MIT

// Intension use lower version.
// To use rollover when value becomes out of range.
// Example: uint8 ([0, 255]], assign 256 would rollover to 0).
pragma solidity >= 0.7.0;


contract ExceptionAssert {
    mapping(address => uint8) public balanceReceived;


    function receiveMoney() public payable {
        // Trigger error if value is not the same.
        // This could happens if the value rolls over after casting to uint8.
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }


    function withdrawMoney(address payable target, uint8 amount) public {
        require(amount <= balanceReceived[msg.sender], "Not enough fund!");
        balanceReceived[msg.sender] -= amount;
        target.transfer(amount);
    }
}