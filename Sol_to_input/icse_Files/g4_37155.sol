pragma solidity ^0.4.24;
contract SynthornToken {
  uint256 startTime = 20;

  function purchasingAllowed() constant returns (bool) {
    return block.timestamp <= startTime + 30 days;
  }
}