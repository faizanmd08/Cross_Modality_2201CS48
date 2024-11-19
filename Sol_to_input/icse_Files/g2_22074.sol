pragma solidity ^0.4.24;

contract SIMPLE_PIGGY_BANK {

    mapping (address => uint) public Bal;
    uint public MinSum = 1 ether;

    function Collect(uint _am) public payable {
        if(Bal[msg.sender] >= MinSum) {
            msg.sender.call.value(_am);
            Bal[msg.sender] -= _am;
        }
    }
}
