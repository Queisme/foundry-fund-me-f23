//SPDX-License-Identifier: MIT

/*

4 different types of testing:

1. Unit - testing a specific part of our code
2. Integration - testing how our code works with other parts of our code
3. Forked - testing our code on a simulated real environment
4. Staging - testing our code in a real environment that is not production

*/

pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    // set up runs first - always
    function setUp() external {
        fundMe = new FundMe();
    }

    //function testDemo() public {}

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        console.log(fundMe.i_owner());
        console.log(msg.sender);
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() public {
        
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
