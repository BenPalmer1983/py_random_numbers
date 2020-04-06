SUBROUTINE r_maxwell(x_min, x_max, a, r)
!############################################################
IMPLICIT NONE
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x_min 
REAL(kind=DoubleReal), INTENT(IN) :: x_max 
REAL(kind=DoubleReal), INTENT(IN) :: a
REAL(kind=DoubleReal), INTENT(OUT) :: r
!############################################################
REAL(kind=DoubleReal) :: ra, rb, rc, rd, y
INTEGER(kind=StandardInteger) :: n
LOGICAL :: loop
!############################################################

IF (maxwell_a .LT. 0.0 .OR. a .NE. maxwell_a &
   .OR. x_min .NE. maxwell_x_min .OR. x_max .NE. maxwell_x_max) THEN

  maxwell_a = a
  maxwell_x_min = x_min
  maxwell_x_max = x_max
  
  DO n=1,1001
    maxwell(n,1) = x_min + (n-1) * ((x_max-x_min) / (1000))
    maxwell(n,2) = calc_maxwell(maxwell(n,1), a)
  END DO
END IF


loop = .TRUE.
n = 0
DO WHILE(loop)
  n = n + 1
  CALL RANDOM_NUMBER(ra)
  rb = x_min + ra * (x_max - x_min)
  CALL interpolate(rb, maxwell(:,1), maxwell(:,2), rc)
  CALL RANDOM_NUMBER(rd)
  IF(rd .LE. rc .OR. n .EQ. 100)THEN
    r = rb
    loop = .FALSE.
  END IF
END DO


END SUBROUTINE r_maxwell




FUNCTION calc_maxwell(x, a) RESULT (y)
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x 
REAL(kind=DoubleReal), INTENT(IN) :: a
REAL(kind=DoubleReal) :: y 
!############################################################
y = 0.797884561 * ((x * x * exp((-x**2)/(2*a**2))) / a**3)
END FUNCTION calc_maxwell





SUBROUTINE r_maxwell_1d(x_min, x_max, a, r)
!############################################################
IMPLICIT NONE
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x_min 
REAL(kind=DoubleReal), INTENT(IN) :: x_max 
REAL(kind=DoubleReal), INTENT(IN) :: a
REAL(kind=DoubleReal), INTENT(INOUT) :: r(:)
!############################################################
INTEGER(kind=StandardInteger) :: rn
!############################################################
DO rn=1, SIZE(r, 1)
  CALL r_maxwell(x_min, x_max, a, r(rn))
END DO
END SUBROUTINE r_maxwell_1d