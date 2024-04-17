// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {Pausable} from "@klaytn/contracts/security/Pausable.sol";
import {Ownable} from "@klaytn/contracts/access/Ownable.sol";

contract PausableToken is KIP7, Pausable, Ownable {
  constructor() KIP7("PausableToken", "PT") {}

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }

  function pause() public onlyOwner {
    _pause();
  }

  function unpause() public onlyOwner {
    _unpause();
  }

  function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    override
    whenNotPaused
  {
    super._beforeTokenTransfer(from, to, amount);
  }
}
