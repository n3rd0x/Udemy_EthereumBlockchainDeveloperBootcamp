// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


// Demonstrate using a child contract.
contract WalletWithContract {
    PaymentReceivedContract public payment;

    function payContract() public payable {
        payment = new PaymentReceivedContract(msg.sender, msg.value);
    }
}


contract PaymentReceivedContract {
    address public from;
    uint public amount;

    constructor(address ifrom, uint iamount) {
        from = ifrom;
        amount = iamount;
    }
}



// Demontrate using struct.
// Pros: Gas cost is less.
contract WalletWithStruct {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        // Way A:
        //payment = PaymentReceivedStruct(msg.sender, msg.value);

        // Way B:
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}