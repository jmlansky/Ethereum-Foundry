// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "./interfaces/IERC20.sol";

contract ForkDAITest is Test {
    IERC20 public dai;

    // Esta funcion se ejecuta ANTES DE CADA funcion de test
    function setUp() public {
        dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }

    function testDeposit() public {
        address _javi = address(123);
        uint256 _initialBalance = dai.balanceOf(_javi);
        console.log("BALANCE INICIAL: ", _initialBalance/ 1e18);

        uint256 _totalSupply = dai.totalSupply();
        console.log("TOTAL SUPPLY: ", _totalSupply/ 1e18);
        
        deal(address(dai), _javi, 1e6 * 1e18);


        uint256 _finalBalance = dai.balanceOf(_javi);
        console.log("BALANCE FINAL: ", _finalBalance/ 1e18);

        uint256 _totalSupplyFinal = dai.totalSupply();
        console.log("TOTAL SUPPLY FINAL: ", _totalSupplyFinal/ 1e18);
    }
}

// url api alchemy = https://eth-mainnet.g.alchemy.com/v2/Fahs600PhG8sQ9BCOdwy_0JY2ery6fr9
// forge test --fork-url [API_ALCHEMY] --match-path test/Fork.t.sol -vv
// forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/Fahs600PhG8sQ9BCOdwy_0JY2ery6fr9 --match-path test/ForkDAI.t.sol -vv