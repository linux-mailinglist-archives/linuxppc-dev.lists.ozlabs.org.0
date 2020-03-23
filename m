Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B918F2E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:35:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m9lJ1HbMzDr27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 21:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rzaCj+gK; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m9ht3HnyzDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:33:49 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id jz1so690204pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=2w7jL0ZTZyPL95dyNwt6SF5zDZVsEYRAtpxVZplDx4k=;
 b=rzaCj+gK3+0OW+oEKn4gCGF6nQgRJlKYxdsvzfQMqI7Wr8ZiIp7F15UMc4k8Tghn1v
 sbqWLnmvfpfvVGjb1uYUWMKpTotk08pHO4SU4SL+D3dku7naKvHvX85/b7LelK68sXjJ
 vUnLn/cHMz02lKu1LG2xVOSe4Hl/ZEiX+ktCMPJ31fR2yXh5BlA5tIRKlK+tT1QE4Vhp
 aA9gaajiVf/iQknjsNOeFPoS0ghfVXBpeVvrO2+rZiHWKbs7Ivtqbbo+7TAlAA5cQcQx
 hkdyCGaQSiusmJgzQuTYIASww7k8fi0Lv7tLj2X3kB+s5C/x0R9tiYSLLXEDMeHlmkti
 e3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=2w7jL0ZTZyPL95dyNwt6SF5zDZVsEYRAtpxVZplDx4k=;
 b=OopbYdBv/ZBfktQEXWvhVvxEF0qcJdAMIl1SxUoMREkiS5s+vAyzvATfu+//XegZsY
 NvRUFUa9w2YEwhhKQLHU9MuLneYPUh5dBgIzlPcjPT/1DcDrVj7maBPDfXgmX/ReJjqD
 pRmvX2IYP72c9CEZtyiHRK1/37uJ8Cxgl36D+YVSrnKQ8FaEk6sT6X4soUH+RAfbHIO1
 EeOYbi2W/h1y+49uX5aFqpDVa8cRnwhGT+8V9tOfsMSKcSFMz2Q7dzk5f1fOYWsnKRIZ
 IPzbwdvnC+XSd3JdAWSpvDjV/naGD4XbHmxQhkhV8zy7Wu3yOiYrPEIhU1FajmsC5+3c
 EKYw==
X-Gm-Message-State: ANhLgQ1q38tgPN17K00Bdm/jkeSQK14/6io5DkC9Jr18MUJHN2TqMFMN
 4sUYreEkEBjGGQCEfHcRcDQ=
X-Google-Smtp-Source: ADFU+vuH5ZhCkgCludyDTSOkYWiu+j3c9vxmK/gYfwLG7ZMsEAKnWkL2kJDPiq8/rfAvpepXlVzF0w==
X-Received: by 2002:a17:902:444:: with SMTP id
 62mr21033948ple.109.1584959627078; 
 Mon, 23 Mar 2020 03:33:47 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id z16sm11921689pjt.40.2020.03.23.03.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 03:33:46 -0700 (PDT)
Date: Mon, 23 Mar 2020 20:29:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: allow rtas to be called in real-mode, use
 this in machine check
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320152816.1469657-1-npiggin@gmail.com>
 <8435e728-8cb4-c6b2-f228-44ebb0b0cc29@linux.ibm.com>
