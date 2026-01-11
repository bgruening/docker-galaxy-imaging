[![Docker Repository on Quay](https://quay.io/repository/bgruening/galaxy-imaging/status "Docker Repository on Quay")](https://quay.io/repository/bgruening/galaxy-imaging)
[![CI](https://github.com/bgruening/docker-galaxy-imaging/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/bgruening/docker-galaxy-imaging/actions/workflows/ci.yml)
[![Gitter](https://badges.gitter.im/bgruening/docker-galaxy-stable.svg)](https://gitter.im/bgruening/docker-galaxy-stable?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Galaxy Workbench for Image Analysis (Galaxy Imaging flavour)
============================================================

Galaxy instance with tools for Image analyses shipped in a Docker container. :whale:


Usage
=====

At first you need to install docker. Please follow the instruction on https://docs.docker.com/installation/

After the successful installation, all what you need to do is:

```bash
docker run --rm -i -t --privileged -p 8080:80 bgruening/galaxy-imaging
```

I will shortly explain the meaning of all the parameters. For a more detailed describtion please consult
the [docker manual](http://docs.docker.io/), it's really worth reading.

Let's start: ``docker run`` will run the Image/Container for you.
In case you do not have the Container stored locally, docker will download it for you. ``-p 8080:80``
will make the port 80 (inside of the container) available on port 8080 on your host.
Inside the container a Apache Webserver is running on port 80 and that port can be bound to a
local port on your host computer. With this parameter you can access your Galaxy instance via ``http://localhost:8080``
immediately after executing the command above. ``bgruening/galaxy-imaging`` is the Image/Container name,
that directs docker to the correct path in the [docker registry](https://quay.io/repository/bgruening/galaxy-imaging).
 For an interactive session, you can execute:

``docker run --rm -i -t --privileged -p 8080:80 bgruening/galaxy-imaging bash``

and run the ``` startup ``` script by your own, to start PostgreSQL, Apache and Galaxy.

Docker images are "read-only", all your changes inside one session will be lost after restart. This mode is usefull to present Galaxy to your collegues or to run workshops with it. To install Tool Shed respositories or to save your data you need to export the calculated data to the host computer.

Fortunately, this is as easy as:

``docker run --rm -i -t --privileged -p 8080:80 -v /home/user/galaxy_storage/:/export/ bgruening/galaxy-imaging``

With the additional ``-v /home/user/galaxy_storage/:/export/`` parameter, docker will mount the folder ``/home/user/galaxy_storage`` into the Container under ``/export/``. A ``startup.sh`` script, that is usually starting Apache, PostgreSQL and Galaxy, will recognise the export directory with one of the following outcomes:

  - In case of an empty ``/export/`` directory, it will move the [PostgreSQL](http://www.postgresql.org/) database, the Galaxy database directory, Shed Tools and Tool Dependencies and various config scripts to /export/ and symlink back to the original location.
  - In case of a non-empty ``/export/``, for example if you continue a previouse session within the same folder, nothing will be moved, but the symlinks will be created.

This enables you to have different export folders for different sessions - means real separation of your different projects.


Enabling Interactive Environments in Galaxy
-------------------------------------------

Interactive Environments (IE) are sophisticated ways to extend Galaxy with powerful services, like IPython, in a secure and reproducible way.
For this we need to be able to launch Docker containers inside our Galaxy Docker container.

``docker run -d -p 8080:80 -p 8021:21 -p 8800:8800 --privileged -v /home/user/galaxy_storage/:/export/ bgruening/galaxy-imaging``

The port 8800 is the proxy port that is used to handle Interactive Environments. ``--privileged`` is needed to start docker containers inside docker.


Using Parent docker
-------------------

On some linux distributions, Docker-In-Docker can run into issues (such as running out of loopback interfaces). If this is an issue,
you can use a 'legacy' mode that use a docker socket for the parent docker installation mounted inside the container. To engage, set the
environmental variable DOCKER_PARENT

``docker run -d -p 8080:80 -p 8021:21 -p 8800:8800 --privileged=true -e DOCKER_PARENT=True -v /var/run/docker.sock:/var/run/docker.sock -v /home/user/galaxy_storage/:/export/ bgruening/galaxy-imaging``



Users & Passwords
================

The Galaxy Admin User has the username ``admin@galaxy.org`` and the password ``admin``.
The PostgreSQL username is ``galaxy``, the password is ``galaxy`` and the database name is ``galaxy`` (I know I was really creative ;)).
If you want to create new users, please make sure to use the ``/export/`` volume. Otherwise your user will be removed after your docker session is finished.


Requirements
============

- [docker](https://docs.docker.com/installation/)


Contributers
============

 - Greg von Kuster
 - Bjoern Gruening
 - Thomas Wollmann


Support & Bug Reports
=====================

For support, questions, or feature requests please see https://github.com/bgruening/galaxy-imaging/issues.

