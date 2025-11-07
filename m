Return-Path: <linuxppc-dev+bounces-13944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E4C40D75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 17:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d346Y04Phz3bt9;
	Sat,  8 Nov 2025 03:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762532436;
	cv=none; b=aJc+zxdeB8HYUdV45OmGXMWXYfuAwQIJpNznRT0X3d4yf0WgA34Y5f6UP4S9fYqHFjp8EeQyJw035NmYrAzu3m7i2b93VZCIkzAJ1gz7NbFtWGqNsP3hXzGAABmeTwuzQnkDpk2KWWfmHDuOh4FjM6DVC/lnJVJ9gEZ5SNv0iP8SLMfFzI0Y1oTywRv80S4WkPiFFnfYHAJaaVNNpzb3YN+A/uk+RpLWXDiV1GO4yCz60UYeMg0e0rzP40EQcaIZPz/GeNzRwm+TC9MxcqyTeiLgl0AzcJlHwZmQ/iX6QzdWywzJa2TpkOKcWiUUB6lU56pD+iRPm4s0v13kUnGLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762532436; c=relaxed/relaxed;
	bh=/QMVyJmWT+2Mrow2G2bbvS6NbII3LFQeU04GAxrge4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6+kQlfIhfSB6t6zHoNHfhYxqOIpBx1Idzf8s3b3sIh7KH2zytNLORz3rzymuQaov3Q5XwY3xiDVAm5SURMpeKIk1ukngjfPW8nlC3bQcUNWw26uOuzW11TgWJ26X5tbtwE3hjoyb0ZCZvzOCnbcSJ9qSYUvwW46ZBDghDlKajvq7ohkguhwdk2/9nnAiRTuQ9/iSs8eo7N9wEh5Ga2FMNpzxIO9FFl/vhPlTjSXxepjRhMUvZityWDBybuPW96MGvP/Uk0XsozSCSEXxS8q49n/7taGVveyPPhlJBFZZ1DdgDqY5VBULh8Wp4Hiv4WwXfcqS2hJ174OEiausPLE0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d346W6VHhz3bsN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 03:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d33vf1WD9z9sRg;
	Fri,  7 Nov 2025 17:11:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5jMBVVQRjlA; Fri,  7 Nov 2025 17:11:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d33vb67HMz9sSN;
	Fri,  7 Nov 2025 17:11:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C349F8B799;
	Fri,  7 Nov 2025 17:11:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 07wmEkaVSV-N; Fri,  7 Nov 2025 17:11:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DEFBE8B787;
	Fri,  7 Nov 2025 17:11:05 +0100 (CET)
Message-ID: <329d210d-8185-469b-9f8c-f0ae66dd7c45@csgroup.eu>
Date: Fri, 7 Nov 2025 17:11:05 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
 <87ecq952pe.ritesh.list@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <87ecq952pe.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 07/11/2025 à 15:37, Ritesh Harjani a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Le 06/11/2025 à 16:02, David Hildenbrand (Red Hat) a écrit :
