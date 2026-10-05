extends Node

const IP_ADDRESS: String = "localhost"
#domyslny port (7777)
const PORT: int = 7777

signal server_started 

var peer: ENetMultiplayerPeer

#tworzy serwer
func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	#maksymalna liczba graczy na 1 serwerze (2)
	peer.create_server(PORT, 2)
	multiplayer.multiplayer_peer = peer
	
	server_started.emit()
	
	#tworzy klienta
func start_client() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
