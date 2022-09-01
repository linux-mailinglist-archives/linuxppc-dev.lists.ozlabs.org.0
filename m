Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F75A8C15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 05:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ6ZF1X52z3bnj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lKPZGL6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ6Yg3DrFz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 13:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lKPZGL6s;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJ6Yf57wzz4xFv;
	Thu,  1 Sep 2022 13:52:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662004326;
	bh=QkpEbhljXfybSii3ubsT2h33XRyQro58sw3vImlY4pI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lKPZGL6sjZL8cIvQZmANcyfYz6cin7DKI2fR4/xE5mgWNnG8QVZ8TVkFvdjgICLJC
	 cYAgbJzyY0Ve0neO06/8RadRZx/Vg6wEakpJv4wPNHpwwryIbEvXnkrBQIPMPcKWx1
	 a9TTfEdO/E7/FKvKWUft2CJ3hZwyJvAOLo1tceO8Er8DnCUUVRc1M8D6iHsdLigonc
	 feybJ2yKF8XYHqR3n0IhhiqAkI4kVTQ0F8tPouYm8lKqCicwY29ioXUXedvPN2VjLw
	 WZ5Z/ob09atWDg1BuP2HipN50vVtPr5ur3/TBIdi4DTaMYG+chGi4J7Q6iNSC7FNF7
	 /Tob5sixBAE/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] Revert "powerpc/irq: Don't open code irq_soft_mask
 helpers"
In-Reply-To: <6d1fd14f-a957-9fb2-ca12-a233b27f4740@csgroup.eu>
References: <20220831131052.42250-1-mpe@ellerman.id.au>
 <6d1fd14f-a957-9fb2-ca12-a233b27f4740@csgroup.eu>
Date: Thu, 01 Sep 2022 13:52:05 +1000
Message-ID: <87zgfju4yi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "zhouzhouyi@gmail.com" <zhouzhouyi@gmail.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 31/08/2022 =C3=A0 15:10, Michael Ellerman a =C3=A9crit=C2=A0:
>> This reverts commit ef5b570d3700fbb8628a58da0487486ceeb713cd.
>>=20
>> Zhouyi reported that commit is causing crashes when running rcutorture
>> with KASAN enabled:
>>=20
>>    BUG: using smp_processor_id() in preemptible [00000000] code: rcu_tor=
ture_rea/100
>>    caller is rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
>>    CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G        W          5.=
19.0-rc5-next-20220708-dirty #253
>>    Call Trace:
>>      dump_stack_lvl+0xbc/0x108 (unreliable)
>>      check_preemption_disabled+0x154/0x160
>>      rcu_preempt_deferred_qs_irqrestore+0x74/0xed0
>>      __rcu_read_unlock+0x290/0x3b0
>>      rcu_torture_read_unlock+0x30/0xb0
>>      rcutorture_one_extend+0x198/0x810
>>      rcu_torture_one_read+0x58c/0xc90
>>      rcu_torture_reader+0x12c/0x360
>>      kthread+0x1e8/0x220
>>      ret_from_kernel_thread+0x5c/0x64
>>=20
>> KASAN will generate instrumentation instructions around the
>> WRITE_ONCE(local_paca->irq_soft_mask, mask):
>>=20
>>     0xc000000000295cb0 <+0>:	addis   r2,r12,774
>>     0xc000000000295cb4 <+4>:	addi    r2,r2,16464
>>     0xc000000000295cb8 <+8>:	mflr    r0
>>     0xc000000000295cbc <+12>:	bl      0xc00000000008bb4c <mcount>
>>     0xc000000000295cc0 <+16>:	mflr    r0
>>     0xc000000000295cc4 <+20>:	std     r31,-8(r1)
>>     0xc000000000295cc8 <+24>:	addi    r3,r13,2354
>>     0xc000000000295ccc <+28>:	mr      r31,r13
>>     0xc000000000295cd0 <+32>:	std     r0,16(r1)
>>     0xc000000000295cd4 <+36>:	stdu    r1,-48(r1)
>>     0xc000000000295cd8 <+40>:	bl      0xc000000000609b98 <__asan_store1+=
8>
>>     0xc000000000295cdc <+44>:	nop
>>     0xc000000000295ce0 <+48>:	li      r9,1
>>     0xc000000000295ce4 <+52>:	stb     r9,2354(r31)
>>     0xc000000000295ce8 <+56>:	addi    r1,r1,48
>>     0xc000000000295cec <+60>:	ld      r0,16(r1)
>>     0xc000000000295cf0 <+64>:	ld      r31,-8(r1)
>>     0xc000000000295cf4 <+68>:	mtlr    r0
>>=20
>> If there is a context switch before "stb     r9,2354(r31)", r31 may
>> not equal to r13, in such case, irq soft mask will not work.
>>=20
>> The usual solution of marking the code ineligible for instrumentation
>> forces the code out-of-line, which we would prefer to avoid. Christophe
>> proposed a partial revert, but Nick raised some concerns with that. So
>> for now do a full revert.
>>=20
>> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>> [mpe: Construct change log based on Zhouyi's original report]
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/include/asm/hw_irq.h | 43 ++++++++++++++++++++++++++-----
>>   1 file changed, 36 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/as=
m/hw_irq.h
>> index 3c8cb48f88ae..983551859891 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -113,7 +113,14 @@ static inline void __hard_RI_enable(void)
>>=20=20=20
>>   static inline notrace unsigned long irq_soft_mask_return(void)
>>   {
>> -	return READ_ONCE(local_paca->irq_soft_mask);
>> +	unsigned long flags;
>> +
>> +	asm volatile(
>> +		"lbz %0,%1(13)"
>> +		: "=3Dr" (flags)
>> +		: "i" (offsetof(struct paca_struct, irq_soft_mask)));
>> +
>> +	return flags;
>>   }
>>=20=20=20
>>   /*
>> @@ -140,24 +147,46 @@ static inline notrace void irq_soft_mask_set(unsig=
ned long mask)
>>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>>   		WARN_ON(mask && !(mask & IRQS_DISABLED));
>>=20=20=20
>> -	WRITE_ONCE(local_paca->irq_soft_mask, mask);
>> -	barrier();
>> +	asm volatile(
>> +		"stb %0,%1(13)"
>> +		:
>> +		: "r" (mask),
>> +		  "i" (offsetof(struct paca_struct, irq_soft_mask))
>> +		: "memory");
>>   }
>
> Only the above changes need to be reverted, below ones should remain as=20
> they are.

I agree, except that it's nearly rc4.

So I want to go back to code that's been well tested, and we can do any
further changes in next for v6.1.

cheers
