pragma solidity ^0.4.24;

contract PreSaleFund {

    address owner = msg.sender;

    function loggedTransfer(uint amount, address target) payable {
       if(msg.sender != address(this)) throw;
       if(!target.call.value(amount)()) { throw; }
    }
}
