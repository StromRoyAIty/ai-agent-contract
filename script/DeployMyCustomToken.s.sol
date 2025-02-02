// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {AIAGENTToken} from "../src/AIAgentToken.sol";

contract DeployMyCustomToken is Script {

    uint256 public constant INITIAL_SUPPLY = 1000000;

    function run() external {
        vm.startBroadcast();
        new AIAGENTToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}


