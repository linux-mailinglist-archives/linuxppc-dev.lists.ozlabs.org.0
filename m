Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE0260E13
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:52:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzRY1mrMzDqHv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:52:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzPZ4CnmzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:50:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlzPR2x8Xz9v06W;
 Tue,  8 Sep 2020 10:50:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rH4fOfzRr4R0; Tue,  8 Sep 2020 10:50:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlzPR00Ytz9v06Q;
 Tue,  8 Sep 2020 10:50:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BCF98B7AE;
 Tue,  8 Sep 2020 10:50:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZFfPAcgG0Axc; Tue,  8 Sep 2020 10:50:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4D998B7AD;
 Tue,  8 Sep 2020 10:50:19 +0200 (CEST)
Subject: Re: [RFC PATCH 02/12] powerpc: remove arguments from interrupt
 handler functions
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-3-npiggin@gmail.com>
 <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
 <1599478457.27656.1.camel@po17688vm.idsi0.si.c-s.fr>
 <1599551224.3zoap14y55.astroid@bobo.none>
 <a4eac9b0-da50-de8a-439e-173da7c20252@csgroup.eu>
Message-ID: <08ed0a91-b231-1dbc-ba21-6247de03bcd2@csgroup.eu>
Date: Tue, 8 Sep 2020 10:50:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a4eac9b0-da50-de8a-439e-173da7c20252@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/09/2020 à 10:29, Christophe Leroy a écrit :
> 
> 
> Le 08/09/2020 à 09:48, Nicholas Piggin a écrit :
>> Excerpts from Christophe Leroy's message of September 7, 2020 9:34 pm:
>>> On Mon, 2020-09-07 at 11:20 +0200, Christophe Leroy wrote:
>>>>
>>>> Le 05/09/2020 à 19:43, Nicholas Piggin a écrit :
>>>>> Make interrupt handlers all just take the pt_regs * argument and load
>>>>> DAR/DSISR etc from that. Make those that return a value return long.
>>>>
>>>> I like this, it will likely simplify a bit the VMAP_STACK mess.
>>>>
>>>> Not sure it is that easy. My board is stuck after the start of init.
>>>>
>>>>
>>>> On the 8xx, on Instruction TLB Error exception, we do
>>>>
>>>>     andis.    r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 
>>>> bits */
>>>>
>>>> On book3s/32, on ISI exception we do:
>>>>     andis.    r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 
>>>> bits */
>>>>
>>>> On 40x and bookE, on ISI exception we do:
>>>>     li    r5,0            /* Pass zero as arg3 */
>>>>
>>>>
>>>> And regs->dsisr will just contain nothing
>>>>
>>>> So it means we should at least write back r5 into regs->dsisr from 
>>>> there
>>>> ? The performance impact should be minimal as we already write _DAR so
>>>> the cache line should already be in the cache.
>>>>
>>>> A hacky 'stw r5, _DSISR(r1)' in handle_page_fault() does the trick,
>>>> allthough we don't want to do it for both ISI and DSI at the end, so
>>>> you'll have to do it in every head_xxx.S
>>>
>>> To get you series build and work, I did the following hacks:
>>
>> Great, thanks for this.
>>
>>> diff --git a/arch/powerpc/include/asm/interrupt.h
>>> b/arch/powerpc/include/asm/interrupt.h
>>> index acfcc7d5779b..c11045d3113a 100644
>>> --- a/arch/powerpc/include/asm/interrupt.h
>>> +++ b/arch/powerpc/include/asm/interrupt.h
>>> @@ -93,7 +93,9 @@ static inline void interrupt_nmi_exit_prepare(struct
>>> pt_regs *regs, struct inter
>>>   {
>>>       nmi_exit();
>>> +#ifdef CONFIG_PPC64
>>>       this_cpu_set_ftrace_enabled(state->ftrace_enabled);
>>> +#endif
>>
>> This seems okay, not a hack.
>>
>>>   #ifdef CONFIG_PPC_BOOK3S_64
>>>       /* Check we didn't change the pending interrupt mask. */
>>> diff --git a/arch/powerpc/kernel/entry_32.S
>>> b/arch/powerpc/kernel/entry_32.S
>>> index f4d0af8e1136..66f7adbe1076 100644
>>> --- a/arch/powerpc/kernel/entry_32.S
>>> +++ b/arch/powerpc/kernel/entry_32.S
>>> @@ -663,6 +663,7 @@ ppc_swapcontext:
>>>    */
>>>       .globl    handle_page_fault
>>>   handle_page_fault:
>>> +    stw    r5,_DSISR(r1)
>>>       addi    r3,r1,STACK_FRAME_OVERHEAD
>>>   #ifdef CONFIG_PPC_BOOK3S_32
>>>       andis.  r0,r5,DSISR_DABRMATCH@h
>>
>> Is this what you want to do for 32, or do you want to seperate
>> ISI and DSI sides?
>>
> 
> No I think we want to separate ISI and DSI sides.
> 
> And I think the specific filtering done in ISI could be done in 
> do_page_fault() in C. Ok, it would make a special handling for is_exec 
> but there are already several places where the behaviour differs based 
> on is_exec.
> The only thing we need to keep at ASM level is the DABR stuff for 
> calling do_break() in handle_page_fault(), because it is used to decide 
> whether full regs are saved or not. But it could be a test done earlier 
> in the prolog and the result being kept in one of the CR bits.

Looking at it once more, I'm wondering whether we really need a full regs.

Before commit 
https://github.com/linuxppc/linux/commit/d300627c6a53693fb01479b59b0cdd293761b1fa#diff-f9658f412252f3bb3093e0a95b37f3ac 
do_break() was called from do_page_fault() without a full regs set.

Christophe
