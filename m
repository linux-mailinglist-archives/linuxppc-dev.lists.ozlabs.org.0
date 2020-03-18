Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC795189497
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:50:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hwzB3vNrzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 14:49:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=KmOYOjPH; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hwxk546KzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 14:48:40 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id t24so12903597pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NQ71pWS4CDzeLhtKX33i6z5Q3NELgccLvC3S+vOGNeI=;
 b=KmOYOjPH1YW1EvXspC9T76uxpMurxjN6d2gmgXhFmxFWiGThJx7e5AQehVFYY95U/Y
 y2/loVq3Wp9+zzCbDxC2c1qwaDIlexntj6AdZWGgUkjouYL4NwjWtFS+N81YzZY1puGy
 NIXSo5z1LYCHEowv1rdOoQOOMnq2dDf1GdSXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NQ71pWS4CDzeLhtKX33i6z5Q3NELgccLvC3S+vOGNeI=;
 b=bsh0BsTUKDKsi44vGpnV/zJR9W73AyL/RDM/+yMVb9zgJRtwL95fASa8yVRmJDn4rz
 46Kc3nXCXGoPxHt61fk6h5lN/d0PpWo4dBkhIR0H9aj34hOAhg53etktxYIxQo725n7q
 8jmVS0+ST7kDzl+YVLcGJWB564G3vnQZes4W7oYYLalGolRZh0qjS8bBLRicaoPC/xzO
 0Xg9YCUmJDq9yOpJcMv/FZw322fbZx6nKEQTR38Y2UiXFhghL4lfc0SinhTg2nD6xA+I
 uNt2rpwRpsfdcO3ViNaf8Jn10rc7b506N3NGqlxgqlOf8zPgS+EGhFQJC40BnBulTrOH
 OKTg==
X-Gm-Message-State: ANhLgQ09Xb1LOJ7zNzcjg5WMIofOq2RFQpaZW9xyw23JVPH5Jqjh9M1W
 KgY5LVTcaGBp3SxErPVSTRsQOQ==
X-Google-Smtp-Source: ADFU+vsGpnKqzl0gtyH2nx0A5yNsxabVE/R/unJ9o3dtKDXDRRxTs/98a/zIBiPrWpb+wcePp9U3Cg==
X-Received: by 2002:a63:2cc3:: with SMTP id s186mr2474521pgs.71.1584503317040; 
 Tue, 17 Mar 2020 20:48:37 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-11e1-e7cb-3c10-05d6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:11e1:e7cb:3c10:5d6])
 by smtp.gmail.com with ESMTPSA id d3sm4646924pfq.126.2020.03.17.20.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 20:48:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 1/5] selftests/powerpc: Add header files for GZIP engine
 test
In-Reply-To: <20200316180714.18631-2-rzinsly@linux.ibm.com>
References: <20200316180714.18631-1-rzinsly@linux.ibm.com>
 <20200316180714.18631-2-rzinsly@linux.ibm.com>
Date: Wed, 18 Mar 2020 14:48:32 +1100
Message-ID: <87d09anx0v.fsf@dja-thinkpad.axtens.net>
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
 Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is throwing a number of snowpatch warnings, as well as a whitespace
warning when I apply it. Please could you check the warnings at
https://patchwork.ozlabs.org/patch/1255779/

It looks like the rest of the series also throws some warnings - please
check those also.

Kind regards,
Daniel


Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:

