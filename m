Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75734FF58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 13:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9P0T6hpbz3bwC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 22:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jor0xLoy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jor0xLoy; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9P043y7kz301k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 22:16:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9Nzv2Njwz9sWK;
 Wed, 31 Mar 2021 22:16:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617189388;
 bh=pnse+F52/Nujb8o7w33aYySleQVvgdGdcUFmk2NYmaA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jor0xLoyT+h4DLuG+rmqa7g8sPW3aRpQFXWTtViOvkWqM7m1s4NuuvhZrTog5FOps
 rfsTHCfr5vK5eQsmoUkBNjAcWvfpe7XSucSn2tUOzTWxI8otdzjdLFKhyUE0aIcXQw
 iF68j7AiDoEBnLK2wxAVnGizk6UYba6ErxNGONhKmDl/AXylkmRfK3ufXzvKFji9ix
 d8CzOE9pbX7xIyj4Db57VypOahcjpXsY9cNc6BhaOvhs0WrzlARBfhohX1xoyxGIRm
 BJCC1Bd0blT/WorxtDM+EGOAH4VYcVhJrxqvwPvN5Py8aM38GeSfUS/OACpgbYbwf0
 ghIy4DzAf8SIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
In-Reply-To: <20210330045132.722243-2-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
Date: Wed, 31 Mar 2021 22:16:23 +1100
Message-ID: <87lfa37euw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: ajd@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, cmr@codefail.de,
 npiggin@gmail.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jordan,

A few nits below ...

Jordan Niethe <jniethe5@gmail.com> writes:
> From: Russell Currey <ruscur@russell.cc>
>
> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RW=
X,
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
> On hash the linear mapping is not kept in the linux pagetable, so this
> will not change the protection if used on that range. Currently these
> functions are not used on the linear map so just WARN for now.
>
> These functions do nothing if STRICT_KERNEL_RWX is not enabled.
>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
>       - WARN on hash linear map]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: WARN if trying to change the hash linear map
> ---
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/include/asm/set_memory.h | 32 ++++++++++
>  arch/powerpc/mm/Makefile              |  2 +-
>  arch/powerpc/mm/pageattr.c            | 88 +++++++++++++++++++++++++++
>  4 files changed, 122 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/set_memory.h
>  create mode 100644 arch/powerpc/mm/pageattr.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc7f5c5933e6..4498a27ac9db 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -135,6 +135,7 @@ config PPC
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BO=
OK3S_64
> +	select ARCH_HAS_SET_MEMORY

Below you do:

	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
		return 0;

Which suggests we should instead just only select ARCH_HAS_SET_MEMORY if
STRICT_KERNEL_RWX ?


> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 3b4e9e4e25ea..d8a08abde1ae 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -5,7 +5,7 @@
>=20=20
>  ccflags-$(CONFIG_PPC64)	:=3D $(NO_MINIMAL_TOC)
>=20=20
> -obj-y				:=3D fault.o mem.o pgtable.o mmap.o maccess.o \
> +obj-y				:=3D fault.o mem.o pgtable.o mmap.o maccess.o pageattr.o \

.. and then the file should only be built if ARCH_HAS_SET_MEMORY =3D y.

>  				   init_$(BITS).o pgtable_$(BITS).o \
>  				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
>  				   init-common.o mmu_context.o drmem.o
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> new file mode 100644
> index 000000000000..9efcb01088da
> --- /dev/null
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * MMU-generic set_memory implementation for powerpc
> + *
> + * Copyright 2019, IBM Corporation.

Should be 2019-2021.

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
> + * This is unsafe if the caller is attempting to change the mapping of t=
he
> + * page it is executing from, or if another CPU is concurrently using the
> + * page being altered.

Is the 2nd part of that statement true?

Or, I guess maybe it is true depending on what "unsafe" means.

AIUI it's unsafe to use this on the page you're executing from, and by
unsafe we mean the kernel will potentially crash because it will lose
the mapping for the currently executing text.

Using this on a page that another CPU is accessing could be safe, if eg.
the other CPU is reading from the page and we are just changing it from
RW->RO.

So I'm not sure they're the same type of "unsafe".

> + * TODO make the implementation resistant to this.
> + *
> + * NOTE: can be dangerous to call without STRICT_KERNEL_RWX

I don't think we need that anymore?

> + */
> +static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	long action =3D (long)data;
> +	pte_t pte;
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	/* invalidate the PTE so it's safe to modify */
> +	pte =3D ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	/* modify the PTE bits as desired, then apply */
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte =3D pte_wrprotect(pte);
> +		break;

So set_memory_ro() removes write, but doesn't remove execute.

That doesn't match my mental model of what "set to ro" means, but I
guess I'm wrong because the other implementations seem to do something
similar.


> +	case SET_MEMORY_RW:
> +		pte =3D pte_mkwrite(pte);

I think we want to add pte_mkdirty() here also to avoid a fault when the
mapping is written to.

eg. pmd_mkwrite(pmd_mkdirty(pte));

> +		break;
> +	case SET_MEMORY_NX:
> +		pte =3D pte_exprotect(pte);
> +		break;
> +	case SET_MEMORY_X:
> +		pte =3D pte_mkexec(pte);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		break;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte);
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return 0;
> +}
> +
> +int change_memory_attr(unsigned long addr, int numpages, long action)
> +{
> +	unsigned long start =3D ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz =3D numpages * PAGE_SIZE;
> +
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		return 0;
> +
> +	if (numpages <=3D 0)
> +		return 0;
> +

This =E2=86=93 should have a comment explaining what it's doing:

> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (WARN_ON_ONCE(!radix_enabled() &&
> +		     get_region_id(addr) =3D=3D LINEAR_MAP_REGION_ID)) {
> +		return -1;
> +	}
> +#endif

Maybe:

	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
	    WARN_ON_ONCE(!radix_enabled() && get_region_id(addr) =3D=3D LINEAR_MAP=
_REGION_ID)) {
		return -1;
	}

But then Aneesh pointed out that we should also block VMEMMAP_REGION_ID.

It might be better to just check for the permitted regions.

	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled()) {
        	int region =3D get_region_id(addr);

	    	if (WARN_ON_ONCE(region !=3D VMALLOC_REGION_ID && region !=3D IO_REGI=
ON_ID))
                	return -1;
	}

> +
> +	return apply_to_existing_page_range(&init_mm, start, sz,
> +					    change_page_attr, (void *)action);
> +}


cheers
