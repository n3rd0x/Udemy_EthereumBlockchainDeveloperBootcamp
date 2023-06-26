// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


contract Sender {
    function withdrawTransfer(address payable target) public {
        // If error occurrs the 'transfer' function will throw / revert an error.
        target.transfer(10);
    }


    // Send function is a low level function that will only care about whether it's
    // able to run its code or not. It's up to the developer to take care of the result.
    function withdrawSend(address payable target) public {
        // The 'send' function will return a boolean.
        //target.send(10);

        // Taking care of the result.
        bool success = target.send(10);
        require(success, "Sending the funds was unsuccessful");
    }

    receive() external payable {}
}


contract ReceiverNoAction {
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}
}


// Receives that will write to a storage variable.
// @remarks Writing will cost some gas.
contract ReceiverAction {
    uint public balanceReceived;


    function balance() public view returns(uint) {
        return address(this).balance;
    }


    receive() external payable {
        balanceReceived += msg.value;
    }
}