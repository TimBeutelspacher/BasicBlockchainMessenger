pragma solidity ^0.6.6;

import "./BasicMessage.sol";

contract Chat {
    
    address private latestMessage = 0x0000000000000000000000000000000000000000;
    
    //Funktion um eine Nachricht in den Chat zu schreiben
    function createMessage(string memory _message) public{
        Message message = new Message(_message, msg.sender, latestMessage);
        latestMessage = address(message);
    }
    
    //Funktion um sich die letzte Nachricht eines Chats ausgeben zu lassen.
    function getLatestMessage() public view returns(address){
        require (latestMessage != 0x0000000000000000000000000000000000000000, "There is no message in this chat.");
        return latestMessage;
    }
}
