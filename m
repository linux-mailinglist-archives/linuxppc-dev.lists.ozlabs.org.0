Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30EA674F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N4NF357JzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 21:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N44M30lNzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 21:10:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46N44L6hjgz9sN1; Tue,  3 Sep 2019 21:10:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46N44L34rnz9sDB;
 Tue,  3 Sep 2019 21:10:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 11/31] powernv/fadump: add fadump support on powernv
In-Reply-To: <156630272823.8896.18439144196389587229.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272823.8896.18439144196389587229.stgit@hbathini.in.ibm.com>
Date: Tue, 03 Sep 2019 21:10:25 +1000
Message-ID: <87sgpdr5y6.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Add basic callback functions for FADump on PowerNV platform.

I assume this doesn't actually work yet?

Does something block it from appearing to work at runtime?

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d8dcd88..fc4ecfe 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -566,7 +566,7 @@ config CRASH_DUMP
>  
>  config FA_DUMP
>  	bool "Firmware-assisted dump"
> -	depends on PPC64 && PPC_RTAS
> +	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
>  	select CRASH_CORE
>  	select CRASH_DUMP
>  	help
> @@ -577,7 +577,8 @@ config FA_DUMP
>  	  is meant to be a kdump replacement offering robustness and
>  	  speed not possible without system firmware assistance.
>  
> -	  If unsure, say "N"
> +	  If unsure, say "y". Only special kernels like petitboot may
> +	  need to say "N" here.
>  
>  config IRQ_ALL_CPUS
>  	bool "Distribute interrupts on all CPUs by default"
> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
> index d2c5b16..f6c52d3 100644
> --- a/arch/powerpc/kernel/fadump-common.h
> +++ b/arch/powerpc/kernel/fadump-common.h
> @@ -140,4 +140,13 @@ static inline int rtas_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
>  }
>  #endif
>  
> +#ifdef CONFIG_PPC_POWERNV
> +extern int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node);
> +#else
> +static inline int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
> +{
> +	return 1;
> +}

Extending the strange flat device tree calling convention to these
functions is not ideal.

It would be better I think if they just returned bool true/false for
"found it" / "not found", and then early_init_dt_scan_fw_dump() can
convert that into the appropriate return value.

> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index f7c8073..b8061fb9 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -114,6 +114,9 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
>  	if (strcmp(uname, "rtas") == 0)
>  		return rtas_fadump_dt_scan(&fw_dump, node);
>  
> +	if (strcmp(uname, "ibm,opal") == 0)
> +		return opal_fadump_dt_scan(&fw_dump, node);
> +

ie this would become:

	if (strcmp(uname, "ibm,opal") == 0 && opal_fadump_dt_scan(&fw_dump, node))
            return 1;

>  	return 0;
>  }
>  
> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
> index da2e99e..43a6e1c 100644
> --- a/arch/powerpc/platforms/powernv/Makefile
> +++ b/arch/powerpc/platforms/powernv/Makefile
> @@ -6,6 +6,7 @@ obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
>  obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
>  
>  obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
> +obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
>  obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
>  obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>  obj-$(CONFIG_EEH)	+= eeh-powernv.o
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> new file mode 100644
> index 0000000..e330877
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Firmware-Assisted Dump support on POWER platform (OPAL).
> + *
> + * Copyright 2019, IBM Corp.
> + * Author: Hari Bathini <hbathini@linux.ibm.com>
> + */
> +
> +#undef DEBUG

No undef again please.

> +#define pr_fmt(fmt) "opal fadump: " fmt
> +
> +#include <linux/string.h>
> +#include <linux/seq_file.h>
> +#include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
> +
> +#include <asm/opal.h>
> +
> +#include "../../kernel/fadump-common.h"
> +
> +static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
> +{
> +	return fadump_conf->reserve_dump_area_start;
> +}
> +
> +static int opal_fadump_register(struct fw_dump *fadump_conf)
> +{
> +	return -EIO;
> +}
> +
> +static int opal_fadump_unregister(struct fw_dump *fadump_conf)
> +{
> +	return -EIO;
> +}
> +
> +static int opal_fadump_invalidate(struct fw_dump *fadump_conf)
> +{
> +	return -EIO;
> +}
> +
> +static int __init opal_fadump_process(struct fw_dump *fadump_conf)
> +{
> +	return -EINVAL;
> +}
> +
> +static void opal_fadump_region_show(struct fw_dump *fadump_conf,
> +				    struct seq_file *m)
> +{
> +}
> +
> +static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
> +				const char *msg)
> +{
> +	int rc;
> +
> +	rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, msg);
> +	if (rc == OPAL_UNSUPPORTED) {
> +		pr_emerg("Reboot type %d not supported.\n",
> +			 OPAL_REBOOT_MPIPL);
> +	} else if (rc == OPAL_HARDWARE)
> +		pr_emerg("No backend support for MPIPL!\n");
> +}
> +
> +static struct fadump_ops opal_fadump_ops = {
> +	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
> +	.fadump_register		= opal_fadump_register,
> +	.fadump_unregister		= opal_fadump_unregister,
> +	.fadump_invalidate		= opal_fadump_invalidate,
> +	.fadump_process			= opal_fadump_process,
> +	.fadump_region_show		= opal_fadump_region_show,
> +	.fadump_trigger			= opal_fadump_trigger,
> +};
> +
> +int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
> +{
> +	unsigned long dn;
> +
> +	/*
> +	 * Check if Firmware-Assisted Dump is supported. if yes, check
> +	 * if dump has been initiated on last reboot.
> +	 */
> +	dn = of_get_flat_dt_subnode_by_name(node, "dump");
> +	if (dn == -FDT_ERR_NOTFOUND) {
> +		pr_debug("FADump support is missing!\n");
> +		return 1;
> +	}
> +
> +	if (!of_flat_dt_is_compatible(dn, "ibm,opal-dump")) {
> +		pr_err("Support missing for this f/w version!\n");
> +		return 1;
> +	}
> +
> +	fadump_conf->ops		= &opal_fadump_ops;
> +	fadump_conf->fadump_supported	= 1;
> +
> +	return 1;
> +}

cheers
