pragma solidity ^0.4.24;
contract EcroContract {
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdrawInvestments() external onlyOwner returns (uint) {
        uint amount = block.timestamp;
        return amount;
    }
}