// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


/**
 * Basic types.
 */
contract HelloBasicType {
    /**
     * Holds 20 bytes.
     */
    address public myAddress;


    /**
     * Default: false
     * NB! Only 2 valid boolean values: true or false
     * Other value such as 0, 1, True, TRUE, False or FALSE
     * will results true state.
     */
    bool public myBool;


    /**
     * Bytes has length.
     */
    bytes public myBytes = "HelloWorld";


    /**
     * Default: 0
     * Range:   0 <-> (2^256) - 1
     * NB! New version of Solidity there 
     */
    uint public myUInt;


    /**
     * Range: -(2^256) <-> (2^256) - 1
     */
    int public myInt;


    /**
     * NB! After version 0.8.x there is no roll over or wrapping
     * when passing its limit, this will flag an error.
     */
    uint8 public myUInt8;

    
    /**
     * NB! Initialize value as the same as default value cost some gas.
     * Should leave blank for default values.
     */
    uint public myCost = 0;


    /**
     * NB! There are no native string utils, such as compare two strings.
     */
    string public myString = "HelloWorld";


    function myAddressBalance() public view returns(uint) {
        // Return in WEI (the smallest unit).
        // 1 ETH => 10^18 WEI
        return myAddress.balance;
    }


    function myAddressMsgSender() public {
        // Store the address of the sender.
        // msg is a public global object through all the contract.
        // 'sender' contains the last contact with this contract.s
        myAddress = msg.sender;
    }


    function myAddressUpdate(address newValue) public {
        myAddress = newValue;
    }


    function myBoolUpdate(bool newValue) public {
        myBool = newValue;
    }


    function myBytesLength() public view returns(uint) {
        return myBytes.length;
    }


    function myIntPowerOf() public {
        // Exponentiation done with **
        // Results 16
        myInt = 2**4;
    }


    function myStringCompare(string memory newValue) public view returns(bool) {
        // The following will cause compiler error.
        // return (myString == newValue)
    
        // Comparing the hashes of the strings.
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(newValue));
    }


    /**
     * NB! Specify 'memory' keyword for string.
     */
    function myStringUpdate(string memory newValue) public {
        myString = newValue;
    }


    function myUInt8Decrease() public {
        // This will wrap around.
        unchecked {
            myUInt8--;
        }
    }


    function myUInt8Increase() public {
        // This will wrap around.
        unchecked {
            myUInt8++;
        }
    }


    function myUInt8Update(uint8 newValue) public {
        myUInt8 = newValue;
    }
}