// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.14;


contract MainFallback {
    mapping(address => uint) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }


    // Fallback function for example 'DepositWithFallback'.
    receive() external payable {
        deposit();
    }
}


contract DepositWithFallback {
    function depositOnMain(address target) public {
        // Trigger the fallback in 'target'
        (bool success, ) = target.call{value: 10, gas: 10000}("");
        require(success);
    }

    receive() external payable {}
}