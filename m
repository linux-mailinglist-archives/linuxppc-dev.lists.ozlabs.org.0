Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84415002A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 01:48:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489q1m1swXzDqTX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 11:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=V9HjTgpD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KXbg+hgR; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489q0B1pt6zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 11:46:49 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 79C88616;
 Sun,  2 Feb 2020 19:46:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Feb 2020 19:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 ynMGFSkzo8+mnaAWwMov4giuOfwKzqEYIujXRx5U8og=; b=V9HjTgpD18V/o4ho
 /OgJGE8WR5hOPoauZ/H/Ar5rklZ5/DLMuGovJAcLgbS6HVWHd9j3wsw5vNwThWQI
 0pAs8M1yiU2SFnG0xxksJWpfVZuJXoelOFgf21OiTZvnald6Xrj/rFXfCuL5r2l6
 7nvoG2EvmEQ6MpyA7troACoPAzU7Rsu0swr6CpL8PUEiKd5hewhBKL0gO+gURldE
 diaJPftymtvn5v8NsXwMGYnanVZ4jAcrbH04Y1EJmvK5GKj5IFUfTHSGCHVM22pC
 m9+ZqGsPwXKCySGP8a7zt6B6eJ5vWV5fLrQDuAHTr4G8Qew6wrPVDe6X6L97FLYK
 WjgaOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ynMGFSkzo8+mnaAWwMov4giuOfwKzqEYIujXRx5U8
 og=; b=KXbg+hgR1zh5KFyW71vKaIj6WWsT5jAZYw1+JP5SvdcdldEFWwFA5Bk6p
 X2Hcfzxop+wmC6/vJwpC8qAFOsu0FVozTVSKQiSLVwvPBS7jgXYw1IEGNJuysbq9
 CEIKODMGm3eJiy5j3oVd1ha7OpOOIUikL3Faku8vuXSVr+DeHdRL76Em3FJvEVI6
 27R1FO7C1yj1q0qBqJoOxleNZdyRzQgCojql1jZDAgE777Vbv+xQyJVa+QPsvFua
 D6Ow+Ieg+G0i8rkhbhTMA7WdzipiXVL/5dUOK/2LEVXYXPDGlRQMtS81J+2RpNuq
 +XJD3wEePYZcjc/gxltNbbXRHiNQw==
X-ME-Sender: <xms:c203Xh5AG6BQwZ3gz4fngcPS-RSGWor8zgt8oNv_00IjeaRuiLYhDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeeigddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:c203Xpz1F3miSg1b-gDTSDKH5PgqEWgWmmRFvdLpFov0_cy7Uv2lcA>
 <xmx:c203XrXXkesPodY9BW8bP6h5HC-VU9Suclg5iHDRjPFsjh_N8jSknw>
 <xmx:c203Xj0rY_CK8CxRDyc4ZiPIlsP0zn9AS1oOPxL6TrQtGE6OYdCd1w>
 <xmx:dW03XpQssGP2dR7UnwLqi-bvHUDKDFhldlmBmOQ2xZYscp1zbhWAPA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32019328005D;
 Sun,  2 Feb 2020 19:46:40 -0500 (EST)
Message-ID: <8675c11631ac027a78e00d4fe2c20736496b1e97.camel@russell.cc>
Subject: Re: [PATCH v6 1/5] powerpc/mm: Implement set_memory() routines
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 03 Feb 2020 11:46:37 +1100
In-Reply-To: <8f8940e2-c6ab-fca2-ab8a-61b80b2edd22@c-s.fr>
References: <20191224055545.178462-1-ruscur@russell.cc>
 <20191224055545.178462-2-ruscur@russell.cc>
 <8f8940e2-c6ab-fca2-ab8a-61b80b2edd22@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-01-08 at 13:52 +0100, Christophe Leroy wrote:
> 
> Le 24/12/2019 à 06:55, Russell Currey a écrit :
> > The set_memory_{ro/rw/nx/x}() functions are required for
> > STRICT_MODULE_RWX,
> > and are generally useful primitives to have.  This implementation
> > is
> > designed to be completely generic across powerpc's many MMUs.
> > 
> > It's possible that this could be optimised to be faster for
> > specific
> > MMUs, but the focus is on having a generic and safe implementation
> > for
> > now.
> > 
> > This implementation does not handle cases where the caller is
> > attempting
> > to change the mapping of the page it is executing from, or if
> > another
> > CPU is concurrently using the page being altered.  These cases
> > likely
> > shouldn't happen, but a more complex implementation with MMU-
> > specific code
> > could safely handle them, so that is left as a TODO for now.
> > 
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> >   arch/powerpc/Kconfig                  |  1 +
> >   arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
> >   arch/powerpc/mm/Makefile              |  1 +
> >   arch/powerpc/mm/pageattr.c            | 83
> > +++++++++++++++++++++++++++
> >   4 files changed, 117 insertions(+)
> >   create mode 100644 arch/powerpc/include/asm/set_memory.h
> >   create mode 100644 arch/powerpc/mm/pageattr.c
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 1ec34e16ed65..f0b9b47b5353 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -133,6 +133,7 @@ config PPC
> >   	select ARCH_HAS_PTE_SPECIAL
> >   	select ARCH_HAS_MEMBARRIER_CALLBACKS
> >   	select ARCH_HAS_SCALED_CPUTIME		if
> > VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> > +	select ARCH_HAS_SET_MEMORY
> >   	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 ||
> > PPC32) && !RELOCATABLE && !HIBERNATION)
> >   	select ARCH_HAS_TICK_BROADCAST		if
> > GENERIC_CLOCKEVENTS_BROADCAST
> >   	select ARCH_HAS_UACCESS_FLUSHCACHE
> > diff --git a/arch/powerpc/include/asm/set_memory.h
> > b/arch/powerpc/include/asm/set_memory.h
> > new file mode 100644
> > index 000000000000..5230ddb2fefd
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/set_memory.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_POWERPC_SET_MEMORY_H
> > +#define _ASM_POWERPC_SET_MEMORY_H
> > +
> > +#define SET_MEMORY_RO	1
> > +#define SET_MEMORY_RW	2
> > +#define SET_MEMORY_NX	3
> > +#define SET_MEMORY_X	4
> 
> Maybe going from 0 to 3 would be better than 1 to 4
> 
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, int
> > action);
> 
> action could be unsigned.
> 
> > +
> > +static inline int set_memory_ro(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
> > +}
> > +
> > +static inline int set_memory_rw(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
> > +}
> > +
> > +static inline int set_memory_nx(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
> > +}
> > +
> > +static inline int set_memory_x(unsigned long addr, int numpages)
> > +{
> > +	return change_memory_attr(addr, numpages, SET_MEMORY_X);
> > +}
> > +
> > +#endif
> > diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> > index 5e147986400d..d0a0bcbc9289 100644
> > --- a/arch/powerpc/mm/Makefile
> > +++ b/arch/powerpc/mm/Makefile
> > @@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
> >   obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
> >   obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
> >   obj-$(CONFIG_KASAN)		+= kasan/
> > +obj-$(CONFIG_ARCH_HAS_SET_MEMORY) += pageattr.o
> 
> CONFIG_ARCH_HAS_SET_MEMORY is set inconditionnally, I think you
> should 
> add pageattr.o to obj-y instead. CONFIG_ARCH_HAS_XXX are almost
> never 
> used in Makefiles

