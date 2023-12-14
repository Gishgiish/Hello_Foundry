// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/EnglishAuction.sol";
// import "../mocks/MockERC721.sol";

// contract EnglishAuctionTest is Test {
//    EnglishAuction public auction;
//    MockERC721 public nft;
//    address payable public seller;
//    uint public nftId;
//    uint public startingBid;

//    function setUp() public {
//        nft = new MockERC721();
//        nftId = 1;
//        seller = payable(msg.sender);
//        startingBid = 10 ether;
//        auction = new EnglishAuction(address(nft), nftId, startingBid);
//    }

//    function testStart() public {
//        auction.start();
//        assertTrue(auction.started(), "Auction should have started");
//    }

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
// }
