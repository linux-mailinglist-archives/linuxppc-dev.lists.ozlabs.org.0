Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E17B7E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 04:05:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yxZn1g8XzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 12:05:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yxXq3WqtzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 12:03:23 +1000 (AEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 56B5A6CB9E96C00784DA;
 Wed, 31 Jul 2019 10:03:18 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 10:03:07 +0800
Subject: Re: [PATCH v2 06/10] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190730074225.39544-1-yanaijie@huawei.com>
 <20190730074225.39544-7-yanaijie@huawei.com>
 <b2fbc322-5276-364c-1f61-4d1db98c3696@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <602e552f-c2ec-38e0-f5be-da1653b6e0c3@huawei.com>
Date: Wed, 31 Jul 2019 10:03:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <b2fbc322-5276-364c-1f61-4d1db98c3696@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.96.203]
X-CFilter-Loop: Reflected
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



On 2019/7/30 17:34, Christophe Leroy wrote:
> 
> 
> Le 30/07/2019 à 09:42, Jason Yan a écrit :
>> This patch add support to boot kernel from places other than KERNELBASE.
>> Since CONFIG_RELOCATABLE has already supported, what we need to do is
>> map or copy kernel to a proper place and relocate. Freescale Book-E
>> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
>> entries are not suitable to map the kernel directly in a randomized
>> region, so we chose to copy the kernel to a proper place and restart to
>> relocate.
>>
>> The offset of the kernel was not randomized yet(a fixed 64M is set). We
>> will randomize it in the next patch.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/Kconfig                          | 11 +++
>>   arch/powerpc/kernel/Makefile                  |  1 +
>>   arch/powerpc/kernel/early_32.c                |  2 +-
>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 13 ++-
>>   arch/powerpc/kernel/head_fsl_booke.S          | 15 +++-
>>   arch/powerpc/kernel/kaslr_booke.c             | 84 +++++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h                    |  6 ++
>>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 +-
>>   8 files changed, 126 insertions(+), 13 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
>>
> 
> [...]
> 
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S 
>> b/arch/powerpc/kernel/head_fsl_booke.S
>> index 2083382dd662..a466c0f0d028 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -155,6 +155,8 @@ _ENTRY(_start);
>>    */
>>   _ENTRY(__early_start)
>> +    LOAD_REG_ADDR_PIC(r20, kimage_vaddr)
>> +    lwz     r20,0(r20)
>>   #define ENTRY_MAPPING_BOOT_SETUP
>>   #include "fsl_booke_entry_mapping.S"
>> @@ -277,8 +279,8 @@ set_ivor:
>>       ori    r6, r6, swapper_pg_dir@l
>>       lis    r5, abatron_pteptrs@h
>>       ori    r5, r5, abatron_pteptrs@l
>> -    lis    r4, KERNELBASE@h
>> -    ori    r4, r4, KERNELBASE@l
>> +    lis     r3, kimage_vaddr@ha
>> +    lwz     r4, kimage_vaddr@l(r3)
>>       stw    r5, 0(r4)    /* Save abatron_pteptrs at a fixed location */
>>       stw    r6, 0(r5)
>> @@ -1067,7 +1069,14 @@ __secondary_start:
>>       mr    r5,r25        /* phys kernel start */
>>       rlwinm    r5,r5,0,~0x3ffffff    /* aligned 64M */
>>       subf    r4,r5,r4    /* memstart_addr - phys kernel start */
>> -    li    r5,0        /* no device tree */
>> +#ifdef CONFIG_RANDOMIZE_BASE
> 
> Is that #ifdef really necessary ? Wouldn't it also work as expected when 
> CONFIG_RANDOMIZE_BASE is not selected ?
> 

Yes, it will also work if CONFIG_RANDOMIZE_BASE is not enabled. I can 
remove it.

>> +    lis    r7,KERNELBASE@h
>> +    ori    r7,r7,KERNELBASE@l
>> +    cmpw    r20,r7        /* if kimage_vaddr != KERNELBASE, 
>> randomized */
>> +    beq    2f
>> +    li    r4,0
>> +#endif
>> +2:    li    r5,0        /* no device tree */
>>       li    r6,0        /* not boot cpu */
>>       bl    restore_to_as0
>> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
>> b/arch/powerpc/kernel/kaslr_booke.c
>> new file mode 100644
>> index 000000000000..960bce4aa8b9
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2019 Jason Yan <yanaijie@huawei.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/signal.h>
>> +#include <linux/sched.h>
>> +#include <linux/kernel.h>
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
>> +#include <linux/ptrace.h>
>> +#include <linux/mman.h>
>> +#include <linux/mm.h>
>> +#include <linux/swap.h>
>> +#include <linux/stddef.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/init.h>
>> +#include <linux/delay.h>
>> +#include <linux/highmem.h>
>> +#include <linux/memblock.h>
>> +#include <asm/pgalloc.h>
>> +#include <asm/prom.h>
>> +#include <asm/io.h>
>> +#include <asm/mmu_context.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/mmu.h>
>> +#include <linux/uaccess.h>
>> +#include <asm/smp.h>
>> +#include <asm/machdep.h>
>> +#include <asm/setup.h>
>> +#include <asm/paca.h>
>> +#include <mm/mmu_decl.h>
>> +
>> +extern int is_second_reloc;
> 
> Couldn't the above be a bool ?
> 

