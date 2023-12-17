// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";

contract SignTest is Test {
    function testSignature() public {
        //get private key
        uint256 privateKey = 123;
        // get publick key
        address pubKey = vm.addr(privateKey);
        // get message hash of secret message
        bytes32 messageHash = keccak256("Secret Message");
        // sign it with a private key (create signature)
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);
        // verify signer from the signature
        address signer = ecrecover(messageHash, v, r, s);

        // verify signer = public key
        assertEq(signer, pubKey);

        // try a failing test
        bytes32 invalidMessageHash = keccak256("Inavlid Message"); // generates a different signer
        signer = ecrecover(invalidMessageHash, v, r, s);

        // assert that the signer of this message isn't the same same as the one for the original
        assertTrue(signer != pubKey);
    }
}
