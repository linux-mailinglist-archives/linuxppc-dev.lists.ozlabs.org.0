Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6BD9132BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 10:28:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EczKiqnu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5nRP0PcDz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 18:28:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EczKiqnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5nQg0YF1z3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 18:27:21 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-709423bc2e5so2113876a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719044832; x=1719649632; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6TQTs/BZEjkv+SKgsGZVItEdwKpdKQEpShA+ZJRLwo=;
        b=EczKiqnupFhOUaVqcAVk6j8opLt6x5/2s3hkvlrBqLUtkMFwPWeAKme6n0o+YIBGhO
         llxsDzitdU1q4oq9aWqpDfCPZfBtmFAU9gXwOb8pI3l5KZqzF+EUxb0/aXcdzukX2gLJ
         G0hwaw6qHlaaTejxm2aNGmudIv+aMbyzUcW+4oc/SCTg0sZ2qz+nI7MsG00ASryVulnn
         cBfXXhzn14KSdZXo861MSm2TmpaQ08uM0eJt4WvepC0eGHlb0h9GaVKvbq0jVZv2hh0b
         EMCVrPra3n7nZOMYaqOryF879B8S5m/tohLJVKDqg6TKQ3pPhr3XCkxPyccE+HZNjP5C
         PlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719044832; x=1719649632;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6TQTs/BZEjkv+SKgsGZVItEdwKpdKQEpShA+ZJRLwo=;
        b=HVnFT5Q6tt8OsS4i5RXTKULd2/RvIZgtYjhTOKwPKZcD/ztU9ZOF143+iISNfXQdWK
         VZdaiDS3A6HODQuwhCOLSmoLrM/Cau+/9DNUIpvT4iBeR/JhU/LSfuhSya8muxtGr8sW
         m+qKGex8xOycrGqC/lnMV5LSwy035fDFx/+NkvoNDmevA2Dr1eR++d6IKdVzk3AzAYus
         jVrVguMch0IRgUblAJZA0lWWvK3x4zQN00JcIvYyD+LfzKvYiFt4eR9P8ydr/CCAf8rp
         /omF+WPp5aCcuaNlKKwEfQZe0KJa2f5qFQi1dul9a4COB7PDe1zFFQqThAlmAxpdh9ID
         OapQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/C14QEVqz9J0cYrkmfm46RD1/QwmC/Whkm34zoBq5hheIu7XEX0tKw9o+wwvsLzO36LSuwpOv2mg+cARCvto4LBF1LkMUbuvA+cRX0g==
X-Gm-Message-State: AOJu0YwqPVMInPfTft5ltMUbli6CYFzG4LPIlfszobZp4UIwbrBUXCMP
	Hu1bWg0OIfwNsFEpTDhjszQbm7dEYE7bjGM86o9mgdf0oj6tsao8adODTw==
X-Google-Smtp-Source: AGHT+IFonVvWAEDPZmEBMw6RGjOLTxMVryM6/C0H7pP6cZx7X97oiPzJ+9DKgZ0p9SQzgS502U13SA==
X-Received: by 2002:a05:6a20:3d8b:b0:1ad:6c36:ee82 with SMTP id adf61e73a8af0-1bcbb3b7b6amr14259781637.13.1719044831494;
        Sat, 22 Jun 2024 01:27:11 -0700 (PDT)
