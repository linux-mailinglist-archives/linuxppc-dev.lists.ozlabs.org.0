Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BBB16F5B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 03:42:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S0TM2KRqzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:42:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S0R03dY8zDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 13:40:44 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 78F83B422DB2468B544E;
 Wed, 26 Feb 2020 10:40:40 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 26 Feb 2020 10:40:31 +0800
Subject: Re: [PATCH v3 3/6] powerpc/fsl_booke/64: implement KASLR for
 fsl_booke64
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <20200206025825.22934-4-yanaijie@huawei.com>
 <41b9f1ca-c6fd-291a-2c96-2a0e8a754ec4@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <dbe0b316-40a2-7da4-c26b-e59efa555400@huawei.com>
Date: Wed, 26 Feb 2020 10:40:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <41b9f1ca-c6fd-291a-2c96-2a0e8a754ec4@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/2/20 21:48, Christophe Leroy 写道:
> 
> 
> Le 06/02/2020 à 03:58, Jason Yan a écrit :
>> The implementation for Freescale BookE64 is similar as BookE32. One
>> difference is that Freescale BookE64 set up a TLB mapping of 1G during
>> booting. Another difference is that ppc64 needs the kernel to be
>> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
>> it 64K-aligned. This can save some code to creat another TLB map at
>> early boot. The disadvantage is that we only have about 1G/64K = 16384
>> slots to put the kernel in.
>>
>> To support secondary cpu boot up, a variable __kaslr_offset was added in
>> first_256B section. This can help secondary cpu get the kaslr offset
>> before the 1:1 mapping has been setup.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Scott Wood <oss@buserror.net>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/Kconfig                 |  2 +-
>>   arch/powerpc/kernel/exceptions-64e.S | 10 +++++++++
>>   arch/powerpc/kernel/head_64.S        |  7 ++++++
>>   arch/powerpc/kernel/setup_64.c       |  4 +++-
>>   arch/powerpc/mm/mmu_decl.h           | 16 +++++++-------
>>   arch/powerpc/mm/nohash/kaslr_booke.c | 33 +++++++++++++++++++++++++---
>>   6 files changed, 59 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index c150a9d49343..754aeb96bb1c 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -568,7 +568,7 @@ config RELOCATABLE
>>   config RANDOMIZE_BASE
>>       bool "Randomize the address of the kernel image"
>> -    depends on (FSL_BOOKE && FLATMEM && PPC32)
>> +    depends on (PPC_FSL_BOOK3E && FLATMEM)
>>       depends on RELOCATABLE
>>       help
>>         Randomizes the virtual address at which the kernel image is
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S 
>> b/arch/powerpc/kernel/exceptions-64e.S
>> index 1b9b174bee86..c1c05b8684ca 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -1378,6 +1378,7 @@ skpinv:    addi    r6,r6,1                /* 
>> Increment */
>>   1:    mflr    r6
>>       addi    r6,r6,(2f - 1b)
>>       tovirt(r6,r6)
>> +    add    r6,r6,r19
>>       lis    r7,MSR_KERNEL@h
>>       ori    r7,r7,MSR_KERNEL@l
>>       mtspr    SPRN_SRR0,r6
>> @@ -1400,6 +1401,7 @@ skpinv:    addi    r6,r6,1                /* 
>> Increment */
>>       /* We translate LR and return */
>>       tovirt(r8,r8)
>> +    add    r8,r8,r19
>>       mtlr    r8
>>       blr
>> @@ -1528,6 +1530,7 @@ a2_tlbinit_code_end:
>>    */
>>   _GLOBAL(start_initialization_book3e)
>>       mflr    r28
>> +    li    r19, 0
>>       /* First, we need to setup some initial TLBs to map the kernel
>>        * text, data and bss at PAGE_OFFSET. We don't have a real mode
>> @@ -1570,6 +1573,12 @@ _GLOBAL(book3e_secondary_core_init)
>>       cmplwi    r4,0
>>       bne    2f
>> +    li    r19, 0
>> +#ifdef CONFIG_RANDOMIZE_BASE
>> +    LOAD_REG_ADDR_PIC(r19, __kaslr_offset)
>> +    lwz    r19,0(r19)
>> +    rlwinm  r19,r19,0,0,5
>> +#endif
>>       /* Setup TLB for this core */
>>       bl    initial_tlb_book3e
>> @@ -1602,6 +1611,7 @@ _GLOBAL(book3e_secondary_core_init)
>>       lis    r3,PAGE_OFFSET@highest
>>       sldi    r3,r3,32
>>       or    r28,r28,r3
>> +    add    r28,r28,r19
>>   1:    mtlr    r28
>>       blr
>> diff --git a/arch/powerpc/kernel/head_64.S 
>> b/arch/powerpc/kernel/head_64.S
>> index ad79fddb974d..744624140fb8 100644
>> --- a/arch/powerpc/kernel/head_64.S
>> +++ b/arch/powerpc/kernel/head_64.S
>> @@ -104,6 +104,13 @@ __secondary_hold_acknowledge:
>>       .8byte    0x0
>>   #ifdef CONFIG_RELOCATABLE
>> +#ifdef CONFIG_RANDOMIZE_BASE
>> +    . = 0x58
>> +    .globl    __kaslr_offset
>> +__kaslr_offset:
>> +DEFINE_FIXED_SYMBOL(__kaslr_offset)
>> +    .long    0
>> +#endif
>>       /* This flag is set to 1 by a loader if the kernel should run
>>        * at the loaded address instead of the linked address.  This
>>        * is used by kexec-tools to keep the the kdump kernel in the
>> diff --git a/arch/powerpc/kernel/setup_64.c 
>> b/arch/powerpc/kernel/setup_64.c
>> index 6104917a282d..a16b970a8d1a 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -66,7 +66,7 @@
>>   #include <asm/feature-fixups.h>
>>   #include <asm/kup.h>
>>   #include <asm/early_ioremap.h>
>> -
> 
> Why remove this new line which clearly separates things in asm/ and 
> things in local dir ?

Sorry to break this. I will add the new line back.

> 
>> +#include <mm/mmu_decl.h>
>>   #include "setup.h"
>>   int spinning_secondaries;
>> @@ -300,6 +300,8 @@ void __init early_setup(unsigned long dt_ptr)
>>       /* Enable early debugging if any specified (see udbg.h) */
>>       udbg_early_init();
>> +    kaslr_early_init(__va(dt_ptr), 0);
>> +
>>       udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
>>       /*
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index 3e1c85c7d10b..bbd721d1e3d7 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> @@ -147,14 +147,6 @@ void reloc_kernel_entry(void *fdt, long addr);
>>   extern void loadcam_entry(unsigned int index);
>>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>> -#ifdef CONFIG_RANDOMIZE_BASE
>> -void kaslr_early_init(void *dt_ptr, phys_addr_t size);
>> -void kaslr_late_init(void);
>> -#else
>> -static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
>> -static inline void kaslr_late_init(void) {}
>> -#endif
>> -
>>   struct tlbcam {
>>       u32    MAS0;
>>       u32    MAS1;
>> @@ -164,6 +156,14 @@ struct tlbcam {
>>   };
>>   #endif
>> +#ifdef CONFIG_RANDOMIZE_BASE
>> +void kaslr_early_init(void *dt_ptr, phys_addr_t size);
>> +void kaslr_late_init(void);
>> +#else
>> +static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
>> +static inline void kaslr_late_init(void) {}
>> +#endif
>> +
>>   #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_FSL_BOOKE) || 
>> defined(CONFIG_PPC_8xx)
>>   /* 6xx have BATS */
>>   /* FSL_BOOKE have TLBCAM */
>> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c 
>> b/arch/powerpc/mm/nohash/kaslr_booke.c
>> index 07b036e98353..c6f5c1db1394 100644
>> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
>> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
>> @@ -231,7 +231,7 @@ static __init unsigned long 
>> get_usable_address(const void *fdt,
>>       unsigned long pa;
>>       unsigned long pa_end;
>> -    for (pa = offset; (long)pa > (long)start; pa -= SZ_16K) {
>> +    for (pa = offset; (long)pa > (long)start; pa -= SZ_64K) {
> 
> Doesn't this modify the behaviour for PPC32 too ?

Oh, yes. I will fix this.

> 
>>           pa_end = pa + regions.kernel_size;
>>           if (overlaps_region(fdt, pa, pa_end))
>>               continue;
>> @@ -265,14 +265,14 @@ static unsigned long __init 
>> kaslr_legal_offset(void *dt_ptr, unsigned long rando
>>   {
>>       unsigned long koffset = 0;
>>       unsigned long start;
>> -    unsigned long index;
>>       unsigned long offset;
>> +#ifdef CONFIG_PPC32
> 
> Can we use
> 
> if (IS_ENABLED(CONFIG_PPC32)) {
>      /* 32 bits stuff */
> } else {
>      /* 64 bits stuff */
> }

Thansk for the suggestion. I will consider to use IS_ENABLED() instead.

> 
>>       /*
>>        * Decide which 64M we want to start
>>        * Only use the low 8 bits of the random seed
>>        */
>> -    index = random & 0xFF;
>> +    unsigned long index = random & 0xFF;
> 
> That's not good in terms of readability, index declaration should remain 
> at the top of the function, should be possible if using IS_ENABLED() 
> instead

I'm wondering how to declare a variable inside a code block such as if 
(IS_ENABLED(CONFIG_PPC32)) at the top of the function and use the 
variable in another if (IS_ENABLED(CONFIG_PPC32)). Is there any good idea?

> 
>>       index %= regions.linear_sz / SZ_64M;
>>       /* Decide offset inside 64M */
>> @@ -287,6 +287,15 @@ static unsigned long __init 
>> kaslr_legal_offset(void *dt_ptr, unsigned long rando
>>               break;
>>           index--;
>>       }
>> +#else
>> +    /* Decide kernel offset inside 1G */
>> +    offset = random % (SZ_1G - regions.kernel_size);
>> +    offset = round_down(offset, SZ_64K);
>> +
>> +    start = memstart_addr;
>> +    offset = memstart_addr + offset;
>> +    koffset = get_usable_address(dt_ptr, start, offset);
>> +#endif
>>       if (koffset != 0)
>>           koffset -= memstart_addr;
>> @@ -325,6 +334,7 @@ static unsigned long __init 
>> kaslr_choose_location(void *dt_ptr, phys_addr_t size
>>       else
>>           pr_warn("KASLR: No safe seed for randomizing the kernel 
>> base.\n");
>> +#ifdef CONFIG_PPC32
>>       ram = min_t(phys_addr_t, __max_low_memory, size);
>>       ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
>>       linear_sz = min_t(unsigned long, ram, SZ_512M);
>> @@ -332,6 +342,7 @@ static unsigned long __init 
>> kaslr_choose_location(void *dt_ptr, phys_addr_t size
>>       /* If the linear size is smaller than 64M, do not randmize */
>>       if (linear_sz < SZ_64M)
>>           return 0;
>> +#endif
>>       /* check for a reserved-memory node and record its cell sizes */
>>       regions.reserved_mem = fdt_path_offset(dt_ptr, "/reserved-memory");
>> @@ -363,6 +374,17 @@ notrace void __init kaslr_early_init(void 
>> *dt_ptr, phys_addr_t size)
>>       unsigned long offset;
>>       unsigned long kernel_sz;
>> +#ifdef CONFIG_PPC64
> 
> Same, can we use a standard C if/else sequence with 
> IS_ENABLED(CONFIG_PPC64) ?

OK, I will try to do this if I can deal with the declaration of 
variables in different if/else sequence.

Thanks,
Jason


> 
>> +    unsigned int *__kaslr_offset = (unsigned int *)(KERNELBASE + 0x58);
>> +    unsigned int *__run_at_load = (unsigned int *)(KERNELBASE + 0x5c);
>> +
>> +    if (*__run_at_load == 1)
>> +        return;
>> +
>> +    /* Setup flat device-tree pointer */
>> +    initial_boot_params = dt_ptr;
>> +#endif
>> +
>>       kernel_sz = (unsigned long)_end - (unsigned long)_stext;
>>       offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>> @@ -372,6 +394,7 @@ notrace void __init kaslr_early_init(void *dt_ptr, 
>> phys_addr_t size)
>>       kernstart_virt_addr += offset;
>>       kernstart_addr += offset;
>> +#ifdef CONFIG_PPC32
>>       is_second_reloc = 1;
>>       if (offset >= SZ_64M) {
>> @@ -381,6 +404,10 @@ notrace void __init kaslr_early_init(void 
>> *dt_ptr, phys_addr_t size)
>>           /* Create kernel map to relocate in */
>>           create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
>>       }
>> +#else
>> +    *__kaslr_offset = kernstart_virt_addr - KERNELBASE;
>> +    *__run_at_load = 1;
>> +#endif
>>       /* Copy the kernel to it's new location and run */
>>       memcpy((void *)kernstart_virt_addr, (void *)_stext, kernel_sz);
>>
> 
> Christophe
> 
> .

