// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Smart contract for transfer money.
 */
contract SmartMoney {
    uint public balanceReceived;


    /**
     * Balance of the contract.
     */
    function balance() public view returns(uint) {
        return address(this).balance;
    }


    /**
     * Deposit the amount transfered.
     */
    function deposit() public payable {
        balanceReceived += msg.value;
    }


    /**
     * Transfer money to the sender's address.
     */
    function withdrawAll() public {
        address payable toAdr = payable(msg.sender);
        toAdr.transfer(balance());
    }


    /**
     * Transfer money to specified address.
     */
    function withdrawAllToAddress(address payable toAdr) public {
        toAdr.transfer(balance());
    }
}