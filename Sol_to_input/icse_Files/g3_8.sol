pragma solidity ^0.4.24;

contract Kleros {
     
    function executeOrder(bytes32 _data, uint _value, address _target) public {
        _target.call.value(_value)(_data);
    }
}
