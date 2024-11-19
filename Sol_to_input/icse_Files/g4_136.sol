pragma solidity ^0.4.24;
contract HorseyPilot {
    struct Proposal{
        uint256 timestamp;
    }
    Proposal public currentProposal;
    uint256 constant proposalLife = 7 days;

    function voteOnProposal(bool voteFor) external {
        require((block.timestamp - currentProposal.timestamp) <= proposalLife);
    }
}