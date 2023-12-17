// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/GaslessTokenTransfer.sol";
import "../src/ERC20Permit.sol";

contract GaslessTokenTransferTest is Test {
    ERC20Permit private token;
    GaslessTokenTransfer private gasless;

    uint256 constant SENDER_PRIV_KEY = 123;
    address sender;
    address receiver;
    uint constant amount = 1000;
    uint constant fee = 10;

    function setUp() public {
        sender = vm.addr(SENDER_PRIV_KEY);
        receiver = address(2);

        token = new ERC20Permit("Test", "test", 18);
        token.mint(sender, amount + fee);

        gasless = new GaslessTokenTransfer();
    }

    function testValidSig() public {
        uint deadline = block.timestamp + 60;
        // Prepare permit message
        bytes32 permitHarsh = _getPermitHash(
            sender,
            address(gasless),
            amount + fee,
            token.nonces(sender),
            deadline
        );

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(SENDER_PRIV_KEY, permitHarsh);

        // Execute send
        gasless.send(
            address(token),
            sender,
            receiver,
            amount,
            fee,
            deadline,
            // Permit signature
            v,
            r,
            s
        );

        // check token balance
        assertEq(token.balanceOf(sender), 0, "Sender balance");
        assertEq(token.balanceOf(receiver), amount, "Receiver balance");
        assertEq(token.balanceOf(address(this)), fee, "Fee");
    }

    function _getPermitHash(
        address owner,
        address spender,
        uint value,
        uint nonces,
        uint deadline
    ) private view returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    "\x19\x01",
                    token.DOMAIN_SEPARATOR(),
                    keccak256(
                        abi.encode(
                            keccak256(
                                "Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"
                            ),
                            owner,
                            spender,
                            value,
                            nonces,
                            deadline
                        )
                    )
                )
            );
    }
}
