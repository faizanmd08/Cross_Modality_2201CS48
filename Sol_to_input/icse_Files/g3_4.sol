pragma solidity ^0.4.24;
contract StarmidFreezeTokens {

	function refundTokens(address _to, uint _amount) public returns(bool) {
        require(block.timestamp > 1601510400);
        return true;
    }
}