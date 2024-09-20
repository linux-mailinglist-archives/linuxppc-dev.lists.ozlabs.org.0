Return-Path: <linuxppc-dev+bounces-1495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157297D893
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 18:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9JJH1lZTz2y64;
	Sat, 21 Sep 2024 02:49:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726850959;
	cv=none; b=Kf90KgzMfskyGxAw5DH40InakghCoVL2ml7fJx3ESTOhV3DHnNGQbaZJKM8AhFQWoMF840lFA2bVSea2vKGL5JOF1C7j6g78yyyI2//GJ/Mo3Y05JZS8L3fn2qTXF/7nBVL77V2VPw3K6/9RvnVlsUchJPR0EMhAPnZgbLxvPxeAsNDNJdhDuazOMt350B1HAkbIYD0WGcPhfGqN/bFEVKuC3WxpUHKCIpSOCI061m2ITvfaIYxMZB8Ia0pYy8Q+zMbZB6J/IYwtnQVGxdUURmLu+7m6gu48Yrdl98P0H9CJj5v/oO8I5f5bY2oil2+Y5MriHzIVphvyJg5whZtVww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726850959; c=relaxed/relaxed;
	bh=2kHoXGpQxL3XPYrnN2xMP9YX8PHpsgIJNgRochE1QWs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GoW6Y4FSeyvCb4vrX/wg5KMjM0GU2yTL2qe4wnMFUNDgTs8oKQSFoK8RGvfaVPPbr7D0IAUqUoaZionDmZN6pw66zm+gSpjGwpIhAz3iGLhhrTigv9YRYX7SE4t620ZoAD5aIFxHIxFh2b34z/EOveKgoAVdqRoVtQiv8DFIo2kKSpuzn4Mt/S+M2GxgrgheDgACKPJsLn6RPoHA0UtxHI09Jq86kxnJ9VyKgUl6uqfxMb2UoG8bWNCZVR7qr9psVn1oVAti3AdlbO+7uI0VuqIE5A5pKDLbTmPOzAnH8o5lvMTEv7xJthhetBSh7OKaseeWpcUECMDGWNy53qXfZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WiRY5Q/x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WiRY5Q/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9JJG3MJDz2xxy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 02:49:17 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71781f42f75so2147136b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726850955; x=1727455755; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kHoXGpQxL3XPYrnN2xMP9YX8PHpsgIJNgRochE1QWs=;
        b=WiRY5Q/x2OE64X+8Z53OBYI4hUOAqNkl90c5QYoGsXYNwUNro99BfWKGAmLeYh4YKO
         p9RLSyliKOxEx6/J2l6DeXJZUMgkj28MRtWxSeraAifRcIQTxlLDJqL5/o9ideMbz3B/
         GtryvIaBlPhr8fv+QO6+s3fef5m6bb97V88ZTsECjfBtH1HzB182QLk8M/Z7TLqLjw3M
         ACMYe88vKsthPWGCjudYsSxqARxYof/hmBpMd+BKuxhkxBiYCyATv5s2Ja61Jd1mqKer
         gS/HdQHCfL8FNn7mz0N9fXqs04W+Il78ZpxJMYmJ5kLUpY4wsnQrsq1x1rlPo/y8ePWz
         CKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850955; x=1727455755;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kHoXGpQxL3XPYrnN2xMP9YX8PHpsgIJNgRochE1QWs=;
        b=KUTFu1DGgkBIWVBP0ZuFJDfh/mpbNtn3l1i6DT64qvNj9jAz8D+hQQ2Tm50VvTxXy+
         Zbi/brdh/yudYJ2mh90ye+trOPYH+ezF6GJuuxKeCuXROvwPz1uXo49lGI7wuf/hflhi
         40N0hKOeIAbtilIR+WKwKf6Gr0ijfFUN2CBh2iOtFJ2xRRgoK23C4AV7GFWLpyRXujdU
         aENduE4sYGTLcaRs/bqM5r7Z/ePVAmzeVFBOMqIZhsRiJDeJvAf6yr6NTxDFcyxPVEdJ
         +zUV7gGDUW8TdOKnLiAt2jro4jNm0iKRiYXQYxafplZ+w79LR2m2doJ7dxr1WSWrOZRP
         X/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBUgW3CeZIJJvSwV4dk1vuW3ZtsRGyVVqwPHEYt6/Vx5bkkAYfEemKMEt/+Y26DrHpRzlillQW6zqLCWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRK2BrJbDuQeMajHSmlpPBr8efvKFiEnuhucf5FDrCH1bA/6vs
	RH1zYaefAjqYY+UyhApURtVccXAjgYNzB0tnntW3zLGOVwHcvv+Z/YsXZQ==
