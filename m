Return-Path: <linuxppc-dev+bounces-10121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CEDAF9FD0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 13:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZ7NB3Xb1z2y06;
	Sat,  5 Jul 2025 21:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751714442;
	cv=none; b=AHvMlhSRmGbS7ntJWi3u5ZXE9h2A95Kg1A2cyApMqTN9x5RWnk9HttWB7857I0fHCK++KNaHgd6S1vTPk8qBexCpI5T1sn5Pmcfmh88e8h0D+jmMyQcfWj90hfnC15JrsWaGOc/IbTbic6DfdXySuzQspiYn5LbIAQxQhWuzgIMwhcBZWFOxF7BffWdb9Xe+Zp2dpVe+6iPFDO5FpG72I/NQIOmQcQe466XAbfrLEJLCcPIa/Ketx5rKfVsw0PKZpYN5sJtoUKaOKcsPpzfprBHK/Pv5VL3nTOsWaVKt/NZn9VcY5OlhyfmNeszFYQOyTyEKx0FPekCC+f9hYdOH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751714442; c=relaxed/relaxed;
	bh=acXtqbiEte4LTOtLhv8uC//Brxig0dWefOt+P1tDcZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNk+4XMNggQV8oYYvbxw7TpjDJFz+bFwhdiz86fBfc9EPPXgnFIxY6un2qJe9GckIW6ZRJlgqOtl8J4XpjciWqUesgYbsYfh0efGDRdjN9T0g4p9JZHZj4n4Iozc0qoNqLRy3tTrLCXvq/SRvSYQKSalOxZETlJL383XzNBMK+tZ2C//QLg8f6VxN8wrcAKBvrVvZ4qTKaC8HSo6Z/ZGRelggKGgDHPG3u3rUbCLxB5/Tn08kKN0W9r1G9hQymTNWQWqTXrwbF5wXp/nUi0p5o2gIqPyV0Q8DS1ScY1jSED6+TsqYWj3TaiWc64dVW6Cwl0vr/bEcP1y80BYQdojwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZ7N50ylbz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jul 2025 21:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bZ6pk3vqKz9syQ;
	Sat,  5 Jul 2025 12:55:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFHckNlESQUx; Sat,  5 Jul 2025 12:55:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bZ6pk2fTFz9sy4;
	Sat,  5 Jul 2025 12:55:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 535538B7A9;
	Sat,  5 Jul 2025 12:55:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wky-Rq-Yptn6; Sat,  5 Jul 2025 12:55:10 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E3ACB8B798;
	Sat,  5 Jul 2025 12:55:08 +0200 (CEST)
Message-ID: <3e9bff9f-1aaf-4e91-a6c0-328a343d18f1@csgroup.eu>
Date: Sat, 5 Jul 2025 12:55:06 +0200
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
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Laight <david.laight.linux@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622172043.3fb0e54c@pumpkin>
 <ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
 <20250624131714.GG17294@gate.crashing.org> <20250624175001.148a768f@pumpkin>
 <20250624182505.GH17294@gate.crashing.org> <20250624220816.078f960d@pumpkin>
 <83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
 <20250626220148.GR17294@gate.crashing.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250626220148.GR17294@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/06/2025 à 00:01, Segher Boessenkool a écrit :
> On Thu, Jun 26, 2025 at 07:56:10AM +0200, Christophe Leroy wrote:
>> Le 24/06/2025 à 23:08, David Laight a écrit :
>>> On Tue, 24 Jun 2025 13:25:05 -0500
>>> Segher Boessenkool <segher@kernel.crashing.org> wrote:
>>>>>> isel (which is base PowerPC, not something "e500" only) is a
>>>>>> computational instruction, it copies one of two registers to a third,
>>>>>> which of the two is decided by any bit in the condition register.
>>>>>
>>>>> Does that mean it could be used for all the ppc cpu variants?
>>>>
>>>> No, only things that implement architecture version of 2.03 or later.
>>>> That is from 2006, so essentially everything that is still made
>>>> implements it :-)
>>>>
>>>> But ancient things do not.  Both 970 (Apple G5) and Cell BE do not yet
>>>> have it (they are ISA 2.01 and 2.02 respectively).  And the older p5's
>>>> do not have it yet either, but the newer ones do.
>>
>> For book3s64, GCC only use isel with -mcpu=power9 or -mcpu=power10
> 
> I have no idea what "book3s64" means.

Well that's the name given in Linux kernel to the 64 bits power CPU 
processors. See commits subject:

