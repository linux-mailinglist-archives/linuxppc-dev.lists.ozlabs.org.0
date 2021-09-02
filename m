Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4D3FE80B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 05:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0RNf12wGz2yn1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 13:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M3GbzRdO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M3GbzRdO; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0RN0261yz2xrH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 13:33:19 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so425484pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7mZEJvEeWjoa4IhkJWH4PCP4T0nimH38+qZyA/ffZfE=;
 b=M3GbzRdOMrOx2xn5WPHiIt79QHD3yp5rwHRKlWTmlcfeuzvfftr9ouktIJhIBC9NFg
 dnK60qo+gp2c4ZYmoovDTsL+1Nv24Ed702BVJU9kyH7h2SM3P+IvPeLO72f0ChKEXvoU
 P10RmrqJpgrOgIpqJ0lkXzff/Bsewf9p1krVgFCRzOjZxmpO2N/XEB3DdHx5EpNdGSKM
 Q/pa5VATPYOczDMz0twp2Nok/0/DnQPpRGRNzd3xJuZtHV/zQhFuRNiUUDT7VJZUyVFj
 AQmJDJTEG56Zaz6DdBYbCztEhbDzj6lpH5BSlosuCwAVSbA8df3d48vNUUvCpDZfRRhn
 Hc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7mZEJvEeWjoa4IhkJWH4PCP4T0nimH38+qZyA/ffZfE=;
 b=sqoxcmsg/ZcQZzHTTshM5mBW0peEO69SzNzmncfdgf7Oj1tT3FPX0AcZDFYf/AtENb
 A+PmWwT2rJz3GNqgYS1QPAV6YZpMSyN7Q+6gBZtD7yvk4xumVfucrpriQSbcO8FutfT5
 zS838GJ94kfCZkGXcrEZAg5f46wwbvmnT5bzVAvxkbZJLMqeeRCoYXoUOS39zC/d0ZgD
 dkTewpIc9+iOEXl8Qapb7d+XnXjKikBaqxlDl6hifu5QPrdEa8Myh8wmYRRGMfdDKedK
 GcdcQ0y0IHGHXCWSpl8w7ZiXxZx1cjZfksFPvGndXVe8Q7887y9eiDYHft3EqpWPW2KH
 r0qA==
X-Gm-Message-State: AOAM53108fqq50sxzcQl7gRft6L1Rox/sX2+qy4o9f/45rUsyVPY0jC3
 /Spwf+laiTwYHe4ZMVX5GVc=
X-Google-Smtp-Source: ABdhPJxS9+bjSC8qSonAZwtaqgNEKF2PVnp0CXcTO9sxgSvSM2qtVeCvO95wJ47u3t+XY6H/4nlwPg==
X-Received: by 2002:a17:90a:428e:: with SMTP id
 p14mr1407256pjg.92.1630553596412; 
 Wed, 01 Sep 2021 20:33:16 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id g4sm398354pgs.42.2021.09.01.20.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 20:33:16 -0700 (PDT)
Date: Thu, 02 Sep 2021 13:33:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/64s: system call scv tabort fix for
 corrupt irq soft-mask state
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <65ed1ac8-f4af-742a-1d2a-e5db7e71a920@csgroup.eu>
In-Reply-To: <65ed1ac8-f4af-742a-1d2a-e5db7e71a920@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1630553233.5hjr91skvz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of September 2, 2021 3:21 am:
>=20
>=20
> Le 01/09/2021 =C3=A0 18:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>> If a system call is made with a transaction active, the kernel
>> immediately aborts it and returns. scv system calls disable irqs even
>> earlier in their interrupt handler, and tabort_syscall does not fix this
>> up.
>>=20
>> This can result in irq soft-mask state being messed up on the next
>> kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
>> the kernel exit handlers, or possibly worse.
>>=20
>> Fix this by having tabort_syscall setting irq soft-mask back to enabled
>> (which requires MSR[EE] be disabled first).
>>=20
>> Reported-by: Eirik Fuller <efuller@redhat.com>
>> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv in=
structions")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> Tested the wrong kernel before sending v1 and missed a bug, sorry.
>>=20
>>   arch/powerpc/kernel/interrupt_64.S | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/in=
terrupt_64.S
>> index d4212d2ff0b5..9c31d65b4851 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -428,16 +428,22 @@ RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_e=
nd, syscall_restart)
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>   tabort_syscall:
>>   _ASM_NOKPROBE_SYMBOL(tabort_syscall)
>> -	/* Firstly we need to enable TM in the kernel */
>> +	/* We need to enable TM in the kernel, and disable EE (for scv) */
>>   	mfmsr	r10
>>   	li	r9, 1
>>   	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
>> +	LOAD_REG_IMMEDIATE(r9, MSR_EE)
>> +	andc	r10, r10, r9
>=20
> Why not use 'rlwinm' to mask out MSR_EE ?
>=20
> Something like
>=20
> 	rlwinm	r10, r10, 0, ~MSR_EE

Mainly because I'm bad at powerpc assembly. Why do you think I'm trying=20
to change as much as possible to C?

Actually there should really be no need for mfmsr either, I wanted to
rewrite the thing entirely as

	ld      r10,PACAKMSR(r13)
	LOAD_REG_IMMEDIATE(r9, MSR_TM)
	or	r10,r10,r9
	mtmsrd	r10

But I thought that's not a minimal bug fix.

Thanks,
Nick
>=20
>>   	mtmsrd	r10, 0
>>  =20
>>   	/* tabort, this dooms the transaction, nothing else */
>>   	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
>>   	TABORT(R9)
>>  =20
>> +	/* scv has disabled irqs so must re-enable. sc just remains enabled */
>> +	li	r9,IRQS_ENABLED
>> +	stb	r9,PACAIRQSOFTMASK(r13)
>> +
>>   	/*
>>   	 * Return directly to userspace. We have corrupted user register stat=
e,
>>   	 * but userspace will never see that register state. Execution will
>>=20
>=20