X-Google-Smtp-Source: AGHT+IEaLnUVQi14uhzAIV/oKw0aTeDl8Mg00K+8OH3Z0MaLH6c6ck+hi6sLK7oZWN6FVNh1iQfPKA==
X-Received: by 2002:a05:6a21:4d8a:b0:1cf:9a86:73e4 with SMTP id adf61e73a8af0-1d30c9fa444mr5021347637.14.1726850954961;
        Fri, 20 Sep 2024 09:49:14 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b970f6sm10359449b3a.143.2024.09.20.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:49:14 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
In-Reply-To: <20240828085223.42177-2-maddy@linux.ibm.com>
Date: Fri, 20 Sep 2024 21:45:55 +0530
Message-ID: <87frpugv2c.fsf@gmail.com>
References: <20240828085223.42177-1-maddy@linux.ibm.com> <20240828085223.42177-2-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> This patch adds debugfs interface to export Hardware Trace Macro (HTM)
> function data in a LPAR. New hypervisor call "H_HTM" has been
> defined to setup, configure, control and dump the HTM data.
> This patch supports only dumping of HTM data in a LPAR.
> New debugfs folder called "htmdump" has been added under
> /sys/kernel/debug/arch path which contains files need to
> pass required parameters for the H_HTM dump function. New Kconfig
> option called "CONFIG_HTMDUMP" has been in platform/pseries for the same.
>
> With this module loaded, list of files in debugfs path
>
> /sys/kernel/debug/powerpc/htmdump
> coreindexonchip  htmtype  nodalchipindex  nodeindex  trace
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v2:
> - Made driver as modules based on review comments
> Changelog v1:
> - Changed from tristate to bool with dependency flags
> - Trimmed the include headers
>
>  arch/powerpc/platforms/pseries/Kconfig   |   9 ++
>  arch/powerpc/platforms/pseries/Makefile  |   1 +
>  arch/powerpc/platforms/pseries/htmdump.c | 130 +++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/htmdump.c
>
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index afc0f6a61337..a66be66d690e 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -128,6 +128,15 @@ config CMM
>  	  will be reused for other LPARs. The interface allows firmware to
>  	  balance memory across many LPARs.
>  
> +config HTMDUMP
> +	tristate "PHYP HTM data dumper"
> +	depends on PPC_PSERIES && DEBUG_FS
> +	default m
> +	help
> +	  Select this option, if you want to enable the kernel debugfs
> +	  interface to dump the Hardware Trace Macro (HTM) function data
> +	  in the LPAR.
> +
>  config HV_PERF_CTRS
>  	bool "Hypervisor supplied PMU events (24x7 & GPCI)"
>  	default y
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 7bf506f6b8c8..3f3e3492e436 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
>  obj-$(CONFIG_HVCS)		+= hvcserver.o
>  obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
>  obj-$(CONFIG_CMM)		+= cmm.o
> +obj-$(CONFIG_HTMDUMP)		+= htmdump.o
>  obj-$(CONFIG_IO_EVENT_IRQ)	+= io_event_irq.o
>  obj-$(CONFIG_LPARCFG)		+= lparcfg.o
>  obj-$(CONFIG_IBMVIO)		+= vio.o
> diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
> new file mode 100644
> index 000000000000..54c28525c4a7
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/htmdump.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) IBM Corporation, 2024
> + */
> +
> +#define pr_fmt(fmt) "htmdump: " fmt
> +
> +#include <linux/debugfs.h>
> +
> +#include <asm/machdep.h>
> +#include <asm/plpar_wrappers.h>
> +
> +/* This enables us to keep track of the memory removed from each node. */
> +struct htmdump_entry {
> +	void *buf;
> +	struct dentry *dir;
> +	char name[16];
> +};
>

How does dir and name gets used?
It isn't that obvious, so maybe a comment will be gr8.