f5164797284d book3s64/radix : Optimize vmemmap start alignment
58450938f771 book3s64/radix : Handle error conditions properly in 
radix_vmemmap_populate
9cf7e13fecba book3s64/radix : Align section vmemmap start address to 
PAGE_SIZE
29bdc1f1c1df book3s64/radix: Fix compile errors when 
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
d629d7a8efc3 powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump 
is active
5959ffabbb67 arch/powerpc: teach book3s64 
arch_get_unmapped_area{_topdown} to handle hugetlb mappings
8846d9683884 book3s64/hash: Early detect debug_pagealloc size requirement
76b7d6463fc5 book3s64/hash: Disable kfence if not early init
b5fbf7e2c6a4 book3s64/radix: Refactoring common kfence related functions
8fec58f503b2 book3s64/hash: Add kfence functionality
47dd2e63d42a book3s64/hash: Disable debug_pagealloc if it requires more 
memory
...

> 
> Some ancient Power architecture versions had something called
> "Book III-S", which was juxtaposed to "Book III-E", which essentially
> corresponds to the old aborted BookE stuff.
> 
> I guess you mean almost all non-FSL implementations?  Most of those
> support the isel insns.  Like, Power5+ (GS).  And everything after that.
> 
> I have no idea why you think power9 has it while older CPUS do not.  In
> the GCC source code we have this comment:

I think nothing, I just observed that GCC doesn't use it unless you tell 
it is power9 or power10. But OK, the comment explains why.

>    /* For ISA 2.06, don't add ISEL, since in general it isn't a win, but
>       altivec is a win so enable it.  */
> and in fact we do not enable it for ISA 2.06 (p8) either, probably for
> a similar reason.
> 
>>>> And all classic PowerPC is ISA 1.xx of course.  Medieval CPUs :-)
>>>
>>> That make more sense than the list in patch 5/5.
>>
>> Sorry for the ambiguity. In patch 5/5 I was addressing only powerpc/32,
>> and as far as I know the only powerpc/32 supported by Linux that has
>> isel is the 85xx which has an e500 core.
> 
> What is "powerpc/32"?  It does not help if you use different names from
> what everyone else does.

Again, that's the way it is called in Linux kernel, refer below commits 
subjects:

$ git log --oneline arch/powerpc/ | grep powerpc/32
2bf3caa7cc3b powerpc/32: Stop printing Kernel virtual memory layout
2a17a5bebc9a powerpc/32: Replace mulhdu() by mul_u64_u64_shr()
dca5b1d69aea powerpc/32: Implement validation of emergency stack
2f2b9a3adc66 powerpc/32s: Reduce default size of module/execmem area
5799cd765fea powerpc/32: Convert patch_instruction() to patch_uint()
6035e7e35482 powerpc/32: Curb objtool unannotated intra-function call 
warning
b72c066ba85a powerpc/32: fix ADB_CUDA kconfig warning
cb615bbe5526 powerpc/32: fix ADB_CUDA kconfig warning
c8a1634145c2 powerpc/32: Drop unused grackle_set_stg()
aad26d3b6af1 powerpc/32s: Implement local_flush_tlb_page_psize()
bac4cffc7c4a powerpc/32s: Introduce _PAGE_READ and remove _PAGE_USER
46ebef51fd92 powerpc/32s: Add _PAGE_WRITE to supplement _PAGE_RW
f84b727d132c powerpc/32: Enable POWER_RESET in pmac32_defconfig
a3ef2fef198c powerpc/32: Add dependencies of POWER_RESET for pmac32
7cb0094be4a5 powerpc/32s: Cleanup the mess in __set_pte_at()
6958ad05d578 powerpc/32: Rearrange _switch to prepare for 32/64 merge
fc8562c9b69a powerpc/32: Remove sync from _switch
...

It means everything built with CONFIG_PPC32

> 
> The name "powerpc32" is sometimes used colloquially to mean PowerPC code
> running in SF=0 mode (MSR[SF]=0), but perhaps more often it is used for
> 32-bit only implementations (so, those that do not even have that bit:
> it's bit 0 in the 64-bit MSR, so all implementations that have an only
> 32-bit MSR, for example).
> 
>> For powerpc/64 we have less constraint than on powerpc32:
>> - Kernel memory starts at 0xc000000000000000
>> - User memory stops at 0x0010000000000000
> 
> That isn't true, not even if you mean some existing name.  Usually
> userspace code is mapped at 256MB (0x10000000).  On powerpc64-linux
> anyway, different default on different ABIs of course :-)

0x10000000 is below 0x0010000000000000, isn't it ? So why isn't it true ?

On 64 bits powerpc, everything related to user is between 0 and 
TASK_SIZE_MAX.

TASK_SIZE_MAX is either TASK_SIZE_4PB or TASK_SIZE_64TB depending on 
page size (64k or 4k)

TASK_SIZE_4PB is 0x0010000000000000UL

Christophe

> 
>>> And for access_ok() avoiding the conditional is a good enough reason
>>> to use a 'conditional move' instruction.
>>> Avoiding speculation is actually free.
>>
>> And on CPUs that are not affected by Spectre and Meltdown like powerpc
>> 8xx or powerpc 603,
> 
> Erm.
> 
> 
> Segher


