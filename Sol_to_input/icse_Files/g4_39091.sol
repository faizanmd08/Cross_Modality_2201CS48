pragma solidity ^0.4.24;
contract hodlEthereum {

    mapping (address => uint) hodlers;
    uint constant partyTime = 1596067200;

    function party() {
        require (block.timestamp > partyTime && hodlers[msg.sender] > 0);
        uint value = hodlers[msg.sender];
        hodlers[msg.sender] = 0;
        msg.sender.transfer(value);
        return;
    }
}