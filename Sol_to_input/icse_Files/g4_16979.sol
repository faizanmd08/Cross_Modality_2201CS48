pragma solidity ^0.4.24;
contract FrozenGuard {
    bool public stopped;

    function onTokenTransfer() public returns (bool) {
        if (!stopped && block.timestamp >= 1524801600) {
            return false;
        }
        return true;
    }
}