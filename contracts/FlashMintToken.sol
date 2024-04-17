// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {KIP7FlashMint} from
  "@klaytn/contracts/KIP/token/KIP7/extensions/KIP7FlashMint.sol";

contract FlashMintToken is KIP7, KIP7FlashMint {
  constructor() KIP7("FlashMintToken", "FMT") {}

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }
}
