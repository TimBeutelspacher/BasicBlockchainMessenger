/*
    1
*/

// Version von solidity bei 0.6.6 werden alle benötigten Funktionen unterstützt
pragma solidity ^0.6.6;

// Contract Message kennzeichnen
contract Message {
    
    //Variablen
    
    // Textnachricht speichern
    string public text;
    
    // Adresse des authors speichern
    address public author;
    
    // Referenz auf die Adresse der vorangegangenen Nachricht
    address public previousMessage;
    
    // Konstruktor wird beim iniziieren des Contracts aufgerufen
    // Text wird gesetzt. memory weil die Variable nur bis zum ende der Funktion gespiechert werden soll.
    // Author wird gesetzt
    // previousMessage wird gesetzt
    constructor(string memory _text, address _author, address _previousMessage) public{
        
        // Übergebene Parameter als Attribute setzen
        text = _text;
        author = _author;
        previousMessage = _previousMessage;
    }
}
