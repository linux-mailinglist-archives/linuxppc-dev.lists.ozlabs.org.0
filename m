Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2FA6723
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:11:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N4631DWVzDqfp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 21:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N43h2ShkzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 21:09:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46N43h1cMKz9sDB; Tue,  3 Sep 2019 21:09:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46N43g57Ypz9s7T;
 Tue,  3 Sep 2019 21:09:51 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 02/31] powerpc/fadump: move internal code to a new file
In-Reply-To: <156630266000.8896.13603358349585118846.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630266000.8896.13603358349585118846.stgit@hbathini.in.ibm.com>
Date: Tue, 03 Sep 2019 21:09:47 +1000
Message-ID: <871rwxskjo.fsf@mpe.ellerman.id.au>
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
> Make way for refactoring platform specific FADump code by moving code
> that could be referenced from multiple places to fadump-common.c file.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/Makefile        |    2 
>  arch/powerpc/kernel/fadump-common.c |  140 ++++++++++++++++++++++++++++++++++
>  arch/powerpc/kernel/fadump-common.h |    8 ++
>  arch/powerpc/kernel/fadump.c        |  146 ++---------------------------------
>  4 files changed, 158 insertions(+), 138 deletions(-)
>  create mode 100644 arch/powerpc/kernel/fadump-common.c

I don't understand why we need fadump.c and fadump-common.c? They're
both common/shared across pseries & powernv aren't they?

By the end of the series we end up with 149 lines in fadump-common.c
which seems like a waste of time. Just put it all in fadump.c.

> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 56dfa7a..439d548 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
>  				  eeh_driver.o eeh_event.o eeh_sysfs.o
>  obj-$(CONFIG_GENERIC_TBSYNC)	+= smp-tbsync.o
>  obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
> -obj-$(CONFIG_FA_DUMP)		+= fadump.o
> +obj-$(CONFIG_FA_DUMP)		+= fadump.o fadump-common.o
>  ifdef CONFIG_PPC32
>  obj-$(CONFIG_E500)		+= idle_e500.o
>  endif
> diff --git a/arch/powerpc/kernel/fadump-common.c b/arch/powerpc/kernel/fadump-common.c
> new file mode 100644
> index 0000000..7f39e4f
> --- /dev/null
> +++ b/arch/powerpc/kernel/fadump-common.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Firmware-Assisted Dump internal code.
> + *
> + * Copyright 2011, IBM Corporation
> + * Author: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Can we not put emails in C files anymore please, they just bitrot, just
the names is fine.

> + * Copyright 2019, IBM Corp.
> + * Author: Hari Bathini <hbathini@linux.ibm.com>

These can just be:

 * Copyright 2011, Mahesh Salgaonkar, IBM Corporation.
 * Copyright 2019, Hari Bathini, IBM Corporation.

> + */
> +
> +#undef DEBUG

Don't undef DEBUG please.

> +#define pr_fmt(fmt) "fadump: " fmt
> +
> +#include <linux/memblock.h>
> +#include <linux/elf.h>
> +#include <linux/mm.h>
> +#include <linux/crash_core.h>
> +
> +#include "fadump-common.h"
> +
> +void *fadump_cpu_notes_buf_alloc(unsigned long size)
> +{
> +	void *vaddr;
> +	struct page *page;
> +	unsigned long order, count, i;
> +
> +	order = get_order(size);
> +	vaddr = (void *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, order);
> +	if (!vaddr)
> +		return NULL;
> +
> +	count = 1 << order;
> +	page = virt_to_page(vaddr);
> +	for (i = 0; i < count; i++)
> +		SetPageReserved(page + i);
> +	return vaddr;
> +}

I realise you're just moving this code, but why do we need all this hand
rolled allocation stuff?

cheers
