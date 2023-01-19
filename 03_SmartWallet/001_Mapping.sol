// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


contract HelloMapping {
    mapping(address => bool) public mapAdr;
    mapping(uint => bool) public mapBool;
    mapping(uint => mapping(uint => bool)) public mapMap;
    

    function setAddress() public {
        mapAdr[msg.sender] = true;
    }


    function setMap(uint idx) public {
        mapBool[idx] = true;
    }


    function setMapMap(uint keyA, uint keyB, bool val) public {
        mapMap[keyA][keyB] = val;
    }



    /**
     * Demonstrate how the compiler would automatic implement 'mapBool'.
     */
     function getBool(uint key) public view returns(bool) {
         return mapBool[key];
     }
}