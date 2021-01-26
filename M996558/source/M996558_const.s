/*
+-----------------------------------------------------------------------------+
| This code corresponds to the the paper "Kummer versus Montgomery Face-off   |
| over Prime Order Fields" by 						      |
| Kaushik Nath,  Indian Statistical Institute, Kolkata, India, and            |
| Palash Sarkar, Indian Statistical Institute, Kolkata, India.	              |
+-----------------------------------------------------------------------------+
| Copyright (c) 2021, Kaushik Nath and Palash Sarkar.                         |
|                                                                             |
| Permission to use this code is granted.                          	      |
|                                                                             |
| Redistribution and use in source and binary forms, with or without          |
| modification, are permitted provided that the following conditions are      |
| met:                                                                        |
|                                                                             |
| * Redistributions of source code must retain the above copyright notice,    |
|   this list of conditions and the following disclaimer.                     |
|                                                                             |
| * Redistributions in binary form must reproduce the above copyright         |
|   notice, this list of conditions and the following disclaimer in the       |
|   documentation and/or other materials provided with the distribution.      |
|                                                                             |
| * The names of the contributors may not be used to endorse or promote       |
|   products derived from this software without specific prior written        |
|   permission.                                                               |
+-----------------------------------------------------------------------------+
| THIS SOFTWARE IS PROVIDED BY THE AUTHORS ""AS IS"" AND ANY EXPRESS OR       |
| IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES   |
| OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.     |
| IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,      |
| INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT    |
| NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
| DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY       |
| THEORY LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING |
| NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,| 
| EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          |
+-----------------------------------------------------------------------------+
*/

.data

.globl hh1_p1
.globl hh1_p2
.globl hh1_p3
.globl h2h_p1
.globl h2h_p2
.globl h2h_p3
.globl hh1_xor
.globl h2h_xor
.globl swap_c
.globl swap_mask
.globl h2h_mask
.globl vec45
.globl vec2e16x45
.globl vecmask3
.globl vecmask19
.globl vecmask13
.globl vecmask29
.globl vecmask29d
.globl vecmask1329d
.globl vecmask32
.globl a24
.globl mask58
.globl p0
.globl p1_6
.globl p7

.p2align 5

hh1_p1 		: .long 0x0,0x0,0x3FFFFFA7,0x3FFFFFFF,0x3FFFFFA7,0x3FFFFFFF,0x0,0x0
hh1_p2 		: .long 0x0,0x0,0x3FFFFFFF,0x3FFFFFFF,0x3FFFFFFF,0x3FFFFFFF,0x0,0x0
hh1_p3 		: .long 0x0,0x0,0x3FFFFFFF,0x00003FFF,0x3FFFFFFF,0x00003FFF,0x0,0x0
h2h_p1 		: .long 0x0,0x0,0x3FFFFFA7,0x3FFFFFFF,0x0,0x0,0x3FFFFFA7,0x3FFFFFFF
h2h_p2 		: .long 0x0,0x0,0x3FFFFFFF,0x3FFFFFFF,0x0,0x0,0x3FFFFFFF,0x3FFFFFFF
h2h_p3 		: .long 0x0,0x0,0x3FFFFFFF,0x00003FFF,0x0,0x0,0x3FFFFFFF,0x00003FFF
hh1_xor	 	: .long 0,0,-1,-1,-1,-1,0,0
h2h_xor	 	: .long 0,0,-1,-1,0,0,-1,-1
swap_c	 	: .long 0,1,2,3,4,5,6,7
swap_mask 	: .long 7,7,7,7,7,7,7,7
h2h_mask 	: .quad 0,-1,-1,-1
vec45 		: .quad 45,45,45,45
vec2e16x45	: .quad 2949120,2949120,2949120,2949120
vecmask3	: .quad 0x00000000E0000000,0x00000000E0000000,0x00000000E0000000,0x00000000E0000000
vecmask19	: .quad 0xFFFFE00000000000,0xFFFFE00000000000,0xFFFFE00000000000,0xFFFFE00000000000
vecmask13	: .quad 0x1FFF,0x1FFF,0x1FFF,0x1FFF
vecmask29	: .quad 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask29d	: .long 0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF,0x1FFFFFFF
vecmask1329d	: .long 0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF,0x1FFFFFFF,0x1FFF
vecmask32	: .quad 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF
a24	 	: .quad 0,249140,0,0 
mask58		: .quad 0x03FFFFFFFFFFFFFF
p0		: .quad 0xFFFFFFFFFFFFFFD3
p1_6		: .quad 0xFFFFFFFFFFFFFFFF
p7		: .quad 0x03FFFFFFFFFFFFFF
