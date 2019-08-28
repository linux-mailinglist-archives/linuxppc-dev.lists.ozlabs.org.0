Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16FA0072
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JNFJ2dCCzDr6W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 21:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JNC05GPCzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 21:03:24 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BD5DA38B7246062394D8;
 Wed, 28 Aug 2019 19:03:19 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 28 Aug 2019
 19:03:12 +0800
Subject: Re: [PATCH v6 06/12] powerpc/fsl_booke/32: implement KASLR
 infrastructure
To: Scott Wood <oss@buserror.net>
References: <20190809100800.5426-1-yanaijie@huawei.com>
 <20190809100800.5426-7-yanaijie@huawei.com>
 <20190828045454.GB17757@home.buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <de603506-5c4e-4ca3-bd77-e3a69af9faef@huawei.com>
Date: Wed, 28 Aug 2019 19:03:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190828045454.GB17757@home.buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, jingxiangfeng@huawei.com, diana.craciun@nxp.com,
 paulus@samba.org, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/8/28 12:54, Scott Wood wrote:
> On Fri, Aug 09, 2019 at 06:07:54PM +0800, Jason Yan wrote:
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
>> Tested-by: Diana Craciun <diana.craciun@nxp.com>
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/Kconfig                          | 11 ++++
>>   arch/powerpc/kernel/Makefile                  |  1 +
>>   arch/powerpc/kernel/early_32.c                |  2 +-
>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S | 17 +++--
>>   arch/powerpc/kernel/head_fsl_booke.S          | 13 +++-
>>   arch/powerpc/kernel/kaslr_booke.c             | 62 +++++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h                    |  7 +++
>>   arch/powerpc/mm/nohash/fsl_booke.c            |  7 ++-
>>   8 files changed, 105 insertions(+), 15 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 77f6ebf97113..710c12ef7159 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -548,6 +548,17 @@ config RELOCATABLE
>>   	  setting can still be useful to bootwrappers that need to know the
>>   	  load address of the kernel (eg. u-boot/mkimage).
>>   
>> +config RANDOMIZE_BASE
>> +	bool "Randomize the address of the kernel image"
>> +	depends on (FSL_BOOKE && FLATMEM && PPC32)
>> +	depends on RELOCATABLE
>> +	help
>> +	  Randomizes the virtual address at which the kernel image is
>> +	  loaded, as a security feature that deters exploit attempts
>> +	  relying on knowledge of the location of kernel internals.
>> +
>> +	  If unsure, say N.
>> +
> 
> Why is N the safe default (other than concerns about code maturity,
> though arm64 and mips don't seem to have updated this recommendation
> after several years)?  On x86 this defaults to Y.
> 

Actually I would like to set this default Y. I was just wondering if
people like this feature or not at the beginning so I had to be more
careful.

>> diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
>> index f4d3eaae54a9..641920d4f694 100644
>> --- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S
>> +++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
>> @@ -155,23 +155,22 @@ skpinv:	addi	r6,r6,1				/* Increment */
>>   
>>   #if defined(ENTRY_MAPPING_BOOT_SETUP)
>>   
>> -/* 6. Setup KERNELBASE mapping in TLB1[0] */
>> +/* 6. Setup kernstart_virt_addr mapping in TLB1[0] */
>>   	lis	r6,0x1000		/* Set MAS0(TLBSEL) = TLB1(1), ESEL = 0 */
>>   	mtspr	SPRN_MAS0,r6
>>   	lis	r6,(MAS1_VALID|MAS1_IPROT)@h
>>   	ori	r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
>>   	mtspr	SPRN_MAS1,r6
>> -	lis	r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, MAS2_M_IF_NEEDED)@h
>> -	ori	r6,r6,MAS2_VAL(PAGE_OFFSET, BOOK3E_PAGESZ_64M, MAS2_M_IF_NEEDED)@l
>> -	mtspr	SPRN_MAS2,r6
>> +	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
>> +	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
>> +	and     r6,r6,r20
>> +	ori	r6,r6,MAS2_M_IF_NEEDED@l
>> +	mtspr   SPRN_MAS2,r6
> 
> Please use tabs rather than spaces between the mnemonic and the
> arguments.
> 
> It looks like that was the last user of MAS2_VAL so let's remove it.
> 

