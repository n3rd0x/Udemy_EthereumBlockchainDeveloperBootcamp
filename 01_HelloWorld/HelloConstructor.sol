// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Constructor.
 */
contract HelloConstructor {
    address public myAddr;


    /**
     * Directly called during the deployment of the contract.
     * Called only once.
     * Cannot be overloaded.
     */
    constructor(address newAddr) {
        myAddr = newAddr;
    }


    function setAdr(address newAddr) public {
        myAddr = newAddr;
    }


    function setAdrSender() public {
        myAddr = msg.sender;
    }
}