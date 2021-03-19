Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304EF341B7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:29:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21rg14d2z3c5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qz8n6N1S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qz8n6N1S; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21rJ0d9kz303T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:29:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F21rH01bhz9sSC;
 Fri, 19 Mar 2021 22:29:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616153359;
 bh=h9n46vZ+v387YB+Fnjwom9YY5fA8Nlh7Po2OkRlziAw=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Qz8n6N1SQZ55bzir9rjHFKEtzydgR72kqfX6Z5azDvM6tZe3ql3Zz8c4CBpJLi3Ck
 2tIVGt7vd0xRRaR+ix5qKhG0I+Ag3nUQ6g7UbFgC8+WndBqTxDaZEdkrRUoQ1CRhNG
 S4CgQCV0C2sT92fCteSie2Ow4ywWLEFu9oE1qWp2kqJM62dPcKayna6p7J+gHTJuas
 kw0+tUmY5fsyrpLR7PswUjuWoj3HbiqSRHawdLmKrNYw7ivMABAjSZzxIUSaA/xKTd
 EE3r7FuXRoeDd1P5w+OiEhFUqUDVYYiLCgzQuKteAv+1uJIovlsVehuJSjByto7+QZ
 Fq9+3TNnkukSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 12/14] powerpc/64s: system call avoid setting MSR[RI]
 until we set MSR[EE]
In-Reply-To: <722aeb8d-507f-6702-dd79-26242f987e3e@csgroup.eu>
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-13-npiggin@gmail.com>
 <722aeb8d-507f-6702-dd79-26242f987e3e@csgroup.eu>
Date: Fri, 19 Mar 2021 22:29:17 +1100
Message-ID: <877dm38jqq.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 15/03/2021 =C3=A0 23:04, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This extends the MSR[RI]=3D0 window a little further into the system
>> call in order to pair RI and EE enabling with a single mtmsrd.
>
> Time ago, I proposed to delay that on PPC32 and Michael objected, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9f9dd859d571e324c=
7412ed9db9da8cfba678257.1548956511.git.christophe.leroy@c-s.fr/

I don't think I objected, I was just curious about what the added
exposure to RI=3D0 was :)

cheers

>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index bd0c82ac9de5..2f14ac3c377c 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -1999,8 +1999,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
>>   	mtctr	r10
>>   	bctr
>>   	.else
>> -	li	r10,MSR_RI
>> -	mtmsrd 	r10,1			/* Set RI (EE=3D0) */
>>   #ifdef CONFIG_RELOCATABLE
>>   	__LOAD_HANDLER(r10, system_call_common)
>>   	mtctr	r10
>> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/in=
terrupt_64.S
>> index f28f41a1a85a..eef61800f734 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -311,10 +311,10 @@ END_BTB_FLUSH_SECTION
>>   	 * nothing pending. system_call_exception() will call
>>   	 * trace_hardirqs_off().
>>   	 */
>> -	li	r11,IRQS_ALL_DISABLED
>> -	li	r12,PACA_IRQ_HARD_DIS
>> +	li	r11,IRQS_DISABLED
>> +	li	r12,-1 /* Set MSR_EE and MSR_RI */
>>   	stb	r11,PACAIRQSOFTMASK(r13)
>> -	stb	r12,PACAIRQHAPPENED(r13)
>> +	mtmsrd	r12,1
>>=20=20=20
>>   	ENTER_KERNEL_SECURITY_FALLBACK
>>=20=20=20
>>=20
