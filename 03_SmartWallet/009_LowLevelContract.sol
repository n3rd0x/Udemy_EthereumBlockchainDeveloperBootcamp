// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.14;


contract MainContract {
    mapping(address => uint) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }
}


contract DepositWithContract {
    function depositOnMain(address target) public {
        // Use the native amount from ContractB and transfer to ContractA.
        // NB! In contract A, it's the address of ContractB that will be stored
        // in the 'addressBalances', because ContractB is the actual sender.
        MainContract main = MainContract(target);
        main.deposit{value: 10, gas: 100000}();
    }

    receive() external payable {}
}


contract DepositWithSignature {
    function depositOnMain(address target) public {
        // Implement as encoded signatures.
        bytes memory payload = abi.encodeWithSignature("deposit");
        (bool success, ) = target.call{value: 10, gas: 10000}(payload);
        require(success);
    }

    receive() external payable {}
}