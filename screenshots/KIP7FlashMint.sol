bytes32 private constant _RETURN_VALUE =
  keccak256("ERC3156FlashBorrower.onFlashLoan");

/**
 * @param receiver The receiver of the flash loan. Should implement the
 * {IERC3156FlashBorrower.onFlashLoan} interface.
 * @param token The token to be flash loaned. Only `address(this)` is
 * supported.
 * @param amount The amount of tokens to be loaned.
 * @param data An arbitrary datafield that is passed to the receiver.
 * @return `true` if the flash loan was successful.
 */
function flashLoan(
  IERC3156FlashBorrower receiver,
  address token,
  uint256 amount,
  bytes calldata data
) public virtual override returns (bool) {
  require(
    amount <= maxFlashLoan(token), "KIP7FlashMint: amount exceeds maxFlashLoan"
  );
  uint256 fee = flashFee(token, amount);
  _mint(address(receiver), amount);
  require(
    receiver.onFlashLoan(msg.sender, token, amount, fee, data) == _RETURN_VALUE,
    "KIP7FlashMint: invalid return value"
  );
  _spendAllowance(address(receiver), address(this), amount + fee);
  _burn(address(receiver), amount + fee);
  return true;
}
