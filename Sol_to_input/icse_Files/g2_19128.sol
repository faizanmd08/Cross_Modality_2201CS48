pragma solidity ^0.4.24;

contract HODLWallet {

    mapping(address => uint256) public balances;

    function doWithdraw(address from,  uint256 amount) internal {
        require(balances[from] >= amount);
        balances[from] = balances[from] - amount;
        from.call.value(amount)();
    }
}
