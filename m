Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9C82D2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 09:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462n394pV2zDqhC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BibH/CQF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462n1C24MczDr2y
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 17:52:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 462n130j0Yz9txY9;
 Tue,  6 Aug 2019 09:52:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BibH/CQF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vBXmEkpNxU1F; Tue,  6 Aug 2019 09:52:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 462n126YbVz9txY7;
 Tue,  6 Aug 2019 09:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565077958; bh=Id8bDQZr7/N8ltUoacaimTRdm8pSKoUJLa6nAGC4iV0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BibH/CQFnsBLd8x4y16IJxlrXGFDkG2cCtOODW0tY8AqJX3Jx6T7/QljsusMirr2T
 zlr1ZeUxpSwZcLgq9NeDdAYBYp44ahZDhGjdDvQFMUVCsxxDSTyeG6KJ3ZmW79volS
 JHfxWEDO5nxUv9Fru05sZ2fag+X1Z7NwzXbhHTUE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDADF8B7E4;
 Tue,  6 Aug 2019 09:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bangrQiku4qm; Tue,  6 Aug 2019 09:52:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B1CE78B75F;
 Tue,  6 Aug 2019 09:52:38 +0200 (CEST)
Subject: Re: [PATCH v4 06/10] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190805064335.19156-1-yanaijie@huawei.com>
 <20190805064335.19156-7-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0ae57807-d154-83ff-8246-e27861dac9c9@c-s.fr>
