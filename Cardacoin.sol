// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.7.0;

// Cardacoin
// Card 'a' coin
// A simple coin which stores gives each receiver a Card (token) that their name and their number of contacts
// Only the creator of the contract will be able to issue new tokens
// A person can introduce themselves to another person. When they do that, both person's number of contacts increases by one

contract Cardacoin {
	mapping (address => uint) public contactsList;
	mapping (address => string) public nameList;
	address public creator;

    event introductionComplete(address _sender, address _recipient, uint _senderContacts, uint _recipientContacts);

	constructor() public {
		creator = msg.sender;
	}

	function makeCard(address _recipient, string memory _name, uint _contacts) public {
		require(msg.sender == creator, "You are not the creator. You cannot create the cards...");
		contactsList[_recipient] = _contacts;
		nameList[_recipient] = _name;
	}

    function introduceYourself(address _recipient) public {
        contactsList[msg.sender] = contactsList[msg.sender] + 1;
        contactsList[_recipient] = contactsList[_recipient] + 1;
        emit introductionComplete(msg.sender, _recipient, contactsList[msg.sender], contactsList[_recipient]);
    }
}