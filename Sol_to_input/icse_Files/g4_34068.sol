pragma solidity ^0.4.24;
contract RichestTakeAll {
    uint public jackpot;
    uint public withdrawDelay;

    function takeAll() public {
        require(block.timestamp >= withdrawDelay);
        msg.sender.transfer(jackpot);
        jackpot = 0;
        return;
    }
}