pragma solidity >=0.4.0 <0.7.0;

contract BasicBlockchainMessenger{
    
    /*
        Variablen
    */
    
    // fortlaufende ID der Chats
    uint chatCounter = 0;
    
    // Liste mit allen chats
    // Key = fortlaufende (integer) Zahl
    // Value = Chat-Objekt
    mapping (uint => chat) private chats;
    
    /*
        Struktur des Chat-Objekts
    */
    
    //Struktur eines Chats
    struct chat{
        
        // fortlaufendeID für Nachrichten in einem Chat 
        uint messageCounter;
        
        // Liste mit Nachrichten innerhalb eines Chats
        // Key = fortlaufende (integer) Zahl
        // Value = Textnachricht (String)
        mapping (uint => string) messages;
    }
    
    /*
        Funktion um einen Chat zu erstellen
    */
    function createChat() public{
        
        // Neues Chat-Objekt erstellen | messageCounter anfang auf 0 setzen
        chat memory newChat = chat(0);
        
        // erstelltes Chat-Objekt mit dem niedrigsten unbenutzen Key das Chat-Mapping eintragen
        chats[chatCounter] = newChat;
        
        // chatCounter um 1 erhöhen
        chatCounter++;
    }
    
    /*
        Funktion zum erstellen einer Nachricht
    */
    function createMessage(uint givenChatID, string memory message) public{
        
        // Eine Nachricht soll nur verfasst werden können, wenn der entsprechende Chat bereits besteht
        require(givenChatID < chatCounter, "Given Chat Id doesn't exist yet!");
        
        // Nachricht in dem angegebenen Chat an die erste unbenutze Stelle schreiben
        chats[givenChatID].messages[chats[givenChatID].messageCounter] = message;
        
        // messageCounter um 1 erhöhen, sodass die nächste Nachricht die alte nicht überschreibt
        chats[givenChatID].messageCounter++;
    }
    
    /*
        Funktion zum aufrufen der letzten Nachricht eines Chats
    */
    function getMessage(uint givenChatID) public view returns (string memory){
        
        // Es können nur Nachrichten von existierenden Chats gelesen werden
        require(givenChatID < chatCounter, "Given Chat Id doesn't exist yet!");
        
        // Prüfung ob es bereits eine Nachricht in dem angegebenen Chat gibt
        require(chats[givenChatID].messageCounter > 0, "There isn't a message in this chat!");
        
        // Ausgabe der letzten Nachricht des angegebenen Chats 
        return chats[givenChatID].messages[chats[givenChatID].messageCounter - 1];
    }
}
