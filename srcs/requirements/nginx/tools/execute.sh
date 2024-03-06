#!/bin/bash

sudo docker build ../. -t nginx
sudo docker run -it nginx