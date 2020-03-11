Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5275181058
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 07:05:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48chJL1jX0zDqXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 17:05:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=209.85.214.196;
 helo=mail-pl1-f196.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48chGw6K4bzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 17:03:48 +1100 (AEDT)
Received: by mail-pl1-f196.google.com with SMTP id w12so553005pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=z8609wnYeWM4sQs0oWODebpUweUOgM1KYQF7Uwz5+vI=;
 b=TTk96AoCDK6lTwmIwZ4oCfX2igI5LUohyL86QuLe143nSMzxX+4nSFmPWoEyslljR9
 U+TSVIvp1Wy4GmqSMKP89TU0/V9g6AflTCwCdV6zEgskUbRWL0O3mHq9wiKE3mUOihAN
 bGBy76nHD9rqzaYASuCE/DkiLnPDumm6CeXiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=z8609wnYeWM4sQs0oWODebpUweUOgM1KYQF7Uwz5+vI=;
 b=AEHyNkjtrxefIq2QfWz7y36k2NJZLtN/gRX4fiukp8dzUcbH5yuJiG4L357gU6Wv40
 JToPGdjj85WYDm6qd/7AfFWX+o4Zb/TQi52CuFfaRiFlXqQOMKMy33VENKpljfaCJgqf
 ZzyWJNHsEoftRHj/8ZyVducwZpeclQ3qywcukmIfjBOgNvbsvAJ/Lxsj/5wJKVG/SUcp
 UgZExZ/JM3SRAH8rzQrZ4vD22l5OWLdDz6/fhQN6skcHZLGnjxedGm07GPjNFFNN7o0B
 mpeLwjAAcZzf7nJMP1T2eeHbWJP3qRsywKRauC0PlboN/SmbOL/y/ZniC8Ay8jb+Dfr8
 PY0w==
X-Gm-Message-State: ANhLgQ30lp5bVII8/s5lrM8PFW4uf43xpq5eMCGaJSf2cn3R11qDSVLq
 6+6AT3EsCZNt8r7L+aKs9fpxrQ==
X-Google-Smtp-Source: ADFU+vtg3jbcIVzZD3g1wFbmGSMoSJ7n6V1O7TzNEnL65b6AC/9l6n1n5U9ubMLhpS80zmw/PimItw==
X-Received: by 2002:a17:90a:37c6:: with SMTP id
 v64mr1811528pjb.20.1583906626109; 
 Tue, 10 Mar 2020 23:03:46 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-05c2-72f4-ac61-bc44.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5c2:72f4:ac61:bc44])
 by smtp.gmail.com with ESMTPSA id p7sm4230533pjp.1.2020.03.10.23.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:03:45 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 1/7] powerpc/mm: Implement set_memory() routines
In-Reply-To: <20200310010338.21205-2-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
 <20200310010338.21205-2-ruscur@russell.cc>
Date: Wed, 11 Mar 2020 17:03:41 +1100
Message-ID: <87imjbpgw2.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
> and are generally useful primitives to have.  This implementation is
> designed to be completely generic across powerpc's many MMUs.
>
> It's possible that this could be optimised to be faster for specific
> MMUs, but the focus is on having a generic and safe implementation for
> now.
>
> This implementation does not handle cases where the caller is attempting
> to change the mapping of the page it is executing from, or if another
> CPU is concurrently using the page being altered.  These cases likely
> shouldn't happen, but a more complex implementation with MMU-specific code
> could safely handle them, so that is left as a TODO for now.
>
> These functions do nothing if STRICT_KERNEL_RWX is not enabled.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v6: Merge patch 8/8 from v5, handling RWX not being enabled.
>     Add note to change_page_attr() in case it's ever made non-static
> ---
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
>  arch/powerpc/mm/Makefile              |  2 +-
>  arch/powerpc/mm/pageattr.c            | 79 +++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/set_memory.h
>  create mode 100644 arch/powerpc/mm/pageattr.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..bd074246e34e 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -129,6 +129,7 @@ config PPC
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> +	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> new file mode 100644
> index 000000000000..64011ea444b4
> --- /dev/null
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_SET_MEMORY_H
> +#define _ASM_POWERPC_SET_MEMORY_H
> +
> +#define SET_MEMORY_RO	0
> +#define SET_MEMORY_RW	1
> +#define SET_MEMORY_NX	2
> +#define SET_MEMORY_X	3
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action);
> +
> +static inline int set_memory_ro(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> +}
> +
> +static inline int set_memory_rw(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> +}
> +
> +static inline int set_memory_nx(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> +}
> +
> +static inline int set_memory_x(unsigned long addr, int numpages)
> +{
> +	return change_memory_attr(addr, numpages, SET_MEMORY_X);
> +}
> +
> +#endif
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 5e147986400d..a998fdac52f9 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -5,7 +5,7 @@
>  
>  ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>  
> -obj-y				:= fault.o mem.o pgtable.o mmap.o \
> +obj-y				:= fault.o mem.o pgtable.o mmap.o pageattr.o \
>  				   init_$(BITS).o pgtable_$(BITS).o \
>  				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
>  				   init-common.o mmu_context.o drmem.o
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..748fa56d9db0
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * MMU-generic set_memory implementation for powerpc
> + *
> + * Copyright 2019, IBM Corporation.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/set_memory.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +
> +
> +/*
> + * Updates the attributes of a page in three steps:
> + *
> + * 1. invalidate the page table entry
> + * 2. flush the TLB
> + * 3. install the new entry with the updated attributes
> + *
> + * This is unsafe if the caller is attempting to change the mapping of the
> + * page it is executing from, or if another CPU is concurrently using the
> + * page being altered.
> + *
> + * TODO make the implementation resistant to this.
> + *
> + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX
> + */
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	long action = (long)data;
> +	pte_t pte;
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	/* invalidate the PTE so it's safe to modify */
> +	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	/* modify the PTE bits as desired, then apply */
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte = pte_wrprotect(pte);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte = pte_mkwrite(pte);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte = pte_exprotect(pte);
> +		break;
> +	case SET_MEMORY_X:
> +		pte = pte_mkexec(pte);
> +		break;
> +	default:
> +		break;

Should this have a WARN_ON_ONCE to let you know you're doing something
that doesn't work? I know it's only ever called by things in this file,
but still... Anyway it's very minor and I'm not fussed either way.

> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte);
> +	spin_unlock(&init_mm.page_table_lock);

Initially I thought: shouldn't you put the PTL lock/unlock in the outer
function? Then I remembered that apply_to_page_range can potentially
allocate new page table entries which would deadlock if you held the
lock.

Speaking of which - apply_to_page_range will create new pte entries if
you apply it over an address range that isn't filled in. That doesn't
really make sense here - should you use apply_to_existing_page_range
instead?

You _might_ be able to move the PTL lock if you use
apply_to_existing_page_range but I'm not completely sure if that's safe
or if the speed boost is worth it. You could check mm/memory.c if you
wanted.

> +
> +	return 0;
> +}
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz = numpages * PAGE_SIZE;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;
> +
> +	if (!numpages)
> +		return 0;

What happens if numpages is negative? Doesn't the guard need to check
for that rather than just for zero?

With those caveats, and noting that I've been focused only on:
 - lock/unlock paths
 - integer arithmetic
 - stuff about apply_page_range semantics
this patch is:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

> +
> +	return apply_to_page_range(&init_mm, start, sz, change_page_attr, (void *)action);
> +}
> -- 
> 2.25.1
