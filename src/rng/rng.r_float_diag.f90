SUBROUTINE r_float_diag(r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(OUT) :: r
!############################################################
CALL RANDOM_NUMBER(r)
r = sqrt(r)
END SUBROUTINE r_float_diag


SUBROUTINE r_float_diag_1d(r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(INOUT) :: r(:)
!############################################################
INTEGER(kind=StandardInteger) :: rn
!############################################################
DO rn=1, SIZE(r, 1)
  CALL r_float_diag(r(rn))
END DO
END SUBROUTINE r_float_diag_1d