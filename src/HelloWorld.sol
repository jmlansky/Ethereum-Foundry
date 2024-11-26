// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract HelloWorld {
    string private message;

    constructor(){
        message = "Hello World from Foundry";
    }

    function getMessage() public view returns(string memory) {
        return message;
    }

    function setMessage(string memory _message) public  {
        message = _message;
    }
}