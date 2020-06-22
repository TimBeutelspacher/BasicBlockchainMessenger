pragma solidity >=0.4.0 <0.7.0;

import "./BasicMessage.sol";

contract Messenger{
    
    mapping(uint => Chat) chats;
    uint chatCounter = 0;
    
    
    struct Chat {
        uint chatID;
        Message[] messages;
    }
    
    function createChat() public {
        Message[] memory messages;
        Chat memory chat = Chat(chatCounter, messages);
        chats[chatCounter] = chat;
        
        chatCounter++;
    }
    
    function createMessage(uint _chatID, string memory _message) public {
        require(_chatID < chatCounter, "The given chatID doesnt exist yet.");
        Message message = new Message(_message, msg.sender);
        chats[_chatID].messages.push(message);
    }
    
    function getLatestMessage(uint _chatID) public view returns(address) {
        require(_chatID < chatCounter, "The given chatID doesnt exist yet.");
        return address(chats[_chatID].messages[chats[_chatID].messages.length-1]);
    }
    
}
