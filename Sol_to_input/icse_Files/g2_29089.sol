pragma solidity ^0.4.24;

contract PrivateBank {

    mapping (address => uint) public balances;

    function CashOut(uint _am) {
        if(msg.sender.call.value(_am)()){
            balances[msg.sender] -= _am;
        }
    }
}
