SUBROUTINE seed(n)
!############################################################
IMPLICIT NONE
! IN/OUT
INTEGER(kind=StandardInteger), INTENT(IN) :: n
!############################################################
INTEGER(kind=StandardInteger) :: seed_size = 64
INTEGER(kind=StandardInteger), ALLOCATABLE :: nseed(:)
INTEGER(kind=StandardInteger) :: i
!############################################################

ALLOCATE(nseed(1:seed_size))
DO i=1,seed_size
  nseed(i) = i + seed_size * n
END DO
CALL random_seed(put=nseed)

END SUBROUTINE seed