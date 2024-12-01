// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Wallet{
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint amount) external {
        require(msg.sender == owner, "Wrong user, only ownser can't withdraw");

        payable(msg.sender).transfer(amount);
    }

    function setNewOwner(address newAddress) external{
        require(msg.sender == owner, "Wrong user, only ownser can't withdraw");

        owner = payable(newAddress);
    }

}