// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ICO is Ownable,ERC20{
    constructor() ERC20("Venky","Vk") Ownable(msg.sender){
        _mint(msg.sender,100000);
    }

    //Create Total Tokens
    function mint(address account,uint256 amount) public onlyOwner returns(bool){
        require(account !=address(this) && account !=(msg.sender) && amount !=uint256(0),"ERC20: function is having Invalid Input");
        _mint(account,amount);
        return true;
    }

    //Burn or Destroy the Token Supply

    function burn(address account,uint256 amount) public onlyOwner returns (bool){
        require(account !=address(this) && account !=(msg.sender) && amount !=uint256(0),"ERC20: function is having Invalid Input");
        _burn(account,amount);
        return true;
    }

    // withdraw Tokens from the Smart Contract

    function withdraw(uint256 amount) public onlyOwner returns (bool){
        require(amount <=balanceOf(address(this)),"Insufficient Balance");
        payable(_msgSender()).transfer( amount);
        return true;
    }
}