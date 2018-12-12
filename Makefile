.PHONEY: echo clean build run

TAG=alpine3.8-crystal-0.27.0

echo:
	@ echo "TAG IS" $(TAG)

clean:
	rm -f *~ hello-world basic-server

build:
	docker build --build-arg USER=`whoami` -t sleepyfox/crystal:$(TAG) .

run:
	docker run -it -p 3000:3000 -v `pwd`:/var/app/project sleepyfox/crystal:$(TAG)
