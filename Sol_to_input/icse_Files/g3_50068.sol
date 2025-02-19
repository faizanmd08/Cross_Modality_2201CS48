pragma solidity ^0.4.24;
contract Safety {
    address public owner;

    function requireStackDepth(address addr, bytes32 data) {
        require(owner==msg.sender);
        if (data=='') { throw; }
        if (!addr.delegatecall(data)){ throw; }
    }
}