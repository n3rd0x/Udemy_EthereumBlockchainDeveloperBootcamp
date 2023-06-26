// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.14;


contract WillThrow {
    // Custom exception.
    error NotAllowedError(string);

    function myFunction(uint opt) public pure {
        if(opt == 1) {
            require(false, "Error, not allowed to continue");
        }
        else if(opt == 2) {
            assert(false);
        }
       else {
            revert NotAllowedError("You are not allowed");
       }
    }
}


contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorPanic(uint code);
    event ErrorBytes(bytes data);

    function catchTheError(uint opt) public {
        WillThrow wt = new WillThrow();
        try wt.myFunction(opt) {
            // Add useful code here.
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
            emit ErrorPanic(errorCode);
        } catch (bytes memory data) {
            emit ErrorBytes(data);
        }
    }
}