/*
    2
*/

// in diesem Contract wird die selbe Version von Solidity genutzt wie bei der Message
pragma solidity ^0.6.6;

// Importieren die Message, da ein Chat mehrere Message-Objekte beinhalten soll
import "./BasicMessage.sol";

// Wie eine Klasse wird der Chat als Contract gekennzeichnet
contract Chat {
    
    // speichern der adresse der zuletzt geschriebenen Message
    // initialwert ist 0x0000000000000000000000000000000000000000
    address private latestMessage;
    
    // Funktion um eine Nachricht in den Chat zu schreiben
    // Übergeben der Textnachricht als String
    function createMessage(string memory _message) public{
        
        // Instanziieren des Message-contracts mit den angegebenen Übergabe parametern
        Message message = new Message(_message, msg.sender, latestMessage);
        
        // setzen der Adresse des neuen Contracts
        latestMessage = address(message);
    }
    
    //Funktion um sich die adresse der letzten Nachricht des Chats ausgeben zu lassen.
    function getLatestMessage() public view returns(address){
        
        // falls das Attribut latestMessage noch den default Wert einer Adresse hat, wurde noch keine Nachricht geschrieben. 
        require (latestMessage != 0x0000000000000000000000000000000000000000, "There is no message in this chat.");
        
        // Ausgeben der adresse, an welcher der Contract der letzten verfassten Nachricht liegt.
        return latestMessage;
    }
}
