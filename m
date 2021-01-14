Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBE2F610B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 13:29:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGkBt5xMbzDrWy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:29:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGk7Q3CKlzDrgX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:26:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DGk7D163sz9v19l;
 Thu, 14 Jan 2021 13:26:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xn4J_wEbxtqT; Thu, 14 Jan 2021 13:25:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DGk7C5X77z9v19j;
 Thu, 14 Jan 2021 13:25:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41A9E8B801;
 Thu, 14 Jan 2021 13:26:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PcRgG9fuFbka; Thu, 14 Jan 2021 13:26:01 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8F788B800;
 Thu, 14 Jan 2021 13:26:00 +0100 (CET)
Subject: Re: [PATCH v5 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-3-npiggin@gmail.com>
 <b3f8fffd-ebbe-277d-9c71-cf3a6d8c4475@csgroup.eu>
 <1610592763.5wfbleady7.astroid@bobo.none>
 <1610625340.tqgg2ar1jg.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c07a91b3-561e-7197-1498-874281059e20@csgroup.eu>
Date: Thu, 14 Jan 2021 13:25:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610625340.tqgg2ar1jg.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/01/2021 à 13:09, Nicholas Piggin a écrit :
> Excerpts from Nicholas Piggin's message of January 14, 2021 1:24 pm:
>> Excerpts from Christophe Leroy's message of January 14, 2021 12:12 am:
>>>
>>>
>>> Le 13/01/2021 à 08:31, Nicholas Piggin a écrit :
>>>> The page fault handling still has some complex logic particularly around
>>>> hash table handling, in asm. Implement this in C instead.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>    arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>>>>    arch/powerpc/kernel/exceptions-64s.S          | 131 +++---------------
>>>>    arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>>>>    arch/powerpc/mm/fault.c                       |  46 ++++--
>>>>    4 files changed, 107 insertions(+), 148 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>> index 066b1d34c7bc..60a669379aa0 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
>>>>    #define HPTE_NOHPTE_UPDATE	0x2
>>>>    #define HPTE_USE_KERNEL_KEY	0x4
>>>>    
>>>> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr);
>>>>    extern int __hash_page_4K(unsigned long ea, unsigned long access,
>>>>    			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>>>>    			  unsigned long flags, int ssize, int subpage_prot);
>>>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>>>> index 6e53f7638737..bcb5e81d2088 100644
>>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>>> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>>>>     *
>>>>     * Handling:
>>>>     * - Hash MMU
>>>> - *   Go to do_hash_page first to see if the HPT can be filled from an entry in
>>>> - *   the Linux page table. Hash faults can hit in kernel mode in a fairly
>>>> + *   Go to do_hash_fault, which attempts to fill the HPT from an entry in the
>>>> + *   Linux page table. Hash faults can hit in kernel mode in a fairly
>>>>     *   arbitrary state (e.g., interrupts disabled, locks held) when accessing
>>>>     *   "non-bolted" regions, e.g., vmalloc space. However these should always be
>>>> - *   backed by Linux page tables.
>>>> + *   backed by Linux page table entries.
>>>>     *
>>>> - *   If none is found, do a Linux page fault. Linux page faults can happen in
>>>> - *   kernel mode due to user copy operations of course.
>>>> + *   If no entry is found the Linux page fault handler is invoked (by
>>>> + *   do_hash_fault). Linux page faults can happen in kernel mode due to user
>>>> + *   copy operations of course.
>>>>     *
>>>>     *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=1 in guest
>>>>     *   MMU context, which may cause a DSI in the host, which must go to the
>>>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>>>    	GEN_COMMON data_access
>>>>    	ld	r4,_DAR(r1)
>>>>    	ld	r5,_DSISR(r1)
>>>
>>> We have DSISR here. I think the dispatch between page fault or do_break() should be done here:
>>> - It would be more similar to other arches
>>
>> Other sub-archs?
>>
>>> - Would avoid doing it also in instruction fault
>>
>> True but it's hidden under an unlikely branch so won't really help
>> instruction fault.
>>
>>> - Would avoid that -1 return which looks more like a hack.
>>
>> I don't really see it as a hack, we return a code to asm caller to
>> direct whether to restore registers or not, we alrady have this
>> pattern.
>>
>> (I'm hoping all that might be go away one day by conrolling NV
>> regs from C if we can get good code generation but even if not we
>> still have it in the interrupt returns).
>>
>> That said I will give it a try here. At very least it might be a
>> better intermediate step.
> 
> Ah yes, this way doesn't work well for later patches because you end
> e.g., with the do_break call having to call the interrupt handler
> wrappers again when they actually expect to be in the asm entry state
> (e.g., irq soft-mask state) when called, and return via interrupt_return
> after the exit wrapper runs (which 64s uses to implement better context
> tracking for example).
> 
> That could possibly be hacked up to deal with multiple interrupt
> wrappers per interrupt, but I'd rather not go backwards.
> 
> That does leave the other sub archs as having this issue, but they don't
> do so much in their handlers. 32 doesn't have soft-mask or context
> tracking to deal with for example. We will need to fix this up though
> and unify things more.
> 

Not sure I understand what you mean exactly.

On the 8xx, do_break() is called by totally different exceptions:
- Exception 0x1c00 Data breakpoint ==> do_break()
- Exception 0x1300 Instruction TLB error ==> handle_page_fault()
- Exception 0x1400 Data TLB error ==> handle_page_fault()

On book3s/32, we now (after my patch ie patch 1 in your series ) have either do_break() or 
handle_page_fault() being called from very early in ASM.

If you do the same in book3s/64, then there is no issue with interrupt wrappers being called twice, 
is it ?

Christophe
