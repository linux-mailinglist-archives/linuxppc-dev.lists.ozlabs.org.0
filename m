Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA8A810C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 13:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NhNy4wY9zDqsC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 21:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NhM21J1pzDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46NhM1636Bz9sDB; Wed,  4 Sep 2019 21:25:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46NhM14Wspz9s4Y;
 Wed,  4 Sep 2019 21:25:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 12/31] powernv/fadump: register kernel metadata address
 with opal
In-Reply-To: <156630273573.8896.13875969842131147431.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630273573.8896.13875969842131147431.stgit@hbathini.in.ibm.com>
Date: Wed, 04 Sep 2019 21:25:15 +1000
Message-ID: <87a7bkqp5w.fsf@mpe.ellerman.id.au>
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
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index b8061fb9..a086a09 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -283,17 +286,17 @@ static void __init fadump_reserve_crash_area(unsigned long base,
>  
>  int __init fadump_reserve_mem(void)
>  {
> +	int ret = 1;
>  	unsigned long base, size, memory_boundary;

Please try to use reverse christmas tree style when possible.

> @@ -363,29 +366,43 @@ int __init fadump_reserve_mem(void)
>  		 * use memblock_find_in_range() here since it doesn't allocate
>  		 * from bottom to top.
>  		 */
> -		for (base = fw_dump.boot_memory_size;
> -		     base <= (memory_boundary - size);
> -		     base += size) {
> +		while (base <= (memory_boundary - size)) {
>  			if (memblock_is_region_memory(base, size) &&
>  			    !memblock_is_region_reserved(base, size))
>  				break;
> +
> +			base += size;
>  		}

Some of these changes look like they might not be necessary in this
patch, ie. could be split out into a lead-up patch. eg. the conversion
from for to while. But it's a bit hard to tell.

> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index e330877..e5c4700 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -13,14 +13,86 @@
>  #include <linux/seq_file.h>
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
> +#include <linux/mm.h>
>  
> +#include <asm/page.h>
>  #include <asm/opal.h>
>  
>  #include "../../kernel/fadump-common.h"
> +#include "opal-fadump.h"
> +
> +static struct opal_fadump_mem_struct *opal_fdm;
> +
> +/* Initialize kernel metadata */
> +static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
> +{
> +	fdm->version = OPAL_FADUMP_VERSION;
> +	fdm->region_cnt = 0;
> +	fdm->registered_regions = 0;
> +	fdm->fadumphdr_addr = 0;
> +}
>  
>  static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>  {
> -	return fadump_conf->reserve_dump_area_start;
> +	ulong addr = fadump_conf->reserve_dump_area_start;

I just noticed you're using ulong, which I haven't seen much before. KVM
uses it a lot but not much else.

Because this is all 64-bit only code I'd probably rather you just use
u64 explicitly to avoid anyone having to think about it.

> +
> +	opal_fdm = __va(fadump_conf->kernel_metadata);
> +	opal_fadump_init_metadata(opal_fdm);
> +
> +	opal_fdm->region_cnt = 1;
> +	opal_fdm->rgn[0].src	= RMA_START;
> +	opal_fdm->rgn[0].dest	= addr;
> +	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
> +	addr += fadump_conf->boot_memory_size;
> +
> +	/*
> +	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
> +	 * So, use it to save fadump header address instead of calculating it.
> +	 */
> +	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
> +				    fadump_conf->boot_memory_size);
> +
> +	return addr;
> +}
> +
> +static ulong opal_fadump_get_metadata_size(void)
> +{
> +	ulong size = sizeof(struct opal_fadump_mem_struct);
> +
> +	size = PAGE_ALIGN(size);
> +	return size;

	return PAGE_ALIGN(sizeof(struct opal_fadump_mem_struct));

???

> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
> new file mode 100644
> index 0000000..19cac1f
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Firmware-Assisted Dump support on POWER platform (OPAL).
> + *
> + * Copyright 2019, IBM Corp.
> + * Author: Hari Bathini <hbathini@linux.ibm.com>
> + */
> +
> +#ifndef __PPC64_OPAL_FA_DUMP_H__
> +#define __PPC64_OPAL_FA_DUMP_H__

Usual style is _ASM_POWERPC_OPAL_FADUMP_H.


> +/* OPAL FADump structure format version */
> +#define OPAL_FADUMP_VERSION			0x1

What is the meaning of this version? How/can we change it. What does it
mean if it's a different number? Please provide some comments or doco
describing how it's expected to be used.

We're defining some sort of ABI here and I want to understand/have
better documentation on what the implications of that are.

> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 2b94392..4111ee9 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -121,6 +121,21 @@ static ulong rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>  	return addr;
>  }
>  
> +/*
> + * On this platform, the metadata struture is passed while registering
> + * for FADump and the same is returned by f/w in capture kernel.
> + * No additional provision to setup kernel metadata separately.
> + */
> +static ulong rtas_fadump_get_metadata_size(void)
> +{
> +	return 0;
> +}
> +
> +static int rtas_fadump_setup_metadata(struct fw_dump *fadump_conf)
> +{
> +	return 0;
> +}

Each of these uses about 16 byes of text as well as space in the symbol
table. I think there's only one call site for each, so allowing the
callback to be NULL and skipping the call when it is would be slightly
more efficient.


> @@ -486,9 +501,10 @@ static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
>  	rtas_os_term((char *)msg);
>  }
>  
> -
>  static struct fadump_ops rtas_fadump_ops = {
>  	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
> +	.fadump_get_metadata_size	= rtas_fadump_get_metadata_size,
> +	.fadump_setup_metadata		= rtas_fadump_setup_metadata,
>  	.fadump_register		= rtas_fadump_register,
>  	.fadump_unregister		= rtas_fadump_unregister,
>  	.fadump_invalidate		= rtas_fadump_invalidate,

cheers