This variable is both used in C and assembly. Use int make it more 
explicit to compare it with 0 or 1 in assembly.

>> +
>> +static unsigned long __init kaslr_choose_location(void *dt_ptr, 
>> phys_addr_t size,
>> +                          unsigned long kernel_sz)
>> +{
>> +    /* return a fixed offset of 64M for now */
>> +    return 0x4000000;
> 
> 64 << 20 would maybe be more explicit than 0x4000000.
> 
> Or return SZ_64M ?
> 

SZ_64M would be good.

> Christophe
> 
>> +}
>> +
>> +/*
>> + * To see if we need to relocate the kernel to a random offset
>> + * void *dt_ptr - address of the device tree
>> + * phys_addr_t size - size of the first memory block
>> + */
>> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>> +{
>> +    unsigned long tlb_virt;
>> +    phys_addr_t tlb_phys;
>> +    unsigned long offset;
>> +    unsigned long kernel_sz;
>> +
>> +    kernel_sz = (unsigned long)_end - KERNELBASE;
>> +
>> +    offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>> +
>> +    if (offset == 0)
>> +        return;
>> +
>> +    kimage_vaddr += offset;
>> +    kernstart_addr += offset;
>> +
>> +    is_second_reloc = 1;
>> +
>> +    if (offset >= SZ_64M) {
>> +        tlb_virt = round_down(kimage_vaddr, SZ_64M);
>> +        tlb_phys = round_down(kernstart_addr, SZ_64M);
>> +
>> +        /* Create kernel map to relocate in */
>> +        create_tlb_entry(tlb_phys, tlb_virt, 1);
>> +    }
>> +
>> +    /* Copy the kernel to it's new location and run */
>> +    memcpy((void *)kimage_vaddr, (void *)KERNELBASE, kernel_sz);
>> +
>> +    reloc_kernel_entry(dt_ptr, kimage_vaddr);
>> +}
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index 804da298beb3..9332772c8a66 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> @@ -148,6 +148,12 @@ void reloc_kernel_entry(void *fdt, int addr);
>>   extern void loadcam_entry(unsigned int index);
>>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>> +#ifdef CONFIG_RANDOMIZE_BASE
>> +void kaslr_early_init(void *dt_ptr, phys_addr_t size);
>> +#else
>> +static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
>> +#endif
>> +
>>   struct tlbcam {
>>       u32    MAS0;
>>       u32    MAS1;
>> diff --git a/arch/powerpc/mm/nohash/fsl_booke.c 
>> b/arch/powerpc/mm/nohash/fsl_booke.c
>> index 556e3cd52a35..8d25a8dc965f 100644
>> --- a/arch/powerpc/mm/nohash/fsl_booke.c
>> +++ b/arch/powerpc/mm/nohash/fsl_booke.c
>> @@ -263,7 +263,8 @@ void setup_initial_memory_limit(phys_addr_t 
>> first_memblock_base,
>>   int __initdata is_second_reloc;
>>   notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>>   {
>> -    unsigned long base = KERNELBASE;
>> +    unsigned long base = kimage_vaddr;
>> +    phys_addr_t size;
>>       kernstart_addr = start;
>>       if (is_second_reloc) {
>> @@ -291,7 +292,7 @@ notrace void __init relocate_init(u64 dt_ptr, 
>> phys_addr_t start)
>>       start &= ~0x3ffffff;
>>       base &= ~0x3ffffff;
>>       virt_phys_offset = base - start;
>> -    early_get_first_memblock_info(__va(dt_ptr), NULL);
>> +    early_get_first_memblock_info(__va(dt_ptr), &size);
>>       /*
>>        * We now get the memstart_addr, then we should check if this
>>        * address is the same as what the PAGE_OFFSET map to now. If
>> @@ -316,6 +317,8 @@ notrace void __init relocate_init(u64 dt_ptr, 
>> phys_addr_t start)
>>           /* We should never reach here */
>>           panic("Relocation error");
>>       }
>> +
>> +    kaslr_early_init(__va(dt_ptr), size);
>>   }
>>   #endif
>>   #endif
>>
> 
> .
> 