>>>>> Yes, we discussed that in [1].
>>>>>
>>>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>>>> have even larger hugetlb sizes than PUDs.
>>>>>
>>>>> @Cristophe, I was under the impression that you would send a fix. Do you
>>>>> want me to prepare something and send it out?
>>>>
>>>> Indeed I would have liked to better understand the implications of all
>>>> this, but I didn't have the time.
>>>
>>> Indeed, too me longer than it should to understand and make up my mind
>>> as well.
>>>
>>>>
>>>> By the way, you would describe the fix better than me so yes if you can
>>>> prepare and send a fix please do.
>>>
>>> I just crafted the following. I yet have to test it more, some early
>>> feedback+testing would be appreciated!
>>>
>>>   From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
>>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with hugetlb
>>>
>>> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
>>> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
>>> into a generic way for the architecture to state that it supports
>>> gigantic hugetlb folios.
>>>
>>> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
>>> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
>>> have folios larger than what the buddy can handle. In the context of
>>> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
>>> when dumping tail pages of folios. Before that commit, we assumed that
>>> we cannot have folios larger than the highest buddy order, which was
>>> obviously wrong.
>>>
>>> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>>> when registering hstate"), we used MAX_FOLIO_ORDER to detect
>>> inconsistencies, and in fact, we found some now.
>>>
>>> Powerpc allows for configs that can allocate gigantic folio during boot
>>> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
>>> exceed PUD_ORDER.
>>>
>>> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE for
>>> all 64bit configs, and increase the maximum folio size to P4D_ORDER.
>>>
>>> Ideally, we'd have a better way to obtain a maximum value. But this should
>>> be good enough for now fix the issue and now mostly states "no real folio
>>> size limit".
>>>
>>> While at it, handle gigantic DAX folios more clearly: DAX can only
>>> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>>>
>>> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
>>> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
>>> HUGETLB_PAGE.
>>>
>>> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on PPC64, we will now
>>> also allow for runtime allocations of folios in some more powerpc configs.
>>> I don't think this is a problem, but if it is we could handle it through
>>> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>>>
>>> While __dump_page()/__dump_folio was also problematic (not handling dumping
>>> of tail pages of such gigantic folios correctly), it doesn't relevant
>>> critical enough to mark it as a fix.
>>>
>>> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>>> when registering hstate")
>>> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
>>> ---
>>>    arch/powerpc/Kconfig                   | 1 +
>>>    arch/powerpc/platforms/Kconfig.cputype | 1 -
>>>    include/linux/mm.h                     | 4 ++--
>>>    include/linux/pgtable.h                | 1 +
>>>    mm/Kconfig                             | 7 +++++++
>>>    5 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index e24f4d88885ae..55c3626c86273 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -137,6 +137,7 @@ config PPC
>>>        select ARCH_HAS_DMA_OPS            if PPC64
>>>        select ARCH_HAS_FORTIFY_SOURCE
>>>        select ARCH_HAS_GCOV_PROFILE_ALL
>>> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64
> 
> 
> The patch looks good from PPC64 perspective, it also fixes the problem
> reported on corenet64_smp_defconfig...
> 
>>
>> Problem is not only on PPC64, it is on PPC32 as well, for instance
>> corenet32_smp_defconfig has the problem as well.
>>
> 
> However on looking deeper into it - I agree with Christophe that this
> problem might still exist on PPC32.
> 
> I did try the patch on corenet32_smp_defconfig and I can see the WARN_ON
> still triggering. You can check the logs here..
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Friteshharjani%2Flinux-ci%2Factions%2Fruns%2F19169468405%2Fjob%2F54799498288&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C27caddf37d884b359c4008de1e13dd22%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638981267852035218%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ceCXfRzudcYmZhzcoUYKMUeirOlKLgVdEy1L2vNrSPI%3D&reserved=0
> 
> 
>>
>> So I think what you want instead is:
>>
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>> b/arch/powerpc/platforms/Kconfig.cputype
>> index 7b527d18aa5ee..1f5a1e587740c 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -276,6 +276,7 @@ config PPC_E500
>>           select FSL_EMB_PERFMON
>>           bool
>>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>           select PPC_SMP_MUXED_IPI
>>           select PPC_DOORBELL
>>           select PPC_KUEP
>>
>>
>>
> 
> @Christophe,
> 
> I don't think even the above diff will fix the warning on PPC32.
> The patch defines MAX_FOLIO_ORDER as P4D_ORDER...
> 
> +#define MAX_FOLIO_ORDER        P4D_ORDER
> +#define P4D_ORDER              (P4D_SHIFT - PAGE_SHIFT)
> 
> and for ppc32 in..
> include/asm-generic/pgtable-nop4d.h
>      #define P4D_SHIFT		PGDIR_SHIFT
> 
> Then in..
> arch/powerpc/include/asm/nohash/32/pgtable.h
>      #define PGDIR_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>      #define PTE_INDEX_SIZE	PTE_SHIFT
> 
> in...
> arch/powerpc/include/asm/page_32.h
>      #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2)	/* full page */
> 
>      #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
> 
> 
> So if you see from above P4D_ORDER is coming down to PTE_INDEX_SIZE
> 
> IIUC, that will cause MAX_FOLIO_ORDER to be 9 in case of e500mc machine type right?
> 
> Can you please confirm if the above analysis looks correct to you?
> 

Ah you are right, that's not enough. I was thinking that PGDIR_ORDER was 
the highest possible value ever but in fact not. PGDIR_SIZE is 4Mbytes 
so any page larger than that still triggers the warning. Here are the 
warnings I get on QEMU with corenet32_smp_defconfig

