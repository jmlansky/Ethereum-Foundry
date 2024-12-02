// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Subastas} from "../src/Subasta.sol";

contract SubastasTest is Test {
    Subastas public subastasContract;
    
    uint256 private inicio;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        subastasContract = new Subastas();
        inicio = block.timestamp;        
    }

    function testOfertarAntesDeTiempo() public {
        vm.expectRevert(bytes("No puede ofertar => Fuera de tiempo"));
        subastasContract.ofertar();
    }

    function testOfertar() public {
        vm.warp(inicio +1 days);
        subastasContract.ofertar();
    }

    function testOfertarDespuesDeFin() public {
        vm.expectRevert(bytes("No puede ofertar => Fuera de tiempo"));
        vm.warp(inicio +3 days);
        subastasContract.ofertar();
    }

    function testTimestamp() public {
        uint _timestamp = block.timestamp;
        skip(100); // avanza el tiempo en xx tiempo => en el ejemplo, 100 segundos
        assertEq(block.timestamp, _timestamp+ 100);

        rewind(50); // retrocede el tiempo en xx tiempo => en el ejemplo, 100 segundos
        assertEq(block.timestamp, _timestamp +50); 
    }

    function testBlockNumber() public {        
        vm.roll(555);
        uint _blockNumber = block.number;
        assertEq(_blockNumber, 555);        
    }
}