// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Stores a string on the blockchain with readable for everyone,
 * but writable only for person that deploys the contract.
 */
contract BlockchainMessenger {
    uint public changeCounter;
    string public message;
    address public owner;


    constructor() {
        owner = msg.sender;
    }


    function newMessage(string memory newMsg) public {
        if(msg.sender == owner) {
            message = newMsg;
            changeCounter++;
        }
    }
}