//SPDX-License-Identifier : MIT

pragma solidity ^0.8.19;

contract MyToken {
    
    string public name = "Mytoken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 _initialSupply){

        totalSupply = _initialSupply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;

    }

    function transfer(address to, uint256 amount) external returns (bool) {

        require(balanceOf[msg.sender] >= amount, 'Insufficient balance');
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;

    }
}