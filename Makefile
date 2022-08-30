init:
	make *.bin
#este graba en el raíz
#Se observar en -v que el mapeamiento va desde el / al /sources de la imagen
#Así, cuando el compilador que se ejecuta en la imagen crea que compila hacia /soruces, en realidad estará compilando a / del host.
%.bin: %.sol
	docker run -e PUID=1000 -e PGID=1000 -v $(shell pwd)/:/sources ethereum/solc:stable -o /sources --abi --bin /sources/$< --overwrite


build:
	docker run -e PUID=1000 -e PGID=1000 -v $(shell pwd)/sources:/sources ethereum/solc:stable -o /sources/output --abi --bin /sources/contract.sol --overwrite

json: 
	docker run -e PUID=1000 -e PGID=1000  ethereum/solc:stable --standard-json < input.json > output.json


