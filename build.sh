#!/bin/bash

python3 setup.py bdist_wheel
rm -rf _skbuild savantboost.egg-info

if [[ -v "${CI_JOB_TOKEN}" ]]; then
  echo ERROR : CI_JOB_TOKEN environment variable is not set
fi

if [[ -v "${CI_PROJECT_ID}" ]]; then
  echo ERROR : CI_PROJECT_ID environment variable is not set
fi

# TWINE_PASSWORD=${CI_JOB_TOKEN} TWINE_USERNAME=gitlab-ci-token twine upload --verbose --repository-url https://git.bw-sw.com/api/v4/projects/${CI_PROJECT_ID}/packages/pypi dist/*
