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

#include "basic_types.h"
#include "gf_p50645_type.h"
#include "gf_p50645_pack.h"
#include "gf_p50645_arith.h"
#include "M996558.h"

int M996558_scalarmult(uchar8 *q, const uchar8 *n, const uchar8 *p) {

	vec r[NLIMBS_VEC] = {0};
	vec t[NLIMBS_VEC] = {0};

	gfe_p50645_18L u,v;
	gfe_p50645_8L w,x,z,zinv;

	uchar8 i,s[CRYPTO_BYTES];

	for (i=0;i<CRYPTO_BYTES;++i) s[i] = n[i];
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] & 0x03;
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] | 0x02;
	s[0] = s[0] & 0xFC;

	gfp50645pack(&u,p);

	t[0][0] = t[0][3] = r[0][2] = 1; 
	
	for (i=0;i<NLIMBS_VEC;++i) {t[i][2] = u.l[i]; r[i][3] = u.l[i];}

	M996558_mladder(t,r,s);

	for (i=0;i<NLIMBS_VEC;++i) {u.l[i] = t[i][0]; v.l[i] = t[i][1];}

	gfp50645pack188(&x,&u);
	gfp50645pack188(&z,&v);

	#if defined(__ADX__)

		gfp50645invx(&zinv,&z);
		gfp50645mulx(&w,&zinv,&x);
	#else
		gfp50645inv(&zinv,&z);
		gfp50645mul(&w,&zinv,&x);
	#endif

	gfp50645reduce(&w);
	gfp50645makeunique(&w);
	gfp50645unpack(q,&w);

	return 0;
}

int M996558_scalarmult_base(uchar8 *q, const uchar8 *n, const uchar8 *p) {

	vec r,t[NLIMBS_VEC] = {0};

	gfe_p50645_18L u,v;
	gfe_p50645_8L w,x,z,zinv;

	uchar8 i,s[CRYPTO_BYTES];

	for (i=0;i<CRYPTO_BYTES;++i) s[i] = n[i];
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] | 0x03;
        s[CRYPTO_BYTES-1] = s[CRYPTO_BYTES-1] | 0x02;
	s[0] = s[0] & 0xFC;

	gfp50645pack(&u,p);

	t[0][0] = t[0][3] = r[0] = r[1] = r[2] = 1; r[3] = u.l[0];
	
	for (i=0;i<NLIMBS_VEC;++i) t[i][2] = u.l[i];

	M996558_mladder_base(t,r,s);

	for (i=0;i<NLIMBS_VEC;++i) {u.l[i] = t[i][0]; v.l[i] = t[i][1];}

	gfp50645pack188(&x,&u);
	gfp50645pack188(&z,&v);

	#if defined(__ADX__)

		gfp50645invx(&zinv,&z);
		gfp50645mulx(&w,&zinv,&x);
	#else
		gfp50645inv(&zinv,&z);
		gfp50645mul(&w,&zinv,&x);
	#endif

	gfp50645reduce(&w);
	gfp50645makeunique(&w);
	gfp50645unpack(q,&w);

	return 0;
}