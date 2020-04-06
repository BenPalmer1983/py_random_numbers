SUBROUTINE rand_seed()
!############################################################
IMPLICIT NONE
!############################################################
INTEGER(kind=StandardInteger) :: put(1:64)
INTEGER(kind=StandardInteger) :: n, clock
!############################################################
DO n=1,64
  CALL SYSTEM_CLOCK(COUNT=clock)
  put(n) = lcg(n + clock)
END DO
CALL RANDOM_SEED(put=put)
END SUBROUTINE rand_seed


FUNCTION lcg(seed_in)
INTEGER(kind=StandardInteger), OPTIONAL :: seed_in
INTEGER(kind=StandardInteger) :: seed = 104729
INTEGER(kind=StandardInteger) :: lcg
INTEGER(kind=LongInteger) :: m = 4294967296_LongInteger
INTEGER(kind=LongInteger) :: a = 1103515245_LongInteger
INTEGER(kind=LongInteger) :: c = 12345_LongInteger
IF (PRESENT(seed_in)) then
  seed = seed_in
END IF
lcg = mod((a*seed+c), m)
END FUNCTION lcg

