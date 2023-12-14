pragma solidity ^0.8.17;

import "solmate/tokens/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract MyToken is ERC20("name", "symbol", 18) {}
