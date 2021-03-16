Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948BF33CE60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:05:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F046f453mz30MX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:04:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FNUfzvHN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FNUfzvHN; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F046D46VLz2yZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:04:36 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d23so13287604plq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VThm0hKSSjVX6EL4dk3ujE/vvFR7zO/6c6pGa124pu0=;
 b=FNUfzvHNAkNuttxez4/JK76lFQI3XS0l2FNNwLjNSUI7XKtrO4WKjoRiIkkXP8gPdw
 lvU/M1yqQ3rek6C1juF+j86pJC1cEAROWZ9Tz27SBM8UgIWwOjt7qNKETM7cHxcJ+JQn
 B1clEdGLmVaBbgKkoheE+EmRI+PXBC7Uc2N5THCjWmImJYx58roVTHOfiMxU5naZZvKB
 53pPftaQed9jUCEAEE7iyRvEBOHi8xrnZTso4tADlqYxjMBSyopMQeEgwuGNW9RU86NS
 FE5P+fgbHZKrEsQ6pU5QCNHVm4vbcUoI4Z38D3bcB0tVabLJbbMrNaiZehQrl7pHwYYt
 vkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VThm0hKSSjVX6EL4dk3ujE/vvFR7zO/6c6pGa124pu0=;
 b=JVt6DgsesiFObj8asYjkxOTOGXd5Y480GA24b4X+4Ro/uAkDn5iPHUlu+z6yzICjpt
 tMS/Z9LZBRo4xSiTmYgpbeLXflwdgstwegS9mOIKQdMzf5AzEB/JWKtMWDNWc9o8b6Gn
 OkoYapqAQ1KRJOakO5kTw8HzaFo4OEglXv0HJOkvt6ZvDX2bWFTdybkbVqTHp2C7W2Ih
 3961xTV0MwwUQlDyXgcZ2gmZ2y6LTEImZiiUZ99dC4cwmZMeL+t+8ndrSLK/BqabiapZ
 qpu78BGKEmmfjbFPkEHqfx5Rz3TI5871JHsoOKkRa4a4v6tBBFL1ppTjgQljmLCKndFe
 DZoQ==
X-Gm-Message-State: AOAM533MkM+b3oudEZTL/FKkx4D5TUFshnd56htbCOlo68vqK2XVjJvz
 8g5BLr1KxjBbToWJjQ1t+DBvkdiOtaw=
X-Google-Smtp-Source: ABdhPJy+FsY8s2YY+CRxE4vVt6HNtQ0akkpfFoOOu1xrkSN7iHvkZprbrZIoqi+IzyS7ZI8oAMEYgg==
X-Received: by 2002:a17:90b:ece:: with SMTP id
 gz14mr3435962pjb.192.1615878273305; 
 Tue, 16 Mar 2021 00:04:33 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id t22sm1796821pjo.45.2021.03.16.00.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:04:32 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:04:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
 <a2c192a2-ebdb-d18a-6e21-b27d8890fe06@csgroup.eu>
In-Reply-To: <a2c192a2-ebdb-d18a-6e21-b27d8890fe06@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615878222.rk6eq5hjpl.astroid@bobo.none>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 15, 2021 11:30 pm:
>=20
>=20
> Le 15/03/2021 =C3=A0 04:17, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Update the new C and asm interrupt return code to account for 64e
>> specifics, switch over to use it.
>>=20
>> The now-unused old ret_from_except code, that was moved to 64e after the
>> 64s conversion, is removed.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>>   arch/powerpc/kernel/entry_64.S            |   9 +-
>>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>>   arch/powerpc/kernel/interrupt.c           |  27 +-
>>   arch/powerpc/kernel/irq.c                 |  76 -----
>>   5 files changed, 56 insertions(+), 379 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/inter=
rupt.c
>> index fbabb49888d3..ae7b058b2970 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
>>   #endif
>>   }
>>  =20
>> +/* temporary hack for context tracking, removed in later patch */
>> +#include <linux/sched/debug.h>
>> +asmlinkage __visible void __sched schedule_user(void);
>> +
>>   /*
>>    * This should be called after a syscall returns, with r3 the return v=
alue
>>    * from the syscall. If this function returns non-zero, the system cal=
l
>> @@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigned=
 long r3,
>>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM)))=
 {
>>   		local_irq_enable();
>>   		if (ti_flags & _TIF_NEED_RESCHED) {
>> +#ifdef CONFIG_PPC_BOOK3E_64
>> +			schedule_user();
>> +#else
>>   			schedule();
>> +#endif
>>   		} else {
>>   			/*
>>   			 * SIGPENDING must restore signal handler function
>> @@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsigned =
long r3,
>>   	return ret;
>>   }
>>  =20
>> -#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>>   notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs=
, unsigned long msr)
>>   {
>>   	unsigned long ti_flags;
>> @@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare(st=
ruct pt_regs *regs, unsigned
>>   	BUG_ON(!(regs->msr & MSR_PR));
>>   	BUG_ON(!FULL_REGS(regs));
>>   	BUG_ON(arch_irq_disabled_regs(regs));
>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> Shouldn't this go away in patch 6 as well ?
> Or is that needed at all ? In syscall_exit_prepare() it is not ifdefed .

Hmm, not sure. I'll take a look. It probably shouldn't be ifdefed at all=20
but definitely by the end it should run without warning.

Thanks,
Nick
