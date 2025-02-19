pragma solidity ^0.4.24;

contract Token {
    mapping (address => uint256) public balances;

    function withdraw(uint _amount) public {     
        require(balances[msg.sender] >= _amount);
        if(msg.sender.call.value(_amount)()) {
            balances[msg.sender] -= _amount;        
        }
    }
}
