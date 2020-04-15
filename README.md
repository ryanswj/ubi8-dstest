# Overview

This repo refers to the hardened version of RedHat Universal Base Image (UBI) version 8. DISA STIG's are
applied to this image and provided as a base image to be used by other applications. A list of all the 
currently implemented STIG's may be found in the scripts folder.

# Version

This build will always pull the latest UBI 8 image from `access.registry.redhat.com`. Every effort is made
to ensure that this image is rebuilt when a new UBI8 image is released from RedHat. The latest version, 
and more information can be found on RedHat's website located [here](https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/ubi8).

# Architecture

Currently, this build is only for `AMD64` architectures.