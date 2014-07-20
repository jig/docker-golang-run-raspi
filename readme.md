docker-golang-run-raspi
===================

Go language container (golang) that can run "go service scripts" in a Raspberry Pi computer.
Note: it is based on resin/rpi-raspbian (the /etc/service file is missing and golang network tests would fail if a service file woudln't been added. This Dockerfile adds /etc/services from Raspbian)

Softare versions:

- Go 1.3

Run
---

Change `/<user-home-dir>/go` with the absolute path of your src parent directory. 

	$ docker run -v="/<user-home-dir>/go:/go:rw" jordi/golang-raspi

If you edit and save your source files, they will remain on your host after the container has been stopped or killed.

Pull
----

	$ docker pull jordi/golang-raspi

Build
-----

`git clone` this project, cd into it, and:

	$ docker build -t golang-raspi .

