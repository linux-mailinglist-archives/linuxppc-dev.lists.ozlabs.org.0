Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC843DFD0E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GflVT2HNZz3cYl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 18:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GflV428MQz30Dl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 18:37:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GflTw4r3dz9sVl;
 Wed,  4 Aug 2021 10:37:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YTPUHOfzsKL; Wed,  4 Aug 2021 10:37:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GflTw3XfSz9sVg;
 Wed,  4 Aug 2021 10:37:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3336A8B7A3;
 Wed,  4 Aug 2021 10:37:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3ppPbVI8GWdy; Wed,  4 Aug 2021 10:37:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0F328B7A1;
 Wed,  4 Aug 2021 10:37:07 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <b36623df00ef3d2296f928487b6e23f93a217afa.1628054802.git.christophe.leroy@csgroup.eu>
 <1628064412.48kzr1eula.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cd5f54fd-fbf4-e471-9971-1e8c86755754@csgroup.eu>
Date: Wed, 4 Aug 2021 10:37:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628064412.48kzr1eula.astroid@bobo.none>
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



Le 04/08/2021 à 10:08, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of August 4, 2021 3:27 pm:
>> In those hot functions that are called at every interrupt, any saved
>> cycle is worth it.
>>
>> interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
>> called from three places:
>> - From entry_32.S
>> - From interrupt_64.S
>> - From interrupt_exit_user_restart() and interrupt_exit_kernel_restart()
>>
>> In entry_32.S, there are inambiguously called based on MSR_PR:
>>
>> 	interrupt_return:
>> 		lwz	r4,_MSR(r1)
>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>> 		andi.	r0,r4,MSR_PR
>> 		beq	.Lkernel_interrupt_return
>> 		bl	interrupt_exit_user_prepare
>> 	...
>> 	.Lkernel_interrupt_return:
>> 		bl	interrupt_exit_kernel_prepare
>>
>> In interrupt_64.S, that's similar:
>>
>> 	interrupt_return_\srr\():
>> 		ld	r4,_MSR(r1)
>> 		andi.	r0,r4,MSR_PR
>> 		beq	interrupt_return_\srr\()_kernel
>> 	interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>> 		bl	interrupt_exit_user_prepare
>> 	...
>> 	interrupt_return_\srr\()_kernel:
>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>> 		bl	interrupt_exit_kernel_prepare
>>
>> In interrupt_exit_user_restart() and interrupt_exit_kernel_restart(),
>> MSR_PR is verified respectively by BUG_ON(!user_mode(regs)) and
>> BUG_ON(user_mode(regs)) prior to calling interrupt_exit_user_prepare()
>> and interrupt_exit_kernel_prepare().
>>
>> The verification in interrupt_exit_user_prepare() and
>> interrupt_exit_kernel_prepare() are therefore useless and can be removed.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Probably okay to do now things are ironing out.
> 
> Unless we want to make a new define for interrupt handler debug and put
> a bunch of these asserts under it. There's quite a lot more here, and
> in asm/interrupt.h, etc.

But that one is so trivial that I'm not sure there is any point in keeping it even as a kind of 
additional DEBUG level, unless you want those BUG_ONs because you don't trust the compiler.

Christophe

> 
> Thanks,
> Nick
> 
>> ---
>>   arch/powerpc/kernel/interrupt.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index 21bbd615ca41..f26caf911ab5 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -465,7 +465,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>>   
>>   	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>>   		BUG_ON(!(regs->msr & MSR_RI));
>> -	BUG_ON(!(regs->msr & MSR_PR));
>>   	BUG_ON(arch_irq_disabled_regs(regs));
>>   	CT_WARN_ON(ct_state() == CONTEXT_USER);
>>   
>> @@ -499,7 +498,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>   	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
>>   	    unlikely(!(regs->msr & MSR_RI)))
>>   		unrecoverable_exception(regs);
>> -	BUG_ON(regs->msr & MSR_PR);
>>   	/*
>>   	 * CT_WARN_ON comes here via program_check_exception,
>>   	 * so avoid recursion.
>> -- 
>> 2.25.0
>>
>>
