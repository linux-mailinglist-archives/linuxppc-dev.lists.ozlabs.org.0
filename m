Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B1407640
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 13:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H69S20rX7z2yWN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 21:26:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kYOrAmnk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kYOrAmnk; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H69RJ2xM6z2xWT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 21:26:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631359563;
 bh=Ngp4Tur6Nc6w73w1PxgVe6eMAUCz+1evyI853t2Xqxg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kYOrAmnkpyW5XVzUgQwAbBgEbN29oXEASGKj9ep4Mh9Inss3kSLrJ/MkvF6he8rFb
 PqajJbAACnAnKUeKU5xiiGVfNzQpalOa4mHOX3HChDMoM0CH0/gQIldm4DwT/MFyxI
 4oXxUmfXUDhYaYLSJwNhYdasbfabpFPgp+yuJVRbA774SjOYL2SqtsYbil1UKGVesZ
 QSCON3N/gWH8OG/57w1BURdIDKQn5MzKgWO5B6/HHZi6Hkppvdj30QJfaylBPNB5LE
 v8wG/JZpaNGahD6fFGKMMNqILBpKtYW8BHR7spGxkbjTD0O9RupQO0xmU6H27ncJH1
 aH4Oh/FUeiDDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H69RH0XkQz9sW5;
 Sat, 11 Sep 2021 21:26:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ritesh Harjani <riteshh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/1] selftests/powerpc: Add memmove_64 test
In-Reply-To: <c152ad80dc3a80cd362f6cbbccd626798ab0d5db.1629300331.git.riteshh@linux.ibm.com>
References: <c152ad80dc3a80cd362f6cbbccd626798ab0d5db.1629300331.git.riteshh@linux.ibm.com>
Date: Sat, 11 Sep 2021 21:26:02 +1000
Message-ID: <87sfybl5f9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Ritesh Harjani <riteshh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ritesh Harjani <riteshh@linux.ibm.com> writes:
> While debugging an issue, we wanted to check whether the arch specific
> kernel memmove implementation is correct. This selftest could help test that.
>
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Ritesh Harjani <riteshh@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/Makefile      |  1 +
>  .../selftests/powerpc/memmoveloop/.gitignore  |  2 +
>  .../selftests/powerpc/memmoveloop/Makefile    | 19 +++++++
>  .../powerpc/memmoveloop/asm/asm-compat.h      |  0
>  .../powerpc/memmoveloop/asm/export.h          |  4 ++
>  .../powerpc/memmoveloop/asm/feature-fixups.h  |  0
>  .../selftests/powerpc/memmoveloop/asm/kasan.h |  0
>  .../powerpc/memmoveloop/asm/ppc_asm.h         | 39 +++++++++++++
>  .../powerpc/memmoveloop/asm/processor.h       |  0
>  .../selftests/powerpc/memmoveloop/mem_64.S    |  1 +
>  .../selftests/powerpc/memmoveloop/memcpy_64.S |  1 +
>  .../selftests/powerpc/memmoveloop/stubs.S     |  8 +++
>  .../selftests/powerpc/memmoveloop/validate.c  | 56 +++++++++++++++++++
>  13 files changed, 131 insertions(+)
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/.gitignore
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/Makefile
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/export.h
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
>  create mode 120000 tools/testing/selftests/powerpc/memmoveloop/mem_64.S
>  create mode 120000 tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/stubs.S
>  create mode 100644 tools/testing/selftests/powerpc/memmoveloop/validate.c

You've copied a lot of tools/testing/selftests/powerpc/copyloops 

I'd be happier if you integrated the memmove test into that existing
code. I realise memmove is not technically a copy loop, but it's close
enough.

Did you try that and hit some roadblock?

cheers


> diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
> index 0830e63818c1..d110b3e5cbcd 100644
> --- a/tools/testing/selftests/powerpc/Makefile
> +++ b/tools/testing/selftests/powerpc/Makefile
> @@ -16,6 +16,7 @@ export CFLAGS
>  SUB_DIRS = alignment		\
>  	   benchmarks		\
>  	   cache_shape		\
> +	   memmoveloop		\
>  	   copyloops		\
>  	   dscr			\
>  	   mm			\
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/.gitignore b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
> new file mode 100644
> index 000000000000..56c1426013d5
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +memmove_64
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/Makefile b/tools/testing/selftests/powerpc/memmoveloop/Makefile
> new file mode 100644
> index 000000000000..d58d8c100099
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/Makefile
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +CFLAGS += -m64
> +CFLAGS += -I$(CURDIR)
> +CFLAGS += -D SELFTEST
> +CFLAGS += -maltivec
> +
> +ASFLAGS = $(CFLAGS) -Wa,-mpower4
> +
> +TEST_GEN_PROGS := memmove_64
> +EXTRA_SOURCES := validate.c ../harness.c stubs.S
> +CPPFLAGS += -D TEST_MEMMOVE=test_memmove
> +
> +top_srcdir = ../../../../..
> +include ../../lib.mk
> +
> +$(OUTPUT)/memmove_64: mem_64.S memcpy_64.S $(EXTRA_SOURCES)
> +	$(CC) $(CPPFLAGS) $(CFLAGS) \
> +		-D TEST_MEMMOVE=test_memmove \
> +		-o $@ $^
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h b/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/export.h b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
> new file mode 100644
> index 000000000000..e6b80d5fbd14
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
> @@ -0,0 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#define EXPORT_SYMBOL(x)
> +#define EXPORT_SYMBOL_GPL(x)
> +#define EXPORT_SYMBOL_KASAN(x)
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h b/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h b/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
> new file mode 100644
> index 000000000000..117005c56e19
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SELFTESTS_POWERPC_PPC_ASM_H
> +#define __SELFTESTS_POWERPC_PPC_ASM_H
> +#include <ppc-asm.h>
> +
> +#define CONFIG_ALTIVEC
> +
> +#define r1	1
> +
> +#define R14 r14
> +#define R15 r15
> +#define R16 r16
> +#define R17 r17
> +#define R18 r18
> +#define R19 r19
> +#define R20 r20
> +#define R21 r21
> +#define R22 r22
> +#define R29 r29
> +#define R30 r30
> +#define R31 r31
> +
> +#define STACKFRAMESIZE	256
> +#define STK_REG(i)	(112 + ((i)-14)*8)
> +
> +#define _GLOBAL(A) FUNC_START(test_ ## A)
> +#define _GLOBAL_TOC(A) _GLOBAL(A)
> +#define _GLOBAL_TOC_KASAN(A) _GLOBAL(A)
> +#define _GLOBAL_KASAN(A) _GLOBAL(A)
> +
> +#define PPC_MTOCRF(A, B)	mtocrf A, B
> +
> +#define BEGIN_FTR_SECTION
> +#define FTR_SECTION_ELSE
> +#define ALT_FTR_SECTION_END_IFCLR(x)
> +#define ALT_FTR_SECTION_END(x, y)
> +#define END_FTR_SECTION_IFCLR(x)
> +
> +#endif /* __SELFTESTS_POWERPC_PPC_ASM_H */
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h b/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/mem_64.S b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
> new file mode 120000
> index 000000000000..db254c9a5f5c
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
> @@ -0,0 +1 @@
> +../../../../../arch/powerpc/lib/mem_64.S
> \ No newline at end of file
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
> new file mode 120000
> index 000000000000..cce33fb6f9d8
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
> @@ -0,0 +1 @@
> +../../../../../arch/powerpc/lib/memcpy_64.S
> \ No newline at end of file
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/stubs.S b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
> new file mode 100644
> index 000000000000..d9baa832fa49
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ppc_asm.h>
> +
> +FUNC_START(memcpy)
> +	b test_memcpy
> +
> +FUNC_START(backwards_memcpy)
> +	b test_backwards_memcpy
> diff --git a/tools/testing/selftests/powerpc/memmoveloop/validate.c b/tools/testing/selftests/powerpc/memmoveloop/validate.c
> new file mode 100644
> index 000000000000..52f7d32bb3fe
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/memmoveloop/validate.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <malloc.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <assert.h>
> +#include "utils.h"
> +
> +void *TEST_MEMMOVE(const void *s1, const void *s2, size_t n);
> +
> +#define BUF_LEN 65536
> +#define MAX_OFFSET 512
> +
> +size_t max(size_t a, size_t b)
> +{
> +	if (a >= b) return a;
> +	return b;
> +}
> +
> +static int testcase_run(void)
> +{
> +	size_t i, src_off, dst_off, len;
> +
> +	char *usermap = memalign(BUF_LEN, BUF_LEN);
> +	char *kernelmap = memalign(BUF_LEN, BUF_LEN);
> +
> +	assert(usermap != NULL);
> +	assert(kernelmap != NULL);
> +
> +	memset(usermap, 0, BUF_LEN);
> +	memset(kernelmap, 0, BUF_LEN);
> +
> +	for (i = 0; i < BUF_LEN; i++) {
> +		usermap[i] = i & 0xff;
> +		kernelmap[i] = i & 0xff;
> +	}
> +
> +	for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
> +		for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
> +			for (len = 1; len < MAX_OFFSET - max(src_off, dst_off); len++) {
> +
> +				memmove(usermap + dst_off, usermap + src_off, len);
> +				TEST_MEMMOVE(kernelmap + dst_off, kernelmap + src_off, len);
> +				if (memcmp(usermap, kernelmap, MAX_OFFSET) != 0) {
> +					printf("memmove failed at %ld %ld %ld\n", src_off, dst_off, len);
> +					abort();
> +				}
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	return test_harness(testcase_run, "memmove");
> +}
> --
> 2.31.1
