Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614D408302
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 04:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7B4z2pvdz2yKF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 12:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nSLgExSp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=riteshh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nSLgExSp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7B495bZGz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 12:58:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18D10otN004440;
 Sun, 12 Sep 2021 22:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=lKHZgLdhefyEfjNb8plPsiWu9H7iTHOOujun2JrbqIM=;
 b=nSLgExSpqDsN+7S2bK39QYZuZes7S/7Q5EeTclKvxJqMGzT8KiI2X9Xue3IBSxdGqfDA
 3xUph23p7bp0y1U2PyAQHWYvgwZUtooLP3JOw3khhnz+T9qE+dFg9yBQnAEm8Z1Ncu0n
 +U7hA4VgxmuMqs3MmzDHlQ6COFP02AafCtoei78PpED/TEd0rJLjsBwZnJU6MP1qVGD2
 RxB59WtHYTRvJczhvrlEkTYv/tSxDNhA/ch0X42blJ3hUpdbQFqD7B43CDzX5TEQusTs
 09J5MEEyEwrQey/aEvTuaNMTmgGOwrgNFVZsk1+6m1xZtJM2yTIYhdNC9e91QSJTtF3S mQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b19h9f0cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Sep 2021 22:57:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18D2vIu4027507;
 Mon, 13 Sep 2021 02:57:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3b0m38t6v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 02:57:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18D2vkZO44695928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 02:57:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81D52A4053;
 Mon, 13 Sep 2021 02:57:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14A5EA404D;
 Mon, 13 Sep 2021 02:57:46 +0000 (GMT)
Received: from localhost (unknown [9.43.85.238])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 02:57:45 +0000 (GMT)
Date: Mon, 13 Sep 2021 08:27:45 +0530
From: Ritesh Harjani <riteshh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/1] selftests/powerpc: Add memmove_64 test
Message-ID: <20210913025745.g2jbspzcvpv76hrw@riteshh-domain>
References: <c152ad80dc3a80cd362f6cbbccd626798ab0d5db.1629300331.git.riteshh@linux.ibm.com>
 <87sfybl5f9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfybl5f9.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xwe_bJlEfMrOKp-LwRN82qpfYHPckEOW
X-Proofpoint-ORIG-GUID: Xwe_bJlEfMrOKp-LwRN82qpfYHPckEOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109120025
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/09/11 09:26PM, Michael Ellerman wrote:
> Ritesh Harjani <riteshh@linux.ibm.com> writes:
> > While debugging an issue, we wanted to check whether the arch specific
> > kernel memmove implementation is correct. This selftest could help test that.
> >
> > Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > Signed-off-by: Ritesh Harjani <riteshh@linux.ibm.com>
> > ---
> >  tools/testing/selftests/powerpc/Makefile      |  1 +
> >  .../selftests/powerpc/memmoveloop/.gitignore  |  2 +
> >  .../selftests/powerpc/memmoveloop/Makefile    | 19 +++++++
> >  .../powerpc/memmoveloop/asm/asm-compat.h      |  0
> >  .../powerpc/memmoveloop/asm/export.h          |  4 ++
> >  .../powerpc/memmoveloop/asm/feature-fixups.h  |  0
> >  .../selftests/powerpc/memmoveloop/asm/kasan.h |  0
> >  .../powerpc/memmoveloop/asm/ppc_asm.h         | 39 +++++++++++++
> >  .../powerpc/memmoveloop/asm/processor.h       |  0
> >  .../selftests/powerpc/memmoveloop/mem_64.S    |  1 +
> >  .../selftests/powerpc/memmoveloop/memcpy_64.S |  1 +
> >  .../selftests/powerpc/memmoveloop/stubs.S     |  8 +++
> >  .../selftests/powerpc/memmoveloop/validate.c  | 56 +++++++++++++++++++
> >  13 files changed, 131 insertions(+)
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/.gitignore
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/Makefile
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/export.h
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
> >  create mode 120000 tools/testing/selftests/powerpc/memmoveloop/mem_64.S
> >  create mode 120000 tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/stubs.S
> >  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/validate.c
>
> You've copied a lot of tools/testing/selftests/powerpc/copyloops
>
> I'd be happier if you integrated the memmove test into that existing
> code. I realise memmove is not technically a copy loop, but it's close
> enough.

Sure.
>
> Did you try that and hit some roadblock?
Nope, let me try that and send it in v2.

-ritesh