In-Reply-To: <8435e728-8cb4-c6b2-f228-44ebb0b0cc29@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584959111.ol6yw4itpo.astroid@bobo.none>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh's on March 23, 2020 8:19 pm:
>=20
>=20
> On 3/20/20 8:58 PM, Nicholas Piggin wrote:
>> rtas_call allocates and uses memory in failure paths, which is
>> not safe for RMA. It also calls local_irq_save() which may not be safe
>> in all real mode contexts.
>>
>> Particularly machine check may run with interrupts not "reconciled",
>> and it may have hit while it was in tracing code that should not be
>> rentered.
>>
>> Create minimal rtas call that should be usable by guest machine check
>> code, use it there to call "ibm,nmi-interlock".
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/rtas.h      |  1 +
>>   arch/powerpc/kernel/entry_64.S       | 12 ++++++--
>>   arch/powerpc/kernel/rtas.c           | 43 ++++++++++++++++++++++++++++
>>   arch/powerpc/platforms/pseries/ras.c |  2 +-
>>   4 files changed, 54 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/=
rtas.h
>> index 3c1887351c71..4ffc499ce1ac 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -352,6 +352,7 @@ extern struct rtas_t rtas;
>>   extern int rtas_token(const char *service);
>>   extern int rtas_service_present(const char *service);
>>   extern int rtas_call(int token, int, int, int *, ...);
>> +extern int raw_rtas_call(int token, int, int, int *, ...);
>>   void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
>>   			int nret, ...);
>>   extern void __noreturn rtas_restart(char *cmd);
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_=
64.S
>> index 51c5b681f70c..309abb677788 100644
>> --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>> @@ -759,6 +759,13 @@ _GLOBAL(enter_rtas)
>>   	li	r0,0
>>   	mtcr	r0
>>  =20
>> +	/* enter_rtas called from real-mode may not have irqs reconciled
>> +	 * but will always have interrupts disabled.
>> +	 */
>> +	mfmsr	r6
>> +	andi.	r7,r6,(MSR_IR|MSR_DR)
>> +	beq	2f
>> +
>>   #ifdef CONFIG_BUG
>>   	/* There is no way it is acceptable to get here with interrupts enabl=
ed,
>>   	 * check it with the asm equivalent of WARN_ON
>> @@ -769,10 +776,10 @@ _GLOBAL(enter_rtas)
>>   #endif
>>  =20
>>   	/* Hard-disable interrupts */
>> -	mfmsr	r6
>>   	rldicl	r7,r6,48,1
>>   	rotldi	r7,r7,16
>>   	mtmsrd	r7,1
>> +2:
>>  =20
>>   	/* Unfortunately, the stack pointer and the MSR are also clobbered,
>>   	 * so they are saved in the PACA which allows us to restore
>> @@ -795,7 +802,6 @@ _GLOBAL(enter_rtas)
>>   	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
>>   	andc	r6,r0,r9
>>  =20
>> -__enter_rtas:
>>   	sync				/* disable interrupts so SRR0/1 */
>>   	mtmsrd	r0			/* don't get trashed */
>>  =20
>> @@ -837,7 +843,7 @@ rtas_return_loc:
>>   	mtspr	SPRN_SRR1,r4
>>   	RFI_TO_KERNEL
>>   	b	.	/* prevent speculative execution */
>> -_ASM_NOKPROBE_SYMBOL(__enter_rtas)
>> +_ASM_NOKPROBE_SYMBOL(enter_rtas)
>>   _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
>>  =20
>>   	.align	3
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index c5fa251b8950..a058dcfb6726 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -450,6 +450,8 @@ int rtas_call(int token, int nargs, int nret, int *o=
utputs, ...)
>>   	char *buff_copy =3D NULL;
>>   	int ret;
>>  =20
>> +	WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) !=3D (MSR_IR|MSR_DR));
>> +
>>   	if (!rtas.entry || token =3D=3D RTAS_UNKNOWN_SERVICE)
>>   		return -1;
>>  =20
>> @@ -483,6 +485,47 @@ int rtas_call(int token, int nargs, int nret, int *=
outputs, ...)
>>   }
>>   EXPORT_SYMBOL(rtas_call);
>>  =20
>> +/*
>> + * Like rtas_call but no kmalloc or printk etc in error handling, so
>> + * error won't go through log_error. No tracing, may be called in real =
mode.
>> + */
>> +int notrace raw_rtas_call(int token, int nargs, int nret, int *outputs,=
 ...)
>> +{
>> +	va_list list;
>> +	int i;
>> +	struct rtas_args *rtas_args;
>> +	int ret;
>> +
>> +	WARN_ON_ONCE((mfmsr() & MSR_EE));
>> +
>> +	if (!rtas.entry || token =3D=3D RTAS_UNKNOWN_SERVICE)
>> +		return -1;
>> +
>> +	/*
>> +	 * Real mode must have MSR[EE]=3D0 and we prefer not to touch any
>> +	 * irq or preempt state (this may be called in machine check).
>> +	 */
>> +	preempt_disable_notrace();
>> +	arch_spin_lock(&rtas.lock);
>=20
> I wonder, if its ok to attempt for this lock in nested MCE.

It's not. It will deadlock if an MCE hits after "ibm,nmi-interlock" is
called and before the lock is released on the same CPU.

The struct actually isn't even that big, 84 bytes or so, and we're in
the dedicated machine check stack here so we could just put it on
stack AFAIKS?

Thanks,
Nick
=