Date: Tue, 6 Aug 2019 09:52:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805064335.19156-7-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/08/2019 à 08:43, Jason Yan a écrit :
> This patch add support to boot kernel from places other than KERNELBASE.
> Since CONFIG_RELOCATABLE has already supported, what we need to do is
> map or copy kernel to a proper place and relocate. Freescale Book-E
> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
> entries are not suitable to map the kernel directly in a randomized
> region, so we chose to copy the kernel to a proper place and restart to
> relocate.
> 
> The offset of the kernel was not randomized yet(a fixed 64M is set). We
> will randomize it in the next patch.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> Tested-by: Diana Craciun <diana.craciun@nxp.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/Kconfig                          | 11 +++
>   arch/powerpc/kernel/Makefile                  |  1 +
>   arch/powerpc/kernel/early_32.c                |  2 +-
>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 17 ++--
>   arch/powerpc/kernel/head_fsl_booke.S          | 13 ++-
>   arch/powerpc/kernel/kaslr_booke.c             | 84 +++++++++++++++++++
>   arch/powerpc/mm/mmu_decl.h                    |  6 ++
>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 +-
>   8 files changed, 126 insertions(+), 15 deletions(-)
>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 77f6ebf97113..755378887912 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -548,6 +548,17 @@ config RELOCATABLE
>   	  setting can still be useful to bootwrappers that need to know the
>   	  load address of the kernel (eg. u-boot/mkimage).
>   
> +config RANDOMIZE_BASE
> +	bool "Randomize the address of the kernel image"
> +	depends on (FSL_BOOKE && FLATMEM && PPC32)
> +	select RELOCATABLE
> +	help
> +	  Randomizes the virtual address at which the kernel image is
> +	  loaded, as a security feature that deters exploit attempts
> +	  relying on knowledge of the location of kernel internals.
> +
> +	  If unsure, say N.
> +
>   config RELOCATABLE_TEST
>   	bool "Test relocatable kernel"
>   	depends on (PPC64 && RELOCATABLE)
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index ea0c69236789..32f6c5b99307 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -106,6 +106,7 @@ extra-$(CONFIG_PPC_8xx)		:= head_8xx.o
>   extra-y				+= vmlinux.lds
>   
>   obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
> +obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr_booke.o
>   
>   obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
>   obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
> diff --git a/arch/powerpc/kernel/early_32.c b/arch/powerpc/kernel/early_32.c
> index 3482118ffe76..fe8347cdc07d 100644
> --- a/arch/powerpc/kernel/early_32.c
> +++ b/arch/powerpc/kernel/early_32.c
> @@ -32,5 +32,5 @@ notrace unsigned long __init early_init(unsigned long dt_ptr)
>   
>   	apply_feature_fixups();
>   
> -	return KERNELBASE + offset;
> +	return kimage_vaddr + offset;
>   }
> diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> index de0980945510..de7ee682bb4a 100644
> --- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> +++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
> @@ -155,23 +155,22 @@ skpinv:	addi	r6,r6,1				/* Increment */
>   
>   #if defined(ENTRY_MAPPING_BOOT_SETUP)
>   
> -/* 6. Setup KERNELBASE mapping in TLB1[0] */
> +/* 6. Setup kimage_vaddr mapping in TLB1[0] */
>   	lis	r6,0x1000		/* Set MAS0(TLBSEL) = TLB1(1), ESEL = 0 */
>   	mtspr	SPRN_MAS0,r6
>   	lis	r6,(MAS1_VALID|MAS1_IPROT)@h
>   	ori	r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
>   	mtspr	SPRN_MAS1,r6
> -	lis	r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@h
> -	ori	r6,r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, M_IF_NEEDED)@l
> -	mtspr	SPRN_MAS2,r6
> +	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
> +	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
> +	and     r6,r6,r20
> +	ori	r6,r6,M_IF_NEEDED@l
> +	mtspr   SPRN_MAS2,r6
>   	mtspr	SPRN_MAS3,r8
>   	tlbwe
>   
> -/* 7. Jump to KERNELBASE mapping */
> -	lis	r6,(KERNELBASE & ~0xfff)@h
> -	ori	r6,r6,(KERNELBASE & ~0xfff)@l
> -	rlwinm	r7,r25,0,0x03ffffff
> -	add	r6,r7,r6
> +/* 7. Jump to kimage_vaddr mapping */
> +	mr	r6,r20
>   
>   #elif defined(ENTRY_MAPPING_KEXEC_SETUP)
>   /*
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index 2083382dd662..aa55832e7506 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -155,6 +155,8 @@ _ENTRY(_start);
>    */
>   
>   _ENTRY(__early_start)
> +	LOAD_REG_ADDR_PIC(r20, kimage_vaddr)
> +	lwz     r20,0(r20)
>   
>   #define ENTRY_MAPPING_BOOT_SETUP
>   #include "fsl_booke_entry_mapping.S"
> @@ -277,8 +279,8 @@ set_ivor:
>   	ori	r6, r6, swapper_pg_dir@l
>   	lis	r5, abatron_pteptrs@h
>   	ori	r5, r5, abatron_pteptrs@l
> -	lis	r4, KERNELBASE@h
> -	ori	r4, r4, KERNELBASE@l
> +	lis     r3, kimage_vaddr@ha
> +	lwz     r4, kimage_vaddr@l(r3)
>   	stw	r5, 0(r4)	/* Save abatron_pteptrs at a fixed location */
>   	stw	r6, 0(r5)
>   
> @@ -1067,7 +1069,12 @@ __secondary_start:
>   	mr	r5,r25		/* phys kernel start */
>   	rlwinm	r5,r5,0,~0x3ffffff	/* aligned 64M */
>   	subf	r4,r5,r4	/* memstart_addr - phys kernel start */
> -	li	r5,0		/* no device tree */
> +	lis	r7,KERNELBASE@h
> +	ori	r7,r7,KERNELBASE@l
> +	cmpw	r20,r7		/* if kimage_vaddr != KERNELBASE, randomized */
> +	beq	2f
> +	li	r4,0
> +2:	li	r5,0		/* no device tree */
>   	li	r6,0		/* not boot cpu */
>   	bl	restore_to_as0
>   
> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
> new file mode 100644
> index 000000000000..30f84c0321b2
> --- /dev/null
> +++ b/arch/powerpc/kernel/kaslr_booke.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Jason Yan <yanaijie@huawei.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/signal.h>
> +#include <linux/sched.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/ptrace.h>
> +#include <linux/mman.h>
> +#include <linux/mm.h>
> +#include <linux/swap.h>
> +#include <linux/stddef.h>
> +#include <linux/vmalloc.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/highmem.h>
> +#include <linux/memblock.h>
> +#include <asm/pgalloc.h>
> +#include <asm/prom.h>
> +#include <asm/io.h>
> +#include <asm/mmu_context.h>
> +#include <asm/pgtable.h>
> +#include <asm/mmu.h>
> +#include <linux/uaccess.h>
> +#include <asm/smp.h>
> +#include <asm/machdep.h>
> +#include <asm/setup.h>
> +#include <asm/paca.h>
> +#include <mm/mmu_decl.h>
> +
> +extern int is_second_reloc;
> +
> +static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
> +						  unsigned long kernel_sz)
> +{
> +	/* return a fixed offset of 64M for now */
> +	return SZ_64M;
> +}
> +
> +/*
> + * To see if we need to relocate the kernel to a random offset
> + * void *dt_ptr - address of the device tree
> + * phys_addr_t size - size of the first memory block
> + */
> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
> +{
> +	unsigned long tlb_virt;
> +	phys_addr_t tlb_phys;
> +	unsigned long offset;
> +	unsigned long kernel_sz;
> +
> +	kernel_sz = (unsigned long)_end - KERNELBASE;
> +
> +	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
> +
> +	if (offset == 0)
> +		return;
> +
> +	kimage_vaddr += offset;
> +	kernstart_addr += offset;
> +
> +	is_second_reloc = 1;
> +
> +	if (offset >= SZ_64M) {
> +		tlb_virt = round_down(kimage_vaddr, SZ_64M);
> +		tlb_phys = round_down(kernstart_addr, SZ_64M);
> +
> +		/* Create kernel map to relocate in */
> +		create_tlb_entry(tlb_phys, tlb_virt, 1);
> +	}
> +
> +	/* Copy the kernel to it's new location and run */
> +	memcpy((void *)kimage_vaddr, (void *)KERNELBASE, kernel_sz);
> +
> +	reloc_kernel_entry(dt_ptr, kimage_vaddr);
> +}
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 804da298beb3..9332772c8a66 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -148,6 +148,12 @@ void reloc_kernel_entry(void *fdt, int addr);
>   extern void loadcam_entry(unsigned int index);
>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>   
> +#ifdef CONFIG_RANDOMIZE_BASE
> +void kaslr_early_init(void *dt_ptr, phys_addr_t size);
> +#else
> +static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
> +#endif
> +
>   struct tlbcam {
>   	u32	MAS0;
>   	u32	MAS1;
> diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
> index 556e3cd52a35..8d25a8dc965f 100644
> --- a/arch/powerpc/mm/nohash/fsl_booke.c
> +++ b/arch/powerpc/mm/nohash/fsl_booke.c
> @@ -263,7 +263,8 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   int __initdata is_second_reloc;
>   notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>   {
> -	unsigned long base = KERNELBASE;
> +	unsigned long base = kimage_vaddr;
> +	phys_addr_t size;
>   
>   	kernstart_addr = start;
>   	if (is_second_reloc) {
> @@ -291,7 +292,7 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>   	start &= ~0x3ffffff;
>   	base &= ~0x3ffffff;
>   	virt_phys_offset = base - start;
> -	early_get_first_memblock_info(__va(dt_ptr), NULL);
> +	early_get_first_memblock_info(__va(dt_ptr), &size);
>   	/*
>   	 * We now get the memstart_addr, then we should check if this
>   	 * address is the same as what the PAGE_OFFSET map to now. If
> @@ -316,6 +317,8 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>   		/* We should never reach here */
>   		panic("Relocation error");
>   	}
> +
> +	kaslr_early_init(__va(dt_ptr), size);
>   }
>   #endif
>   #endif
> 
