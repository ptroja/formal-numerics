formal-numerics
===============

Ada/SPARK formal numerics package.

Instructions for building a GNATprove with support for _external
axiomatization_ are in the
[gnatprove](https://github.com/ptroja/formal-numerics/tree/gnatprove/)
branch. Hopefully they should be obsoleted by the next release of the
GNATprove.

TODO
====

The GNAT GPL 2013 compiler handles subrange predicates of
floating-point types incorrectly. Thus, there is no run-time check for
`Positive_Float` type and others. Thus has been already fixed by
AdaCore and such predicates will be added once a new compiler is
released.
