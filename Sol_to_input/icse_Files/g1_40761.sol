pragma solidity ^0.4.24;

contract SendBalance {

    mapping (address => uint) userBalances ;
    bool withdrawn = false ;

    function withdrawBalance(){
        if (!(msg.sender.call.value(userBalances[msg.sender])())) { throw; }
        userBalances[msg.sender] = 0;
    }
}
