SUBROUTINE r_gaussian(x_min, x_max, mu, sigma, r)
!############################################################
IMPLICIT NONE
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x_min 
REAL(kind=DoubleReal), INTENT(IN) :: x_max 
REAL(kind=DoubleReal), INTENT(IN) :: mu 
REAL(kind=DoubleReal), INTENT(IN) :: sigma 
REAL(kind=DoubleReal), INTENT(OUT) :: r
!############################################################
REAL(kind=DoubleReal) :: ra, rb, rc, rd, y
INTEGER(kind=StandardInteger) :: n
LOGICAL :: loop
!############################################################

IF (gaussian_sigma .LT. 0.0 .OR. mu .NE. gaussian_mu .OR. sigma .NE. gaussian_sigma &
   .OR. x_min .NE. gaussian_x_min .OR. x_max .NE. gaussian_x_max) THEN
  gaussian_mu = mu
  gaussian_sigma = sigma
  gaussian_x_min = x_min
  gaussian_x_max = x_max
  
  DO n=1,1001
    gaussian(n,1) = x_min + (n-1) * ((x_max-x_min) / (1000))
    gaussian(n,2) = calc_gaussian(gaussian(n,1), mu, sigma)
    !print *, gaussian(n,1) , gaussian(n,2) 
  END DO
END IF

loop = .TRUE.
n = 0
DO WHILE(loop)
  n = n + 1
  CALL RANDOM_NUMBER(ra)
  rb = x_min + ra * (x_max - x_min)
  CALL interpolate(rb, gaussian(:,1), gaussian(:,2), rc)
  CALL RANDOM_NUMBER(rd)
  IF(rd .LE. rc .OR. n .EQ. 100)THEN
    r = rb
    loop = .FALSE.
  END IF
  !print *, n, ra, rb, rc, rd
END DO


END SUBROUTINE r_gaussian




FUNCTION calc_gaussian(x, mu, sigma) RESULT (y)
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x 
REAL(kind=DoubleReal), INTENT(IN) :: mu 
REAL(kind=DoubleReal), INTENT(IN) :: sigma 
REAL(kind=DoubleReal) :: y 
!############################################################
y = (1 / (sigma * 2.506628275D0 )) * exp(-0.5D0 * ((x-mu)/sigma)**2)
END FUNCTION calc_gaussian







SUBROUTINE r_gaussian_1d(x_min, x_max, mu, sigma, r)
!############################################################
IMPLICIT NONE
!############################################################
REAL(kind=DoubleReal), INTENT(IN) :: x_min 
REAL(kind=DoubleReal), INTENT(IN) :: x_max 
REAL(kind=DoubleReal), INTENT(IN) :: mu 
REAL(kind=DoubleReal), INTENT(IN) :: sigma 
REAL(kind=DoubleReal), INTENT(INOUT) :: r(:)
!############################################################
INTEGER(kind=StandardInteger) :: rn
!############################################################
DO rn=1, SIZE(r, 1)
  CALL r_gaussian(x_min, x_max, mu, sigma, r(rn))
END DO
END SUBROUTINE r_gaussian_1d