pragma solidity ^0.4.24;
contract SaleBalanceTracker {
  uint256 public snapshotTimestamp = 0;
  bool public locked = false;

  function endSale() {
    require(!locked);
    snapshotTimestamp = block.timestamp;
    locked = true;
    return;
  }
}