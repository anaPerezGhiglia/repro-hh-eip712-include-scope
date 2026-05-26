import { defineConfig } from "hardhat/config";

export default defineConfig({
  paths: {
    sources: "./contracts",
    tests: "./test",
  },
  solidity: {
    profiles: {
      default: {
        compilers: [{ version: "0.8.28" }],
      },
    },
  },
  test: {
    solidity: {
      // The user has explicitly scoped EIP-712 type collection to A.sol.
      // B.sol — which defines a same-named, differently-shaped `Order` struct —
      // is NOT in this include glob, is NOT imported by A.sol, and is not
      // referenced from any test. The expectation (matching Forge `bind-json`)
      // is that B.sol's `Order` is irrelevant to the registry.
      eip712Types: { include: ["contracts/A.sol"] },
    },
  },
});
