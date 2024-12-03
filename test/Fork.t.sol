// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

interface IWETH {
    function balanceOf(address) external view returns (uint256);
    function deposit() external payable;
}

contract ForkTest is Test {
    IWETH public weth;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function testDeposit() public {
        uint256 _initialBalance = weth.balanceOf(address(this));
        console.log("BALANCE INICIAL: ", _initialBalance);

        weth.deposit{value: 500}();

        uint256 _finalBalance = weth.balanceOf(address(this));
        console.log("BALANCE FINAL: ", _finalBalance);
    }
}

// url api alchemy = https://eth-mainnet.g.alchemy.com/v2/Fahs600PhG8sQ9BCOdwy_0JY2ery6fr9
// forge test --fork-url [API_ALCHEMY] --match-path test/Fork.t.sol -vv
// forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/Fahs600PhG8sQ9BCOdwy_0JY2ery6fr9 --match-path test/Fork.t.sol -vv