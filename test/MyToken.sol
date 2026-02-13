//SPDX-License-Identifier : MIT

pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MyToken.sol";

contract MyTokenTest is Test {
    
    MyToken token;
    address alice = makeAddr('alice');

    function setUp() public {
        token = new MyToken(1000);
    }

    function test_initialSupply() public view {
        assertEq(token.totalSupply(), 1000 * 10**18);
    }

    function test_Transfer() public {
        token.transfer(alice, 100 * 10**18);
        assertEq(token.balanceOf(alice), 100 * 10**18);
    }

}