pragma solidity ^0.4.24;
contract TokenMintPoD {

  uint256 public lockTime;

  function getBalanceOfToken() public constant returns (uint256) {
    if (block.timestamp <= lockTime)
        return lockTime;
  }
}