Received: from dw-tp ([171.76.84.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819db94ddsm2852254a91.43.2024.06.22.01.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:27:10 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
In-Reply-To: <20240620174614.53751-2-maddy@linux.ibm.com>
Date: Sat, 22 Jun 2024 13:10:18 +0530
Message-ID: <87msnd5st9.fsf@gmail.com>
References: <20240620174614.53751-1-maddy@linux.ibm.com> <20240620174614.53751-2-maddy@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, Madhavan Srinivasan <maddy@linux.ibm.com>, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a generic review and I haven't looked into the PAPR spec for
htmdump hcall and it's interface.

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
> With patch series applied and booted, list of files in debugfs path
>
> # pwd
> /sys/kernel/debug/powerpc/htmdump
> # ls
> coreindexonchip  htmtype  nodalchipindex  nodeindex  trace
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/Kconfig   |   8 ++
>  arch/powerpc/platforms/pseries/Makefile  |   1 +
>  arch/powerpc/platforms/pseries/htmdump.c | 130 +++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/htmdump.c
>
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index afc0f6a61337..46c0ea605e33 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -128,6 +128,14 @@ config CMM
>  	  will be reused for other LPARs. The interface allows firmware to
>  	  balance memory across many LPARs.
>
> +config HTMDUMP
> +	tristate "PHYP HTM data dumper"

Not sure if we can make machine_device_initcall() as a tristate?
Did we try compiling it as a module?

It we would like to keep this as a module - then why not use module_init
call and then make it depend upon...

depends on PPC_PSERIES && DEBUG_FS (??)

> +	default y

and then since this is mostly a debug trace facility, then we need not enable
it by default right?

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
> index 000000000000..540cdb7e069c
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
> +#include <linux/bitops.h>
> +#include <linux/string.h>
> +#include <linux/init.h>
> +#include <linux/moduleparam.h>
> +#include <linux/fs.h>
> +#include <linux/debugfs.h>
> +#include <linux/slab.h>
> +#include <linux/memory.h>
> +#include <linux/memory_hotplug.h>
> +#include <linux/numa.h>
> +#include <linux/memblock.h>
> +#include <asm/machdep.h>
> +#include <asm/plpar_wrappers.h>

Do we need all of the above?
e.g. slab, memory_hotplug etc are not needed IMO.

Maybe only?

#include <asm/hvcall.h>
#include <asm/io.h>
#include <asm/machdep.h>
#include <asm/plpar_wrappers.h>

#include <linux/debugfs.h>
#include <linux/module.h>

(module.h depending upon if we make it module_init())


> +
> +/* This enables us to keep track of the memory removed from each node. */
> +struct htmdump_entry {
> +	void *buf;
> +	struct dentry *dir;
> +	char name[16];
> +};
> +
> +static u32 nodeindex = 0;
> +static u32 nodalchipindex = 0;
> +static u32 coreindexonchip = 0;
> +static u32 htmtype = 0;
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
> +	switch(rc) {
> +	case H_SUCCESS:
> +	case H_PARTIAL:
> +		break;
> +	case H_NOT_AVAILABLE:
> +		return 0;
> +	case H_BUSY:
> +	case H_LONG_BUSY_ORDER_1_MSEC:
> +	case H_LONG_BUSY_ORDER_10_MSEC:
> +	case H_LONG_BUSY_ORDER_100_MSEC:
> +	case H_LONG_BUSY_ORDER_1_SEC:
> +	case H_LONG_BUSY_ORDER_10_SEC:
> +	case H_LONG_BUSY_ORDER_100_SEC:
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
> +static struct dentry *htmdump_debugfs_dir;
> +
> +static int htmdump_init_debugfs(void)
> +{
> +	struct htmdump_entry *ent;
> +
> +	ent = kcalloc(1, sizeof(struct htmdump_entry), GFP_KERNEL);
> +	if (!ent) {
> +		pr_err("Failed to allocate ent\n");
> +		return -EINVAL;
> +	}
> +
> +	ent->buf = kmalloc(BUFFER_SIZE, GFP_KERNEL);
> +	if (!ent->buf) {
> +		pr_err("Failed to allocate htmdump buf\n");
> +		return -ENOMEM;
> +	}
> +
> +	pr_debug("%s: ent:%lx buf:%lx\n",
> +			__func__, (long unsigned int)ent, (long unsigned int)ent->buf);
> +
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

minor nit: For all of the above. S_IRUSR | S_IWUSR instead of 0600.

> +	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, ent, &htmdump_fops);

maybe S_IRUSR instead of 0400.

(makes it more readable).

> +
> +	return 0;
> +}
> +
> +static int htmdump_init(void)

maybe put it into __init section?

> +{
> +	if (htmdump_init_debugfs())
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +machine_device_initcall(pseries, htmdump_init);
> --
> 2.45.2
