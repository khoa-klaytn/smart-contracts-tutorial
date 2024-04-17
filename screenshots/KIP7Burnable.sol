function burn(uint256 amount) public virtual override {
  _burn(_msgSender(), amount);
}

function burnFrom(address account, uint256 amount) public virtual override {
  _spendAllowance(account, _msgSender(), amount);
  _burn(account, amount);
}
