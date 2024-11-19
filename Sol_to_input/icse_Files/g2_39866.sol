pragma solidity ^0.4.24;

contract NinjaToken {

    mapping(address=>string) public commit;
    mapping(address=>uint) public balances;
    address public fundingAccount;

    function buy(string _commit) payable {
        if(!fundingAccount.call.value(msg.value)()) throw;
        balances[fundingAccount] -= msg.value;
    }
}
