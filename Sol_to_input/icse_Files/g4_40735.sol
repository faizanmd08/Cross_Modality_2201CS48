pragma solidity ^0.4.24;
contract CollateralManagerState {
    uint[] public borrowRates;
    uint public borrowRatesLastUpdated;

    function updateBorrowRates(uint rate) external {
        borrowRates.push(rate);
        borrowRatesLastUpdated = block.timestamp;
        return;
    }
}
