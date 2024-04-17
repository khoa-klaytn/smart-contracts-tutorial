// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {KIP7Snapshot} from
  "@klaytn/contracts/KIP/token/KIP7/extensions/KIP7Snapshot.sol";
import {Ownable} from "@klaytn/contracts/access/Ownable.sol";

contract SnapshotToken is KIP7, KIP7Snapshot, Ownable {
  constructor() KIP7("SnapshotToken", "ST") {}

  function supportsInterface(bytes4 interfaceId) ... {...}

  function snapshot() public onlyOwner {
    _snapshot();
  }

  // The following functions are overrides required by Solidity.

  function _beforeTokenTransfer(...) override(KIP7, KIP7Snapshot) {
    super._beforeTokenTransfer(...);
  }
}
