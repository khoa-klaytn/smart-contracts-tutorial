// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";

contract FungibleToken is KIP7 {
  constructor() KIP7("FungibleToken", "FT") {
    _mint(msg.sender, 1000 * 10 ** decimals());
  }
}
