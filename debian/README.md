Image based on Debian Official Docker Repository.

VERSION=11-(bullseye)
NAME=mig:debian11

Image Layers :
1.  Add default user itmig with uid 1000
2.  Create home folder for user itmig
3.  Installed packages:
    - apt-transport-https
    - wget
    - curl
    - ca-certificates