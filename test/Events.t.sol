// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Events} from "../src/Events.sol";

contract EventsTest is Test {
    Events public eventsContract;
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        eventsContract = new Events();
    }

    function testEmitTransfer() public {
        // valida los parametros del emit
        // si la funcion asociada al evento tine los siguientes parametros: (indice1: "from", indice2: "to", indice3: null, data: "200");
        vm.expectEmit(true, true, false, true); // valida "from", "to" y "data" ya que valida los indices 1, 2 y el data.
        emit Transfer(address(this), address(123), 200);
        eventsContract.transfer(address(this), address(123), 200);        
    }

    function testEmitTransferOnlyOneIndex() public {
        // si la funcion asociada al evento tine los siguientes parametros: (indice1: "from", indice2: "to", indice3: null, data: "50");
        vm.expectEmit(true, false, false, false); // valida UNICAMENTE el indice que corresponde al "from" ya que valida el indice 1.
        emit Transfer(address(this), address(123), 50);
        eventsContract.transfer(address(this), address(123), 50);
    }

    function testEmitTransferMany() public {
        address[] memory _to = new address[](2);
        _to[0] = address(10);
        _to[1] = address(11);

        uint256[] memory _amounts = new uint256[](2);
        _amounts[0] = 24;
        _amounts[1] = 66;

        for (uint i = 0; i< _to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), _to[i], _amounts[i]);           
        }
        eventsContract.transferMany(address(this), _to, _amounts);
    }
}