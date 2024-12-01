// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Errors{
    error NotAuthorized();
    
    function trowError() external pure{
        require(false, "Not Authorized");
    }

    function throwCustomError() public pure{
        revert NotAuthorized();
    }
}