#!/bin/bash

python3 setup.py bdist_wheel
python3 setup.py clean
rm -rf _skbuild savantboost.egg-info
