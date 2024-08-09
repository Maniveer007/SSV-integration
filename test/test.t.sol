// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "forge-std/console2.sol";
import { SSVNetworkViews } from "../src/SSVNetworkViews.sol";
import { SSVNetwork } from "../src/SSVNetwork.sol";
import { ISSVNetworkCore } from "../src/interfaces/ISSVNetworkCore.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract DemoTest is Test {

    SSVNetworkViews views;
    SSVNetwork network;

    function setUp() public  {
        // setup code here
        network = SSVNetwork( 0xDD9BC35aE942eF0cFa76930954a156B3fF30a4E1 );
        views = SSVNetworkViews( 0xafE830B6Ee262ba11cce5F32fDCd760FFE6a66e4 );
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
        uint operatorEarning = views.getOperatorEarnings(10);
        console2.log("operatorEarning: ", operatorEarning);

        ISSVNetworkCore.Cluster memory cluster = ISSVNetworkCore.Cluster(
            41, // validatorCount
            13895649400, // networkFeeIndex
            13888301440, // index
            true, // active
            104141413051240000000
            ); // balance

        uint64[] memory operatorIds = new uint64[](4);
        operatorIds[0] = 1;
        operatorIds[1] = 2;
        operatorIds[2] = 3;
        operatorIds[3] = 4;

        IERC20 token = IERC20(0x9D65fF81a3c488d585bBfb0Bfe3c7707c7917f54);

        deal(address(token), address(this), 1 ether);

        token.approve(address(network), 1 ether);
        
        network.deposit(
            0x7F91842457e43eE795921E6c23b02Cc98233bB5A,// clusterOwner
            operatorIds, // operatorIds
            1 ether ,// amount
            cluster
        );

        uint64[] memory operatorIds2 = new uint64[](3);
        operatorIds2[0] = 1;
        operatorIds2[1] = 2;
        operatorIds2[2] = 3;


        network.withdraw( operatorIds , 1 ether /10**18 , cluster);


    }

}