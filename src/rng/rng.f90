!#############################################################
!#  HOW TO USE:
!#
!#
!# interp.interp4(x, x_points, y_points, y)
!# interp.interp4dydx(x, x_points, y_points, y)
!#
!#
!# 
!# 
!#
!#
!#
!#
!#############################################################

MODULE rng

USE kinds

IMPLICIT NONE

INCLUDE "rng.globals.f90"
INCLUDE "rng.interfaces.f90"

CONTAINS

INCLUDE "rng.seed.f90"
INCLUDE "rng.rand_seed.f90"

INCLUDE "rng.r_float.f90"
INCLUDE "rng.r_float_diag.f90"
INCLUDE "rng.r_int.f90"
INCLUDE "rng.r_gaussian.f90"
INCLUDE "rng.r_maxwell.f90"

INCLUDE "rng.interp.f90"
INCLUDE "rng.interp4.f90"



INCLUDE "rng.tally.f90"

END MODULE rng