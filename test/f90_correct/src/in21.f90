!
! Copyright (c) 2000, NVIDIA CORPORATION.  All rights reserved.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
! test f2008 bessel_jn intrinsic

program p 
 use ISO_C_BINDING
 use check_mod

  interface
    subroutine get_expected_f( src1, expct, order, n ) bind(C)
     use ISO_C_BINDING
      type(C_PTR), value :: src1
      type(C_PTR), value :: expct
      integer(C_INT), value :: order
      integer(C_INT), value :: n
    end subroutine
    
    subroutine get_expected_d( src1, expct, order, n ) bind(C)
     use ISO_C_BINDING
      type(C_PTR), value :: src1
      type(C_PTR), value :: expct
      integer(C_INT), value :: order
      integer(C_INT), value :: n
    end subroutine
  end interface
    

  integer, parameter :: N=22
  real*4, target,  dimension(N) :: r_src1
  real*4, target,  dimension(N) :: r_rslt
  real*4, target,  dimension(N) :: r_expct
  real*4 :: valuer
  
  real*8, target,  dimension(N) :: d_src1
  real*8, target,  dimension(N) :: d_rslt
  real*8, target,  dimension(N) :: d_expct
  real*8 :: value8
  integer :: order = 3
  
  valuer = -.2
  valued = -.2_8
  do i =  0,N-1 
    r_src1(i+1) = valuer + i
    d_src1(i+1) = valued + i
  enddo

  r_rslt = bessel_jn(3, r_src1)
  d_rslt = bessel_jn(order, d_src1)

  call get_expected_f(C_LOC(r_src1), C_LOC(r_expct), order, N)
  call get_expected_d(C_LOC(d_src1), C_LOC(d_expct), order, N)

  call checkr4( r_rslt, r_expct, N, rtoler=0.0000003)
  call checkr8( d_rslt, d_expct, N, rtoler=0.0000003_8)

!   print *, "r_expct:" 
!   print *, r_expct
!   print *, "r_rslt:" 
!   print *, r_rslt
!
!   print *, "d_expct:" 
!   print *, d_expct
!   print *, "d_rslt:" 
!   print *, d_rslt
end program 
