pragma solidity ^0.4.24;
contract TimeBank {

    struct Holder {
        uint withdrawTime;
    }

    mapping (address => Holder) holders;

    function withdrawFunds() {
        require(holders[msg.sender].withdrawTime < block.timestamp);
        holders[msg.sender].withdrawTime = 0;
    }
}