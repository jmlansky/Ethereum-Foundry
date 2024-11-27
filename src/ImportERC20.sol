// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// forge install rari-capital/solmate
// forge update  lib/solmate
// forge remove solmate
//import "solmate/tokens/ERC20.sol";

// contract Token is ERC20("TradingSmrt", "SMRT", 18){ }

import "@openzeppelin/contracts/access/Ownable.sol";

contract TestOwnable is Ownable {
    constructor() Ownable(msg.sender) {}
}
