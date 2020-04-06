SUBROUTINE r_float(r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(OUT) :: r
!############################################################
CALL RANDOM_NUMBER(r)
END SUBROUTINE r_float


SUBROUTINE r_float_1d(r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(INOUT) :: r(:)
!############################################################
CALL RANDOM_NUMBER(r)
END SUBROUTINE r_float_1d

SUBROUTINE r_float_ab(a, b, r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(IN) :: a
REAL(kind=DoubleReal), INTENT(IN) :: b
REAL(kind=DoubleReal), INTENT(OUT) :: r
!############################################################
CALL RANDOM_NUMBER(r)
r = a + r * (b - a)
END SUBROUTINE r_float_ab


SUBROUTINE r_float_ab_1d(a, b, r)
!############################################################
IMPLICIT NONE
! IN/OUT
REAL(kind=DoubleReal), INTENT(IN) :: a
REAL(kind=DoubleReal), INTENT(IN) :: b
REAL(kind=DoubleReal), INTENT(INOUT) :: r(:)
!############################################################
CALL RANDOM_NUMBER(r)
r(:) = a + r(:) * (b - a)
END SUBROUTINE r_float_ab_1d