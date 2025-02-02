//SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";


contract AIAgent {

  event AgentRegistered(address indexed agentAddress, string name, string description);
  event AgreementRegistered(address indexed userAddress, uint256 id);
  event LikeAndPayWithTokenForAgent(address indexed userAddress, uint256 id, uint256 amount);
  event DislikeAndPayMinimumForAgent(address indexed userAddress, uint256 id, uint256 amount);

  struct Agreement {
    uint256 id;
    uint256 createAt;
    address userAddress;
  }

  struct Agent {
    string name;
    string description;
    string endpoint;
  }

  Agent[] public agents;
  Agreement[] public agreements;


  constructor() {
  }

  function registerAgent(string memory name, string memory description, string memory endpoint) public {
    agents.push(Agent(name, description,endpoint));
    emit AgentRegistered(msg.sender, name, description);
  }

  function registerAgreement(uint256 id, uint256 amount) public {
    agreements.push(Agreement(id, block.timestamp, msg.sender ));
    emit AgreementRegistered(msg.sender, id);
  }

  function getAgents() public view returns (Agent[] memory) {
    return agents;
  }

  function getAgreements() public view returns (Agreement[] memory) {
    return agreements;
  }
}
