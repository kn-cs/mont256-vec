#+-----------------------------------------------------------------------------+
#| This code corresponds to the the paper "Kummer versus Montgomery Face-off   |
#| over Prime Order Fields" by						       |
#| Kaushik Nath,  Indian Statistical Institute, Kolkata, India, and            |
#| Palash Sarkar, Indian Statistical Institute, Kolkata, India.	               |
#+-----------------------------------------------------------------------------+
#| Copyright (c) 2021, Kaushik Nath, Palash Sarkar.                            |
#|                                                                             |
#| Permission to use this code is granted.                          	       |
#|                                                                             |
#| Redistribution and use in source and binary forms, with or without          |
#| modification, are permitted provided that the following conditions are      |
#| met:                                                                        |
#|                                                                             |
#| * Redistributions of source code must retain the above copyright notice,    |
#|   this list of conditions and the following disclaimer.                     |
#|                                                                             |
#| * Redistributions in binary form must reproduce the above copyright         |
#|   notice, this list of conditions and the following disclaimer in the       |
#|   documentation and/or other materials provided with the distribution.      |
#|                                                                             |
#| * The names of the contributors may not be used to endorse or promote       |
#|   products derived from this software without specific prior written        |
#|   permission.                                                               |
#+-----------------------------------------------------------------------------+
#| THIS SOFTWARE IS PROVIDED BY THE AUTHORS ""AS IS"" AND ANY EXPRESS OR       |
#| IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES   |
#| OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.     |
#| IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,      |
#| INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT    |
#| NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
#| DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY       |
#| THEORY LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING |
#| NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,| 
#| EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          |
#+-----------------------------------------------------------------------------+

INCDRS = -I../include/

SRCFLS = ../source/M996558_const.s 		\
	 ../source/M996558_mladder.s		\
	 ../source/M996558_mladder_base.s	\
	 ../source/gf_p50645_mulx.s 		\
	 ../source/gf_p50645_nsqrx.s 		\
	 ../source/gf_p50645_mul.s 		\
	 ../source/gf_p50645_nsqr.s 		\
	 ../source/gf_p50645_makeunique.s 	\
	 ../source/gf_p50645_pack.c		\
	 ../source/gf_p50645_inv.c 		\
	 ../source/M996558_scalarmult.c		\
	  ./M996558_test.c
         
OBJFLS = ../source/M996558_const.o 		\
	 ../source/M996558_mladder.o		\
	 ../source/M996558_mladder_base.o	\
	 ../source/gf_p50645_mulx.o 		\
	 ../source/gf_p50645_nsqrx.o 		\
	 ../source/gf_p50645_mul.o 		\
	 ../source/gf_p50645_nsqr.o 		\
	 ../source/gf_p50645_makeunique.o 	\
	 ../source/gf_p50645_pack.o		\
	 ../source/gf_p50645_inv.o 		\
	 ../source/M996558_scalarmult.o		\
	  ./M996558_test.o

EXE    = M996558_test

#CFLAGS = -march=haswell -mtune=haswell -mavx2 -m64 -O3 -funroll-loops -fomit-frame-pointer
CFLAGS = -march=skylake -mtune=skylake -mavx2 -m64 -O3 -funroll-loops -fomit-frame-pointer

CC     = gcc
LL     = gcc

$(EXE): $(OBJFLS)
	$(LL) -o $@ $(OBJFLS) -lm -no-pie

.c.o:
	$(CC) $(INCDRS) $(CFLAGS) -o $@ -c $<

clean:
	-rm $(EXE)
	-rm $(OBJFLS)
