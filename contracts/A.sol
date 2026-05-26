// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// In `eip712Types.include`. Defines the canonical `Order` struct.
// No imports — nothing reaches B.sol from here.
library A {
  struct Order {
    address user;
    uint256 amount;
  }
}
