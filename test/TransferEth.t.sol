// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TransferEther} from "../src/TransferEth.sol";

contract TransferEtherTest is Test {
    TransferEther public transferEtherContract;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        transferEtherContract = new TransferEther();        
    }

    function _send(uint256 _amount) private{
        (bool ok, ) = address(transferEtherContract).call{value: _amount}("");
        require(ok, "Send Eth failed");
    }

    function testBalance() public view{
        console.log("ETH BALANCE: ", address(this).balance/1e18);
    }

    function testSendEth() public {
        uint _balance = address(transferEtherContract).balance;

        deal(address(1), 100); // la funcion "deal" simula agregar un monto de eth a un address
        assertEq(address(1).balance, 100);

        deal(address(1), 145);
        vm.prank(address(1)); // setea msg.sender = address(1) unicamente para la linea siguiente
        _send(145);

        hoax(address(2), 44); // unifica la funcion deal + prank del bloque anterior
        _send(22);

        assertEq(address(transferEtherContract).balance, _balance + 145 + 22);
    }
}