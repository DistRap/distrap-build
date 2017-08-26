An umbrella repository which organizes all of the submodules
for the Distrap project and provides development environment.


Requires
--------

- stack https://docs.haskellstack.org/en/stable/README/
- arm-none-eabi-newlib
- arm-none-eabi-gcc

Fedora::

  dnf install arm-none-eabi-gcc-cs arm-none-eabi-newlib

Building
--------

To build all images::

        git clone --recursive https://github.com/distrap/distrap-build
        cd distrap-build
        make
