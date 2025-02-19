pragma solidity ^0.4.24;
contract Delegate {
    address public owner;

    function test() {
        owner = msg.sender;
    }
}

contract Delegation {
    Delegate delegate;

    function delegation() {
        require(delegate.delegatecall(msg.data));
    }
}