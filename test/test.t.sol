// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "forge-std/console2.sol";
import { SSVNetworkViews } from "../src/SSVNetworkViews.sol";
import { SSVNetwork } from "../src/SSVNetwork.sol";

contract DemoTest is Test {

    SSVNetworkViews views;
    SSVNetwork network;

    function setUp() public  {
        // setup code here
        network = SSVNetwork( 0xDD9BC35aE942eF0cFa76930954a156B3fF30a4E1 );
        views = SSVNetworkViews( 0x052E5F6bD9DB71C08Db38377596875ceC5708a94 );
    }

    function test_console() public {
        console2.log(block.number);
        console2.log("Hello, World!");
        (address owner, uint256 Fee , uint32 validatorcount, address whitelisted_address, bool isprivate, bool active) = views.getOperatorById(10);
        console2.log("owner: ", owner);
        console2.log("Fee: ", Fee);
        console2.log("validatorcount: ", validatorcount);
        console2.log("whitelisted_address: ", whitelisted_address);
        console2.log("isprivate: ", isprivate);
        console2.log("active: ", active);

    }

}