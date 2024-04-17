// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP37} from "@klaytn/contracts/KIP/token/KIP37/KIP37.sol";
import {Ownable} from "@klaytn/contracts/access/Ownable.sol";

contract FungibilityAgnosticToken is KIP37, Ownable {
  constructor() KIP37("") {}

  function setURI(string memory newuri) public onlyOwner {
    _setURI(newuri);
  }
}
