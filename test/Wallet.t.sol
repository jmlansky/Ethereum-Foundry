// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public walletContract;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        walletContract = new Wallet();
    }

    function testSetNewOwner() public {
        walletContract.setNewOwner(address(1));
        assertEq(walletContract.owner(), address(1));
    }

    function testFailNotOwner() public {
        vm.prank(address(1)); // mock owner and set the address(1) as the owner address
        walletContract.setNewOwner(address(2)); // as the owner is mocked => can set the new owner to address(2)
    }
}