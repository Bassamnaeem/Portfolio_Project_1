// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Token_2 {
address owner;

//Token 2 "Sam"
 string public name = "Sam"; 
 string public symbol = "SM"; 
 uint public totalSupply = 10**8; 
 uint256 public decimals; 
 
    event Transfer(address indexed recipient, address indexed to, uint amount);
    mapping(address=>uint) private balances; 
//Constructor
    constructor() { 
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
        decimals = 8;
    } 
    modifier onlyOwner() {
        require(msg.sender == owner,"You are not the Owner"); 
        _;
    }
//Checking Balance Function
    function balanceOf(address user) public view returns(uint){
        return balances[user];
    }
//Token Transfer Function
    function transfer(address reciever, uint amount) public returns(bool){
        require(balances[msg.sender] >= amount,"You do not have enough tokens to transfer"); 
        balances[msg.sender] -= amount; 
        balances[reciever] += amount; 
        
//Event Trigger
        emit Transfer(msg.sender,reciever,amount); 
        return true;
    }

}
