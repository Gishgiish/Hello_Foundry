// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/EnglishAuction.sol";

// import "../mocks/MockERC721.sol";

contract EnglishAuctionTest is Test {
    EnglishAuction public auction;
    IERC721 public nft;
    address payable public seller;
    uint public nftId;
    uint public startingBid;
    event Start();

    function setUp() public {
        // nft = new MockERC721();
        nftId = 1;
        seller = payable(msg.sender);
        startingBid = 10 ether;
        auction = new EnglishAuction(address(seller), nftId, startingBid);
    }

    function testStart() public {
        //expect event to be emited when called
        vm.expectEmit(true, false, false, false);
        emit Start();
        //handle require statement
        vm.expectRevert(bytes("Auction has already started"));

        // start auction
        auction.start();
    }
    //    function testBid() public {
    //        uint256 bidAmount = 20 ether;
    //        auction.bid{value: bidAmount}();
    //        assertEq(auction.highestBid(), bidAmount, "Highest bid should be updated");
    //    }
    //    function testWithdraw() public {
    //        uint256 withdrawAmount = 10 ether;
    //        auction.bids(msg.sender);
    //        auction.withdraw();
    //        assertEq(auction.bids(msg.sender), 0, "Bid should be withdrawn");
    //    }
    //    function testEnd() public {
    //        auction.end();
    //        assertTrue(auction.ended(), "Auction should have ended");
    //    }
}
