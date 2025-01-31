Return-Path: <linuxppc-dev+bounces-5728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72625A2397B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykm2z6DJLz2yn9;
	Fri, 31 Jan 2025 17:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738304411;
	cv=none; b=HFdSw1LaztA6WH8JRXPfgmZily9UJj1Bp8UUuPjpUgBIjNOrG6ROkQQZQ3dIXxAt8WjzYboLaYQFmyWApesY0p7deHy6DgOO/TD+QQMyTtKCCdNQzoAd7MqF1RUwlTo/sTQqp9b2QRq9UL9HskmrRjzs6VPXKICZRU8IrcsNpgjs8XGLdNSOn47Aa8rxct4kBpHFgrhnYLllzHe5L+YOa6B2vE2+7hQONAXCZ8toiux2O37dNXBBPoxvJ2UBb77ZyLcFumi8Ed2ivm92OIW3ggbrN+uiUiLzgydCf+pJ6KBRefiKYsHKZOMU0Iox3RshuYVByw+k3wHUolpoBlcWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738304411; c=relaxed/relaxed;
	bh=6tOWBbU3E/HMygBc1enwqsPYAdAJvJ5fdkZvRK7NFuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQuIMfwxOck8SB26zpBJhxfhFdjjEemTNlEyyoxzdYJHxI6PG56VXgd6lXf3NkgenAJ/Xu7RvlqUtZV1kODkM2NaASi3lSyyqQYPDH6rxfdkWxPtnJDYclUTKCCEWNn94k9VMDwuIb+Xk58ru3mdreNFN8AYaQiKhNoBrP6LKYcIxoACOddE9XIM4Ydbe2eANafAFe6brfdt57qqMyTljnKEq77wB5YL4/5nLWrNCc7UgrpDHsR/egfJtTbupxyBhwKhOd2ZwZW0dDAKz272/2e1/lC3xw1wfPknBUG1jt/0+p8qhTJ77JuqA1oFQMinp9GzNGUGv/UEpqn7W1LU5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykm2v0tx1z2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yklp73HJWz9sRr;
	Fri, 31 Jan 2025 07:09:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1Ul4JWa_36c; Fri, 31 Jan 2025 07:09:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yklp72LmJz9sRk;
	Fri, 31 Jan 2025 07:09:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 406AB8B774;
	Fri, 31 Jan 2025 07:09:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9ugh9ONY4wYh; Fri, 31 Jan 2025 07:09:03 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C71218B763;
	Fri, 31 Jan 2025 07:09:02 +0100 (CET)
Message-ID: <01bc9e5c-fd47-4c26-8af3-59f10f3b9c76@csgroup.eu>
Date: Fri, 31 Jan 2025 07:09:02 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
 <20250130202634.eeb9TfkW@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250130202634.eeb9TfkW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/01/2025 à 21:26, Sebastian Andrzej Siewior a écrit :
> On 2025-01-30 22:27:07 [+0530], Shrikanth Hegde wrote:
>>> | #DEFINE need_irq_preemption() \
>>> |          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>>> |
>>> | 	if (need_irq_preemption()) {
>>>
>>> be a bit smaller/ quicker? This could be a fast path ;)
>>
>> I am okay with either way. I did try both[1], there wasn't any significant difference,
>> hence chose a simpler one. May be system size, workload pattern might matter.
>>
>> Let me do some more testing to see which one wins.
>> Is there any specific benchmark which might help here?
> 
> No idea. As per bean counting: preempt_model_preemptible() should
> resolve in two function calls + conditional in the dynamic case. This
> should be more expensive compared to a nop/ branch ;)

I did a build comparison on pmac32_defconfig + dynamic preemption, the 
static branch looks definitely more optimal:

Without static branch:

...
  294:	7c 08 02 a6 	mflr    r0
  298:	90 01 00 24 	stw     r0,36(r1)
  29c:	48 00 00 01 	bl      29c <interrupt_exit_kernel_prepare+0x50>
			29c: R_PPC_REL24	preempt_model_full
  2a0:	2c 03 00 00 	cmpwi   r3,0
  2a4:	41 82 00 a4 	beq     348 <interrupt_exit_kernel_prepare+0xfc>
...
  2a8:	81 22 00 4c 	lwz     r9,76(r2)
  2ac:	71 29 00 04 	andi.   r9,r9,4
  2b0:	40 82 00 d4 	bne     384 <interrupt_exit_kernel_prepare+0x138>
...
  2b4:	7d 20 00 a6 	mfmsr   r9
  2b8:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
