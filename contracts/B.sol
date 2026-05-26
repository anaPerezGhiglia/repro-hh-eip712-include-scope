// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// NOT in `eip712Types.include`. Nothing in this project imports it.
// Hardhat still compiles it (it's under `paths.sources`), so its AST ends up
// in the build info alongside A.sol's. The bug: Hardhat's EIP-712 collector
// walks every source in every build info regardless of `include`, so this
// `Order` lands in the same `byName` registry as A's and triggers HHE818.
contract B {
  struct Order {
    bytes32 id;
    bool active;
  }
}
