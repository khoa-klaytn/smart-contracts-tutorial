// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {
  KIP7Permit,
  IKIP7Permit
} from "@klaytn/contracts/KIP/token/KIP7/extensions/draft-KIP7Permit.sol";

contract PermitToken is KIP7, KIP7Permit {
  constructor() KIP7("PermitToken", "PT") KIP7Permit("PermitToken") {}

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return interfaceId == type(IKIP7Permit).interfaceId
      || super.supportsInterface(interfaceId);
  }
}
