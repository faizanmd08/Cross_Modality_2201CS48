pragma solidity ^0.4.24;
contract TimeSource {
  uint32 private mockNow;

  function currentTime() public constant returns (uint32) {
    return mockNow > 0 ? mockNow : uint32(block.timestamp);
  }
}
