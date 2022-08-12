# Savant boost library

Functions and utilities to speed up data processing in computer vision tasks by using GPUs and C++.

Creating a package:
1. Build docker image depend on platform:
```make build-dgpu-builder``` or ```make build-xavier-builder```
2. Compile and create whl package:
```make build-dgpu-lib``` or ```make build-xavier-lib```