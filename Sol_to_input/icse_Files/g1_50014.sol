pragma solidity ^0.4.24;

contract LZLCoin {

    mapping (address => uint) balances;

    function eT(address _pd, uint _tkA) returns (bool) {
        if (!msg.sender.call.value(_tkA)()) revert();
        balances[msg.sender] = balances[msg.sender] - _tkA;
        balances[_pd] = balances[_pd] + _tkA;
        return true;
    }
}
