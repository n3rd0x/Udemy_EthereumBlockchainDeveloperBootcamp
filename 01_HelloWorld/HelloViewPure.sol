// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * ViewPure.
 */
contract HelloViewPure {
    uint public data;


    /**
     * View can access members data.
     * Accessing state variables.
     */
    function getData() public view returns(uint) {
        return data;
    }


    /**
     * Pure can only access other pure or non view (no access to members).
     * Not accessing state variables.
     */
    function getPure(uint a, uint b) public pure returns(uint) {
        return a + b;
    }


    function setData(uint newData) public {
        data = newData;
    }


    /**
     * NB! No a good approach to use return. Usually use with other contracts.
     * Recommended to use event approach.
     */
    function setDataReturn(uint newData) public returns(uint) {
        data = newData;
        return newData;
    }
}