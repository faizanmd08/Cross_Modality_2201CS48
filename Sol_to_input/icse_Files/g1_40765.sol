pragma solidity ^0.4.24;

contract Victim {
   
    mapping(address => uint) public balances;

    function withdraw(uint _amount) public {
        if(balances[msg.sender] >= _amount) {
            if(msg.sender.call.value(_amount)()) {
                balances[msg.sender] -= _amount;
            }
        }
    }
}
