// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP17} from "@klaytn/contracts/KIP/token/KIP17/KIP17.sol";

contract NonFungibleToken is KIP17 {
  constructor() KIP17("NonFungibleToken", "NFT") {}

  function _baseURI() internal pure override returns (string memory) {
    return "";
  }
}
