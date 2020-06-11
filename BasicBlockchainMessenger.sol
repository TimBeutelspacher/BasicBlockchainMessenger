pragma solidity >=0.4.0 <0.7.0;

contract BasicBlockchainMessenger{
    
    //Variablen
    uint chatCounter = 0;
    mapping (uint => chat) private chats;
    
    //Struktur eines Chats
    struct chat{
        uint messageCounter;
        mapping (uint => string) messages;
    }
    
    //Funktion um einen Chat zu erstellen
    function createChat() public{
        chat memory newChat = chat(0);
        chats[chatCounter] = newChat;
        chatCounter++;
    }
    
    //Funktion zum erstellen einer Nachricht
    function createMessage(uint givenChatID, string memory message) public{
        require(givenChatID < chatCounter, "Given Chat Id doesn't exist yet!");
        chats[givenChatID].messages[chats[givenChatID].messageCounter] = message;
        chats[givenChatID].messageCounter++;
    }
    
    //Funktion zum aufrufen der letzten Nachricht eines Chats
    function getMessage(uint givenChatID) public view returns (string memory){
        require(givenChatID < chatCounter, "Given Chat Id doesn't exist yet!");
        require(chats[givenChatID].messageCounter > 0, "There isn't a message in this chat!");
        return chats[givenChatID].messages[chats[givenChatID].messageCounter - 1];
    }
}
