pragma solidity ^0.4.24;

contract HiroyukiCoinDark {

    mapping(address => uint256) public balanceOf;

    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        assert(msg.sender.call.value(0)());
        return true;
    }
}
