Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE031486E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:03:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXQL5yxhzDsdJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:03:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXNh2vP6zDrf7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:02:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZXNZ2YGtz9vBmJ;
 Tue,  9 Feb 2021 07:02:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L0tlxnlezxup; Tue,  9 Feb 2021 07:02:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZXNZ1dmhz9vBLv;
 Tue,  9 Feb 2021 07:02:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B42DE8B7C9;
 Tue,  9 Feb 2021 07:02:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EaRDrqLwf-EG; Tue,  9 Feb 2021 07:02:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2D568B764;
 Tue,  9 Feb 2021 07:02:21 +0100 (CET)
Subject: Re: [PATCH v5 09/22] powerpc/syscall: Make interrupt.c buildable on
 PPC32
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <ba073ad67bd971a88ce331b65d6655523b54c794.1612796617.git.christophe.leroy@csgroup.eu>
 <1612833796.dl9doe6njg.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <73fd6e9b-fe99-e804-d681-c0a22b9bef38@csgroup.eu>
Date: Tue, 9 Feb 2021 07:02:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612833796.dl9doe6njg.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/02/2021 à 02:27, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>> To allow building interrupt.c on PPC32, ifdef out specific PPC64
>> code or use helpers which are available on both PP32 and PPC64
>>
>> Modify Makefile to always build interrupt.o
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v5:
>> - Also for interrupt exit preparation
>> - Opted out kuap related code, ppc32 keeps it in ASM for the time being
>> ---
>>   arch/powerpc/kernel/Makefile    |  4 ++--
>>   arch/powerpc/kernel/interrupt.c | 31 ++++++++++++++++++++++++-------
>>   2 files changed, 26 insertions(+), 9 deletions(-)
>>

>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index d6be4f9a67e5..2dac4d2bb1cf 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -39,7 +39,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   		BUG_ON(!(regs->msr & MSR_RI));
>>   	BUG_ON(!(regs->msr & MSR_PR));
>>   	BUG_ON(!FULL_REGS(regs));
>> -	BUG_ON(regs->softe != IRQS_ENABLED);
>> +	BUG_ON(arch_irq_disabled_regs(regs));
>>   
>>   #ifdef CONFIG_PPC_PKEY
>>   	if (mmu_has_feature(MMU_FTR_PKEY)) {
>> @@ -65,7 +65,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
>>   			isync();
>>   	} else
>>   #endif
>> +#ifdef CONFIG_PPC64
>>   		kuap_check_amr();
>> +#endif
> 
> Wouldn't mind trying to get rid of these ifdefs at some point, but
> there's some kuap / keys changes going on recently so I'm happy enough
> to let this settle then look at whether we can refactor.

I have a follow up series that implements interrupts entries/exits in C and that removes all kuap 
assembly, I will likely release it as RFC later today.

> 
>>   
>>   	account_cpu_user_entry();
>>   
>> @@ -318,7 +323,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>>   	return ret;
>>   }
>>   
>> -#ifdef CONFIG_PPC_BOOK3S /* BOOK3E not yet using this */
>> +#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>>   notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
>>   {
>>   #ifdef CONFIG_PPC_BOOK3E
> 
> Why are you building this for 32? I don't mind if it's just to keep
> things similar and make it build for now, but you're not using it yet,
> right?

The series using that will follow, I thought it would be worth doing this at once.

>   
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
