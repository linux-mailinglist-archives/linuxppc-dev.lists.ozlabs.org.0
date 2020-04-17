Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9641AD578
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:07:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493PGV3GbWzDrF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 15:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493PDG6vpSzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 15:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pm+b49gs; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493PDG4CDGz9sQx;
 Fri, 17 Apr 2020 15:05:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587099918;
 bh=z+s+Qp25kwirOE3jBPZndwVtwdjbrv0mx7G9SdpeQkQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pm+b49gsaErJeAVa0cKs/EwF2MSVsQeX0s2IOM9y3ge0sgrXR4xnJWlYdI/U9CeK2
 1F4qGzB/kIqSMELGtlrmQjZwlaf/U0T+hQVyKYqvwJ3CBj8JdofYKqqtwsxtGHMb4t
 lL9ew3EeMSsNIuOA9OHvN38hRt6zjRoIQqx3EdB6C/HLzX06TZTKWawAIv10F1vZ6D
 aSdIGtrVCShCb3Z2KE0GCaSWp8xmRHmW4UrnVLLOqXpdTjqFrljxeJyEZqLI+kWxGt
 aVz6KiBG1xG5/yKwmxICriLPWqtSx9kqcxCCEbf4wy5OYdPUNFaySd2t8h3+Ln7vL7
 WwnDQjjOR87Yw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
Subject: Re: [PATCH V3 1/5] selftests/powerpc: Add header files for GZIP
 engine test
In-Reply-To: <20200413155916.16900-2-rzinsly@linux.ibm.com>
References: <20200413155916.16900-1-rzinsly@linux.ibm.com>
 <20200413155916.16900-2-rzinsly@linux.ibm.com>
Date: Fri, 17 Apr 2020 15:05:32 +1000
Message-ID: <87imhyitwj.fsf@mpe.ellerman.id.au>
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Raphael,

Some comments below ...

Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:
> Add files to access the powerpc NX-GZIP engine in user space.
>
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
> ---
>  .../selftests/powerpc/nx-gzip/inc/crb.h       | 159 ++++++++++++++++++
>  .../selftests/powerpc/nx-gzip/inc/nx-gzip.h   |  27 +++
>  .../powerpc/nx-gzip/inc/nx-helpers.h          |  54 ++++++
>  .../selftests/powerpc/nx-gzip/inc/nx.h        |  38 +++++
>  4 files changed, 278 insertions(+)
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx.h

It's standard to call the directory "include", can you rename it please?

> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
> new file mode 100644
> index 000000000000..9056e3dc1831
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __CRB_H
> +#define __CRB_H
> +#include <linux/types.h>
> +#include "nx.h"
> +
> +typedef unsigned char u8;
> +typedef unsigned int u32;
> +typedef unsigned long long u64;

The vast bulk of the code uses the stdint.h types, so it would be
preferable to either use those throughout or use the kernel types
throughout, eg. __u8, __u32, __u64, rather than defining your own here.


...
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
> new file mode 100644
> index 000000000000..75482c45574d
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright 2020 IBM Corp.
> + *
> + */
> +
> +#ifndef _UAPI_MISC_VAS_H
> +#define _UAPI_MISC_VAS_H

That's the wrong include guard.

> +
> +#include <asm/ioctl.h>
> +
> +#define VAS_FLAGS_PIN_WINDOW	0x1
> +#define VAS_FLAGS_HIGH_PRI	0x2
> +
> +#define VAS_FTW_SETUP		_IOW('v', 1, struct vas_gzip_setup_attr)
> +#define VAS_842_TX_WIN_OPEN	_IOW('v', 2, struct vas_gzip_setup_attr)
> +#define VAS_GZIP_TX_WIN_OPEN	_IOW('v', 0x20, struct vas_gzip_setup_attr)
> +
> +struct vas_gzip_setup_attr {
> +	int32_t		version;
> +	int16_t		vas_id;
> +	int16_t		reserved1;
> +	int64_t		flags;
> +	int64_t		reserved2[6];
> +};

