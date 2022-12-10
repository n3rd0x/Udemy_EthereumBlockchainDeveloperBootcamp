// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * A simple contract to publish on the blockchain.
 */
contract HelloEther {
    string public greetings = "Hello Blockchain";


    function updateGreetings(string memory newMsg) public {
        greetings = newMsg;
    }
}