// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Errors} from "../src/Errors.sol";

contract ErrorsTest is Test {
    Errors public errorsContract;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        errorsContract = new Errors();
    }

    function testFail() public view{
        errorsContract.trowError();
    }

    function testRevert() public {
        vm.expectRevert();
        errorsContract.trowError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("Not Authorized"));
        errorsContract.trowError();
    }

    function testCustomError() public {
        vm.expectRevert(Errors.NotAuthorized.selector);
        errorsContract.throwCustomError();
    }

    function testErrorLabel() public pure {
        assertEq(uint256(1), uint256(1), "test1");
        assertEq(uint256(1), uint256(1), "test2");
        assertEq(uint256(1), uint256(1), "test3");
        assertEq(uint256(1), uint256(1), "test4");
        assertEq(uint256(1), uint256(1), "test5");
    }
}