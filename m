Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F633CE9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:26:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04b41gLqz3bcW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KQrhmlEZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KQrhmlEZ; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04Zc5htDz2yYr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:25:43 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3189341pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4URgY7RiWQ2MO4RUxC1qhFs6zXior6E1jNACEA6oRIw=;
 b=KQrhmlEZwX+xx2/YHe2/cvzI2z1CvfPP4zVq9fLJlbXHFBdI221w1ZqBOpGkyY3wIz
 gQOOP0n1Lj7I0rszU+hyG2x0sdOES0agmwWKOmrjUq2sVzqTwO6jgcXFOL3ghYaOorsg
 TYCQLoH4ELvEMw2kPPxggjJHfIkSdgFQn7dkfZjaFAIfIykvEt9rfhw3BJpZ2pjpzi81
 8YCt68flrUV0vH7ZUf8CuyORfHvrlBxRCnY/zEJFYY9TeMyUL+L2rLU6zK7ITAucc+w7
 ltx4AzNn25JBRfDXbf95v9VQUKrxNlFc7mwZK+l0j+QsD6lxvydx3lUoMx7lWDjHQQHu
 f+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4URgY7RiWQ2MO4RUxC1qhFs6zXior6E1jNACEA6oRIw=;
 b=p7KPuXRT89ULEvR7vFVujyTgT7fWB/2OlGu6AYE3WsXic1XmXB0D0ZlYtxIVyXelC9
 2r8TKvYo/MC+tSvhJTxVbkpHq5dmt/WpvHbtdyVyc9pg+NfbYNLfkFsrufR8QZ9LwzAm
 WjrXlhjd2dB46J55DjS12db77b3fYUM/k8PENxf9bSqvcr73/MTnrQF4BnQX88s9x0gn
 QMRBfKL2T0dGkDx+QIDV4dLuhxFFsHVaVPpLTiiiP3YLVKlocNMFXwyAFGWPGAzxC3yu
 qy6m6LhMZKzAj6heQNiNE43yJSTNVrX/Fl/T6Gp9cWoDFvvJ8moERS6GGdSYpZcOGNNU
 otUA==
X-Gm-Message-State: AOAM531jLeP/a16ZlTYaSClxjzT9eAL0wpO7EzOKtx4aawtLb40bfFql
 k60egqsoAAQxiWj+hP1WXN8=
X-Google-Smtp-Source: ABdhPJwpaIbDXyl0F5mW3YzU2ivBPd7lY8JAvGw6wRve1At1MDvbCtJ+GdbAbAmYZiAz7BrKuO8tTA==
X-Received: by 2002:a17:90a:ff05:: with SMTP id
 ce5mr3380931pjb.156.1615879540540; 
 Tue, 16 Mar 2021 00:25:40 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id y29sm15767379pfp.206.2021.03.16.00.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:25:40 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:25:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
 <a2c192a2-ebdb-d18a-6e21-b27d8890fe06@csgroup.eu>
 <1615878222.rk6eq5hjpl.astroid@bobo.none>
In-Reply-To: <1615878222.rk6eq5hjpl.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1615879421.ckimzb9u3c.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of March 16, 2021 5:04 pm:
> Excerpts from Christophe Leroy's message of March 15, 2021 11:30 pm:
>>=20
>>=20
>> Le 15/03/2021 =C3=A0 04:17, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Update the new C and asm interrupt return code to account for 64e
>>> specifics, switch over to use it.
>>>=20
>>> The now-unused old ret_from_except code, that was moved to 64e after th=
e
>>> 64s conversion, is removed.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>>>   arch/powerpc/kernel/entry_64.S            |   9 +-
>>>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++-------------------=
-
>>>   arch/powerpc/kernel/interrupt.c           |  27 +-
>>>   arch/powerpc/kernel/irq.c                 |  76 -----
>>>   5 files changed, 56 insertions(+), 379 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/inte=
rrupt.c
>>> index fbabb49888d3..ae7b058b2970 100644
>>> --- a/arch/powerpc/kernel/interrupt.c
>>> +++ b/arch/powerpc/kernel/interrupt.c
>>> @@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
>>>   #endif
>>>   }
>>>  =20
>>> +/* temporary hack for context tracking, removed in later patch */
>>> +#include <linux/sched/debug.h>
>>> +asmlinkage __visible void __sched schedule_user(void);
>>> +
>>>   /*
>>>    * This should be called after a syscall returns, with r3 the return =
value
>>>    * from the syscall. If this function returns non-zero, the system ca=
ll
>>> @@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigne=
d long r3,
>>>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))=
) {
>>>   		local_irq_enable();
>>>   		if (ti_flags & _TIF_NEED_RESCHED) {
>>> +#ifdef CONFIG_PPC_BOOK3E_64
>>> +			schedule_user();
>>> +#else
>>>   			schedule();
>>> +#endif
>>>   		} else {
>>>   			/*
>>>   			 * SIGPENDING must restore signal handler function
>>> @@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsigned=
 long r3,
>>>   	return ret;
>>>   }
>>>  =20
>>> -#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>>>   notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *reg=
s, unsigned long msr)
>>>   {
>>>   	unsigned long ti_flags;
>>> @@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare(s=
truct pt_regs *regs, unsigned
>>>   	BUG_ON(!(regs->msr & MSR_PR));
>>>   	BUG_ON(!FULL_REGS(regs));
>>>   	BUG_ON(arch_irq_disabled_regs(regs));
>>> +#ifdef CONFIG_PPC_BOOK3S_64
>>=20
>> Shouldn't this go away in patch 6 as well ?
>> Or is that needed at all ? In syscall_exit_prepare() it is not ifdefed .
>=20
> Hmm, not sure. I'll take a look. It probably shouldn't be ifdefed at all=20
> but definitely by the end it should run without warning.

Oh I got confused and thought that was the syscall exit. Interrupt exit=20
has to keep this until patch 6 because 64e context tracking does=20
everything in interrupt wrappers, so by the time we get here it will
already be set to CONTEXT_USER.

Thanks,
Nick
