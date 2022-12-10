// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * A simple contract to publish on the blockchain and
 * manage payable transactions.
 */
contract HelloPayable {
    string public greetings = "Hello Payable in Blockchain";


    /**
     * The modifier 'payable' enables payable transaction.
     */
    function updatePayableGreetings(string memory newMsg) public payable {
        // 'ether' is a global keyword.
        if(msg.value == 1 ether) {
            greetings = newMsg;
        }
        else {
            address payable ptx = payable(msg.sender);

            // Transfer the value back to contract.
            ptx.transfer(msg.value);
        }
    }
}