> Add files to access the powerpc NX-GZIP engine in user space.
>
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
> ---
>  .../selftests/powerpc/nx-gzip/inc/crb.h       | 170 ++++++++++++++++++
>  .../selftests/powerpc/nx-gzip/inc/nx-gzip.h   |  27 +++
>  .../powerpc/nx-gzip/inc/nx-helpers.h          |  53 ++++++
>  .../selftests/powerpc/nx-gzip/inc/nx.h        |  30 ++++
>  4 files changed, 280 insertions(+)
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-gzip.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
>
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
> new file mode 100644
> index 000000000000..6af25fb8461a
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/crb.h
> @@ -0,0 +1,170 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __CRB_H
> +#define __CRB_H
> +#include <linux/types.h>
> +
> +typedef unsigned char u8;
> +typedef unsigned int u32;
> +typedef unsigned long long u64;
> +
> +/* From nx-842.h */
> +
> +/* CCW 842 CI/FC masks
> + * NX P8 workbook, section 4.3.1, figure 4-6
> + * "CI/FC Boundary by NX CT type"
> + */
> +#define CCW_CI_842              (0x00003ff8)
> +#define CCW_FC_842              (0x00000007)
> +
> +/* end - nx-842.h */
> +
> +#ifndef __aligned
> +#define __aligned(x)            __attribute__((aligned(x)))
> +#endif
> +
> +#ifndef __packed
> +#define __packed        __attribute__((packed))
> +#endif
> +
> +/* Chapter 6.5.8 Coprocessor-Completion Block (CCB) */
> +
> +#define CCB_VALUE		(0x3fffffffffffffff)
> +#define CCB_ADDRESS		(0xfffffffffffffff8)
> +#define CCB_CM			(0x0000000000000007)
> +#define CCB_CM0			(0x0000000000000004)
> +#define CCB_CM12		(0x0000000000000003)
> +
> +#define CCB_CM0_ALL_COMPLETIONS	(0x0)
> +#define CCB_CM0_LAST_IN_CHAIN	(0x4)
> +#define CCB_CM12_STORE		(0x0)
> +#define CCB_CM12_INTERRUPT	(0x1)
> +
> +#define CCB_SIZE		(0x10)
> +#define CCB_ALIGN		CCB_SIZE
> +
> +struct coprocessor_completion_block {
> +	__be64 value;
> +	__be64 address;
> +} __packed __aligned(CCB_ALIGN);
> +
> +
> +/* Chapter 6.5.7 Coprocessor-Status Block (CSB) */
> +
> +#define CSB_V			(0x80)
> +#define CSB_F			(0x04)
> +#define CSB_CH			(0x03)
> +#define CSB_CE_INCOMPLETE	(0x80)
> +#define CSB_CE_TERMINATION	(0x40)
> +#define CSB_CE_TPBC		(0x20)
> +
> +#define CSB_CC_SUCCESS		(0)
> +#define CSB_CC_INVALID_ALIGN	(1)
> +#define CSB_CC_OPERAND_OVERLAP	(2)
> +#define CSB_CC_DATA_LENGTH	(3)
> +#define CSB_CC_TRANSLATION	(5)
> +#define CSB_CC_PROTECTION	(6)
> +#define CSB_CC_RD_EXTERNAL	(7)
> +#define CSB_CC_INVALID_OPERAND	(8)
> +#define CSB_CC_PRIVILEGE	(9)
> +#define CSB_CC_INTERNAL		(10)
> +#define CSB_CC_WR_EXTERNAL	(12)
> +#define CSB_CC_NOSPC		(13)
> +#define CSB_CC_EXCESSIVE_DDE	(14)
> +#define CSB_CC_WR_TRANSLATION	(15)
> +#define CSB_CC_WR_PROTECTION	(16)
> +#define CSB_CC_UNKNOWN_CODE	(17)
> +#define CSB_CC_ABORT		(18)
> +#define CSB_CC_TRANSPORT	(20)
> +#define CSB_CC_SEGMENTED_DDL	(31)
> +#define CSB_CC_PROGRESS_POINT	(32)
> +#define CSB_CC_DDE_OVERFLOW	(33)
> +#define CSB_CC_SESSION		(34)
> +#define CSB_CC_PROVISION	(36)
> +#define CSB_CC_CHAIN		(37)
> +#define CSB_CC_SEQUENCE		(38)
> +#define CSB_CC_HW		(39)
> +
> +#define CSB_SIZE		(0x10)
> +#define CSB_ALIGN		CSB_SIZE
> +
> +struct coprocessor_status_block {
> +	u8 flags;
> +	u8 cs;
> +	u8 cc;
> +	u8 ce;
> +	__be32 count;
> +	__be64 address;
> +} __packed __aligned(CSB_ALIGN);
> +
> +
> +/* Chapter 6.5.10 Data-Descriptor List (DDL)
> + * each list contains one or more Data-Descriptor Entries (DDE)
> + */
> +
> +#define DDE_P			(0x8000)
> +
> +#define DDE_SIZE		(0x10)
> +#define DDE_ALIGN		DDE_SIZE
> +
> +struct data_descriptor_entry {
> +	__be16 flags;
> +	u8 count;
> +	u8 index;
> +	__be32 length;
> +	__be64 address;
> +} __packed __aligned(DDE_ALIGN);
> +
> +
> +/* Chapter 6.5.2 Coprocessor-Request Block (CRB) */
> +
> +#define CRB_SIZE		(0x80)
> +#define CRB_ALIGN		(0x100) /* Errata: requires 256 alignment */
> +
> +
> +/* Coprocessor Status Block field
> + *   ADDRESS	address of CSB
> + *   C		CCB is valid
> + *   AT		0 = addrs are virtual, 1 = addrs are phys
> + *   M		enable perf monitor
> + */
> +#define CRB_CSB_ADDRESS		(0xfffffffffffffff0)
> +#define CRB_CSB_C		(0x0000000000000008)
> +#define CRB_CSB_AT		(0x0000000000000002)
> +#define CRB_CSB_M		(0x0000000000000001)
> +
> +struct coprocessor_request_block {
> +	__be32 ccw;
> +	__be32 flags;
> +	__be64 csb_addr;
> +
> +	struct data_descriptor_entry source;
> +	struct data_descriptor_entry target;
> +
> +	struct coprocessor_completion_block ccb;
> +
> +	u8 reserved[48];
> +
> +	struct coprocessor_status_block csb;
> +} __packed __aligned(CRB_ALIGN);
> +
> +#define crb_csb_addr(c)         __be64_to_cpu(c->csb_addr)
> +#define crb_nx_fault_addr(c)    __be64_to_cpu(c->stamp.nx.fault_storage_addr)
> +#define crb_nx_flags(c)         c->stamp.nx.flags
> +#define crb_nx_fault_status(c)  c->stamp.nx.fault_status
> +#define crb_nx_pswid(c)		c->stamp.nx.pswid;
> +
> +
> +/* RFC02167 Initiate Coprocessor Instructions document
> + * Chapter 8.2.1.1.1 RS
> + * Chapter 8.2.3 Coprocessor Directive
> + * Chapter 8.2.4 Execution
> + *
> + * The CCW must be converted to BE before passing to icswx()
> + */
> +
> +#define CCW_PS                  (0xff000000)
> +#define CCW_CT                  (0x00ff0000)
> +#define CCW_CD                  (0x0000ffff)
> +#define CCW_CL                  (0x0000c000)
> +
> +#endif
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
> +
> +#endif /* _UAPI_MISC_VAS_H */
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
> new file mode 100644
> index 000000000000..201cf9f86a97
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx-helpers.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <sys/time.h>
> +#include <asm/byteorder.h>
> +#include <stdint.h>
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
> +
> +#define min_t(t, x, y)	((x) < (y) ? (x) : (y))
> +/*
> + * Get/Set bit fields. (from nx-842.h)
> + */
> +#define GET_FIELD(m, v)         (((v) & (m)) >> MASK_LSH(m))
> +#define MASK_LSH(m)             (__builtin_ffsl(m) - 1)
> +#define SET_FIELD(m, v, val)    \
> +		(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_LSH(m)) & (m)))
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
> +#define WARN_ON_ONCE(x)		if (x) \
> +				printf("WARNING: %s:%d\n", __func__, __LINE__)
> +
> +extern void dump_buffer(char *msg, char *buf, int len);
> +extern void *alloc_aligned_mem(int len, int align, char *msg);
> +extern void get_payload(char *buf, int len);
> +extern void time_add(struct timeval *in, int seconds, struct timeval *out);
> +
> +typedef int bool;
> +extern bool time_after(struct timeval *a, struct timeval *b);
> +extern long time_delta(struct timeval *a, struct timeval *b);
> +extern void dump_dde(struct data_descriptor_entry *dde, char *msg);
> +extern void copy_paste_crb_data(struct coprocessor_request_block *crb);
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
> new file mode 100644
> index 000000000000..08c93f7fb96c
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/inc/nx.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright 2020 IBM Corp.
> + *
> + */
> +
> +#define	NX_FUNC_COMP_842	1
> +#define NX_FUNC_COMP_GZIP	2
> +
> +typedef int bool;
> +
> +struct nx842_func_args {
> +	bool use_crc;
> +	bool decompress;		/* true: decompress; false compress */
> +	bool move_data;
> +	int timeout;			/* seconds */
> +};
> +
> +typedef struct {
> +	int len;
> +	char *buf;
> +} nxbuf_t;
> +
> +/* @function should be EFT (aka 842), GZIP etc */
> +extern void *nx_function_begin(int function, int pri);
> +
> +extern int nx_function(void *handle, nxbuf_t *in, nxbuf_t *out, void *arg);
> +
> +extern int nx_function_end(void *handle);
> +
> -- 
> 2.21.0
