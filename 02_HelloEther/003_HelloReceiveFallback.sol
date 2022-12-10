// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Introduction to receive and fallback.
 * NB! By default the contract can not receive any thing due to
 * constructor is not mark as payable.
 * The deployment will also fails if there contains value to the contract.
 * In this case the deployment should be with zero value.
 *
 * receive() vs function()
 * receive() is a function that gets priority over fallback() when a calldata is empty.
 * But fallback gets precedence over receive when calldata does not fit a valid function signature.
 */
contract HelloReceiveFallback {
    uint public lastValueSent;
    string public lastCalled;
    uint public myValue;


    /**
     * The following results when calling the function with 1 as parameter.
     * InputData: 0xdc3efa0e0000000000000000000000000000000000000000000000000000000000000001
     * The first four bytes are the function signiture (0xdc3efa0e) which is a hashed value of
     * 'updateMyValue(uint256)'.
     *
     * By calling the 'web3.utils.sha3("updateMyValue(uint256)")' in the console will results:
     * 0xdc3efa0ef51052098b53737e392aa9812c90dc8280eaae39600fcf1992fababa
     * By comparing the first 4 bytes, they matched.
     *
     * It's possible to set the raw data in the calldata and it would call the 'updateMyValue'.
     * CallData: 0xdc3efa0e000000000000000000000000000000000000000000000000000000000000000F
     * This will update 'myValue' to be 15.
     */
    function updateMyValue(uint nval) public {
        myValue = nval;
    }


    /**
     * The receive function will be triggered wwhen the transaction
     * contains no calldata.
     */
    receive() external payable {
        lastValueSent = msg.value;
        lastCalled = "receive";
    }


    /**
     * The fallback function willl be triggered when none of the defined
     * signiture mathes.
     * NB! Adding 'payable' modifier is optional. Only needed if
     * the contract will manages payable transactions.
     */
    fallback() external payable {
        lastValueSent = msg.value;
        lastCalled = "fallback";
    }
}