...
  348:	48 00 00 01 	bl      348 <interrupt_exit_kernel_prepare+0xfc>
			348: R_PPC_REL24	preempt_model_lazy
  34c:	2c 03 00 00 	cmpwi   r3,0
  350:	40 a2 ff 58 	bne     2a8 <interrupt_exit_kernel_prepare+0x5c>
  354:	4b ff ff 60 	b       2b4 <interrupt_exit_kernel_prepare+0x68>

With the static branch:

...
  294:	48 00 00 58 	b       2ec <interrupt_exit_kernel_prepare+0xa0>
...
  298:	7d 20 00 a6 	mfmsr   r9
  29c:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
...
  2ec:	81 22 00 4c 	lwz     r9,76(r2)
  2f0:	71 29 00 04 	andi.   r9,r9,4
  2f4:	41 82 ff a4 	beq     298 <interrupt_exit_kernel_prepare+0x4c>
...

With the static branch it is just an unconditional branch being later 
replaced by a NOP. It must be more efficient.

So in first case we need to get and save LR, call preempt_model_full(), 
compare with 0, call preempt_model_lazy() and compare again, and at some 
point read and restore LR.

And the preempt_model_() functions are not tiny functions:

00003620 <preempt_model_full>:
     3620:	3d 20 00 00 	lis     r9,0
			3622: R_PPC_ADDR16_HA	preempt_dynamic_mode
     3624:	94 21 ff f0 	stwu    r1,-16(r1)
     3628:	80 69 00 00 	lwz     r3,0(r9)
			362a: R_PPC_ADDR16_LO	preempt_dynamic_mode
     362c:	2c 03 ff ff 	cmpwi   r3,-1
     3630:	41 82 00 18 	beq     3648 <preempt_model_full+0x28>
     3634:	68 63 00 02 	xori    r3,r3,2
     3638:	38 21 00 10 	addi    r1,r1,16
     363c:	7c 63 00 34 	cntlzw  r3,r3
     3640:	54 63 d9 7e 	srwi    r3,r3,5
     3644:	4e 80 00 20 	blr
...
     3648:	0f e0 00 00 	twui    r0,0
     364c:	68 63 00 02 	xori    r3,r3,2
     3650:	38 21 00 10 	addi    r1,r1,16
     3654:	7c 63 00 34 	cntlzw  r3,r3
     3658:	54 63 d9 7e 	srwi    r3,r3,5
     365c:	4e 80 00 20 	blr

00003660 <preempt_model_lazy>:
     3660:	3d 20 00 00 	lis     r9,0
			3662: R_PPC_ADDR16_HA	preempt_dynamic_mode
     3664:	94 21 ff f0 	stwu    r1,-16(r1)
     3668:	80 69 00 00 	lwz     r3,0(r9)
			366a: R_PPC_ADDR16_LO	preempt_dynamic_mode
     366c:	2c 03 ff ff 	cmpwi   r3,-1
     3670:	41 82 00 18 	beq     3688 <preempt_model_lazy+0x28>
     3674:	68 63 00 03 	xori    r3,r3,3
     3678:	38 21 00 10 	addi    r1,r1,16
     367c:	7c 63 00 34 	cntlzw  r3,r3
     3680:	54 63 d9 7e 	srwi    r3,r3,5
     3684:	4e 80 00 20 	blr
...
     3688:	0f e0 00 00 	twui    r0,0
     368c:	68 63 00 03 	xori    r3,r3,3
     3690:	38 21 00 10 	addi    r1,r1,16
     3694:	7c 63 00 34 	cntlzw  r3,r3
     3698:	54 63 d9 7e 	srwi    r3,r3,5
     369c:	4e 80 00 20 	blr



> But you would still need preempt_model_preemptible() for the !DYN case.
> 
>>>> +	       preempt_model_voluntary() ? "voluntary" :
>>>> +	       preempt_model_full()      ? "full" :
>>>> +	       preempt_model_lazy()      ? "lazy" :
>>>> +	       "",
>>>
>>> So intend to rework this part. I have patches stashed at
>>> 	https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbigeasy%2Fstaging.git%2Flog%2F%3Fh%3Dpreemption_string&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C553a8f640a9c4514597d08dd416c6534%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638738655988556429%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ZfVQi1iRYaVCTrZ5vIhOQ7yAKaDnOwFi0NRjycfrI5A%3D&reserved=0
>>>
>>> which I didn't sent yet due to the merge window. Just a heads up ;)
>>
>> Makes sense. I had seen at-least two places where this code was there, ftrace/powerpc.
>> There were way more places..
>>
>> You want me to remove this part?
> 
> No, just be aware.
> I don't know how this will be routed I guess we merge the sched pieces
> first and then I submit the other pieces via the relevant maintainer
> tree. In that case please be aware that all parts get removed/ replaced
> properly.
> 
> Sebastian