>
> cheers
>
>
> > diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
> > index 0830e63818c1..d110b3e5cbcd 100644
> > --- a/tools/testing/selftests/powerpc/Makefile
> > +++ b/tools/testing/selftests/powerpc/Makefile
> > @@ -16,6 +16,7 @@ export CFLAGS
> >  SUB_DIRS = alignment		\
> >  	   benchmarks		\
> >  	   cache_shape		\
> > +	   memmoveloop		\
> >  	   copyloops		\
> >  	   dscr			\
> >  	   mm			\
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/.gitignore b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
> > new file mode 100644
> > index 000000000000..56c1426013d5
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +memmove_64
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/Makefile b/tools/testing/selftests/powerpc/memmoveloop/Makefile
> > new file mode 100644
> > index 000000000000..d58d8c100099
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/Makefile
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +CFLAGS += -m64
> > +CFLAGS += -I$(CURDIR)
> > +CFLAGS += -D SELFTEST
> > +CFLAGS += -maltivec
> > +
> > +ASFLAGS = $(CFLAGS) -Wa,-mpower4
> > +
> > +TEST_GEN_PROGS := memmove_64
> > +EXTRA_SOURCES := validate.c ../harness.c stubs.S
> > +CPPFLAGS += -D TEST_MEMMOVE=test_memmove
> > +
> > +top_srcdir = ../../../../..
> > +include ../../lib.mk
> > +
> > +$(OUTPUT)/memmove_64: mem_64.S memcpy_64.S $(EXTRA_SOURCES)
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) \
> > +		-D TEST_MEMMOVE=test_memmove \
> > +		-o $@ $^
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h b/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/export.h b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
> > new file mode 100644
> > index 000000000000..e6b80d5fbd14
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
> > @@ -0,0 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#define EXPORT_SYMBOL(x)
> > +#define EXPORT_SYMBOL_GPL(x)
> > +#define EXPORT_SYMBOL_KASAN(x)
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h b/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h b/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
> > new file mode 100644
> > index 000000000000..117005c56e19
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
> > @@ -0,0 +1,39 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __SELFTESTS_POWERPC_PPC_ASM_H
> > +#define __SELFTESTS_POWERPC_PPC_ASM_H
> > +#include <ppc-asm.h>
> > +
> > +#define CONFIG_ALTIVEC
> > +
> > +#define r1	1
> > +
> > +#define R14 r14
> > +#define R15 r15
> > +#define R16 r16
> > +#define R17 r17
> > +#define R18 r18
> > +#define R19 r19
> > +#define R20 r20
> > +#define R21 r21
> > +#define R22 r22
> > +#define R29 r29
> > +#define R30 r30
> > +#define R31 r31
> > +
> > +#define STACKFRAMESIZE	256
> > +#define STK_REG(i)	(112 + ((i)-14)*8)
> > +
> > +#define _GLOBAL(A) FUNC_START(test_ ## A)
> > +#define _GLOBAL_TOC(A) _GLOBAL(A)
> > +#define _GLOBAL_TOC_KASAN(A) _GLOBAL(A)
> > +#define _GLOBAL_KASAN(A) _GLOBAL(A)
> > +
> > +#define PPC_MTOCRF(A, B)	mtocrf A, B
> > +
> > +#define BEGIN_FTR_SECTION
> > +#define FTR_SECTION_ELSE
> > +#define ALT_FTR_SECTION_END_IFCLR(x)
> > +#define ALT_FTR_SECTION_END(x, y)
> > +#define END_FTR_SECTION_IFCLR(x)
> > +
> > +#endif /* __SELFTESTS_POWERPC_PPC_ASM_H */
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h b/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/mem_64.S b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
> > new file mode 120000
> > index 000000000000..db254c9a5f5c
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
> > @@ -0,0 +1 @@
> > +../../../../../arch/powerpc/lib/mem_64.S
> > \ No newline at end of file
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
> > new file mode 120000
> > index 000000000000..cce33fb6f9d8
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
> > @@ -0,0 +1 @@
> > +../../../../../arch/powerpc/lib/memcpy_64.S
> > \ No newline at end of file
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/stubs.S b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
> > new file mode 100644
> > index 000000000000..d9baa832fa49
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#include <asm/ppc_asm.h>
> > +
> > +FUNC_START(memcpy)
> > +	b test_memcpy
> > +
> > +FUNC_START(backwards_memcpy)
> > +	b test_backwards_memcpy
> > diff --git a/tools/testing/selftests/powerpc/memmoveloop/validate.c b/tools/testing/selftests/powerpc/memmoveloop/validate.c
> > new file mode 100644
> > index 000000000000..52f7d32bb3fe
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/memmoveloop/validate.c
> > @@ -0,0 +1,56 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <malloc.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <assert.h>
> > +#include "utils.h"
> > +
> > +void *TEST_MEMMOVE(const void *s1, const void *s2, size_t n);
> > +
> > +#define BUF_LEN 65536
> > +#define MAX_OFFSET 512
> > +
> > +size_t max(size_t a, size_t b)
> > +{
> > +	if (a >= b) return a;
> > +	return b;
> > +}
> > +
> > +static int testcase_run(void)
> > +{
> > +	size_t i, src_off, dst_off, len;
> > +
> > +	char *usermap = memalign(BUF_LEN, BUF_LEN);
> > +	char *kernelmap = memalign(BUF_LEN, BUF_LEN);
> > +
> > +	assert(usermap != NULL);
> > +	assert(kernelmap != NULL);
> > +
> > +	memset(usermap, 0, BUF_LEN);
> > +	memset(kernelmap, 0, BUF_LEN);
> > +
> > +	for (i = 0; i < BUF_LEN; i++) {
> > +		usermap[i] = i & 0xff;
> > +		kernelmap[i] = i & 0xff;
> > +	}
> > +
> > +	for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
> > +		for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
> > +			for (len = 1; len < MAX_OFFSET - max(src_off, dst_off); len++) {
> > +
> > +				memmove(usermap + dst_off, usermap + src_off, len);
> > +				TEST_MEMMOVE(kernelmap + dst_off, kernelmap + src_off, len);
> > +				if (memcmp(usermap, kernelmap, MAX_OFFSET) != 0) {
> > +					printf("memmove failed at %ld %ld %ld\n", src_off, dst_off, len);
> > +					abort();
> > +				}
> > +			}
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> > +int main(void)
> > +{
> > +	return test_harness(testcase_run, "memmove");
> > +}
> > --
> > 2.31.1
