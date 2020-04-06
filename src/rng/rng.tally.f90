SUBROUTINE tally(r, bins, r_min, r_max, t)
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: r(:)
INTEGER(kind=StandardInteger), INTENT(IN) :: bins
REAL(kind=DoubleReal), INTENT(IN) :: r_min
REAL(kind=DoubleReal), INTENT(IN) :: r_max
INTEGER(kind=StandardInteger), INTENT(OUT) :: t(1:bins)
!############################################################
INTEGER(kind=StandardInteger) :: n, rn
!############################################################
t = 0
DO n=1,SIZE(r,1)
  IF(r(n) .LE. r_min)THEN
    rn = 1
  ELSE IF(r(n) .GE. r_max)THEN
    rn = bins
  ELSE
    rn = CEILING(bins * ((r(n) - r_min) / (r_max - r_min)))
  END IF
  t(rn) = t(rn) + 1
END DO

END SUBROUTINE tally
