// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Fallback will be triggered when no signiture matches.
 */
contract HelloFallback {
    uint public lastValueSent;
    string public lastCalled;


    /**
     * Intensionally left commented.
     */
    // receive() external payable {
    //    lastValueSent = msg.value;
    //    lastCalled = "receive";
    //}


    /**
     * The fallback function will be triggeren whether calldata contains value or not,
     * as long as no receive function is defined.
     */
    fallback() external payable {
        lastValueSent = msg.value;
        lastCalled = "fallback";
    }
}