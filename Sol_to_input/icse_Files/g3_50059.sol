pragma solidity ^0.4.24;
contract AppProxyBase2 {

    function transfer(address addr) public {
        if (msg.value > 0) {
            addr.delegatecall(msg.value);
        } else {
            revert();
        }
    }
}