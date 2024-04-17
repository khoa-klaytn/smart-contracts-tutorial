// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {KIP7Burnable} from
  "@klaytn/contracts/KIP/token/KIP7/extensions/KIP7Burnable.sol";

contract BurnableToken is KIP7, KIP7Burnable {
  constructor() KIP7("BurnableToken", "BT") {
    _mint(msg.sender, 1000 * 10 ** decimals());
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(KIP7, KIP7Burnable)
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }
}
