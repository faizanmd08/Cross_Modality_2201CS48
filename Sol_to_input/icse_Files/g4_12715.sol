pragma solidity ^0.4.24;
contract NokuFlatPlan {

    uint256 public nextPaymentTime;
     
    function payFee() public returns(bool paid) {
        require(block.timestamp < nextPaymentTime);
        return true;
    }
}