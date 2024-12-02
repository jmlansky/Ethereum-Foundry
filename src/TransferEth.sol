// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TransferEther {
    address payable public owner;
    event Deposit(address account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable{
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Wrong user, only ownser can't withdraw");
        payable(msg.sender).transfer(_amount);
    }

    function setNewOwner(address newAddress) external{
        require(msg.sender == owner, "Wrong user, only ownser can't withdraw");
        owner = payable(newAddress);
    }
}