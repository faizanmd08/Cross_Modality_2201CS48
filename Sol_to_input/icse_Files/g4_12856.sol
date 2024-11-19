pragma solidity ^0.4.24;
contract Crowdsale {
  uint256 public openingTime;
  uint256 public closingTime;
  bool public paused = false;
  modifier onlyOwner() {
    require(!paused);
    _;
  }

  function _preValidatePurchase() internal onlyOwner {
    require(block.timestamp >= openingTime && block.timestamp <= closingTime);
    return;
  }
}