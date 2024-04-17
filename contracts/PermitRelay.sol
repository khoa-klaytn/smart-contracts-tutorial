// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {PermitToken} from "./PermitToken.sol";

contract PermitRelay {
  function relay(
    address token,
    address sender,
    address receiver,
    uint256 amount,
    uint256 fee,
    uint256 deadline,
    // Permit signature
    uint8 v,
    bytes32 r,
    bytes32 s
  ) external {
    PermitToken(token).permit(
      sender, address(this), amount + fee, deadline, v, r, s
    );
    // Permit signature covers both amount & fee
    PermitToken(token).transferFrom(sender, receiver, amount);
    PermitToken(token).transferFrom(sender, msg.sender, fee);
  }
}
