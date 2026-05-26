// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test} from "forge-std/Test.sol";

import {A} from "../contracts/A.sol";

// The test never touches B. It only uses the `Order` defined in A.sol —
// which is the file the user listed in `eip712Types.include`.
//
// We pass the full EIP-712 type definition string to the cheatcode rather
// than the bare name. `eip712HashStruct`'s first argument is
// `typeNameOrDefinition` — Forge auto-detects which form was passed:
//   - with a "(", it treats the string as a literal type definition;
//   - without, it looks the name up in the generated `JsonBindings.sol`.
// We use the definition form here only to keep the repro independent of
// `forge bind-json` (whose output file would otherwise be required at
// runtime). The bug being demonstrated is unaffected by this choice:
// HHE818 is thrown by Hardhat at collection time, before any cheatcode
// call runs.
contract FooTest is Test {
  function test_orderHash() external view {
    A.Order memory o = A.Order({user: address(this), amount: 1});
    bytes32 h = vm.eip712HashStruct(
      "Order(address user,uint256 amount)",
      abi.encode(o)
    );
    assertEq(h.length, 32);
  }
}
