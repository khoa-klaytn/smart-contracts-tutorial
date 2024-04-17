// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {KIP7Permit} from
  "@klaytn/contracts/KIP/token/KIP7/extensions/draft-KIP7Permit.sol";
import {
  KIP7Votes,
  IVotes
} from "@klaytn/contracts/KIP/token/KIP7/extensions/KIP7Votes.sol";

contract VotesToken is KIP7, KIP7Permit, KIP7Votes {
  constructor() KIP7("VotesToken", "VT") KIP7Permit("VotesToken") {}

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return interfaceId == type(IVotes).interfaceId
      || super.supportsInterface(interfaceId);
  }

  // The following functions are overrides required by Solidity.

  function _afterTokenTransfer(address from, address to, uint256 amount)
    internal
    override(KIP7, KIP7Votes)
  {
    super._afterTokenTransfer(from, to, amount);
  }

  function _mint(address to, uint256 amount) internal override(KIP7, KIP7Votes) {
    super._mint(to, amount);
  }

  function _burn(address account, uint256 amount)
    internal
    override(KIP7, KIP7Votes)
  {
    super._burn(account, amount);
  }
}
