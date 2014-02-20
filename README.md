GNATprove and external axiomatization
=====================================

The _spark-hi-lite-gpl-2013_ from [AdaCore](http://libre.adacore.com/)
(release date May 24, 2013) does not support _external
axiomatization_, which is required to prove code with formalized
Ada.Numerics.Elementary_Functions. External axiomatization is only
available in the latest GNATprove, which can be downloaded from the
Hi-Lite repository.

To build GNATprove you need a matching GNAT front-end sources, which
unfortunately are not distributed by AdaCore. Below are instructions
for building GNATprove with external axiomatization using the publicly
available source code. The procedure has been tested on Linux x86_64,
but should also work on other platforms. It assumes that all the
source code is extrated into user's home directory.

Requirements
------------

* a working GNAT compiler (GNAT GPL 2013 from AdaCore is recommended)
* OCaml compiler (both the 3.12.x and 4.x.x versions should work)
* standard developer utilities (make, git, etc.)

Getting the source code
=======================

Download the GNATprove repository:

```
git clone https://forge.open-do.org/anonscm/git/spark2014/spark2014.git
```

and checkout a source code that is still relatively compatibile with
the publicly available GNAT front-end but already supports external
axiomatization (ea):

```
git checkout -b ea edd46ad8ff1b22f46aed7934a1817af90dc1766a
```

and apply patches corresponding to the checked-out GNATprove version:

```
git am ~/formal-numerics/edd46ad8ff1b22f46aed7934a1817af90dc1766a/*
```

Download and unpack the GNAT GPL 2013 sources from
[AdaCore](http://libre.adacore.com/).

```
tar zxvf ports/Ada/gnat-gpl-2013-src.tgz
```

and setup a link to them in the GNATprove folder (see
`spark2014/Makefile` for details):

```
cd spark2014/gnat2why/; ln -s ../../gnat-gpl-2013-src/src/ada/ gnat_src
```

Finally, checkout the GNATprove submodules:

```
cd spark2014; git submodule init; git submodule update
```

Compiling
---------

Follow the GNATprove installation procedure (see `spark2014/Makefile`
for details):

```
make setup; make; make stdlib; make install-all
```

Formal theories for SPARK
=========================

Make the [Why3](http://why3.lri.fr/) `.mlw` mathematic theories from
the main branch of this repository accessible to GNATprove:

```
ln -s ~/formal-numerics/theories/*.mlw ~/spark2014/install/share/spark/theories/
```

For the `Ada.Containers.Formal_Vectors` use the Why3 theory from the
`Formal_Vectors` folder of this repository:

```
cp ~/formal-numerics/Formal_Vectors/ada__containers__formal_vectors.mlw ~/spark2014/install/share/spark/theories
```

and the corresponding Ada files (these files are only slightly modifed
versions of the original files):

```
cp ~/formal-numerics/Formal_Vectors/a-cofove.ad? /opt/gnat-gpl-2013-x86_64-pc-linux-gnu-bin/lib/gcc/x86_64-pc-linux-gnu/4.7.4/rts-native/adainclude/
```
