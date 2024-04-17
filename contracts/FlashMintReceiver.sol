// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {KIP7FlashMint} from
  "@klaytn/contracts/KIP/token/KIP7/extensions/KIP7FlashMint.sol";
import {IERC3156FlashBorrower} from
  "@klaytn/contracts/interfaces/IERC3156FlashBorrower.sol";

contract FlashMintReceiver is IERC3156FlashBorrower {
  bytes32 private constant _RETURN_VALUE =
    keccak256("ERC3156FlashBorrower.onFlashLoan");

  function onFlashLoan(
    address initiator,
    address token,
    uint256 amount,
    uint256 fee,
    bytes calldata data
  ) external override returns (bytes32) {
    // Do something with the loan
    return _RETURN_VALUE;
  }
}
