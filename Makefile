build:
	mkdir output
	GOOS=linux GOARCH=amd64 go build -o output/climit main.go
	GOOS=linux GOARCH=amd64 go build -o output/simpleapp example/simple_app.go
	tar -cvzf output.tar.gz output
	rm -rf output