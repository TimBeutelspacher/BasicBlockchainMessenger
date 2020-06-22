pragma solidity >=0.4.0 <0.7.0;

import "./BasicMessage.sol";

contract Messenger{
    
    Message[] public messages;
    uint public chatID;
    
    constructor(uint _chatID) public {
        chatID = _chatID;
    }
    
    function createMessage(string memory _message) public {
        
        Message message = new Message(_message, msg.sender);
        messages.push(message);
    }
    
    function getLatestMessage() public view returns(string memory) {
        return messages[messages.length-1].message();
    }
    
}
