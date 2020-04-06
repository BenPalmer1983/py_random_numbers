!#############################################################
!#
!#                      FIT GLOBALS
!#
!#############################################################



!# Gaussian
REAL(kind=DoubleReal) ::                         gaussian(1:1001, 1:2) = 0.0D0
REAL(kind=DoubleReal) ::                         gaussian_sigma = -1.0D0
REAL(kind=DoubleReal) ::                         gaussian_mu = 0.0D0
REAL(kind=DoubleReal) ::                         gaussian_x_min = 0.0D0
REAL(kind=DoubleReal) ::                         gaussian_x_max = 0.0D0

!# Maxwell Boltzmann
REAL(kind=DoubleReal) ::                         maxwell(1:1001, 1:2) = 0.0D0
REAL(kind=DoubleReal) ::                         maxwell_a = -1.0D0
REAL(kind=DoubleReal) ::                         maxwell_x_min = 0.0D0
REAL(kind=DoubleReal) ::                         maxwell_x_max = 0.0D0