random: crng init done
Hash pointers mode set to never.
Memory CAM mapping: 16/16/16/16/64/64/64/256/256 Mb, residual: 256Mb
Activating Kernel Userspace Access Protection
Activating Kernel Userspace Execution Prevention
Linux version 6.18.0-rc4-00026-g274928854644-dirty 
(chleroy@PO20335.IDSI0.si.c-s.fr) (powerpc64-linux-gcc (GCC) 8.5.0, GNU 
ld (GNU Binutils) 2.36.1) #1706 SMP Fri Nov  7 17:01:26 CET 2025
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
Found initrd at 0xc4000000:0xc41d1a3b
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
printk: legacy bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     = 0x40000000
dcache_bsize      = 0x40
icache_bsize      = 0x40
cpu_features      = 0x0000000000000194
   possible        = 0x000000000001039c
   always          = 0x0000000000000100
cpu_user_features = 0x8c008000 0x08000000
mmu_features      = 0x000a0210
-----------------------------------------------------
qemu_e500_setup_arch()
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
   Normal   [mem 0x0000000000000000-0x000000002fffffff]
   HighMem  [mem 0x0000000030000000-0x000000003fffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x000000003fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
percpu: Embedded 17 pages/cpu s39436 r8192 d22004 u69632
Kernel command line: hugepagesz=1g hugepages=1 hugepagesz=64m 
hugepages=1 hugepagesz=256m hugepages=1 noreboot no_hash_pointers
Unknown kernel command line parameters "noreboot", will be passed to 
user space.
printk: log buffer data + meta data: 16384 + 51200 = 67584 bytes
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4753 hugetlb_add_hstate+0x170/0x178
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
6.18.0-rc4-00026-g274928854644-dirty #1706 NONE
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c2027d88 LR: c2028548 CTR: 00000003
REGS: c24b5e10 TRAP: 0700   Not tainted 
(6.18.0-rc4-00026-g274928854644-dirty)
MSR:  00021002 <CE,ME>  CR: 24000424  XER: 20000000

GPR00: c2028548 c24b5f00 c23b5580 00000012 40000000 c24b5ee0 c24c0000 
00000000
GPR08: c24f7934 00001000 c23b74cc 00000000 c24f5070 02089cc0 00000000 
00000000
GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 ef7e7fc0 
c23b5008
GPR24: 00000000 c10937d4 0000000a c205b000 00000000 c24f7934 40000000 
c24f7934
NIP [c2027d88] hugetlb_add_hstate+0x170/0x178
LR [c2028548] hugepagesz_setup+0xb0/0x16c
Call Trace:
[c24b5f00] [c0d3dc6c] memparse+0x2c/0x104 (unreliable)
[c24b5f30] [c2028548] hugepagesz_setup+0xb0/0x16c
[c24b5f50] [c2028d18] hugetlb_bootmem_alloc+0x7c/0x194
[c24b5f80] [c2021628] mm_core_init+0x30/0x368
[c24b5fa0] [c2000ec0] start_kernel+0x2f4/0x7bc
[c24b5ff0] [c0000478] set_ivor+0x150/0x18c
Code: 60000000 60000000 2f8a0000 41deff28 83810020 83a10024 83c10028 
83e1002c 38210030 4e800020 0fe00000 0fe00000 <0fe00000> 4bffff24 
3d20c24d 9421ff60
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4753 hugetlb_add_hstate+0x170/0x178
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W 
6.18.0-rc4-00026-g274928854644-dirty #1706 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c2027d88 LR: c2028548 CTR: 00000005
REGS: c24b5e10 TRAP: 0700   Tainted: G        W 
(6.18.0-rc4-00026-g274928854644-dirty)
MSR:  00021002 <CE,ME>  CR: 24000224  XER: 20000000

GPR00: c2028548 c24b5f00 c23b5580 0000000e 04000000 c24b5ee0 c24c0000 
00000001
GPR08: 00001000 40000000 c24f79b4 00000000 24000424 02089cc0 00000000 
00000000
GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 ef7e7fc0 
c23b5008
GPR24: 00000000 c10937d4 0000000a c205b000 00000080 c24f7934 04000000 
c24f79b4
NIP [c2027d88] hugetlb_add_hstate+0x170/0x178
LR [c2028548] hugepagesz_setup+0xb0/0x16c
Call Trace:
[c24b5f00] [c0d3dc6c] memparse+0x2c/0x104 (unreliable)
[c24b5f30] [c2028548] hugepagesz_setup+0xb0/0x16c
[c24b5f50] [c2028d18] hugetlb_bootmem_alloc+0x7c/0x194
[c24b5f80] [c2021628] mm_core_init+0x30/0x368
[c24b5fa0] [c2000ec0] start_kernel+0x2f4/0x7bc
[c24b5ff0] [c0000478] set_ivor+0x150/0x18c
Code: 60000000 60000000 2f8a0000 41deff28 83810020 83a10024 83c10028 
83e1002c 38210030 4e800020 0fe00000 0fe00000 <0fe00000> 4bffff24 
3d20c24d 9421ff60
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4753 hugetlb_add_hstate+0x170/0x178
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W 
6.18.0-rc4-00026-g274928854644-dirty #1706 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c2027d88 LR: c2028548 CTR: 00000004
REGS: c24b5e10 TRAP: 0700   Tainted: G        W 
(6.18.0-rc4-00026-g274928854644-dirty)
MSR:  00021002 <CE,ME>  CR: 24000224  XER: 20000000

GPR00: c2028548 c24b5f00 c23b5580 00000010 10000000 c24b5ee0 c24c0000 
00000002
GPR08: 00001000 04000000 c24f7a34 00000000 24000224 02089cc0 00000000 
00000000
GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 ef7e7fc0 
c23b5008
GPR24: 00000000 c10937d4 0000000a c205b000 00000100 c24f7934 10000000 
c24f7a34
NIP [c2027d88] hugetlb_add_hstate+0x170/0x178
LR [c2028548] hugepagesz_setup+0xb0/0x16c
Call Trace:
[c24b5f00] [c0d3dc6c] memparse+0x2c/0x104 (unreliable)
[c24b5f30] [c2028548] hugepagesz_setup+0xb0/0x16c
[c24b5f50] [c2028d18] hugetlb_bootmem_alloc+0x7c/0x194
[c24b5f80] [c2021628] mm_core_init+0x30/0x368
[c24b5fa0] [c2000ec0] start_kernel+0x2f4/0x7bc
[c24b5ff0] [c0000478] set_ivor+0x150/0x18c
Code: 60000000 60000000 2f8a0000 41deff28 83810020 83a10024 83c10028 
83e1002c 38210030 4e800020 0fe00000 0fe00000 <0fe00000> 4bffff24 
3d20c24d 9421ff60
---[ end trace 0000000000000000 ]---
HugeTLB: allocating 1 of page size 1.00 GiB failed.  Only allocated 0 
hugepages.
Built 1 zonelists, mobility grouping on.  Total pages: 262144
mem auto-init: stack:off, heap alloc:off, heap free:off
**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
** Use hash_pointers=always to force this mode off      **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
rcu: Hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=24 to nr_cpu_ids=2.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1 
rcu_task_cpu_ids=2.
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 2 CPUs
mpic: ISU size: 256, shift: 8, mask: ff
mpic: Initializing for 256 sources
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 
0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
e500 family performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
smp: Bringing up secondary CPUs ...
Activating Kernel Userspace Access Protection
smp: Brought up 1 node, 2 CPUs
Memory: 668416K/1048576K available (13796K kernel code, 1160K rwdata, 
18972K rodata, 3796K init, 245K bss, 377736K reserved, 0K cma-reserved, 
262144K highmem)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 7645041785100000 ns
posixtimers hash table entries: 1024 (order: 1, 8192 bytes, linear)
futex hash table entries: 512 (32768 bytes on 1 NUMA nodes, total 32 
KiB, linear).
Machine: QEMU ppce500
SoC family: QorIQ
SoC ID: svr:0x00000000, Revision: 0.0
NET: Registered PF_NETLINK/PF_ROUTE protocol family
audit: initializing netlink subsys (disabled)
audit: type=2000 audit(0.224:1): state=initialized audit_enabled=0 res=1

------------[ cut here ]------------
WARNING: CPU: 1 PID: 1 at mm/hugetlb.c:4753 hugetlb_add_hstate+0x170/0x178
Modules linked in:
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W 
6.18.0-rc4-00026-g274928854644-dirty #1706 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c2027d88 LR: c200bab4 CTR: 00000008
REGS: c50cdce0 TRAP: 0700   Tainted: G        W 
(6.18.0-rc4-00026-g274928854644-dirty)
MSR:  00029002 <CE,EE,ME>  CR: 48000824  XER: 20000000

GPR00: c200bab4 c50cddd0 c50f0000 0000000a 00029002 0000002c c24c0000 
00000003
GPR08: 00001000 10000000 c24f7ab4 00000004 44000828 00000000 c00043b8 
00000000
GPR16: 00000000 00000000 00000000 00000000 00000000 c24be774 c205c024 
c20000c4
GPR24: c5138a80 00000000 c23b74dc 00000000 00000180 c24f7934 00400000 
c24f7ab4
NIP [c2027d88] hugetlb_add_hstate+0x170/0x178
LR [c200bab4] hugetlbpage_init+0x98/0x118
Call Trace:
[c50cddd0] [c0017de0] udbg_uart_putc+0x48/0x94 (unreliable)
[c50cde00] [c200bab4] hugetlbpage_init+0x98/0x118
[c50cde30] [c0004130] do_one_initcall+0x58/0x228
[c50cdea0] [c200162c] kernel_init_freeable+0x224/0x3c8
[c50cdee0] [c00043d8] kernel_init+0x20/0x148
[c50cdf00] [c0015224] ret_from_kernel_user_thread+0x10/0x18
---- interrupt: 0 at 0x0
Code: 60000000 60000000 2f8a0000 41deff28 83810020 83a10024 83c10028 
83e1002c 38210030 4e800020 0fe00000 0fe00000 <0fe00000> 4bffff24 
3d20c24d 9421ff60
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 1 PID: 1 at mm/hugetlb.c:4753 hugetlb_add_hstate+0x170/0x178
Modules linked in:
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W 
6.18.0-rc4-00026-g274928854644-dirty #1706 NONE
Tainted: [W]=WARN
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c2027d88 LR: c200bab4 CTR: 00000006
REGS: c50cdce0 TRAP: 0700   Tainted: G        W 
(6.18.0-rc4-00026-g274928854644-dirty)
MSR:  00029002 <CE,EE,ME>  CR: 44000224  XER: 20000000

GPR00: c200bab4 c50cddd0 c50f0000 0000000c c100e27a 00000002 c24c0000 
00000004
GPR08: 00001000 00400000 c24f7b34 ffffffff 48000824 00000000 c00043b8 
00000000
GPR16: 00000000 00000000 00000000 00000000 00000000 c24be774 c205c024 
c20000c4
GPR24: c5138a80 00000001 c23b74dc 00000000 00000200 c24f7934 01000000 
c24f7b34
NIP [c2027d88] hugetlb_add_hstate+0x170/0x178
LR [c200bab4] hugetlbpage_init+0x98/0x118
Call Trace:
[c50cddd0] [c2027d2c] hugetlb_add_hstate+0x114/0x178 (unreliable)
[c50cde00] [c200bab4] hugetlbpage_init+0x98/0x118
[c50cde30] [c0004130] do_one_initcall+0x58/0x228
[c50cdea0] [c200162c] kernel_init_freeable+0x224/0x3c8
[c50cdee0] [c00043d8] kernel_init+0x20/0x148
[c50cdf00] [c0015224] ret_from_kernel_user_thread+0x10/0x18
---- interrupt: 0 at 0x0
Code: 60000000 60000000 2f8a0000 41deff28 83810020 83a10024 83c10028 
83e1002c 38210030 4e800020 0fe00000 0fe00000 <0fe00000> 4bffff24 
3d20c24d 9421ff60
---[ end trace 0000000000000000 ]---
Found FSL PCI host bridge at 0x0000000fe0008000. Firmware bus number: 0->255
PCI host bridge /pci@fe0008000 (primary) ranges:
  MEM 0x0000000c00000000..0x0000000c1fffffff -> 0x00000000e0000000
   IO 0x0000000fe1000000..0x0000000fe100ffff -> 0x0000000000000000
/pci@fe0008000: PCICSRBAR @ 0xdff00000
setup_pci_atmu: end of DRAM 40000000
fsl-pamu: fsl_pamu_init: could not find a PAMU node
PCI: Probing PCI hardware
fsl-pci fe0008000.pci: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xc00000000-0xc1fffffff] (bus 
address [0xe0000000-0xffffffff])
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [1957:0030] type 00 class 0x0b2000 conventional PCI 
endpoint
pci 0000:00:00.0: BAR 0 [mem 0xdff00000-0xdfffffff]
pci 0000:00:01.0: [8086:100e] type 00 class 0x020000 conventional PCI 
endpoint
pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x0001ffff]
pci 0000:00:01.0: BAR 1 [io  0x0000-0x003f]
pci 0000:00:01.0: ROM [mem 0x00000000-0x0003ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:01.0: ROM [mem 0xc00000000-0xc0003ffff pref]: assigned
pci 0000:00:01.0: BAR 0 [mem 0xc00040000-0xc0005ffff]: assigned
pci 0000:00:01.0: BAR 1 [io  0x1000-0x103f]: assigned
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0xc00000000-0xc1fffffff]
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page


Christophe

