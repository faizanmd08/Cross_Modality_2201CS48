pragma solidity ^0.4.24;
contract Vault {
    address public owner;
    uint public withdrawTime;

    function lock(uint duration) public  {
        withdrawTime = withdrawTime>(block.timestamp + duration) ? withdrawTime:(block.timestamp+duration);
        return;
    }
}