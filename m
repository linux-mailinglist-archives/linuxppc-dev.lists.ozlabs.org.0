Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0063C0E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 03:23:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NC246hWGzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 11:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="R29+1uik"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NC091h0rzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 11:21:58 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d126so6320073pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8Hu6OaRpphTcydnEl+oRmHQ1ovnuEr92cVerD6GpVdc=;
 b=R29+1uik24wxsgXVzPA3hnfYJfA5cNtuRSRnQ/mL5I9UfZeyHfeUf3MDSAX9nVuhvI
 /9J/naELWaEUiTFf5TAkxSlOnYY9HGK4alHl0SIa8i1aQ/1ed4DmQMC7cmMxD/xYGB62
 5APwtNUdTeUBBvEIsbvnaPssSb6EcDXHRPobw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8Hu6OaRpphTcydnEl+oRmHQ1ovnuEr92cVerD6GpVdc=;
 b=kuYskx7VtcVJdqYIe+q+bV2UAjY8NAtpZfhtmigY3/XNkiwVUA1LV/Ot0M2kZcO6KY
 DapIZY/3Bf9x0MXZJ2p3JVbfrGuHleIkJu4v8MYQRToKa1PZKS9g03J+aO9VbYIjXVin
 MLcVTR8mr1ZskHpdFtqjLaTgHFXxS+OWkvYE+7xhAhtIzIquwD0r2DCdRse5Z5mwTIHc
 DkIXWvoFYBLkD12zZruD/XTYf1pb2vmJD7EHZUjs135Kow6keJ5cTz+OyHSSl7Qcfg1J
 s6IHoQm1VNvlSz90s/wVnighVM62TQPaGtPoRySPIHhOCpztmlvBd825E3IjAWPdv9GG
 LSjQ==
X-Gm-Message-State: APjAAAUofp6ozpaV6RD479gsT3wOn0ublTugg1ck2CezLyoSSd186813
 yDBqPTWA/aGQ6lemQDLScEXuZg==
X-Google-Smtp-Source: APXvYqwkbKc5AXEdTYzKq3rT43PIlftzD0fKmBhL2fQT8iG3e0iYLqCYyFzr+9vO7vP9UShovEGJ0Q==
X-Received: by 2002:aa7:9087:: with SMTP id i7mr20139844pfa.40.1560216115675; 
 Mon, 10 Jun 2019 18:21:55 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id t5sm11373642pgh.46.2019.06.10.18.21.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 18:21:54 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH] powerpc/book3e: KASAN Full support for 64bit
In-Reply-To: <a0c04cb8-a19b-2d73-5725-4868556e2b47@c-s.fr>
References: <3401648225001077db54172ee87573b21e1cfa38.1553782837.git.christophe.leroy@c-s.fr>
 <877ea7za12.fsf@dja-thinkpad.axtens.net>
 <028d7332-57e0-bbec-1843-29f87b33a1d4@c-s.fr>
 <87woi2xm8l.fsf@dja-thinkpad.axtens.net>
 <a0c04cb8-a19b-2d73-5725-4868556e2b47@c-s.fr>
Date: Tue, 11 Jun 2019 11:21:49 +1000
Message-ID: <87lfy8q5le.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> On 06/03/2019 11:50 PM, Daniel Axtens wrote:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> Hi,
>>>
>>> Ok, can you share your .config ?
>>=20
>> Sure! This one is with kasan off as the last build I did was testing to
>> see if the code reorgisation was the cause of the issues. (it was not)
>>=20
>>=20
>>=20
>>=20
>> This was the kasan-enabled config that failed to boot:
>>=20
>>=20
>
> Same issue with your .config under QEMU:
>
> A go with gdb shows:
>
> Breakpoint 3, 0xc000000000027b6c in exc_0x700_common ()
> =3D> 0xc000000000027b6c <exc_0x700_common+0>:	f8 01 00 70	std     r0,112(=
r1)
> (gdb) bt
> #0  0xc000000000027b6c in exc_0x700_common ()
> #1  0xc00000000136f80c in .udbg_init_memcons ()
>

Thanks for debugging this!

