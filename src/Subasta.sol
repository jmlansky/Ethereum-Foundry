// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Subastas {
    uint256 public inicio = block.timestamp + 1 days; // fecha deploy + 1 dia
    uint256 public fin = block.timestamp + 2 days; // fecha deploy + 2 dias

    function ofertar() external view {
        require(block.timestamp >= inicio && block.timestamp < fin, "No puede ofertar => Fuera de tiempo");
    }

    function finalizar() external view {
        require(block.timestamp > fin, "No puede finalizar => Subasta en curso");
    }
}