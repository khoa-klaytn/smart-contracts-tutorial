// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7} from "@klaytn/contracts/KIP/token/KIP7/KIP7.sol";
import {Ownable} from "@klaytn/contracts/access/Ownable.sol";

contract MintableToken is KIP7, Ownable {
  constructor() KIP7("MintableToken", "MT") {
    _mint(msg.sender, 1000 * 10 ** decimals());
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }

  // Owner-controlled minting
  function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
  }

  // Mint only when the random number is even
  function mintEven(uint256 random) public {
    require(random % 2 == 0, "random is not even");
    _mint(msg.sender, 100 * 10 ** decimals());
  }
}
