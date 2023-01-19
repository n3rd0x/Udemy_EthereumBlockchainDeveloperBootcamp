// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;



// @brief A contract contains money send by user,
// but only user who has send can withdraw the same
// amount that as been sent.
contract AdvancedMapping {
    mapping(address => uint) public balanceRecv;


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }


    function sendMoney() public payable {
        balanceRecv[msg.sender] += msg.value;
    }


    function withdrawAll(address payable toAdr) public {
        // @remarks DO NOT USE THIS WAY OF IMPLEMENTATION
        // Check effects interactions pattern.
        // This could lead to the function is called again
        // before the balance received is reset.
        //toAdr.transfer(balanceRecv[msg.sender]);
        //balanceRecv[msg.sender] = 0;

        // @remakrs BETTER WAY
        uint value2Send = balanceRecv[msg.sender];
        balanceRecv[msg.sender] = 0;

        toAdr.transfer(value2Send);
    }
}