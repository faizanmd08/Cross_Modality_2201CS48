pragma solidity ^0.4.24;
contract DiceRoll {

    uint64 nextJackpotTime;

    function createWinner() public {
        uint64 tmNow = uint64(block.timestamp);
        require(tmNow >= nextJackpotTime);
    }
}