OK.

>> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
>> new file mode 100644
>> index 000000000000..f8dc60534ac1
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
> 
> Shouldn't this go under arch/powerpc/mm/nohash?
> 
>> +/*
>> + * To see if we need to relocate the kernel to a random offset
>> + * void *dt_ptr - address of the device tree
>> + * phys_addr_t size - size of the first memory block
>> + */
>> +notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>> +{
>> +	unsigned long tlb_virt;
>> +	phys_addr_t tlb_phys;
>> +	unsigned long offset;
>> +	unsigned long kernel_sz;
>> +
>> +	kernel_sz = (unsigned long)_end - KERNELBASE;
> 
> Why KERNELBASE and not kernstart_addr?
> 

Did you mean kernstart_virt_addr? It should be kernstart_virt_addr.

>> +
>> +	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>> +
>> +	if (offset == 0)
>> +		return;
>> +
>> +	kernstart_virt_addr += offset;
>> +	kernstart_addr += offset;
>> +
>> +	is_second_reloc = 1;
>> +
>> +	if (offset >= SZ_64M) {
>> +		tlb_virt = round_down(kernstart_virt_addr, SZ_64M);
>> +		tlb_phys = round_down(kernstart_addr, SZ_64M);
> 
> If kernstart_addr wasn't 64M-aligned before adding offset, then "offset
>> = SZ_64M" is not necessarily going to detect when you've crossed a
> mapping boundary.
> >> +
>> +		/* Create kernel map to relocate in */
>> +		create_tlb_entry(tlb_phys, tlb_virt, 1);
>> +	}
>> +
>> +	/* Copy the kernel to it's new location and run */
>> +	memcpy((void *)kernstart_virt_addr, (void *)KERNELBASE, kernel_sz);
>> +
>> +	reloc_kernel_entry(dt_ptr, kernstart_virt_addr);
>> +}
> 
> After copying, call flush_icache_range() on the destination.
> 

OK

>> diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
>> index 556e3cd52a35..2dc27cf88add 100644
>> --- a/arch/powerpc/mm/nohash/fsl_booke.c
>> +++ b/arch/powerpc/mm/nohash/fsl_booke.c
>> @@ -263,7 +263,8 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>>   int __initdata is_second_reloc;
>>   notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>>   {
>> -	unsigned long base = KERNELBASE;
>> +	unsigned long base = kernstart_virt_addr;
>> +	phys_addr_t size;
>>   
>>   	kernstart_addr = start;
>>   	if (is_second_reloc) {
>> @@ -291,7 +292,7 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>>   	start &= ~0x3ffffff;
>>   	base &= ~0x3ffffff;
>>   	virt_phys_offset = base - start;
>> -	early_get_first_memblock_info(__va(dt_ptr), NULL);
>> +	early_get_first_memblock_info(__va(dt_ptr), &size);
>>   	/*
>>   	 * We now get the memstart_addr, then we should check if this
>>   	 * address is the same as what the PAGE_OFFSET map to now. If
>> @@ -316,6 +317,8 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
>>   		/* We should never reach here */
>>   		panic("Relocation error");
>>   	}
>> +
>> +	kaslr_early_init(__va(dt_ptr), size);
> 
> Are you assuming that available memory starts at physical address zero?
> This isn't true of some partitioning scenarios, or in a kdump crash
> kernel.
> 

I'm not assuming that but I haven't tested that case for now. I will 
reconsider and test these scenarios and fix all bugs.

> -Scott
> 
> .
> 

