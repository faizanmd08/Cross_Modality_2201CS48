pragma solidity ^0.4.24;
contract tokenHodl {
    mapping (address => uint) public hodlers;

    function party() {
        uint value = hodlers[msg.sender];
        hodlers[msg.sender] = 0;
        msg.sender.transfer(value);
    }
}