> Without CONFIG_PPC_EARLY_DEBUG, it boots fine for me. Can you check on=20
> your side ?

Yes, that works on my side.

> Deactivating KASAN for arch/powerpc/kernel/udbg.o and=20
> arch/powerpc/sysdev/udbg_memcons.o is not enough, we hit a call to=20
> strstr() in register_early_udbg_console(), and once we get rid of it (in=
=20
> the same way as in prom_init.c) the next issue is register_console() and=
=20
> I don't know what to do about that one.

Disabling early debug seems like a reasonable restriction to add.

I'll have a look at modules across this and book3s next.

Regards,
Daniel

>
> Christophe
>
>>=20
>>=20
>> Regards,
>> Daniel
>>=20
>>>
>>> Christophe
>>>
>>> Le 31/05/2019 =C3=A0 03:29, Daniel Axtens a =C3=A9crit=C2=A0:
>>>> Hi Christophe,
>>>>
>>>> I tried this on the t4240rdb and it fails to boot if KASAN is
>>>> enabled. It does boot with the patch applied but KASAN disabled, so th=
at
>>>> narrows it down a little bit.
>>>>
>>>> I need to focus on 3s first so I'll just drop 3e from my patch set for
>>>> now.
>>>>
>>>> Regards,
>>>> Daniel
>>>>
>>>>> The KASAN shadow area is mapped into vmemmap space:
>>>>> 0x8000 0400 0000 0000 to 0x8000 0600 0000 0000.
>>>>> For this vmemmap has to be disabled.
>>>>>
>>>>> Cc: Daniel Axtens <dja@axtens.net>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>>> ---
>>>>>    arch/powerpc/Kconfig                  |   1 +
>>>>>    arch/powerpc/Kconfig.debug            |   3 +-
>>>>>    arch/powerpc/include/asm/kasan.h      |  11 +++
>>>>>    arch/powerpc/kernel/Makefile          |   2 +
>>>>>    arch/powerpc/kernel/head_64.S         |   3 +
>>>>>    arch/powerpc/kernel/setup_64.c        |  20 +++---
>>>>>    arch/powerpc/mm/kasan/Makefile        |   1 +
>>>>>    arch/powerpc/mm/kasan/kasan_init_64.c | 129 ++++++++++++++++++++++=
++++++++++++
>>>>>    8 files changed, 159 insertions(+), 11 deletions(-)
>>>>>    create mode 100644 arch/powerpc/mm/kasan/kasan_init_64.c
>>>>>
>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>> index 1a2fb50126b2..e0b7c45e4dc7 100644
>>>>> --- a/arch/powerpc/Kconfig
>>>>> +++ b/arch/powerpc/Kconfig
>>>>> @@ -174,6 +174,7 @@ config PPC
>>>>>    	select HAVE_ARCH_AUDITSYSCALL
>>>>>    	select HAVE_ARCH_JUMP_LABEL
>>>>>    	select HAVE_ARCH_KASAN			if PPC32
>>>>> +	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && !SPARSEMEM_VMEMMAP
>>>>>    	select HAVE_ARCH_KGDB
>>>>>    	select HAVE_ARCH_MMAP_RND_BITS
>>>>>    	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>>>>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
>>>>> index 61febbbdd02b..b4140dd6b4e4 100644
>>>>> --- a/arch/powerpc/Kconfig.debug
>>>>> +++ b/arch/powerpc/Kconfig.debug
>>>>> @@ -370,4 +370,5 @@ config PPC_FAST_ENDIAN_SWITCH
>>>>>    config KASAN_SHADOW_OFFSET
>>>>>    	hex
>>>>>    	depends on KASAN
>>>>> -	default 0xe0000000
>>>>> +	default 0xe0000000 if PPC32
>>>>> +	default 0x6800040000000000 if PPC64
>>>>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/=
asm/kasan.h
>>>>> index 296e51c2f066..756b3d58f921 100644
>>>>> --- a/arch/powerpc/include/asm/kasan.h
>>>>> +++ b/arch/powerpc/include/asm/kasan.h
>>>>> @@ -23,10 +23,21 @@
>>>>>=20=20=20=20
>>>>>    #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>>>>>=20=20=20=20
>>>>> +#ifdef CONFIG_PPC32
>>>>>    #define KASAN_SHADOW_END	0UL
>>>>>=20=20=20=20
>>>>>    #define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
>>>>>=20=20=20=20
>>>>> +#else
>>>>> +
>>>>> +#include <asm/pgtable.h>
>>>>> +
>>>>> +#define KASAN_SHADOW_SIZE	(KERN_VIRT_SIZE >> KASAN_SHADOW_SCALE_SHIF=
T)
>>>>> +
>>>>> +#define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
>>>>> +
>>>>> +#endif /* CONFIG_PPC32 */
>>>>> +
>>>>>    #ifdef CONFIG_KASAN
>>>>>    void kasan_early_init(void);
>>>>>    void kasan_mmu_init(void);
>>>>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makef=
ile
>>>>> index 0ea6c4aa3a20..7f232c06f11d 100644
>>>>> --- a/arch/powerpc/kernel/Makefile
>>>>> +++ b/arch/powerpc/kernel/Makefile
>>>>> @@ -35,6 +35,8 @@ KASAN_SANITIZE_early_32.o :=3D n
>>>>>    KASAN_SANITIZE_cputable.o :=3D n
>>>>>    KASAN_SANITIZE_prom_init.o :=3D n
>>>>>    KASAN_SANITIZE_btext.o :=3D n
>>>>> +KASAN_SANITIZE_paca.o :=3D n
>>>>> +KASAN_SANITIZE_setup_64.o :=3D n
>>>>>=20=20=20=20
>>>>>    ifdef CONFIG_KASAN
>>>>>    CFLAGS_early_32.o +=3D -DDISABLE_BRANCH_PROFILING
>>>>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head=
_64.S
>>>>> index 3fad8d499767..80fbd8024fb2 100644
>>>>> --- a/arch/powerpc/kernel/head_64.S
>>>>> +++ b/arch/powerpc/kernel/head_64.S
>>>>> @@ -966,6 +966,9 @@ start_here_multiplatform:
>>>>>    	 * and SLB setup before we turn on relocation.
>>>>>    	 */
>>>>>=20=20=20=20
>>>>> +#ifdef CONFIG_KASAN
>>>>> +	bl	kasan_early_init
>>>>> +#endif
>>>>>    	/* Restore parameters passed from prom_init/kexec */
>>>>>    	mr	r3,r31
>>>>>    	bl	early_setup		/* also sets r13 and SPRG_PACA */
>>>>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/set=
up_64.c
>>>>> index ba404dd9ce1d..d2bf860dd966 100644
>>>>> --- a/arch/powerpc/kernel/setup_64.c
>>>>> +++ b/arch/powerpc/kernel/setup_64.c
>>>>> @@ -311,6 +311,16 @@ void __init early_setup(unsigned long dt_ptr)
>>>>>     	DBG(" -> early_setup(), dt_ptr: 0x%lx\n", dt_ptr);
>>>>>=20=20=20=20
>>>>>    	/*
>>>>> +	 * Configure exception handlers. This include setting up trampolines
>>>>> +	 * if needed, setting exception endian mode, etc...
>>>>> +	 */
>>>>> +	configure_exceptions();
>>>>> +
>>>>> +	/* Apply all the dynamic patching */
>>>>> +	apply_feature_fixups();
>>>>> +	setup_feature_keys();
>>>>> +
>>>>> +	/*
>>>>>    	 * Do early initialization using the flattened device
>>>>>    	 * tree, such as retrieving the physical memory map or
>>>>>    	 * calculating/retrieving the hash table size.
>>>>> @@ -325,16 +335,6 @@ void __init early_setup(unsigned long dt_ptr)
>>>>>    	setup_paca(paca_ptrs[boot_cpuid]);
>>>>>    	fixup_boot_paca();
>>>>>=20=20=20=20
>>>>> -	/*
>>>>> -	 * Configure exception handlers. This include setting up trampolines
>>>>> -	 * if needed, setting exception endian mode, etc...
>>>>> -	 */
>>>>> -	configure_exceptions();
>>>>> -
>>>>> -	/* Apply all the dynamic patching */
>>>>> -	apply_feature_fixups();
>>>>> -	setup_feature_keys();
>>>>> -
>>>>>    	/* Initialize the hash table or TLB handling */
>>>>>    	early_init_mmu();
>>>>>=20=20=20=20
>>>>> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/M=
akefile
>>>>> index 6577897673dd..0bfbe3892808 100644
>>>>> --- a/arch/powerpc/mm/kasan/Makefile
>>>>> +++ b/arch/powerpc/mm/kasan/Makefile
>>>>> @@ -3,3 +3,4 @@
>>>>>    KASAN_SANITIZE :=3D n
>>>>>=20=20=20=20
>>>>>    obj-$(CONFIG_PPC32)           +=3D kasan_init_32.o
>>>>> +obj-$(CONFIG_PPC64)	+=3D kasan_init_64.o
>>>>> diff --git a/arch/powerpc/mm/kasan/kasan_init_64.c b/arch/powerpc/mm/=
kasan/kasan_init_64.c
>>>>> new file mode 100644
>>>>> index 000000000000..7fd71b8e883b
>>>>> --- /dev/null
>>>>> +++ b/arch/powerpc/mm/kasan/kasan_init_64.c
>>>>> @@ -0,0 +1,129 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +#define DISABLE_BRANCH_PROFILING
>>>>> +
>>>>> +#include <linux/kasan.h>
>>>>> +#include <linux/printk.h>
>>>>> +#include <linux/memblock.h>
>>>>> +#include <linux/sched/task.h>
>>>>> +#include <asm/pgalloc.h>
>>>>> +
>>>>> +static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
>>>>> +{
>>>>> +	unsigned long va =3D (unsigned long)kasan_early_shadow_page;
>>>>> +	phys_addr_t pa =3D __pa(kasan_early_shadow_page);
>>>>> +	int i;
>>>>> +
>>>>> +	for (i =3D 0; i < PTRS_PER_PTE; i++, ptep++)
>>>>> +		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
>>>>> +}
>>>>> +
>>>>> +static void __init kasan_populate_pmd(pmd_t *pmdp)
>>>>> +{
>>>>> +	int i;
>>>>> +
>>>>> +	for (i =3D 0; i < PTRS_PER_PMD; i++)
>>>>> +		pmd_populate_kernel(&init_mm, pmdp + i, kasan_early_shadow_pte);
>>>>> +}
>>>>> +
>>>>> +static void __init kasan_populate_pud(pud_t *pudp)
>>>>> +{
>>>>> +	int i;
>>>>> +
>>>>> +	for (i =3D 0; i < PTRS_PER_PUD; i++)
>>>>> +		pud_populate(&init_mm, pudp + i, kasan_early_shadow_pmd);
>>>>> +}
>>>>> +
>>>>> +static void __init *kasan_alloc_pgtable(unsigned long size)
>>>>> +{
>>>>> +	void *ptr =3D memblock_alloc_try_nid(size, size, MEMBLOCK_LOW_LIMIT,
>>>>> +					   __pa(MAX_DMA_ADDRESS), NUMA_NO_NODE);
>>>>> +
>>>>> +	if (!ptr)
>>>>> +		panic("%s: Failed to allocate %lu bytes align=3D0x%lx max_addr=3D%=
lx\n",
>>>>> +		      __func__, size, size, __pa(MAX_DMA_ADDRESS));
>>>>> +
>>>>> +	return ptr;
>>>>> +}
>>>>> +
>>>>> +static int __init kasan_map_page(unsigned long va, unsigned long pa,=
 pgprot_t prot)
