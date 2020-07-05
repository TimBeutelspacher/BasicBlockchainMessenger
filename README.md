# Basic Blockchain Messenger
In diesem Repository liegen zwei Solidity Smart Contracts, mit welchen ein einfacher Messenger Dienst auf der Ethereum Blockchain ermöglicht wird. Zum einen gibt es die Datei Chat.sol. Diese symbolisiert einen Chatraum und ermöglicht das Ausgeben der letzen Nachricht sowie das Schreiben einer neuen Nachricht. Bei jeder Nachricht die in diesem Chat geschrieben wird, wird der Smart Contract Message.sol auf die Blockchain geladen. Dieser enthält die Nachricht, den Autor und die Adresse der vorherigen Nachricht. So sind die Nachrichten untereinander verkettet und man kann die vorherigen Nachrichten alle aufrufen. 

Unter https://github.com/TimBeutelspacher/BlockchainMessenger liegen mehrere Smart Contracts mit denen ein Messenger mit deutlich mehr Funktionen ermöglicht wird. Unteranderem können mehrere Chats erzeugt werden, man kann sich einen Nicknamen setzen usw.
