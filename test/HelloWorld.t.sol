// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloWorldContract;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        helloWorldContract = new HelloWorld();        
    }

    function testGetMessage() public {
        string memory message = helloWorldContract.getMessage();
        assertEq(message, "Hello World from Foundry");
    }

    function testSetMessage() public {
        string memory newMessage = "My new message";
        helloWorldContract.setMessage(newMessage);
        string memory message = helloWorldContract.getMessage();
        assertEq(message, newMessage);
    }
}