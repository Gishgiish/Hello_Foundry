// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Accounts} from "../src/Accounts.sol";

contract AccountTest is Test {
    Accounts public account;

    function setUp() public {
        account = new Accounts();
    }

    function testDeposit() public {
        uint256 amount = 100;
        account.deposit(amount);
        assertEq(account.balance(), amount);
    }

    function testDepositOverflow() public {
        uint256 amount = type(uint256).max;
        vm.expectRevert("Overflow");
        account.deposit(amount);
    }

    // function testDepositoverflow() public {
    //     uint amount = 100;
    //     uint _added = amount + type(uint256).max;
    //     vm.expectRevert("Overflow");
    //     account.deposit(_added);
    // }

    function testWithdraw() public {
        uint256 amount = 100;
        account.deposit(amount);
        account.withdraw(amount);
        assertEq(account.balance(), 0);
    }

    function testWithdrawUnderflow() public {
        uint256 amount = 100;
        vm.expectRevert("Underflow");
        account.withdraw(amount);
    }
}
