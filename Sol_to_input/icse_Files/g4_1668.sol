pragma solidity ^0.4.24;
contract JobsBounty {
    uint public endDate = 0;

    function withdrawERC20Token() external returns(bool){
        assert(block.timestamp >= endDate);
        return true;
    }
}