> +static u32 nodeindex;
> +static u32 nodalchipindex;
> +static u32 coreindexonchip;
> +static u32 htmtype;
> +static struct dentry *htmdump_debugfs_dir;
> +static struct htmdump_entry *ent;
> +
> +#define BUFFER_SIZE PAGE_SIZE
> +
> +static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
> +			     size_t count, loff_t *ppos)
> +{
> +	struct htmdump_entry *ent = filp->private_data;
> +	unsigned long page, read_size, available;
> +	loff_t offset;
> +	long rc;
> +
> +	page = ALIGN_DOWN(*ppos, BUFFER_SIZE);
> +	offset = (*ppos) % BUFFER_SIZE;
> +
> +	rc = htm_get_dump_hardware(nodeindex, nodalchipindex, coreindexonchip,
> +				   htmtype, virt_to_phys(ent->buf), BUFFER_SIZE, page);
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +	case H_PARTIAL:
> +		break;
> +	case H_NOT_AVAILABLE:
> +		return 0;

Minor nits for error returns here...

Is returning 0 correct here? Maybe it is (since 0 means no data read),
but wanted to confirm if we should return -ENODATA, or -ENODEV 
(not sure what does H_NOT_AVAILABLE here means)

#define	ENODATA		61	/* No data available */

> +	case H_BUSY:
> +	case H_LONG_BUSY_ORDER_1_MSEC:
> +	case H_LONG_BUSY_ORDER_10_MSEC:
> +	case H_LONG_BUSY_ORDER_100_MSEC:
> +	case H_LONG_BUSY_ORDER_1_SEC:
> +	case H_LONG_BUSY_ORDER_10_SEC:
> +	case H_LONG_BUSY_ORDER_100_SEC:

Similarly for above maybe -EBUSY perhaps, instead of -EINVAL

#define	EBUSY		16	/* Device or resource busy */

> +	case H_PARAMETER:
> +	case H_P2:
> +	case H_P3:
> +	case H_P4:
> +	case H_P5:
> +	case H_P6:
> +	case H_STATE:
> +	case H_AUTHORITY:
> +		return -EINVAL;
> +	}
> +
> +	available = BUFFER_SIZE - offset;
> +	read_size = min(count, available);
> +	*ppos += read_size;
> +	return simple_read_from_buffer(ubuf, count, &offset, ent->buf, available);
> +}
> +
> +static const struct file_operations htmdump_fops = {
> +	.llseek = default_llseek,
> +	.read	= htmdump_read,
> +	.open	= simple_open,
> +};
> +
> +static int htmdump_init_debugfs(void)
> +{
> +	ent = kcalloc(1, sizeof(struct htmdump_entry), GFP_KERNEL);
> +	if (!ent) {
> +		pr_err("Failed to allocate ent\n");
> +		return -EINVAL;

return value can be -ENOMEM;

> +	}
> +
> +	ent->buf = kmalloc(BUFFER_SIZE, GFP_KERNEL);
> +	if (!ent->buf) {
> +		pr_err("Failed to allocate htmdump buf\n");
> +		return -ENOMEM;

kfree(ent)?


> +	}
> +
> +	pr_debug("%s: ent:%lx buf:%lx\n",
> +			__func__, (long unsigned int)ent, (long unsigned int)ent->buf);
> +

maybe %p perhaps? 


<Documentation/core-api/printk-formats.rst>
Plain Pointers
--------------

::

	%p	abcdef12 or 00000000abcdef12

Pointers printed without a specifier extension (i.e unadorned %p) are
hashed to prevent leaking information about the kernel memory layout. This
has the added benefit of providing a unique identifier.
<...>
...the aim of printing the address is to provide
more information for debugging, use %p and boot the kernel with the
``no_hash_pointers`` parameter during debugging, which will print all %p
addresses unmodified. If you *really* always want the unmodified address, see
%px below.


> +	htmdump_debugfs_dir = debugfs_create_dir("htmdump",
> +						  arch_debugfs_dir);
> +
> +	debugfs_create_u32("nodeindex", 0600,
> +			htmdump_debugfs_dir, &nodeindex);
> +	debugfs_create_u32("nodalchipindex", 0600,
> +			htmdump_debugfs_dir, &nodalchipindex);
> +	debugfs_create_u32("coreindexonchip", 0600,
> +			htmdump_debugfs_dir, &coreindexonchip);
> +	debugfs_create_u32("htmtype", 0600,
> +			htmdump_debugfs_dir, &htmtype);
> +	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, ent, &htmdump_fops);
> +
> +	return 0;
> +}
> +
> +static int __init htmdump_init(void)
> +{
> +	if (htmdump_init_debugfs())
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void __exit htmdump_exit(void)
> +{
> +	debugfs_remove_recursive(htmdump_debugfs_dir);
> +	kfree(ent->buf);
> +	kfree(ent);
> +}
> +
> +module_init(htmdump_init);
> +module_exit(htmdump_exit);
> +MODULE_DESCRIPTION("PHYP Hardware Trace Macro (HTM) data dumper");
> +MODULE_LICENSE("GPL");
> -- 
> 2.45.2

