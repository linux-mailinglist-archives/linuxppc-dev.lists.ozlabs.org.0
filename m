Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F233702E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 11:39:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx56Q5bh6z3d5c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 21:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx5645wTRz3cLp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 21:39:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dx55w1NnBz9v13c;
 Thu, 11 Mar 2021 11:39:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tZloAslLb0pz; Thu, 11 Mar 2021 11:39:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dx55v51kbz9v13Y;
 Thu, 11 Mar 2021 11:38:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D605D8B807;
 Thu, 11 Mar 2021 11:39:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id A76jusLrAy7J; Thu, 11 Mar 2021 11:39:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66C008B806;
 Thu, 11 Mar 2021 11:39:00 +0100 (CET)
Subject: Re: [PATCH v2 36/43] powerpc/32: Set current->thread.regs in C
 interrupt entry
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <8d523f9ecee1de0515cc31d43030c12ab171a670.1615291474.git.christophe.leroy@csgroup.eu>
 <1615339900.vmbtzuirqw.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <035298ad-4d0b-5e74-6f5c-e03677580924@csgroup.eu>
Date: Thu, 11 Mar 2021 11:38:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615339900.vmbtzuirqw.astroid@bobo.none>
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



Le 10/03/2021 à 02:33, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of March 9, 2021 10:10 pm:
>> No need to do that is assembly, do it in C.
> 
> Hmm. No issues with the patch as such, but why does ppc32 need this but
> not 64? AFAIKS 64 sets this when a thread is created.

Looks like ppc64 was doing the same in function save_remaining_regs() in arch/ppc64/kernel/head.S 
until commit https://github.com/mpe/linux-fullhistory/commit/e5bb080d

But I can't find what happend to it in that commit.

Where is it done now ? Maybe that's also already done for ppc32.

Thanks
Christophe


> 
> Thanks,
> Nick
> 
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/interrupt.h | 4 +++-
>>   arch/powerpc/kernel/entry_32.S       | 3 +--
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
>> index 861e6eadc98c..e6d71c2e3aa2 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -33,8 +33,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>>   	if (!arch_irq_disabled_regs(regs))
>>   		trace_hardirqs_off();
>>   
>> -	if (user_mode(regs))
>> +	if (user_mode(regs)) {
>> +		current->thread.regs = regs;
>>   		account_cpu_user_entry();
>> +	}
>>   #endif
>>   	/*
>>   	 * Book3E reconciles irq soft mask in asm
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
>> index 8fe1c3fdfa6e..815a4ff1ba76 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -52,8 +52,7 @@
>>   prepare_transfer_to_handler:
>>   	andi.	r0,r9,MSR_PR
>>   	addi	r12, r2, THREAD
>> -	beq	2f			/* if from user, fix up THREAD.regs */
>> -	stw	r3,PT_REGS(r12)
>> +	beq	2f
>>   #ifdef CONFIG_PPC_BOOK3S_32
>>   	kuep_lock r11, r12
>>   #endif
>> -- 
>> 2.25.0
>>
>>