This doesn't match the kernel header.

In fact you should just be able to symlink the uapi header.

> +#endif /* _UAPI_MISC_VAS_H */
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
> new file mode 100644
> index 000000000000..e0d68914c941
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <sys/time.h>
> +#include <asm/byteorder.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include "crb.h"
> +
> +#define cpu_to_be32		__cpu_to_be32
> +#define cpu_to_be64		__cpu_to_be64
> +#define be32_to_cpu		__be32_to_cpu
> +#define be64_to_cpu		__be64_to_cpu
> +
> +/*
> + * Several helpers/macros below were copied from the tree
> + * (kernel.h, nx-842.h, nx-ftw.h, asm-compat.h etc)
> + */
> +
> +/* from kernel.h */
> +#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
> +#define __round_mask(x, y)	((__typeof__(x))((y)-1))
> +#define round_up(x, y)		((((x)-1) | __round_mask(x, y))+1)
> +#define round_down(x, y)	((x) & ~__round_mask(x, y))

Unused?

> +#define min_t(t, x, y)	((x) < (y) ? (x) : (y))

Unused?

> +/*
> + * Get/Set bit fields. (from nx-842.h)
> + */
> +#define GET_FIELD(m, v)         (((v) & (m)) >> MASK_LSH(m))
> +#define MASK_LSH(m)             (__builtin_ffsl(m) - 1)
> +#define SET_FIELD(m, v, val)    \
> +		(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_LSH(m)) & (m)))

Unused?

> +
> +/* From asm-compat.h */
> +#define __stringify_in_c(...)	#__VA_ARGS__
> +#define stringify_in_c(...)	__stringify_in_c(__VA_ARGS__) " "
> +
> +#define	pr_debug
> +#define	pr_debug_ratelimited	printf
> +#define	pr_err			printf
> +#define	pr_err_ratelimited	printf
> +
> +#define WARN_ON_ONCE(x)		do {if (x) \
> +				printf("WARNING: %s:%d\n", __func__, __LINE__)\
> +				} while (0)

Unused?

> +extern void dump_buffer(char *msg, char *buf, int len);
> +extern void *alloc_aligned_mem(int len, int align, char *msg);
> +extern void get_payload(char *buf, int len);
> +extern void time_add(struct timeval *in, int seconds, struct timeval *out);
>
> +extern bool time_after(struct timeval *a, struct timeval *b);
> +extern long time_delta(struct timeval *a, struct timeval *b);
> +extern void dump_dde(struct data_descriptor_entry *dde, char *msg);
> +extern void copy_paste_crb_data(struct coprocessor_request_block *crb);

None of those externs appear to exist or be used.

> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
> new file mode 100644
> index 000000000000..1ae8348b59d6
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright 2020 IBM Corp.
> + *
> + */
> +#ifndef _NX_H
> +#define _NX_H
> +
> +#include <stdbool.h>
> +
> +#define	NX_FUNC_COMP_842	1
> +#define NX_FUNC_COMP_GZIP	2
> +
> +#ifndef __aligned
> +#define __aligned(x)	__attribute__((aligned(x)))
> +#endif
> +
> +struct nx842_func_args {
> +	bool use_crc;
> +	bool decompress;		/* true decompress; false compress */
> +	bool move_data;
> +	int timeout;			/* seconds */
> +};
> +
> +struct nxbuf_t {
> +	int len;
> +	char *buf;
> +};
> +
> +/* @function should be EFT (aka 842), GZIP etc */
> +extern void *nx_function_begin(int function, int pri);
> +
> +extern int nx_function(void *handle, struct nxbuf_t *in, struct nxbuf_t *out,
> +			void *arg);
> +
> +extern int nx_function_end(void *handle);

You don't need extern on function declarations in headers.

> +
> +#endif	/* _NX_H */
> -- 
> 2.21.0


cheers
