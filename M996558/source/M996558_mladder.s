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

.p2align 5
.globl M996558_mladder
M996558_mladder:

movq 	  %rsp,%r11
andq 	  $-32,%rsp
subq 	  $2944,%rsp

movq 	  %r11,0(%rsp)
movq 	  %r12,8(%rsp)
movq 	  %r13,16(%rsp)
movq 	  %r14,24(%rsp)
movq 	  %r15,32(%rsp)
movq 	  %rbx,40(%rsp)
movq 	  %rbp,48(%rsp) 

// load <0,0,1,X1>
vmovdqa   0(%rsi),%ymm8
vmovdqa   %ymm8,64(%rsp)
vmovdqa   32(%rsi),%ymm9
vmovdqa   64(%rsi),%ymm10
vmovdqa   96(%rsi),%ymm11
vmovdqa   128(%rsi),%ymm12
vmovdqa   160(%rsi),%ymm13
vmovdqa   192(%rsi),%ymm14
vmovdqa   224(%rsi),%ymm15
vmovdqa   256(%rsi),%ymm8
vmovdqa   %ymm8,96(%rsp)

vmovdqa   288(%rsi),%ymm0
vmovdqa   320(%rsi),%ymm1
vmovdqa   352(%rsi),%ymm2
vmovdqa   384(%rsi),%ymm3
vmovdqa   416(%rsi),%ymm4
vmovdqa   448(%rsi),%ymm5
vmovdqa   480(%rsi),%ymm6
vmovdqa   512(%rsi),%ymm7
vmovdqa   544(%rsi),%ymm8

