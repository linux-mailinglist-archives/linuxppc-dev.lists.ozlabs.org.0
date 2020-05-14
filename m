Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AE1D3096
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 15:03:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NBY72RPPzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 23:03:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NBTD5wymzDqrs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 22:59:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49NBT747ntz9v00M;
 Thu, 14 May 2020 14:59:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id enqC2JdgaCiv; Thu, 14 May 2020 14:59:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49NBT72mMlz9v00K;
 Thu, 14 May 2020 14:59:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40C868B849;
 Thu, 14 May 2020 14:59:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GG-K6pC9Elp4; Thu, 14 May 2020 14:59:41 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D68D8B84B;
 Thu, 14 May 2020 14:59:40 +0200 (CEST)
Subject: Re: [PATCH v8 28/30] powerpc: Support prefixed instructions in
 alignment handler
To: Alistair Popple <alistair@popple.id.au>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-29-jniethe5@gmail.com>
 <0bfb8015-44e4-7693-e32e-39b46a87dd3a@csgroup.eu>
 <1772537.83GeNkKoO8@townsend>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <45df4a2b-c100-0066-00de-c06d5a50001f@csgroup.eu>
Date: Thu, 14 May 2020 14:59:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1772537.83GeNkKoO8@townsend>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/05/2020 à 14:15, Alistair Popple a écrit :
> On Thursday, 14 May 2020 4:14:12 PM AEST Christophe Leroy wrote:
>> Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
>>> If a prefixed instruction results in an alignment exception, the
>>> SRR1_PREFIXED bit is set. The handler attempts to emulate the
>>> responsible instruction and then increment the NIP past it. Use
>>> SRR1_PREFIXED to determine by how much the NIP should be incremented.
>>>
>>> Prefixed instructions are not permitted to cross 64-byte boundaries. If
>>> they do the alignment interrupt is invoked with SRR1 BOUNDARY bit set.
>>> If this occurs send a SIGBUS to the offending process if in user mode.
>>> If in kernel mode call bad_page_fault().
>>
>> Shouldn't this patch go before patch 23 ?
> 
> Is there a particular reason you think it needs to go before patch 23? Neither
> seem particularly related to one another and it seems logical to me at least
> that you would introduce prefix support to the datatype prior to using them.

If you enable prefix instruction and allow people to use them before you 
have implemented proper support in alignment handler, what will happen 
if an alignment exception occurs ?

Christophe

> 
> - Alistair
>   
>> Christophe
>>
>>> Reviewed-by: Alistair Popple <alistair@popple.id.au>
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>> v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
>>> commit (previously in "powerpc sstep: Prepare to support prefixed
>>> instructions").
>>>
>>>       - Rename sufx to suffix
>>>       - Use a macro for calculating instruction length
>>>
>>> v3: Move __get_user_{instr(), instr_inatomic()} up with the other
>>> get_user definitions and remove nested if.
>>> v4: Rolled into "Add prefixed instructions to instruction data type"
>>> v5: Only one definition of inst_length()
>>> ---
>>>
>>>    arch/powerpc/kernel/traps.c | 19 ++++++++++++++++++-
>>>    1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>> index 493a3fa0ac1a..105242cc2f28 100644
>>> --- a/arch/powerpc/kernel/traps.c
>>> +++ b/arch/powerpc/kernel/traps.c
>>> @@ -583,6 +583,8 @@ static inline int check_io_access(struct pt_regs
>>> *regs)
>>>
>>>    #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
>>>    #define REASON_PRIVILEGED	ESR_PPR
>>>    #define REASON_TRAP		ESR_PTR
>>>
>>> +#define REASON_PREFIXED		0
>>> +#define REASON_BOUNDARY		0
>>>
>>>    /* single-step stuff */
>>>    #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
>>>
>>> @@ -597,12 +599,16 @@ static inline int check_io_access(struct pt_regs
>>> *regs)>
>>>    #define REASON_ILLEGAL		SRR1_PROGILL
>>>    #define REASON_PRIVILEGED	SRR1_PROGPRIV
>>>    #define REASON_TRAP		SRR1_PROGTRAP
>>>
>>> +#define REASON_PREFIXED		SRR1_PREFIXED
>>> +#define REASON_BOUNDARY		SRR1_BOUNDARY
>>>
>>>    #define single_stepping(regs)	((regs)->msr & MSR_SE)
>>>    #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
>>>    #define clear_br_trace(regs)	((regs)->msr &= ~MSR_BE)
>>>    #endif
>>>
>>> +#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
>>> +
>>>
>>>    #if defined(CONFIG_E500)
>>>    int machine_check_e500mc(struct pt_regs *regs)
>>>    {
>>>
>>> @@ -1593,11 +1599,20 @@ void alignment_exception(struct pt_regs *regs)
>>>
>>>    {
>>>    
>>>    	enum ctx_state prev_state = exception_enter();
>>>    	int sig, code, fixed = 0;
>>>
>>> +	unsigned long  reason;
>>>
>>>    	/* We restore the interrupt state now */
>>>    	if (!arch_irq_disabled_regs(regs))
>>>    	
>>>    		local_irq_enable();
>>>
>>> +	reason = get_reason(regs);
>>> +
>>> +	if (reason & REASON_BOUNDARY) {
>>> +		sig = SIGBUS;
>>> +		code = BUS_ADRALN;
>>> +		goto bad;
>>> +	}
>>> +
>>>
>>>    	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
>>>    	
>>>    		goto bail;
>>>
>>> @@ -1606,7 +1621,8 @@ void alignment_exception(struct pt_regs *regs)
>>>
>>>    		fixed = fix_alignment(regs);
>>>    	
>>>    	if (fixed == 1) {
>>>
>>> -		regs->nip += 4;	/* skip over emulated instruction */
>>> +		/* skip over emulated instruction */
>>> +		regs->nip += inst_length(reason);
>>>
>>>    		emulate_single_step(regs);
>>>    		goto bail;
>>>    	
>>>    	}
>>>
>>> @@ -1619,6 +1635,7 @@ void alignment_exception(struct pt_regs *regs)
>>>
>>>    		sig = SIGBUS;
>>>    		code = BUS_ADRALN;
>>>    	
>>>    	}
>>>
>>> +bad:
>>>    	if (user_mode(regs))
>>>    	
>>>    		_exception(sig, regs, code, regs->dar);
>>>    	
>>>    	else
