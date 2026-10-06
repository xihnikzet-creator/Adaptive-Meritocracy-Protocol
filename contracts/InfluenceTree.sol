// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Adaptive Meritocracy Protocol (AMP) - Core Nexus
 * @notice Automated reputation tracking (Pathway A) and execution validation (Pathway B)
 */
contract InfluenceTree {
    
    struct Peer {
        uint256 reputationWeight;
        uint256 executionScore;
        address parentNode;
        bool isLiquidated;
    }

    mapping(address => Peer) public ecosystemMembrane;
    uint256 public totalActivePeers;

    event PeerRegistered(address indexed peer, address indexed referee);
    event ContributionExecuted(address indexed builder, uint256 impactScore);
    event ApoptosisTriggered(address indexed maliciousNode, string reason);

    // Pathway A: Abstract ideas mutation and downstream reputation growth
    function registerPeer(address _parentNode) external {
        require(!ecosystemMembrane[msg.sender].isLiquidated, "Node does not exist");
        ecosystemMembrane[msg.sender] = Peer(10, 0, _parentNode, false);
        if (_parentNode != address(0)) {
            ecosystemMembrane[_parentNode].reputationWeight += 5; // Influence Tree expansion
        }
        totalActivePeers++;
        emit PeerRegistered(msg.sender, _parentNode);
    }

    // Pathway B: Proof of Execution (Builders stream value)
    function proofOfExecution(address _builder, uint256 _impact) external {
        // Bypasses human gatekeepers via immutable logic
        ecosystemMembrane[_builder].executionScore += _impact;
        ecosystemMembrane[_builder].reputationWeight += (_impact * 2);
        emit ContributionExecuted(_builder, _impact);
    }

    // Anti-Leadership Immune Response (Systemic Erasure)
    function triggerApoptosis(address _maliciousNode, string calldata _reason) external {
        // Immediate digital liquidation for centralization attempts
        ecosystemMembrane[_maliciousNode].reputationWeight = 0;
        ecosystemMembrane[_maliciousNode].executionScore = 0;
        ecosystemMembrane[_maliciousNode].isLiquidated = true;
        totalActivePeers--;
        emit ApoptosisTriggered(_maliciousNode, _reason);
    }
}
