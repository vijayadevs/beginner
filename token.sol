// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    string public tokenName="Ethereum";
    string public tokenAbbrv="ETH";
    uint256 public totalSupply=10;
    mapping(address => uint256) public balances;

    constructor( uint256 _initialSupply) {
        balances[msg.sender] = _initialSupply;
    }

    function mint(address _receiver, uint256 _amount) public {
        totalSupply += _amount;
        balances[_receiver] += _amount;
    }

    function burn(address _owner, uint256 _amount) public {
        require(balances[_owner] >= _amount, "Insufficient balance");
        totalSupply -= _amount;
        balances[_owner] -= _amount;
    }
}
