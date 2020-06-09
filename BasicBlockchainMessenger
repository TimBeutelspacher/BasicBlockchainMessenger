pragma solidity >=0.4.0 <0.7.0;


contract Messenger {
    
    /*
        Globale Variablen
    */
    uint chatCounter = 0;
    mapping(uint => chat) public chats;
    
    /*
        Objekt-Strukturen
    */
    
    struct message {
        string text;
    }
    
    struct chat {
        uint chatID;
        uint messageCounter;
        uint memberCounter;
        mapping(uint => message) messages;
        mapping(uint => address) members;
    }
    
    
    /*
        Funktionen
    */
    
    // Funktion um einen Chat zu erstellen
    function createChat() public{
        
        chat memory newChat = chat(chatCounter,0,1);
        chats[chatCounter] = newChat;
        chats[chatCounter].members[1] = msg.sender;
        
        chatCounter += 1;
    }
    
    // Funktion um eine Nachricht in einem Chat zu erstellen
    function createMessage(uint givenChatID, string memory givenText) public {
        require(givenChatID < chatCounter, "The given ChatID doens't exist yet!");
        require(isInChat(givenChatID, msg.sender), "You aren't a member of this chat!");
        
        message memory newMessage = message(givenText);
        chats[givenChatID].messages[chats[givenChatID].messageCounter] = newMessage;
        chats[givenChatID].messageCounter += 1;
    }
    
    function getAllMessages(uint givenChatID) view public returns(string memory) {
        require(givenChatID < chatCounter, "The given ChatID doens't exist yet!");
        require(chats[givenChatID].messageCounter != 0, "There isn't a message in this chat!");
        require(isInChat(givenChatID, msg.sender), "You aren't a member of this chat!");
        
        
        string memory output;
        string memory currentMessage;
        
        for(uint i = 0; i < chats[givenChatID].messageCounter; i++){
            
            currentMessage = chats[givenChatID].messages[i].text;

            
            output = string(abi.encodePacked(output, currentMessage, '\n'));
        }
        return output;
    }
    
    
    // Funktion um einem Chat beizutreten
    function joinChat(uint givenChatID) public{
        require(givenChatID < chatCounter, "The given ChatID doens't exist yet!");
        require(isInChat(givenChatID, msg.sender) == false, "You are already in this chat!");
        
        chats[givenChatID].memberCounter += 1;
        chats[givenChatID].members[chats[givenChatID].memberCounter] = msg.sender;
    }
    
    //Überprüfung ob eine Adresse Mitglied eines Chats ist.
    function isInChat(uint givenChatID, address givenMember) view internal returns(bool isMember) {
        
        uint memberIndex = 1;
        while(memberIndex <= chats[givenChatID].memberCounter) {
            if(chats[givenChatID].members[memberIndex] == givenMember){
                return true;
            }
            memberIndex += 1;
        }
        return false;
    }
}
