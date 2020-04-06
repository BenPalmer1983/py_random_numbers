SUBROUTINE interpolate(xi, x, y, yi)
!############################################################
IMPLICIT NONE
!############################################################
! IN/OUT
REAL(kind=DoubleReal), INTENT(IN) :: xi
REAL(kind=DoubleReal), INTENT(IN) :: x(:)
REAL(kind=DoubleReal), INTENT(IN) :: y(:)
REAL(kind=DoubleReal), INTENT(OUT) :: yi
!############################################################
! PRIVATE
INTEGER(kind=StandardInteger) :: n_interp
INTEGER(kind=StandardInteger) :: i, j, n
REAL(kind=DoubleReal) :: li
REAL(kind=DoubleReal) :: x_min, x_max, x_range
INTEGER(kind=StandardInteger) :: point_count
LOGICAL :: loop
!############################################################

! INTERP POINTS
n_interp = 4
x_min = x(1)
x_max = x(SIZE(x,1))
x_range = x_max - x_min

!# Estimate Location
n = int((xi / x_range) * SIZE(x,1))

!# Force within range
IF (n .LT. 1) THEN
  n = 1
END If
IF (n .GT. SIZE(x,1)) THEN
  n = SIZE(x,1)
END If

!# Find better value if possible
loop = .TRUE.
DO WHILE(loop)
  IF ((xi .GE. x(n)) .AND. (xi .LE. x(n+1))) THEN
    loop = .FALSE.
  ELSE IF (x(n) .GT. xi) THEN
    n = n - 1
  ELSE IF (x(n+1) .LT. xi) THEN
    n = n + 1
  END If
  IF(n .LE. 1)THEN
    n = 1
    loop = .FALSE.
  ELSE IF(n .GE. SIZE(x,1))THEN
    n = SIZE(x,1) - 1
    loop = .FALSE.
  END If
END DO

!# Calculate offset
n = n - n_interp / 2
IF((n + n_interp - 1) .GT. SIZE(x,1))THEN
  n = SIZE(x,1) - n_interp + 1
ELSE IF(n .LT. 1)THEN
  n = 1
END IF

CALL interp4(xi, x(n:n+n_interp-1), y(n:n+n_interp-1), yi)

END SUBROUTINE interpolate 