Fair enough, will keep that in mind

> 
> > diff --git a/arch/powerpc/mm/pageattr.c
> > b/arch/powerpc/mm/pageattr.c
> > new file mode 100644
> > index 000000000000..15d5fb04f531
> > --- /dev/null
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -0,0 +1,83 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * MMU-generic set_memory implementation for powerpc
> > + *
> > + * Copyright 2019, IBM Corporation.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/set_memory.h>
> > +
> > +#include <asm/mmu.h>
> > +#include <asm/page.h>
> > +#include <asm/pgtable.h>
> > +
> > +
> > +/*
> > + * Updates the attributes of a page in three steps:
> > + *
> > + * 1. invalidate the page table entry
> > + * 2. flush the TLB
> > + * 3. install the new entry with the updated attributes
> > + *
> > + * This is unsafe if the caller is attempting to change the
> > mapping of the
> > + * page it is executing from, or if another CPU is concurrently
> > using the
> > + * page being altered.
> > + *
> > + * TODO make the implementation resistant to this.
> > + */
> > +static int __change_page_attr(pte_t *ptep, unsigned long addr,
> > void *data)
> > +{
> > +	int action = *((int *)data);
> 
> Don't use pointers for so simple things, pointers forces the compiler
> to 
> setup a stack frame and save the data into stack. Instead do:
> 
> 	int action = (int)data;
> 
> > +	pte_t pte_val;
> > +
> > +	// invalidate the PTE so it's safe to modify
> > +	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
> > +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> 
> Why flush a range for a single page ? On most targets this will do a 
> tlbia which is heavy, while a tlbie would suffice.
> 
> I think flush_tlb_kernel_range() should be replaced by something 
> flushing only a single page.

You might be able to help me out here, I wanted to do that but the only
functions I could find that flushed single pages needed a
vm_area_struct, which I can't get.

> 
> > +
> > +	// modify the PTE bits as desired, then apply
> > +	switch (action) {
> > +	case SET_MEMORY_RO:
> > +		pte_val = pte_wrprotect(pte_val);
> > +		break;
> > +	case SET_MEMORY_RW:
> > +		pte_val = pte_mkwrite(pte_val);
> > +		break;
> > +	case SET_MEMORY_NX:
> > +		pte_val = pte_exprotect(pte_val);
> > +		break;
> > +	case SET_MEMORY_X:
> > +		pte_val = pte_mkexec(pte_val);
> > +		break;
> > +	default:
> > +		WARN_ON(true);
> > +		return -EINVAL;
> 
> Is it worth checking that the action is valid for each page ? I
> think 
> validity of action should be checked in change_memory_attr(). All
> other 
> functions are static so you know they won't be called from outside.
> 
> Once done, you can squash __change_page_attr() into
> change_page_attr(), 
> remove the ret var and return 0 all the time.

Makes sense to fold things into a single function, but in terms of
performance it shouldn't make a difference, right?  I still have to
check the action to determine what to change (unless I replace passing
SET_MEMORY_RO into apply_to_page_range() with a function pointer to
pte_wrprotect() for example).  

> 
> > +	}
> > +
> > +	set_pte_at(&init_mm, addr, ptep, pte_val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int change_page_attr(pte_t *ptep, unsigned long addr, void
> > *data)
> > +{
> > +	int ret;
> > +
> > +	spin_lock(&init_mm.page_table_lock);
> > +	ret = __change_page_attr(ptep, addr, data);
> > +	spin_unlock(&init_mm.page_table_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +int change_memory_attr(unsigned long addr, int numpages, int
> > action)
> > +{
> > +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> > +	unsigned long size = numpages * PAGE_SIZE;
> > +
> > +	if (!numpages)
> > +		return 0;
> > +
> > +	return apply_to_page_range(&init_mm, start, size,
> > change_page_attr, &action);
> 
> Use (void*)action instead of &action (see upper comment)

To get this to work I had to use (void *)(size_t)action to stop the
compiler from complaining about casting an int to a void*, is there a
better way to go about it?  Works fine, just looks gross.

> 
> > +}
> > 
> 
> Christophe
> 

