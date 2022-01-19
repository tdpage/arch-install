#! /bin/bash

echo 'installing pacman packages from list...'
paclist='./config/packages.txt'

pacman -Syu --needed - < ${paclist}

echo 'done installing pacman packages!'
