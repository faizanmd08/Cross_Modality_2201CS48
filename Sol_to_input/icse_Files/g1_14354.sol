pragma solidity ^0.4.24;

contract ICOBuyer {

    address public sale;

    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function buy() onlyOwner {
        require(sale.call.value(this.balance)());
    }
}