// <0',0',1',X1'> ← Pack-N2D(<0,0,1,X1>)
vpsllq    $32,%ymm0,%ymm0
vpor      64(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      96(%rsp),%ymm8,%ymm8

vmovdqa   %ymm0,0(%rsi)
vmovdqa   %ymm9,32(%rsi)
vmovdqa   %ymm10,64(%rsi)
vmovdqa   %ymm11,96(%rsi)
vmovdqa   %ymm12,128(%rsi)
vmovdqa   %ymm13,160(%rsi)
vmovdqa   %ymm14,192(%rsi)
vmovdqa   %ymm15,224(%rsi)
vmovdqa   %ymm8,256(%rsi)

// load <X2,Z2,X3,Z3>
vmovdqa   0(%rdi),%ymm8
vmovdqa   %ymm8,64(%rsp)
vmovdqa   32(%rdi),%ymm9
vmovdqa   64(%rdi),%ymm10
vmovdqa   96(%rdi),%ymm11
vmovdqa   128(%rdi),%ymm12
vmovdqa   160(%rdi),%ymm13
vmovdqa   192(%rdi),%ymm14
vmovdqa   224(%rdi),%ymm15
vmovdqa   256(%rdi),%ymm8
vmovdqa   %ymm8,96(%rsp)

vmovdqa   288(%rdi),%ymm0
vmovdqa   320(%rdi),%ymm1
vmovdqa   352(%rdi),%ymm2
vmovdqa   384(%rdi),%ymm3
vmovdqa   416(%rdi),%ymm4
vmovdqa   448(%rdi),%ymm5
vmovdqa   480(%rdi),%ymm6
vmovdqa   512(%rdi),%ymm7
vmovdqa   544(%rdi),%ymm8

// <X2',Z2',X3',Z3'> ← Pack-N2D(<X2,Z2,X3,Z3>)
vpsllq    $32,%ymm0,%ymm0
vpor      64(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      96(%rsp),%ymm8,%ymm8

movq      $63,%r15
movq	  $1,%rcx

movb      $0, %r8b
movq      %rdx,%rax

.L1:
addq      %r15,%rax
movb      0(%rax),%r14b
movq      %rdx,%rax

.L2:
movb	  %r14b,%bl
shrb      %cl,%bl
andb      $1,%bl

movb      %bl,%r9b
xorb      %r8b,%bl
movb      %r9b,%r8b

// <X2',Z2',X3',Z3'> ← Dense-Swap(<X2',Z2',X3',Z3'>,b)
movzbl    %bl,%ebx
imul	  $4,%ebx,%ebx
movl      %ebx,56(%rsp)
vpbroadcastd 56(%rsp),%ymm1
vpaddd	  swap_c,%ymm1,%ymm1
vpand     swap_mask,%ymm1,%ymm1

vpermd	  %ymm0,%ymm1,%ymm0
vpermd	  %ymm9,%ymm1,%ymm9
vpermd	  %ymm10,%ymm1,%ymm10
vpermd	  %ymm11,%ymm1,%ymm11
vpermd	  %ymm12,%ymm1,%ymm12
vpermd	  %ymm13,%ymm1,%ymm13
vpermd	  %ymm14,%ymm1,%ymm14
vpermd	  %ymm15,%ymm1,%ymm15
vpermd	  %ymm8,%ymm1,%ymm8

// <T1',T2',T4',T3'> ← Dense-H-H1(<X2',Z2',X3',Z3'>)
vpshufd	  $68,%ymm0,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    hh1_p1,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm9,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm12

vpshufd	  $68,%ymm13,%ymm1
vpshufd	  $238,%ymm13,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm13

vpshufd	  $68,%ymm14,%ymm1
vpshufd	  $238,%ymm14,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm14

vpshufd	  $68,%ymm15,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddd    hh1_p2,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm8,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    hh1_p3,%ymm1,%ymm1
vpxor     hh1_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

vpsrld    $29,%ymm0,%ymm1
vpaddd    %ymm1,%ymm9,%ymm9
vpand     vecmask29d,%ymm0,%ymm0

vpsrld    $29,%ymm9,%ymm1
vpaddd    %ymm1,%ymm10,%ymm10
vpand     vecmask29d,%ymm9,%ymm9

vpsrld    $29,%ymm10,%ymm1
vpaddd    %ymm1,%ymm11,%ymm11
vpand     vecmask29d,%ymm10,%ymm10

vpsrld    $29,%ymm11,%ymm1
vpaddd    %ymm1,%ymm12,%ymm12
vpand     vecmask29d,%ymm11,%ymm11

vpsrld    $29,%ymm12,%ymm1
vpaddd    %ymm1,%ymm13,%ymm13
vpand     vecmask29d,%ymm12,%ymm12

vpsrld    $29,%ymm13,%ymm1
vpaddd    %ymm1,%ymm14,%ymm14
vpand     vecmask29d,%ymm13,%ymm13

vpsrld    $29,%ymm14,%ymm1
vpaddd    %ymm1,%ymm15,%ymm15
vpand     vecmask29d,%ymm14,%ymm14

vpsrld    $29,%ymm15,%ymm1
vpaddd    %ymm1,%ymm8,%ymm8
vpand     vecmask29d,%ymm15,%ymm15

vpand     vecmask3,%ymm8,%ymm1
vpsllq    $3,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0

vpand     vecmask19,%ymm8,%ymm1
vpsrlq    $45,%ymm1,%ymm1
vpmuludq  vec45,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpand     vecmask1329d,%ymm8,%ymm8

vmovdqa   %ymm0,64(%rsp)
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)
vmovdqa   %ymm8,160(%rsp)

// <T1',T2',T1',T2'> ← Dense-Dup(<T1',T2',T4',T3'>)
vpermq	  $68,%ymm0,%ymm0
vpermq	  $68,%ymm9,%ymm1
vpermq	  $68,%ymm10,%ymm2
vpermq	  $68,%ymm11,%ymm3
vpermq	  $68,%ymm12,%ymm4
vpermq	  $68,%ymm13,%ymm5
vpermq	  $68,%ymm14,%ymm6
vpermq	  $68,%ymm15,%ymm7
vpermq	  $68,%ymm8,%ymm8

// <T1,T2,T1,T2> ← Pack-D2N(<T1',T2',T1',T2'>)
vmovdqa   %ymm1,352(%rsp)
vpsrlq    $32,%ymm1,%ymm1
vmovdqa   %ymm1,640(%rsp)

vmovdqa   %ymm0,320(%rsp)
vpsrlq    $32,%ymm0,%ymm1
vmovdqa   %ymm1,608(%rsp)

vmovdqa   %ymm2,384(%rsp)
vpsrlq    $32,%ymm2,%ymm1
vmovdqa   %ymm1,672(%rsp)

vmovdqa   %ymm3,416(%rsp)
vpsrlq    $32,%ymm3,%ymm1
vmovdqa   %ymm1,704(%rsp)

vmovdqa   %ymm4,448(%rsp)
vpsrlq    $32,%ymm4,%ymm1
vmovdqa   %ymm1,736(%rsp)

vmovdqa   %ymm5,480(%rsp)
vpsrlq    $32,%ymm5,%ymm1
vmovdqa   %ymm1,768(%rsp)

vmovdqa   %ymm6,512(%rsp)
vpsrlq    $32,%ymm6,%ymm1
vmovdqa   %ymm1,800(%rsp)

vmovdqa   %ymm7,544(%rsp)
vpsrlq    $32,%ymm7,%ymm1
vmovdqa   %ymm1,832(%rsp)

vmovdqa   %ymm8,576(%rsp)
vpsrlq    $32,%ymm8,%ymm1
vmovdqa   %ymm1,864(%rsp)

vmovdqa   64(%rsp),%ymm0
vmovdqa   160(%rsp),%ymm8

// <T1,T2,T4,T3> ← Pack-D2N(<T1',T2',T4',T3'>)
vpsrlq    $32,%ymm0,%ymm0
vpsrlq    $32,%ymm9,%ymm1
vpsrlq    $32,%ymm10,%ymm2
vpsrlq    $32,%ymm11,%ymm3
vpsrlq    $32,%ymm12,%ymm4
vpsrlq    $32,%ymm13,%ymm5
vpsrlq    $32,%ymm14,%ymm6
vpsrlq    $32,%ymm15,%ymm7
vpsrlq    $32,%ymm8,%ymm8

// <T5,T6,T7,T8> ← Mul(<T1,T2,T4,T3>,<T1,T2,T1,T2>)
vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpmuludq  608(%rsp),%ymm0,%ymm15
vmovdqa   %ymm15,1440(%rsp)

vpmuludq  640(%rsp),%ymm0,%ymm15
vpmuludq  608(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1472(%rsp)

vpmuludq  672(%rsp),%ymm0,%ymm15
vpmuludq  640(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1504(%rsp)

vpmuludq  704(%rsp),%ymm0,%ymm15
vpmuludq  672(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1536(%rsp)

vpmuludq  736(%rsp),%ymm0,%ymm15
vpmuludq  704(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1568(%rsp)

vpmuludq  768(%rsp),%ymm0,%ymm15
vpmuludq  736(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1600(%rsp)

vpmuludq  800(%rsp),%ymm0,%ymm15
vpmuludq  768(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1632(%rsp)

vpmuludq  832(%rsp),%ymm0,%ymm15
vpmuludq  800(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1664(%rsp)

vpmuludq  864(%rsp),%ymm0,%ymm15
vpmuludq  832(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1696(%rsp)

vpmuludq  864(%rsp),%ymm1,%ymm15
vpmuludq  832(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1728(%rsp)

vpmuludq  864(%rsp),%ymm2,%ymm15
vpmuludq  832(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1760(%rsp)

vpmuludq  864(%rsp),%ymm3,%ymm15
vpmuludq  832(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1792(%rsp)

vpmuludq  864(%rsp),%ymm4,%ymm15
vpmuludq  832(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1824(%rsp)

vpmuludq  864(%rsp),%ymm5,%ymm15
vpmuludq  832(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1856(%rsp)

vpmuludq  864(%rsp),%ymm6,%ymm15
vpmuludq  832(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1888(%rsp)

vpmuludq  864(%rsp),%ymm7,%ymm15
vpmuludq  832(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1920(%rsp)

vpmuludq  864(%rsp),%ymm8,%ymm15
vmovdqa   %ymm15,1952(%rsp)

vmovdqa   64(%rsp),%ymm8
vmovdqa   96(%rsp),%ymm14
vmovdqa   128(%rsp),%ymm15
vmovdqa   160(%rsp),%ymm2

vpmuludq  320(%rsp),%ymm8,%ymm1
vmovdqa   %ymm1,1984(%rsp)

vpmuludq  352(%rsp),%ymm8,%ymm1
vpmuludq  320(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2016(%rsp)

vpmuludq  384(%rsp),%ymm8,%ymm1
vpmuludq  352(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2048(%rsp)

vpmuludq  416(%rsp),%ymm8,%ymm1
vpmuludq  384(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2080(%rsp)

vpmuludq  448(%rsp),%ymm8,%ymm1
vpmuludq  416(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2112(%rsp)

vpmuludq  480(%rsp),%ymm8,%ymm1
vpmuludq  448(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2144(%rsp)

vpmuludq  512(%rsp),%ymm8,%ymm1
vpmuludq  480(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2176(%rsp)

vpmuludq  544(%rsp),%ymm8,%ymm1
vpmuludq  512(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2208(%rsp)

vpmuludq  576(%rsp),%ymm8,%ymm1
vpmuludq  544(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2240(%rsp)

vpmuludq  576(%rsp),%ymm9,%ymm1
vpmuludq  544(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2272(%rsp)

vpmuludq  576(%rsp),%ymm10,%ymm1
vpmuludq  544(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2304(%rsp)

vpmuludq  576(%rsp),%ymm11,%ymm1
vpmuludq  544(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2336(%rsp)

vpmuludq  576(%rsp),%ymm12,%ymm1
vpmuludq  544(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2368(%rsp)

vpmuludq  576(%rsp),%ymm13,%ymm1
vpmuludq  544(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2400(%rsp)

vpmuludq  576(%rsp),%ymm14,%ymm1
vpmuludq  544(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2432(%rsp)

vpmuludq  576(%rsp),%ymm15,%ymm1
vpmuludq  544(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2464(%rsp)

vpmuludq  576(%rsp),%ymm2,%ymm1
vmovdqa   %ymm1,2496(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15

vmovdqa   %ymm14,2528(%rsp)
vmovdqa   %ymm15,2560(%rsp)

vmovdqa   160(%rsp),%ymm14
vpaddq    288(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2592(%rsp)

vmovdqa   320(%rsp),%ymm0
vmovdqa   352(%rsp),%ymm1
vmovdqa   384(%rsp),%ymm2
vmovdqa   416(%rsp),%ymm3
vmovdqa   448(%rsp),%ymm4
vmovdqa   480(%rsp),%ymm5
vmovdqa   512(%rsp),%ymm6
vmovdqa   544(%rsp),%ymm7

vpaddq    608(%rsp),%ymm0,%ymm0
vpaddq    640(%rsp),%ymm1,%ymm1
vpaddq    672(%rsp),%ymm2,%ymm2
vpaddq    704(%rsp),%ymm3,%ymm3
vpaddq    736(%rsp),%ymm4,%ymm4
vpaddq    768(%rsp),%ymm5,%ymm5
vpaddq    800(%rsp),%ymm6,%ymm6
vpaddq    832(%rsp),%ymm7,%ymm7

vmovdqa   576(%rsp),%ymm14
vpaddq    864(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2624(%rsp)

vpmuludq  %ymm8,%ymm0,%ymm15
vmovdqa   %ymm15,2656(%rsp)

vpmuludq  %ymm9,%ymm0,%ymm15
vpmuludq  %ymm8,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2688(%rsp)

vpmuludq  %ymm10,%ymm0,%ymm15
vpmuludq  %ymm9,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2720(%rsp)

vpmuludq  %ymm11,%ymm0,%ymm15
vpmuludq  %ymm10,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2752(%rsp)

vpmuludq  %ymm12,%ymm0,%ymm15
vpmuludq  %ymm11,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2784(%rsp)

vpmuludq  %ymm13,%ymm0,%ymm15
vpmuludq  %ymm12,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2816(%rsp)

vpmuludq  2528(%rsp),%ymm0,%ymm15
vpmuludq  %ymm13,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2848(%rsp)

vpmuludq  2560(%rsp),%ymm0,%ymm15
vpmuludq  2528(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2880(%rsp)

vpmuludq  2592(%rsp),%ymm0,%ymm15
vpmuludq  2560(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2912(%rsp)

vpmuludq  2592(%rsp),%ymm1,%ymm15
vpmuludq  2560(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm9,%ymm14
vpaddq    %ymm14,%ymm15,%ymm8

vpmuludq  2592(%rsp),%ymm2,%ymm15
vpmuludq  2560(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm10,%ymm14
vpaddq    %ymm14,%ymm15,%ymm9

vpmuludq  2592(%rsp),%ymm3,%ymm15
vpmuludq  2560(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm11,%ymm14
vpaddq    %ymm14,%ymm15,%ymm10

vpmuludq  2592(%rsp),%ymm4,%ymm15
vpmuludq  2560(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm12,%ymm14
vpaddq    %ymm14,%ymm15,%ymm11

vpmuludq  2592(%rsp),%ymm5,%ymm15
vpmuludq  2560(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm13,%ymm14
vpaddq    %ymm14,%ymm15,%ymm12

vpmuludq  2592(%rsp),%ymm6,%ymm15
vpmuludq  2560(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   2624(%rsp),%ymm14
vpmuludq  2528(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm13

vpmuludq  2592(%rsp),%ymm7,%ymm15
vmovdqa   2624(%rsp),%ymm14
vpmuludq  2560(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm14

vmovdqa   2624(%rsp),%ymm15
vpmuludq  2592(%rsp),%ymm15,%ymm15

vmovdqa   2656(%rsp),%ymm0
vmovdqa   2688(%rsp),%ymm1
vmovdqa   2720(%rsp),%ymm2
vmovdqa   2752(%rsp),%ymm3
vmovdqa   2784(%rsp),%ymm4
vmovdqa   2816(%rsp),%ymm5
vmovdqa   2848(%rsp),%ymm6

vpsubq    1440(%rsp),%ymm0,%ymm0
vpsubq    1472(%rsp),%ymm1,%ymm1
vpsubq    1504(%rsp),%ymm2,%ymm2
vpsubq    1536(%rsp),%ymm3,%ymm3
vpsubq    1568(%rsp),%ymm4,%ymm4
vpsubq    1600(%rsp),%ymm5,%ymm5
vpsubq    1632(%rsp),%ymm6,%ymm6

vpsubq    1984(%rsp),%ymm0,%ymm0
vpsubq    2016(%rsp),%ymm1,%ymm1
vpsubq    2048(%rsp),%ymm2,%ymm2
vpsubq    2080(%rsp),%ymm3,%ymm3
vpsubq    2112(%rsp),%ymm4,%ymm4
vpsubq    2144(%rsp),%ymm5,%ymm5
vpsubq    2176(%rsp),%ymm6,%ymm6

vmovdqa   2912(%rsp),%ymm7
vpsubq    1696(%rsp),%ymm7,%ymm7
vpsubq    2240(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2560(%rsp)

vmovdqa   2880(%rsp),%ymm7
vpsubq    1664(%rsp),%ymm7,%ymm7
vpsubq    2208(%rsp),%ymm7,%ymm7

vpsubq    1728(%rsp),%ymm8,%ymm8
vpsubq    1760(%rsp),%ymm9,%ymm9
vpsubq    1792(%rsp),%ymm10,%ymm10
vpsubq    1824(%rsp),%ymm11,%ymm11
vpsubq    1856(%rsp),%ymm12,%ymm12
vpsubq    1888(%rsp),%ymm13,%ymm13
vpsubq    1920(%rsp),%ymm14,%ymm14
vpsubq    1952(%rsp),%ymm15,%ymm15

vpsubq    2272(%rsp),%ymm8,%ymm8
vpsubq    2304(%rsp),%ymm9,%ymm9
vpsubq    2336(%rsp),%ymm10,%ymm10
vpsubq    2368(%rsp),%ymm11,%ymm11
vpsubq    2400(%rsp),%ymm12,%ymm12
vpsubq    2432(%rsp),%ymm13,%ymm13
vpsubq    2464(%rsp),%ymm14,%ymm14
vpsubq    2496(%rsp),%ymm15,%ymm15

vpaddq    2272(%rsp),%ymm0,%ymm0
vpaddq    2304(%rsp),%ymm1,%ymm1
vpaddq    2336(%rsp),%ymm2,%ymm2
vpaddq    2368(%rsp),%ymm3,%ymm3
vpaddq    2400(%rsp),%ymm4,%ymm4
vpaddq    2432(%rsp),%ymm5,%ymm5
vpaddq    2464(%rsp),%ymm6,%ymm6
vpaddq    2496(%rsp),%ymm7,%ymm7

vpaddq    1440(%rsp),%ymm8,%ymm8
vpaddq    1472(%rsp),%ymm9,%ymm9
vpaddq    1504(%rsp),%ymm10,%ymm10
vpaddq    1536(%rsp),%ymm11,%ymm11
vpaddq    1568(%rsp),%ymm12,%ymm12
vpaddq    1600(%rsp),%ymm13,%ymm13
vpaddq    1632(%rsp),%ymm14,%ymm14
vpaddq    1664(%rsp),%ymm15,%ymm15

vmovdqa   %ymm6,64(%rsp)
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $29,%ymm8,%ymm6
vpaddq    %ymm6,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vpmuludq  vec2e16x45,%ymm8,%ymm8
vpaddq    1984(%rsp),%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm6
vpaddq    %ymm6,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9
vpmuludq  vec2e16x45,%ymm9,%ymm9
vpaddq    2016(%rsp),%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm6
vpaddq    %ymm6,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10
vpmuludq  vec2e16x45,%ymm10,%ymm10
vpaddq    2048(%rsp),%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm6
vpaddq    %ymm6,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11
vpmuludq  vec2e16x45,%ymm11,%ymm11
vpaddq    2080(%rsp),%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm6
vpaddq    %ymm6,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12
vpmuludq  vec2e16x45,%ymm12,%ymm12
vpaddq    2112(%rsp),%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm6
vpaddq    %ymm6,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13
vpmuludq  vec2e16x45,%ymm13,%ymm13
vpaddq    2144(%rsp),%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm6
vpaddq    %ymm6,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14
vpmuludq  vec2e16x45,%ymm14,%ymm14
vpaddq    2176(%rsp),%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm7
vpaddq    1696(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm15,%ymm15
vpmuludq  vec2e16x45,%ymm15,%ymm15
vpaddq    2208(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1728(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    2240(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2240(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1760(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm0,%ymm0

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1792(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1824(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm2,%ymm2

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1856(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1888(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm4,%ymm4

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1920(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1952(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    64(%rsp),%ymm6,%ymm6
vmovdqa   %ymm6,64(%rsp)

vpsrlq    $29,%ymm7,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    2560(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    2240(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,1152(%rsp)

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    64(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm10,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,160(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $13,%ymm6,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpaddq	  %ymm10,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq    %ymm10,%ymm8,%ymm7
vpand     vecmask13,%ymm6,%ymm8

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,896(%rsp)

vmovdqa   128(%rsp),%ymm10
vmovdqa   160(%rsp),%ymm6
vmovdqa   96(%rsp),%ymm7

vmovdqa   %ymm9, 928(%rsp)
vmovdqa   %ymm10,960(%rsp)
vmovdqa   %ymm11,992(%rsp)
vmovdqa   %ymm12,1024(%rsp)
vmovdqa   %ymm13,1056(%rsp)
vmovdqa   %ymm14,1088(%rsp)
vmovdqa   %ymm15,1120(%rsp)

vmovdqa   %ymm0, 1184(%rsp)
vmovdqa   %ymm1, 1216(%rsp)
vmovdqa   %ymm2, 1248(%rsp)
vmovdqa   %ymm3, 1280(%rsp)
vmovdqa   %ymm4, 1312(%rsp)
vmovdqa   %ymm5, 1344(%rsp)
vmovdqa   %ymm6, 1376(%rsp)
vmovdqa   %ymm7, 1408(%rsp)
vmovdqa   %ymm8, 1440(%rsp)

// <T5',T6',T7',T8'> ← Pack-N2D(<T5,T6,T7,T8>)
vpsllq    $32,%ymm0,%ymm0
vpor      896(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      1152(%rsp),%ymm8,%ymm8

// <T9',T10',T11',T12'> ← Dense-H2-H(<T5',T6',T7',T8'>)
vpshufd	  $68,%ymm0,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm0,%ymm3
vpaddd    h2h_p1,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm0

vpshufd	  $68,%ymm9,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm9,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm9

vpshufd	  $68,%ymm10,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm10,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm10

vpshufd	  $68,%ymm11,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm11,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm11

vpshufd	  $68,%ymm12,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm12,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm12

vpshufd	  $68,%ymm13,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm13,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm13

vpshufd	  $68,%ymm14,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm14,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm14

vpshufd	  $68,%ymm15,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm15,%ymm3
vpaddd    h2h_p2,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm15

vpshufd	  $68,%ymm8,%ymm1
vpand     h2h_mask,%ymm1,%ymm1
vpshufd	  $238,%ymm8,%ymm3
vpaddd    h2h_p3,%ymm1,%ymm1
vpxor     h2h_xor,%ymm3,%ymm3
vpaddd    %ymm1,%ymm3,%ymm8

vpsrld    $29,%ymm0,%ymm1
vpaddd    %ymm1,%ymm9,%ymm9
vpand     vecmask29d,%ymm0,%ymm0

vpsrld    $29,%ymm9,%ymm1
vpaddd    %ymm1,%ymm10,%ymm10
vpand     vecmask29d,%ymm9,%ymm9

vpsrld    $29,%ymm10,%ymm1
vpaddd    %ymm1,%ymm11,%ymm11
vpand     vecmask29d,%ymm10,%ymm10

vpsrld    $29,%ymm11,%ymm1
vpaddd    %ymm1,%ymm12,%ymm12
vpand     vecmask29d,%ymm11,%ymm11

vpsrld    $29,%ymm12,%ymm1
vpaddd    %ymm1,%ymm13,%ymm13
vpand     vecmask29d,%ymm12,%ymm12

vpsrld    $29,%ymm13,%ymm1
vpaddd    %ymm1,%ymm14,%ymm14
vpand     vecmask29d,%ymm13,%ymm13

vpsrld    $29,%ymm14,%ymm1
vpaddd    %ymm1,%ymm15,%ymm15
vpand     vecmask29d,%ymm14,%ymm14

vpsrld    $29,%ymm15,%ymm1
vpaddd    %ymm1,%ymm8,%ymm8
vpand     vecmask29d,%ymm15,%ymm15

vpand     vecmask3,%ymm8,%ymm1
vpsllq    $3,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0

vpand     vecmask19,%ymm8,%ymm1
vpsrlq    $45,%ymm1,%ymm1
vpmuludq  vec45,%ymm1,%ymm1
vpaddd    %ymm1,%ymm0,%ymm0
vpand     vecmask1329d,%ymm8,%ymm8

vmovdqa   %ymm0,64(%rsp)
vmovdqa   %ymm8,96(%rsp)

// <T9',T10',1',X1'> ← Blend(<0',0',1',X1'>,<T9',T10',T11',T12'>,1100)
vpblendd  $240,0(%rsi),%ymm0,%ymm0
vpblendd  $240,32(%rsi),%ymm9,%ymm1
vpblendd  $240,64(%rsi),%ymm10,%ymm2
vpblendd  $240,96(%rsi),%ymm11,%ymm3
vpblendd  $240,128(%rsi),%ymm12,%ymm4
vpblendd  $240,160(%rsi),%ymm13,%ymm5
vpblendd  $240,192(%rsi),%ymm14,%ymm6
vpblendd  $240,224(%rsi),%ymm15,%ymm7
vpblendd  $240,256(%rsi),%ymm8,%ymm8

// <T9,T10,1,X1> ← Pack-D2N(<T9',T10',1',X1'>)
vmovdqa   %ymm0,320(%rsp)
vpsrlq    $32,%ymm0,%ymm0
vmovdqa   %ymm0,608(%rsp)

vmovdqa   %ymm1,352(%rsp)
vpsrlq    $32,%ymm1,%ymm1
vmovdqa   %ymm1,640(%rsp)

vmovdqa   %ymm2,384(%rsp)
vpsrlq    $32,%ymm2,%ymm2
vmovdqa   %ymm2,672(%rsp)

vmovdqa   %ymm3,416(%rsp)
vpsrlq    $32,%ymm3,%ymm3
vmovdqa   %ymm3,704(%rsp)

vmovdqa   %ymm4,448(%rsp)
vpsrlq    $32,%ymm4,%ymm4
vmovdqa   %ymm4,736(%rsp)

vmovdqa   %ymm5,480(%rsp)
vpsrlq    $32,%ymm5,%ymm5
vmovdqa   %ymm5,768(%rsp)

vmovdqa   %ymm6,512(%rsp)
vpsrlq    $32,%ymm6,%ymm6
vmovdqa   %ymm6,800(%rsp)

vmovdqa   %ymm7,544(%rsp)
vpsrlq    $32,%ymm7,%ymm7
vmovdqa   %ymm7,832(%rsp)

vmovdqa   %ymm8,576(%rsp)
vpsrlq    $32,%ymm8,%ymm8
vmovdqa   %ymm8,864(%rsp)

vmovdqa   64(%rsp),%ymm0
vmovdqa   96(%rsp),%ymm8

// <0,T13,0,0> ← Unreduced-Mulc(<T9,T10,T11,T12>,<0,a24,0,0>)
// <T5,T14,T7,T8> ← Add(<0,T13,0,0>,<T5,T6,T7,T8>)
vpmuludq  a24,%ymm0,%ymm1
vpaddq    896(%rsp),%ymm1,%ymm1
vpmuludq  a24,%ymm9,%ymm2
vpaddq    928(%rsp),%ymm2,%ymm2

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $32,%ymm0,%ymm4
vpsrlq    $32,%ymm9,%ymm5

vpmuludq  a24,%ymm4,%ymm4
vpaddq    1184(%rsp),%ymm4,%ymm4
vpmuludq  a24,%ymm5,%ymm5
vpaddq    1216(%rsp),%ymm5,%ymm5

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $32,%ymm10,%ymm6
vpmuludq  a24,%ymm10,%ymm3
vpaddq    960(%rsp),%ymm3,%ymm3
vpmuludq  a24,%ymm6,%ymm6
vpaddq    1248(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2
vmovdqa   %ymm2,928(%rsp)

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5
vmovdqa   %ymm5,1216(%rsp)

vpsrlq    $32,%ymm11,%ymm5
vpmuludq  a24,%ymm11,%ymm2
vpaddq    992(%rsp),%ymm2,%ymm2
vpmuludq  a24,%ymm5,%ymm5
vpaddq    1280(%rsp),%ymm5,%ymm5

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm3,%ymm3
vmovdqa   %ymm3,960(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm6,%ymm6
vmovdqa   %ymm6,1248(%rsp)

vpsrlq    $32,%ymm12,%ymm6
vpmuludq  a24,%ymm12,%ymm3
vpaddq    1024(%rsp),%ymm3,%ymm3
vpmuludq  a24,%ymm6,%ymm6
vpaddq    1312(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2
vmovdqa   %ymm2,992(%rsp)

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5
vmovdqa   %ymm5,1280(%rsp)

vpsrlq    $32,%ymm13,%ymm5
vpmuludq  a24,%ymm13,%ymm2
vpaddq    1056(%rsp),%ymm2,%ymm2
vpmuludq  a24,%ymm5,%ymm5
vpaddq    1344(%rsp),%ymm5,%ymm5

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm3,%ymm3
vmovdqa   %ymm3,1024(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm6,%ymm6
vmovdqa   %ymm6,1312(%rsp)

vpsrlq    $32,%ymm14,%ymm6
vpmuludq  a24,%ymm14,%ymm3
vpaddq    1088(%rsp),%ymm3,%ymm3
vpmuludq  a24,%ymm6,%ymm6
vpaddq    1376(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2
vmovdqa   %ymm2,1056(%rsp)

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5
vmovdqa   %ymm5,1344(%rsp)

vpsrlq    $32,%ymm15,%ymm5
vpmuludq  a24,%ymm15,%ymm2
vpaddq    1120(%rsp),%ymm2,%ymm2
vpmuludq  a24,%ymm5,%ymm5
vpaddq    1408(%rsp),%ymm5,%ymm5

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm3,%ymm3
vmovdqa   %ymm3,1088(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm6,%ymm6
vmovdqa   %ymm6,1376(%rsp)

vpsrlq    $32,%ymm8,%ymm6
vpmuludq  a24,%ymm8,%ymm3
vpaddq    1152(%rsp),%ymm3,%ymm3
vpmuludq  a24,%ymm6,%ymm6
vpaddq    1440(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2
vmovdqa   %ymm2,1120(%rsp)

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5
vmovdqa   %ymm5,1408(%rsp)

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3
vmovdqa   %ymm3,1152(%rsp)
vmovdqa   %ymm4,1184(%rsp)

vpsrlq    $13,%ymm6,%ymm7
vpmuludq  vec45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask13,%ymm6,%ymm6
vmovdqa   %ymm6,1440(%rsp)
vmovdqa   %ymm1,896(%rsp)

// <,,T15,T16> ← Sqr(<T9,T10,T11,T12>)
vmovdqa   %ymm0,64(%rsp)
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)
vmovdqa   %ymm8,160(%rsp)

vpsrlq    $32,%ymm0,%ymm0
vpsrlq    $32,%ymm9,%ymm1
vpsrlq    $32,%ymm10,%ymm2
vpsrlq    $32,%ymm11,%ymm3
vpsrlq    $32,%ymm12,%ymm4
vpsrlq    $32,%ymm13,%ymm5
vpsrlq    $32,%ymm14,%ymm6
vpsrlq    $32,%ymm15,%ymm7
vpsrlq    $32,%ymm8,%ymm8

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpermq	  $238,%ymm1,%ymm0
vpblendd  $15,%ymm0,%ymm9,%ymm9
vpermq	  $238,%ymm2,%ymm0
vpblendd  $15,%ymm0,%ymm10,%ymm10
vpermq	  $238,%ymm3,%ymm0
vpblendd  $15,%ymm0,%ymm11,%ymm11
vpermq	  $238,%ymm4,%ymm0
vpblendd  $15,%ymm0,%ymm12,%ymm12
vpermq	  $238,%ymm5,%ymm0
vpblendd  $15,%ymm0,%ymm13,%ymm13
vpermq	  $238,%ymm6,%ymm0
vpblendd  $15,%ymm0,%ymm14,%ymm14
vpermq	  $238,%ymm7,%ymm0
vpblendd  $15,%ymm0,%ymm15,%ymm15
vpermq	  $238,%ymm8,%ymm8
vpblendd  $240,160(%rsp),%ymm8,%ymm2
vmovdqa   192(%rsp),%ymm0
vpermq	  $238,%ymm0,%ymm0
vpblendd  $240,64(%rsp),%ymm0,%ymm8

vpmuludq  %ymm8,%ymm8,%ymm1
vmovdqa   %ymm1,2016(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1472(%rsp)

vpmuludq  %ymm9,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2048(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1504(%rsp)

vpmuludq  %ymm10,%ymm8,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm9,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2080(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1536(%rsp)

vpmuludq  %ymm11,%ymm8,%ymm1
vpmuludq  %ymm10,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2112(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1568(%rsp)

vpmuludq  %ymm12,%ymm8,%ymm1
vpmuludq  %ymm11,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm10,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2144(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1600(%rsp)

vpmuludq  %ymm13,%ymm8,%ymm1
vpmuludq  %ymm12,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2176(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1632(%rsp)

vpmuludq  %ymm14,%ymm8,%ymm1
vpmuludq  %ymm13,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm11,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2208(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1664(%rsp)

vpmuludq  %ymm15,%ymm8,%ymm1
vpmuludq  %ymm14,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2240(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1696(%rsp)

vpmuludq  %ymm15,%ymm9,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm8,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2272(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1728(%rsp)

vpmuludq  %ymm15,%ymm10,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2304(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1760(%rsp)

vpmuludq  %ymm15,%ymm11,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2336(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1792(%rsp)

vpmuludq  %ymm15,%ymm12,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm2,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2368(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1824(%rsp)

vpmuludq  %ymm15,%ymm13,%ymm1
vpmuludq  %ymm2,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2400(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1856(%rsp)

vpmuludq  %ymm15,%ymm14,%ymm1
vpmuludq  %ymm2,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2432(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1888(%rsp)

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2464(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1920(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vmovdqa   %ymm1,2496(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1952(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm1
vmovdqa   %ymm1,2528(%rsp)
vpermq	  $68,%ymm1,%ymm1
vmovdqa   %ymm1,1984(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15
vpaddq    288(%rsp),%ymm2,%ymm2

vpermq	  $238,%ymm8,%ymm7
vpblendd  $15,%ymm7,%ymm2,%ymm2
vpermq	  $238,%ymm9,%ymm7
vpblendd  $15,%ymm7,%ymm15,%ymm15
vpermq	  $238,%ymm10,%ymm7
vpblendd  $15,%ymm7,%ymm14,%ymm14
vpermq	  $238,%ymm11,%ymm7
vpblendd  $15,%ymm7,%ymm13,%ymm13
vpermq	  $238,%ymm12,%ymm7
vpblendd  $15,%ymm7,%ymm12,%ymm12

vpermq	  $78,%ymm13,%ymm11
vpermq	  $78,%ymm14,%ymm10
vpermq	  $78,%ymm15,%ymm9
vpermq	  $78,%ymm2,%ymm8

vpmuludq  %ymm2,%ymm8,%ymm1
vpmuludq  %ymm15,%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm12,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2688(%rsp)

vpmuludq  %ymm2,%ymm9,%ymm1
vpmuludq  %ymm15,%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm8
vpermq	  $68,%ymm8,%ymm1
vmovdqa   %ymm1,2656(%rsp)

vpmuludq  %ymm2,%ymm10,%ymm1
vpmuludq  %ymm15,%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm13,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm9
vpermq	  $68,%ymm9,%ymm6

vpmuludq  %ymm2,%ymm11,%ymm1
vpmuludq  %ymm15,%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm10
vpermq	  $68,%ymm10,%ymm5

vpmuludq  %ymm2,%ymm12,%ymm1
vpmuludq  %ymm15,%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm14,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm11
vpermq	  $68,%ymm11,%ymm4

vpmuludq  %ymm2,%ymm13,%ymm1
vpmuludq  %ymm15,%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpaddq    %ymm1,%ymm1,%ymm12
vpermq	  $68,%ymm12,%ymm3

vpmuludq  %ymm2,%ymm14,%ymm1
vpaddq    %ymm1,%ymm1,%ymm1
vpmuludq  %ymm15,%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm13
vpermq	  $68,%ymm13,%ymm1
vmovdqa   %ymm1,2624(%rsp)

vpmuludq  %ymm2,%ymm15,%ymm1
vpaddq    %ymm1,%ymm1,%ymm14
vpermq	  $68,%ymm14,%ymm1
vmovdqa   %ymm1,2592(%rsp)

vpmuludq  %ymm2,%ymm2,%ymm15
vpermq	  $68,%ymm15,%ymm1
vmovdqa   %ymm1,2560(%rsp)

vmovdqa   2560(%rsp),%ymm0
vmovdqa   2592(%rsp),%ymm1
vmovdqa   2624(%rsp),%ymm2

vpsubq    1472(%rsp),%ymm0,%ymm0
vpsubq    1504(%rsp),%ymm1,%ymm1
vpsubq    1536(%rsp),%ymm2,%ymm2
vpsubq    1568(%rsp),%ymm3,%ymm3
vpsubq    1600(%rsp),%ymm4,%ymm4
vpsubq    1632(%rsp),%ymm5,%ymm5
vpsubq    1664(%rsp),%ymm6,%ymm6

vpsubq    2016(%rsp),%ymm0,%ymm0
vpsubq    2048(%rsp),%ymm1,%ymm1
vpsubq    2080(%rsp),%ymm2,%ymm2
vpsubq    2112(%rsp),%ymm3,%ymm3
vpsubq    2144(%rsp),%ymm4,%ymm4
vpsubq    2176(%rsp),%ymm5,%ymm5
vpsubq    2208(%rsp),%ymm6,%ymm6

vmovdqa   2688(%rsp),%ymm7
vpsubq    1728(%rsp),%ymm7,%ymm7
vpsubq    2272(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2592(%rsp)

vmovdqa   2656(%rsp),%ymm7
vpsubq    1696(%rsp),%ymm7,%ymm7
vpsubq    2240(%rsp),%ymm7,%ymm7

vpsubq    1760(%rsp),%ymm8,%ymm8
vpsubq    1792(%rsp),%ymm9,%ymm9
vpsubq    1824(%rsp),%ymm10,%ymm10
vpsubq    1856(%rsp),%ymm11,%ymm11
vpsubq    1888(%rsp),%ymm12,%ymm12
vpsubq    1920(%rsp),%ymm13,%ymm13
vpsubq    1952(%rsp),%ymm14,%ymm14
vpsubq    1984(%rsp),%ymm15,%ymm15

vpsubq    2304(%rsp),%ymm8,%ymm8
vpsubq    2336(%rsp),%ymm9,%ymm9
vpsubq    2368(%rsp),%ymm10,%ymm10
vpsubq    2400(%rsp),%ymm11,%ymm11
vpsubq    2432(%rsp),%ymm12,%ymm12
vpsubq    2464(%rsp),%ymm13,%ymm13
vpsubq    2496(%rsp),%ymm14,%ymm14
vpsubq    2528(%rsp),%ymm15,%ymm15

vpaddq    2304(%rsp),%ymm0,%ymm0
vpaddq    2336(%rsp),%ymm1,%ymm1
vpaddq    2368(%rsp),%ymm2,%ymm2
vpaddq    2400(%rsp),%ymm3,%ymm3
vpaddq    2432(%rsp),%ymm4,%ymm4
vpaddq    2464(%rsp),%ymm5,%ymm5
vpaddq    2496(%rsp),%ymm6,%ymm6
vpaddq    2528(%rsp),%ymm7,%ymm7

vpaddq    1472(%rsp),%ymm8,%ymm8
vpaddq    1504(%rsp),%ymm9,%ymm9
vpaddq    1536(%rsp),%ymm10,%ymm10
vpaddq    1568(%rsp),%ymm11,%ymm11
vpaddq    1600(%rsp),%ymm12,%ymm12
vpaddq    1632(%rsp),%ymm13,%ymm13
vpaddq    1664(%rsp),%ymm14,%ymm14
vpaddq    1696(%rsp),%ymm15,%ymm15

vmovdqa   %ymm6,64(%rsp)
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $29,%ymm8,%ymm6
vpaddq    %ymm6,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vpmuludq  vec2e16x45,%ymm8,%ymm8
vpaddq    2016(%rsp),%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm6
vpaddq    %ymm6,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9
vpmuludq  vec2e16x45,%ymm9,%ymm9
vpaddq    2048(%rsp),%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm6
vpaddq    %ymm6,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10
vpmuludq  vec2e16x45,%ymm10,%ymm10
vpaddq    2080(%rsp),%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm6
vpaddq    %ymm6,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11
vpmuludq  vec2e16x45,%ymm11,%ymm11
vpaddq    2112(%rsp),%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm6
vpaddq    %ymm6,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12
vpmuludq  vec2e16x45,%ymm12,%ymm12
vpaddq    2144(%rsp),%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm6
vpaddq    %ymm6,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13
vpmuludq  vec2e16x45,%ymm13,%ymm13
vpaddq    2176(%rsp),%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm6
vpaddq    %ymm6,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14
vpmuludq  vec2e16x45,%ymm14,%ymm14
vpaddq    2208(%rsp),%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm7
vpaddq    1728(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm15,%ymm15
vpmuludq  vec2e16x45,%ymm15,%ymm15
vpaddq    2240(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1760(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    2272(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2272(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1792(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm0,%ymm0

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1824(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1856(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm2,%ymm2

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1888(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1920(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm4,%ymm4

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1952(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1984(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    64(%rsp),%ymm6,%ymm6
vmovdqa   %ymm6,64(%rsp)

vpsrlq    $29,%ymm7,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    2592(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    2272(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10
vpblendd  $15,1152(%rsp),%ymm10,%ymm10
vmovdqa   %ymm10,160(%rsp)

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    64(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm10,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,192(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $13,%ymm6,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpaddq	  %ymm10,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq    %ymm10,%ymm8,%ymm7
vpand     vecmask13,%ymm6,%ymm8

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask29,%ymm7,%ymm7
vpblendd  $15,896(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,64(%rsp)

vmovdqa   128(%rsp),%ymm10
vmovdqa   192(%rsp),%ymm6
vmovdqa   96(%rsp),%ymm7

// <T5,T14,T15,T16> ← Blend(<T5,T14,T7,T8>,<,,T15,T16>,9)
vpblendd  $15,928(%rsp),%ymm9,%ymm9
vpblendd  $15,960(%rsp),%ymm10,%ymm10
vpblendd  $15,992(%rsp),%ymm11,%ymm11
vpblendd  $15,1024(%rsp),%ymm12,%ymm12
vpblendd  $15,1056(%rsp),%ymm13,%ymm13
vpblendd  $15,1088(%rsp),%ymm14,%ymm14
vpblendd  $15,1120(%rsp),%ymm15,%ymm15
vpblendd  $15,1184(%rsp),%ymm0,%ymm0
vpblendd  $15,1216(%rsp),%ymm1,%ymm1
vpblendd  $15,1248(%rsp),%ymm2,%ymm2
vpblendd  $15,1280(%rsp),%ymm3,%ymm3
vpblendd  $15,1312(%rsp),%ymm4,%ymm4
vpblendd  $15,1344(%rsp),%ymm5,%ymm5
vpblendd  $15,1376(%rsp),%ymm6,%ymm6
vpblendd  $15,1408(%rsp),%ymm7,%ymm7
vpblendd  $15,1440(%rsp),%ymm8,%ymm8

// <X2,Z2,X3,Z3> ← Mul(<T5,T14,T15,T16>,<T6,T10,1,X1>)
vmovdqa   %ymm14,96(%rsp)
vmovdqa   %ymm15,128(%rsp)

vmovdqa   %ymm0,192(%rsp)
vmovdqa   %ymm1,224(%rsp)
vmovdqa   %ymm2,256(%rsp)
vmovdqa   %ymm8,288(%rsp)

vpmuludq  608(%rsp),%ymm0,%ymm15
vmovdqa   %ymm15,1440(%rsp)

vpmuludq  640(%rsp),%ymm0,%ymm15
vpmuludq  608(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1472(%rsp)

vpmuludq  672(%rsp),%ymm0,%ymm15
vpmuludq  640(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1504(%rsp)

vpmuludq  704(%rsp),%ymm0,%ymm15
vpmuludq  672(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1536(%rsp)

vpmuludq  736(%rsp),%ymm0,%ymm15
vpmuludq  704(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1568(%rsp)

vpmuludq  768(%rsp),%ymm0,%ymm15
vpmuludq  736(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1600(%rsp)

vpmuludq  800(%rsp),%ymm0,%ymm15
vpmuludq  768(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1632(%rsp)

vpmuludq  832(%rsp),%ymm0,%ymm15
vpmuludq  800(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1664(%rsp)

vpmuludq  864(%rsp),%ymm0,%ymm15
vpmuludq  832(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  608(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1696(%rsp)

vpmuludq  864(%rsp),%ymm1,%ymm15
vpmuludq  832(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  640(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1728(%rsp)

vpmuludq  864(%rsp),%ymm2,%ymm15
vpmuludq  832(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  672(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1760(%rsp)

vpmuludq  864(%rsp),%ymm3,%ymm15
vpmuludq  832(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  704(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1792(%rsp)

vpmuludq  864(%rsp),%ymm4,%ymm15
vpmuludq  832(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  736(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1824(%rsp)

vpmuludq  864(%rsp),%ymm5,%ymm15
vpmuludq  832(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  768(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1856(%rsp)

vpmuludq  864(%rsp),%ymm6,%ymm15
vpmuludq  832(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  800(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1888(%rsp)

vpmuludq  864(%rsp),%ymm7,%ymm15
vpmuludq  832(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,1920(%rsp)

vpmuludq  864(%rsp),%ymm8,%ymm15
vmovdqa   %ymm15,1952(%rsp)

vmovdqa   64(%rsp),%ymm8
vmovdqa   96(%rsp),%ymm14
vmovdqa   128(%rsp),%ymm15
vmovdqa   160(%rsp),%ymm2

vpmuludq  320(%rsp),%ymm8,%ymm1
vmovdqa   %ymm1,1984(%rsp)

vpmuludq  352(%rsp),%ymm8,%ymm1
vpmuludq  320(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2016(%rsp)

vpmuludq  384(%rsp),%ymm8,%ymm1
vpmuludq  352(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2048(%rsp)

vpmuludq  416(%rsp),%ymm8,%ymm1
vpmuludq  384(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2080(%rsp)

vpmuludq  448(%rsp),%ymm8,%ymm1
vpmuludq  416(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2112(%rsp)

vpmuludq  480(%rsp),%ymm8,%ymm1
vpmuludq  448(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2144(%rsp)

vpmuludq  512(%rsp),%ymm8,%ymm1
vpmuludq  480(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2176(%rsp)

vpmuludq  544(%rsp),%ymm8,%ymm1
vpmuludq  512(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2208(%rsp)

vpmuludq  576(%rsp),%ymm8,%ymm1
vpmuludq  544(%rsp),%ymm9,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  320(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2240(%rsp)

vpmuludq  576(%rsp),%ymm9,%ymm1
vpmuludq  544(%rsp),%ymm10,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  352(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2272(%rsp)

vpmuludq  576(%rsp),%ymm10,%ymm1
vpmuludq  544(%rsp),%ymm11,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  384(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2304(%rsp)

vpmuludq  576(%rsp),%ymm11,%ymm1
vpmuludq  544(%rsp),%ymm12,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  416(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2336(%rsp)

vpmuludq  576(%rsp),%ymm12,%ymm1
vpmuludq  544(%rsp),%ymm13,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  448(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2368(%rsp)

vpmuludq  576(%rsp),%ymm13,%ymm1
vpmuludq  544(%rsp),%ymm14,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  480(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2400(%rsp)

vpmuludq  576(%rsp),%ymm14,%ymm1
vpmuludq  544(%rsp),%ymm15,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vpmuludq  512(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2432(%rsp)

vpmuludq  576(%rsp),%ymm15,%ymm1
vpmuludq  544(%rsp),%ymm2,%ymm0
vpaddq    %ymm0,%ymm1,%ymm1
vmovdqa   %ymm1,2464(%rsp)

vpmuludq  576(%rsp),%ymm2,%ymm1
vmovdqa   %ymm1,2496(%rsp)

vpaddq    192(%rsp),%ymm8,%ymm8
vpaddq    224(%rsp),%ymm9,%ymm9
vpaddq    256(%rsp),%ymm10,%ymm10
vpaddq    %ymm3,%ymm11,%ymm11
vpaddq    %ymm4,%ymm12,%ymm12
vpaddq    %ymm5,%ymm13,%ymm13
vpaddq    %ymm6,%ymm14,%ymm14
vpaddq    %ymm7,%ymm15,%ymm15

vmovdqa   %ymm14,2528(%rsp)
vmovdqa   %ymm15,2560(%rsp)

vmovdqa   160(%rsp),%ymm14
vpaddq    288(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2592(%rsp)

vmovdqa   320(%rsp),%ymm0
vmovdqa   352(%rsp),%ymm1
vmovdqa   384(%rsp),%ymm2
vmovdqa   416(%rsp),%ymm3
vmovdqa   448(%rsp),%ymm4
vmovdqa   480(%rsp),%ymm5
vmovdqa   512(%rsp),%ymm6
vmovdqa   544(%rsp),%ymm7

vpaddq    608(%rsp),%ymm0,%ymm0
vpaddq    640(%rsp),%ymm1,%ymm1
vpaddq    672(%rsp),%ymm2,%ymm2
vpaddq    704(%rsp),%ymm3,%ymm3
vpaddq    736(%rsp),%ymm4,%ymm4
vpaddq    768(%rsp),%ymm5,%ymm5
vpaddq    800(%rsp),%ymm6,%ymm6
vpaddq    832(%rsp),%ymm7,%ymm7

vmovdqa   576(%rsp),%ymm14
vpaddq    864(%rsp),%ymm14,%ymm14
vmovdqa   %ymm14,2624(%rsp)

vpmuludq  %ymm8,%ymm0,%ymm15
vmovdqa   %ymm15,2656(%rsp)

vpmuludq  %ymm9,%ymm0,%ymm15
vpmuludq  %ymm8,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2688(%rsp)

vpmuludq  %ymm10,%ymm0,%ymm15
vpmuludq  %ymm9,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2720(%rsp)

vpmuludq  %ymm11,%ymm0,%ymm15
vpmuludq  %ymm10,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2752(%rsp)

vpmuludq  %ymm12,%ymm0,%ymm15
vpmuludq  %ymm11,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2784(%rsp)

vpmuludq  %ymm13,%ymm0,%ymm15
vpmuludq  %ymm12,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2816(%rsp)

vpmuludq  2528(%rsp),%ymm0,%ymm15
vpmuludq  %ymm13,%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2848(%rsp)

vpmuludq  2560(%rsp),%ymm0,%ymm15
vpmuludq  2528(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm8,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2880(%rsp)

vpmuludq  2592(%rsp),%ymm0,%ymm15
vpmuludq  2560(%rsp),%ymm1,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm9,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm8,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   %ymm15,2912(%rsp)

vpmuludq  2592(%rsp),%ymm1,%ymm15
vpmuludq  2560(%rsp),%ymm2,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm10,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm9,%ymm14
vpaddq    %ymm14,%ymm15,%ymm8

vpmuludq  2592(%rsp),%ymm2,%ymm15
vpmuludq  2560(%rsp),%ymm3,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm11,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm10,%ymm14
vpaddq    %ymm14,%ymm15,%ymm9

vpmuludq  2592(%rsp),%ymm3,%ymm15
vpmuludq  2560(%rsp),%ymm4,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm12,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm11,%ymm14
vpaddq    %ymm14,%ymm15,%ymm10

vpmuludq  2592(%rsp),%ymm4,%ymm15
vpmuludq  2560(%rsp),%ymm5,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  %ymm13,%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm12,%ymm14
vpaddq    %ymm14,%ymm15,%ymm11

vpmuludq  2592(%rsp),%ymm5,%ymm15
vpmuludq  2560(%rsp),%ymm6,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2528(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vpmuludq  2624(%rsp),%ymm13,%ymm14
vpaddq    %ymm14,%ymm15,%ymm12

vpmuludq  2592(%rsp),%ymm6,%ymm15
vpmuludq  2560(%rsp),%ymm7,%ymm14
vpaddq    %ymm14,%ymm15,%ymm15
vmovdqa   2624(%rsp),%ymm14
vpmuludq  2528(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm13

vpmuludq  2592(%rsp),%ymm7,%ymm15
vmovdqa   2624(%rsp),%ymm14
vpmuludq  2560(%rsp),%ymm14,%ymm14
vpaddq    %ymm14,%ymm15,%ymm14

vmovdqa   2624(%rsp),%ymm15
vpmuludq  2592(%rsp),%ymm15,%ymm15

vmovdqa   2656(%rsp),%ymm0
vmovdqa   2688(%rsp),%ymm1
vmovdqa   2720(%rsp),%ymm2
vmovdqa   2752(%rsp),%ymm3
vmovdqa   2784(%rsp),%ymm4
vmovdqa   2816(%rsp),%ymm5
vmovdqa   2848(%rsp),%ymm6

vpsubq    1440(%rsp),%ymm0,%ymm0
vpsubq    1472(%rsp),%ymm1,%ymm1
vpsubq    1504(%rsp),%ymm2,%ymm2
vpsubq    1536(%rsp),%ymm3,%ymm3
vpsubq    1568(%rsp),%ymm4,%ymm4
vpsubq    1600(%rsp),%ymm5,%ymm5
vpsubq    1632(%rsp),%ymm6,%ymm6

vpsubq    1984(%rsp),%ymm0,%ymm0
vpsubq    2016(%rsp),%ymm1,%ymm1
vpsubq    2048(%rsp),%ymm2,%ymm2
vpsubq    2080(%rsp),%ymm3,%ymm3
vpsubq    2112(%rsp),%ymm4,%ymm4
vpsubq    2144(%rsp),%ymm5,%ymm5
vpsubq    2176(%rsp),%ymm6,%ymm6

vmovdqa   2912(%rsp),%ymm7
vpsubq    1696(%rsp),%ymm7,%ymm7
vpsubq    2240(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2560(%rsp)

vmovdqa   2880(%rsp),%ymm7
vpsubq    1664(%rsp),%ymm7,%ymm7
vpsubq    2208(%rsp),%ymm7,%ymm7

vpsubq    1728(%rsp),%ymm8,%ymm8
vpsubq    1760(%rsp),%ymm9,%ymm9
vpsubq    1792(%rsp),%ymm10,%ymm10
vpsubq    1824(%rsp),%ymm11,%ymm11
vpsubq    1856(%rsp),%ymm12,%ymm12
vpsubq    1888(%rsp),%ymm13,%ymm13
vpsubq    1920(%rsp),%ymm14,%ymm14
vpsubq    1952(%rsp),%ymm15,%ymm15

vpsubq    2272(%rsp),%ymm8,%ymm8
vpsubq    2304(%rsp),%ymm9,%ymm9
vpsubq    2336(%rsp),%ymm10,%ymm10
vpsubq    2368(%rsp),%ymm11,%ymm11
vpsubq    2400(%rsp),%ymm12,%ymm12
vpsubq    2432(%rsp),%ymm13,%ymm13
vpsubq    2464(%rsp),%ymm14,%ymm14
vpsubq    2496(%rsp),%ymm15,%ymm15

vpaddq    2272(%rsp),%ymm0,%ymm0
vpaddq    2304(%rsp),%ymm1,%ymm1
vpaddq    2336(%rsp),%ymm2,%ymm2
vpaddq    2368(%rsp),%ymm3,%ymm3
vpaddq    2400(%rsp),%ymm4,%ymm4
vpaddq    2432(%rsp),%ymm5,%ymm5
vpaddq    2464(%rsp),%ymm6,%ymm6
vpaddq    2496(%rsp),%ymm7,%ymm7

vpaddq    1440(%rsp),%ymm8,%ymm8
vpaddq    1472(%rsp),%ymm9,%ymm9
vpaddq    1504(%rsp),%ymm10,%ymm10
vpaddq    1536(%rsp),%ymm11,%ymm11
vpaddq    1568(%rsp),%ymm12,%ymm12
vpaddq    1600(%rsp),%ymm13,%ymm13
vpaddq    1632(%rsp),%ymm14,%ymm14
vpaddq    1664(%rsp),%ymm15,%ymm15

vmovdqa   %ymm6,64(%rsp)
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $29,%ymm8,%ymm6
vpaddq    %ymm6,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vpmuludq  vec2e16x45,%ymm8,%ymm8
vpaddq    1984(%rsp),%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm6
vpaddq    %ymm6,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9
vpmuludq  vec2e16x45,%ymm9,%ymm9
vpaddq    2016(%rsp),%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm6
vpaddq    %ymm6,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10
vpmuludq  vec2e16x45,%ymm10,%ymm10
vpaddq    2048(%rsp),%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm6
vpaddq    %ymm6,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11
vpmuludq  vec2e16x45,%ymm11,%ymm11
vpaddq    2080(%rsp),%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm6
vpaddq    %ymm6,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12
vpmuludq  vec2e16x45,%ymm12,%ymm12
vpaddq    2112(%rsp),%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm6
vpaddq    %ymm6,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13
vpmuludq  vec2e16x45,%ymm13,%ymm13
vpaddq    2144(%rsp),%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm6
vpaddq    %ymm6,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14
vpmuludq  vec2e16x45,%ymm14,%ymm14
vpaddq    2176(%rsp),%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm7
vpaddq    1696(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm15,%ymm15
vpmuludq  vec2e16x45,%ymm15,%ymm15
vpaddq    2208(%rsp),%ymm15,%ymm15

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1728(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    2240(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,2240(%rsp)

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1760(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm0,%ymm0

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1792(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1824(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm2,%ymm2

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1856(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1888(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    %ymm6,%ymm4,%ymm4

vpsrlq    $29,%ymm7,%ymm6
vpaddq    1920(%rsp),%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    1952(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6
vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    64(%rsp),%ymm6,%ymm6
vmovdqa   %ymm6,64(%rsp)

vpsrlq    $29,%ymm7,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vpmuludq  vec2e16x45,%ymm7,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpmuludq  vec2e16x45,%ymm6,%ymm6
vpaddq    2560(%rsp),%ymm6,%ymm6

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vmovdqa   %ymm10,128(%rsp)
vpsrlq    $29,%ymm15,%ymm7
vpaddq    2240(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,192(%rsp)

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    64(%rsp),%ymm7,%ymm10
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm10,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,160(%rsp)

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm6,%ymm6
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,96(%rsp)

vpsrlq    $13,%ymm6,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpaddq	  %ymm10,%ymm10,%ymm10
vpaddq	  %ymm10,%ymm8,%ymm8
vpsllq	  $2,%ymm10,%ymm10
vpaddq    %ymm10,%ymm8,%ymm7
vpand     vecmask13,%ymm6,%ymm8

vpsrlq    $29,%ymm7,%ymm10
vpaddq    %ymm10,%ymm9,%ymm9
vpand     vecmask29,%ymm7,%ymm7
vmovdqa   %ymm7,64(%rsp)

vmovdqa   128(%rsp),%ymm10
vmovdqa   160(%rsp),%ymm6
vmovdqa   96(%rsp),%ymm7

// <X2',Z2',X3',Z3'> ← Pack-N2D(<X2,Z2,X3,Z3>)
vpsllq    $32,%ymm0,%ymm0
vpor      64(%rsp),%ymm0,%ymm0
vpsllq    $32,%ymm1,%ymm1
vpor      %ymm1,%ymm9,%ymm9
vpsllq    $32,%ymm2,%ymm2
vpor      %ymm2,%ymm10,%ymm10
vpsllq    $32,%ymm3,%ymm3
vpor      %ymm3,%ymm11,%ymm11
vpsllq    $32,%ymm4,%ymm4
vpor      %ymm4,%ymm12,%ymm12
vpsllq    $32,%ymm5,%ymm5
vpor      %ymm5,%ymm13,%ymm13
vpsllq    $32,%ymm6,%ymm6
vpor      %ymm6,%ymm14,%ymm14
vpsllq    $32,%ymm7,%ymm7
vpor      %ymm7,%ymm15,%ymm15
vpsllq    $32,%ymm8,%ymm8
vpor      192(%rsp),%ymm8,%ymm8

subb      $1,%cl
cmpb	  $0,%cl
jge       .L2

movb	  $7,%cl
subq      $1,%r15
cmpq	  $0,%r15
jge       .L1

// <X2,Z2,X3,Z3> ← Pack-D2N(<X2',Z2',X3',Z3'>)
vpsrlq    $32,%ymm9,%ymm1
vpand     vecmask32,%ymm9,%ymm9
vpsrlq    $32,%ymm10,%ymm2
vpand     vecmask32,%ymm10,%ymm10
vpsrlq    $32,%ymm11,%ymm3
vpand     vecmask32,%ymm11,%ymm11
vpsrlq    $32,%ymm12,%ymm4
vpand     vecmask32,%ymm12,%ymm12
vpsrlq    $32,%ymm13,%ymm5
vpand     vecmask32,%ymm13,%ymm13
vpsrlq    $32,%ymm14,%ymm6
vpand     vecmask32,%ymm14,%ymm14
vpsrlq    $32,%ymm15,%ymm7
vpand     vecmask32,%ymm15,%ymm15

vmovdqa   %ymm7,96(%rsp)

vpand     vecmask32,%ymm0,%ymm7
vmovdqa   %ymm7,64(%rsp)
vpsrlq    $32,%ymm0,%ymm0

vpand     vecmask32,%ymm8,%ymm7
vmovdqa   %ymm7,160(%rsp)
vpsrlq    $32,%ymm8,%ymm8

vmovdqa   %ymm8,128(%rsp)

// <X2,Z2,X3,Z3> ← Reduce(<X2,Z2,X3,Z3>)
vmovdqa   64(%rsp),%ymm8
vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm9,%ymm9
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,64(%rsp)

vpsrlq    $29,%ymm9,%ymm7
vpaddq    %ymm7,%ymm10,%ymm10
vpand     vecmask29,%ymm9,%ymm9

vpsrlq    $29,%ymm10,%ymm7
vpaddq    %ymm7,%ymm11,%ymm11
vpand     vecmask29,%ymm10,%ymm10

vpsrlq    $29,%ymm11,%ymm7
vpaddq    %ymm7,%ymm12,%ymm12
vpand     vecmask29,%ymm11,%ymm11

vpsrlq    $29,%ymm12,%ymm7
vpaddq    %ymm7,%ymm13,%ymm13
vpand     vecmask29,%ymm12,%ymm12

vpsrlq    $29,%ymm13,%ymm7
vpaddq    %ymm7,%ymm14,%ymm14
vpand     vecmask29,%ymm13,%ymm13

vpsrlq    $29,%ymm14,%ymm7
vpaddq    %ymm7,%ymm15,%ymm15
vpand     vecmask29,%ymm14,%ymm14

vpsrlq    $29,%ymm15,%ymm7
vpaddq    160(%rsp),%ymm7,%ymm8
vpand     vecmask29,%ymm15,%ymm15

vpsrlq    $29,%ymm8,%ymm7
vpaddq    %ymm7,%ymm0,%ymm0
vpand     vecmask29,%ymm8,%ymm8
vmovdqa   %ymm8,224(%rsp)

vpsrlq    $29,%ymm0,%ymm7
vpaddq    %ymm7,%ymm1,%ymm1
vpand     vecmask29,%ymm0,%ymm0

vpsrlq    $29,%ymm1,%ymm7
vpaddq    %ymm7,%ymm2,%ymm2
vpand     vecmask29,%ymm1,%ymm1

vpsrlq    $29,%ymm2,%ymm7
vpaddq    %ymm7,%ymm3,%ymm3
vpand     vecmask29,%ymm2,%ymm2

vpsrlq    $29,%ymm3,%ymm7
vpaddq    %ymm7,%ymm4,%ymm4
vpand     vecmask29,%ymm3,%ymm3

vpsrlq    $29,%ymm4,%ymm7
vpaddq    %ymm7,%ymm5,%ymm5
vpand     vecmask29,%ymm4,%ymm4

vpsrlq    $29,%ymm5,%ymm7
vpaddq    %ymm7,%ymm6,%ymm6
vpand     vecmask29,%ymm5,%ymm5

vpsrlq    $29,%ymm6,%ymm7
vpaddq    96(%rsp),%ymm7,%ymm7
vpand     vecmask29,%ymm6,%ymm6

vpsrlq    $29,%ymm7,%ymm8
vpaddq    128(%rsp),%ymm8,%ymm8
vpand     vecmask29,%ymm7,%ymm7

vmovdqa   %ymm10,160(%rsp)
vpsrlq    $13,%ymm8,%ymm10
vpmuludq  vec45,%ymm10,%ymm10
vpaddq    64(%rsp),%ymm10,%ymm10
vpand     vecmask13,%ymm8,%ymm8

vmovdqa   %ymm11,192(%rsp)
vpsrlq    $29,%ymm10,%ymm11
vpaddq    %ymm11,%ymm9,%ymm9
vpand     vecmask29,%ymm10,%ymm10
vmovdqa   %ymm10,64(%rsp)

vmovdqa   160(%rsp),%ymm10
vmovdqa   192(%rsp),%ymm11

// Store output
vmovdqa   %ymm9, 32(%rdi)
vmovdqa   %ymm10,64(%rdi)
vmovdqa   %ymm11,96(%rdi)
vmovdqa   %ymm12,128(%rdi)
vmovdqa   %ymm13,160(%rdi)
vmovdqa   %ymm14,192(%rdi)
vmovdqa   %ymm15,224(%rdi)
vmovdqa   %ymm0, 288(%rdi)
vmovdqa   %ymm1, 320(%rdi)
vmovdqa   %ymm2, 352(%rdi)
vmovdqa   %ymm3, 384(%rdi)
vmovdqa   %ymm4, 416(%rdi)
vmovdqa   %ymm5, 448(%rdi)
vmovdqa   %ymm6, 480(%rdi)
vmovdqa   %ymm7, 512(%rdi)
vmovdqa   %ymm8, 544(%rdi)

vmovdqa   64(%rsp),%ymm0
vmovdqa   %ymm0, 0(%rdi)
vmovdqa   224(%rsp),%ymm0
vmovdqa   %ymm0, 256(%rdi)

movq 	  0(%rsp),%r11
movq 	  8(%rsp),%r12
movq 	  16(%rsp),%r13
movq 	  24(%rsp),%r14
movq 	  32(%rsp),%r15
movq 	  40(%rsp),%rbx
movq 	  48(%rsp),%rbp

movq 	  %r11,%rsp

ret
