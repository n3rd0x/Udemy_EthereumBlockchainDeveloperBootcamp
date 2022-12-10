// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Visiblity levels.
 */
contract HelloConstructor {
    uint public myValue;


    /**
     * Can be called externally and from other contracts.
     */
    function helloExternal(uint nval) external {
        helloPublic(nval);
    }


    /**
     * Can be called from the contract itself or from derived contract.
     * Can noot be invoked by a transaction.
     */
    function helloInternal(uint nval) internal {
        myValue = nval;
    }


    /**
     * Can only be called in the contract,
     * not externally and not visible for derived contracts.
     */
    function helloPrivate(uint nval) private {
        helloInternal(nval);
    }


    /**
     * Can be called internally and externally.
     */
    function helloPublic(uint nval) public {
        helloPrivate(nval);
    }
}