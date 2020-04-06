SUBROUTINE r_int(a, b, y)
!############################################################
IMPLICIT NONE
! IN/OUT
INTEGER(kind=StandardInteger), INTENT(IN) :: a
INTEGER(kind=StandardInteger), INTENT(IN) :: b
INTEGER(kind=StandardInteger), INTENT(OUT) :: y
!############################################################
REAL(kind=DoubleReal) :: r
!############################################################
CALL RANDOM_NUMBER(r)
IF(r .EQ. 0.0D0)THEN
  y = a
ELSE
  y = a + CEILING((b - a) * r)
END IF
END SUBROUTINE r_int


SUBROUTINE r_int_1d(a, b, y)
!############################################################
IMPLICIT NONE
! IN/OUT
INTEGER(kind=StandardInteger), INTENT(IN) :: a
INTEGER(kind=StandardInteger), INTENT(IN) :: b
INTEGER(kind=StandardInteger), INTENT(INOUT) :: y(:)
!############################################################
INTEGER(kind=StandardInteger) :: rn
!############################################################
DO rn=1, SIZE(y, 1)
  CALL r_int(a, b, y(rn))
END DO
END SUBROUTINE r_int_1d

