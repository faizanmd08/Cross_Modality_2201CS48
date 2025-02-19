pragma solidity ^0.4.24;
contract Prover {
    address owner;

    modifier onlyOwner {
        require(owner==msg.sender);
        _;
    }

    function Delegate(address addr,bytes data) onlyOwner {
       require(addr.delegatecall(data));
    }
}