>>>>> +{
>>>>> +	pgd_t *pgdp =3D pgd_offset_k(va);
>>>>> +	pud_t *pudp;
>>>>> +	pmd_t *pmdp;
>>>>> +	pte_t *ptep;
>>>>> +
>>>>> +	if (pgd_none(*pgdp) || (void *)pgd_page_vaddr(*pgdp) =3D=3D kasan_e=
arly_shadow_pud) {
>>>>> +		pudp =3D kasan_alloc_pgtable(PUD_TABLE_SIZE);
>>>>> +		kasan_populate_pud(pudp);
>>>>> +		pgd_populate(&init_mm, pgdp, pudp);
>>>>> +	}
>>>>> +	pudp =3D pud_offset(pgdp, va);
>>>>> +	if (pud_none(*pudp) || (void *)pud_page_vaddr(*pudp) =3D=3D kasan_e=
arly_shadow_pmd) {
>>>>> +		pmdp =3D kasan_alloc_pgtable(PMD_TABLE_SIZE);
>>>>> +		kasan_populate_pmd(pmdp);
>>>>> +		pud_populate(&init_mm, pudp, pmdp);
>>>>> +	}
>>>>> +	pmdp =3D pmd_offset(pudp, va);
>>>>> +	if (!pmd_present(*pmdp) || (void *)pmd_page_vaddr(*pmdp) =3D=3D kas=
an_early_shadow_pte) {
>>>>> +		ptep =3D kasan_alloc_pgtable(PTE_TABLE_SIZE);
>>>>> +		kasan_populate_pte(ptep, PAGE_KERNEL);
>>>>> +		pmd_populate_kernel(&init_mm, pmdp, ptep);
>>>>> +	}
>>>>> +	ptep =3D pte_offset_kernel(pmdp, va);
>>>>> +
>>>>> +	__set_pte_at(&init_mm, va, ptep, pfn_pte(pa >> PAGE_SHIFT, prot), 0=
);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void __init kasan_init_region(struct memblock_region *reg)
>>>>> +{
>>>>> +	void *start =3D __va(reg->base);
>>>>> +	void *end =3D __va(reg->base + reg->size);
>>>>> +	unsigned long k_start, k_end, k_cur;
>>>>> +
>>>>> +	if (start >=3D end)
>>>>> +		return;
>>>>> +
>>>>> +	k_start =3D (unsigned long)kasan_mem_to_shadow(start);
>>>>> +	k_end =3D (unsigned long)kasan_mem_to_shadow(end);
>>>>> +
>>>>> +	for (k_cur =3D k_start; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
>>>>> +		void *va =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
>>>>> +
>>>>> +		kasan_map_page(k_cur, __pa(va), PAGE_KERNEL);
>>>>> +	}
>>>>> +	flush_tlb_kernel_range(k_start, k_end);
>>>>> +}
>>>>> +
>>>>> +void __init kasan_init(void)
>>>>> +{
>>>>> +	struct memblock_region *reg;
>>>>> +
>>>>> +	for_each_memblock(memory, reg)
>>>>> +		kasan_init_region(reg);
>>>>> +
>>>>> +	/* It's too early to use clear_page() ! */
>>>>> +	memset(kasan_early_shadow_page, 0, sizeof(kasan_early_shadow_page));
>>>>> +
>>>>> +	/* Enable error messages */
>>>>> +	init_task.kasan_depth =3D 0;
>>>>> +	pr_info("KASAN init done\n");
>>>>> +}
>>>>> +
>>>>> +/* The early shadow maps everything to a single page of zeroes */
>>>>> +asmlinkage void __init kasan_early_init(void)
>>>>> +{
>>>>> +	unsigned long addr =3D KASAN_SHADOW_START;
>>>>> +	unsigned long end =3D KASAN_SHADOW_END;
>>>>> +	pgd_t *pgdp =3D pgd_offset_k(addr);
>>>>> +
>>>>> +	kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL);
>>>>> +	kasan_populate_pmd(kasan_early_shadow_pmd);
>>>>> +	kasan_populate_pud(kasan_early_shadow_pud);
>>>>> +
>>>>> +	do {
>>>>> +		pgd_populate(&init_mm, pgdp, kasan_early_shadow_pud);
>>>>> +	} while (pgdp++, addr =3D pgd_addr_end(addr, end), addr !=3D end);
>>>>> +}
>>>>> --=20
>>>>> 2.13.3
