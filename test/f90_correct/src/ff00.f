** Copyright (c) 1989, NVIDIA CORPORATION.  All rights reserved.
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.

*   Intrinsic/generic names used for other types of symbols.

	program int
	call ifix(2.6)
	end

	
	subroutine ifix(ccos)

	parameter(ichar = 14)
	common /ccos/ rslts(ichar)
	integer expect(ichar), rslts

	common /x/ index, amin0

	rslts(1) = 2 * ccos
	sin = 3.5
	rslts(2) = sin * sin
	call set7(dsin)
	rslts(3) = dsin

	goto 20
10	rslts(4) = cos
	goto 30
20	cos = 2.1
	goto 10
30	continue

	call t5_9(min)
	cexp = 3.5
	rslts(10) = cexp * cexp
	rslts(11) = min
	call dfloat(9)
	rslts(13) = index
	rslts(14) = amin0 * amin0

c --- check results:

	call check(rslts, expect, ichar)
	data expect / 5, 12, 7, 2,
     +                12, 3, 12, 7, 1,
     +                12, 8, 9, 2, 12          /
	end

	
	subroutine set7(max)
	real max
	max = 7
	end


	function ichar()
	ichar = 3
	end


	subroutine t5_9(ccos)
	implicit integer (r, c)
	parameter(csin = 14)
	common /ccos/ rslts(csin)

	external ichar
	real csqrt
	real iabs(2)
	common /x/ idim, dim

	csqrt = 3.5
	rslts(5) = csqrt * csqrt
	rslts(6) = ichar()
	iabs(1) = 3.5
	rslts(7) = iabs(1) * iabs(1)
	rslts(8) = abs(-7)
	ccos = 8
	idim = 2
	dim = 3.5

	data isign / 1 /
	rslts(9) = isign
	return

	entry dfloat(idint)
	rslts(12) = idint
	end
