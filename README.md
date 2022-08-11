# Computer vision boost library

Functions and utilities to speed up data processing in computer vision tasks by using GPUs and C++.

Creating a package:
1. Build docker image depend on platform:
```make build-dgpu-docker-image``` or ```make build-jetson-docker-image-l4t```
2. Compile, create and  publish whl package. ```make build-dgpu-lib``` or ```make build-jetson-lib```