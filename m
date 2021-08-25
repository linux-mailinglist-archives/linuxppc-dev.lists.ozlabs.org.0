Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C555A3F6EEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 07:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvZhN4jLmz2yZB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 15:45:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvZgt4hr1z2yJC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 15:45:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GvZgk5Lc4z9sTx;
 Wed, 25 Aug 2021 07:45:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKrMKKLXkpmR; Wed, 25 Aug 2021 07:45:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GvZgk4C0qz9sTt;
 Wed, 25 Aug 2021 07:45:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E1438B83B;
 Wed, 25 Aug 2021 07:45:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dxNafVVCFkYi; Wed, 25 Aug 2021 07:45:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB8758B76A;
 Wed, 25 Aug 2021 07:45:05 +0200 (CEST)
Subject: Re: [PATCH v3 1/3] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
 <87zgt6aybp.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f5f598a5-3830-ee21-aff5-cba06deeb959@csgroup.eu>
Date: Wed, 25 Aug 2021 07:45:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87zgt6aybp.fsf@mpe.ellerman.id.au>
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



Le 25/08/2021 à 07:27, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
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
>> Acked-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/interrupt.c | 2 --
>>   1 file changed, 2 deletions(-)
> 
> I'll pick this one up independent of the other two patches.
> 

Second patch should be ok as well, no ?

Christophe
