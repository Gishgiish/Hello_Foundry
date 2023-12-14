// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {EtherWallet} from "../src/EtherWallet.sol";

contract EthWallet is Test {
    EtherWallet public wallet;

    function setUp() public {
        wallet = new EtherWallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailNotOwner() public {
        vm.prank(address(1));
        wallet.setOwner(address(1));
    }
}
