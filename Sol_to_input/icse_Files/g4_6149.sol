pragma solidity ^0.4.24;
contract JadeCoin {

  uint256 public nextSnapshotTime;

  function snapshotDailyGooResearchFunding() external returns (bool){
    nextSnapshotTime = block.timestamp + 24 hours;
    return true;
  }
}