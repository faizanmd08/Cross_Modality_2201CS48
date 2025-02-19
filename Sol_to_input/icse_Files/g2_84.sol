pragma solidity ^0.4.24;
contract Fomo {
    uint256 public airDropTracker_ = 0;

    function airdrop() private view returns(bool) {
        uint256 seed = uint256(keccak256(abi.encodePacked((block.timestamp) / now)));
        if(seed < airDropTracker_)
            return true;
        else
            return false;
    }
}