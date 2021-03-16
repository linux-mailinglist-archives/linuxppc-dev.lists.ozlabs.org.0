Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C7733CF77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F05gf6719z3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 19:15:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HPu2X+8O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HPu2X+8O; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F05g83MNCz309v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 19:14:44 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id b23so8279004pfo.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nBfVNpu9Fz4NHHXFPA8DLkCliNeK6PUizhpnXEZ1wLw=;
 b=HPu2X+8OdYgWltJGJo7Rq0Efxjm0K8eJwz5tFZ0DqXzxRFgoCAexNpJ0qpjG2DwxNo
 x/809xEeyOVEODo833q0Fpg0KMbyWSuWe4bFLIb5Ope7p7wJ/yoeyKnaMlk3hrFxBtzh
 r+XI8G7Wsyt7ER8xpdvJz142mQnQJ45bzMEBfNgB65qqT9n0xFfRxEgZ+nk6O/y90VlS
 cK8gBoN04GySpVZ752zmCs39DcTyd5xVH/N9ZiOC5gsocgmrYb7O12ew6KOxE43UXyvm
 MMrR7wsb9K8hNARhi8pwLg1+pLzrkcoTJYJSg2h9J4+Yy7gNO9WaVZ40/fa9k3tf4MJf
 ZjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nBfVNpu9Fz4NHHXFPA8DLkCliNeK6PUizhpnXEZ1wLw=;
 b=qZlwJETOmmRzpmsMEus/efUNUDwXfKhY5U/8hB17bKGdPCinlCUFYnmXfB+l43GYW+
 +Fy7oBRANEBYbaTGbCWjUq26wT6gPDbvaV69uUrLO8ypTarX6tn2injKMAvmiu1QidiY
 pRornClh1/wdzNUBzBto+IJOIZ1WodxWLmBA8kM5E+aalyqj4VoSw+AqCUzzpGOsHDnT
 OgNJwK/FAvTmwzpBoxCVG3xgK66qqLCtpLq3/Gus1aBX4IYZ5rdWm6Ci0komhsxjTUD+
 zyaGj2fwC5TOzrk6nFBlsXyuPjNNclCI02lHCkFjihIo5OSuWqVUsYyFaGXz8SBpVD9f
 qcmw==
X-Gm-Message-State: AOAM533VJC/1kDYDCwpBaMv31warfdoRK+TL+8eSW0jtlW9SsrAsaXVX
 Pgn2WyiKwtyapMS9QBiz9EU=
X-Google-Smtp-Source: ABdhPJwUqWuJ3mwceVpJLLqnGI39ljcuIGqme/9Cerc9QTSjzq+Spy8fBg8jzd/W/4AqotK5JyJO3A==
X-Received: by 2002:a62:fc81:0:b029:1f1:5b91:3453 with SMTP id
 e123-20020a62fc810000b02901f15b913453mr13690217pfh.53.1615882481197; 
 Tue, 16 Mar 2021 01:14:41 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id n5sm15466089pfq.44.2021.03.16.01.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:14:40 -0700 (PDT)
Date: Tue, 16 Mar 2021 18:14:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
 <a2c192a2-ebdb-d18a-6e21-b27d8890fe06@csgroup.eu>
 <1615878222.rk6eq5hjpl.astroid@bobo.none>
 <1615879421.ckimzb9u3c.astroid@bobo.none>
 <f452729c-6290-17e9-eb96-4c1ebffd4c7e@csgroup.eu>
In-Reply-To: <f452729c-6290-17e9-eb96-4c1ebffd4c7e@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615882448.ceo6nj8iib.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 16, 2021 5:29 pm:
>=20
>=20
> Le 16/03/2021 =C3=A0 08:25, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Nicholas Piggin's message of March 16, 2021 5:04 pm:
>>> Excerpts from Christophe Leroy's message of March 15, 2021 11:30 pm:
>>>>
>>>>
>>>> Le 15/03/2021 =C3=A0 04:17, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> Update the new C and asm interrupt return code to account for 64e
>>>>> specifics, switch over to use it.
>>>>>
>>>>> The now-unused old ret_from_except code, that was moved to 64e after =
the
>>>>> 64s conversion, is removed.
>>>>>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>> ---
>>>>>    arch/powerpc/include/asm/asm-prototypes.h |   2 -
>>>>>    arch/powerpc/kernel/entry_64.S            |   9 +-
>>>>>    arch/powerpc/kernel/exceptions-64e.S      | 321 ++----------------=
----
>>>>>    arch/powerpc/kernel/interrupt.c           |  27 +-
>>>>>    arch/powerpc/kernel/irq.c                 |  76 -----
>>>>>    5 files changed, 56 insertions(+), 379 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/in=
terrupt.c
>>>>> index fbabb49888d3..ae7b058b2970 100644
>>>>> --- a/arch/powerpc/kernel/interrupt.c
>>>>> +++ b/arch/powerpc/kernel/interrupt.c
>>>>> @@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
>>>>>    #endif
>>>>>    }
>>>>>   =20
>>>>> +/* temporary hack for context tracking, removed in later patch */
>>>>> +#include <linux/sched/debug.h>
>>>>> +asmlinkage __visible void __sched schedule_user(void);
>>>>> +
>>>>>    /*
>>>>>     * This should be called after a syscall returns, with r3 the retu=
rn value
>>>>>     * from the syscall. If this function returns non-zero, the system=
 call
>>>>> @@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsig=
ned long r3,
>>>>>    	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_T=
M))) {
>>>>>    		local_irq_enable();
>>>>>    		if (ti_flags & _TIF_NEED_RESCHED) {
>>>>> +#ifdef CONFIG_PPC_BOOK3E_64
>>>>> +			schedule_user();
>>>>> +#else
>>>>>    			schedule();
>>>>> +#endif
>>>>>    		} else {
>>>>>    			/*
>>>>>    			 * SIGPENDING must restore signal handler function
>>>>> @@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsign=
ed long r3,
>>>>>    	return ret;
>>>>>    }
>>>>>   =20
>>>>> -#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>>>>>    notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *=
regs, unsigned long msr)
>>>>>    {
>>>>>    	unsigned long ti_flags;
>>>>> @@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare=
(struct pt_regs *regs, unsigned
>>>>>    	BUG_ON(!(regs->msr & MSR_PR));
>>>>>    	BUG_ON(!FULL_REGS(regs));
>>>>>    	BUG_ON(arch_irq_disabled_regs(regs));
>>>>> +#ifdef CONFIG_PPC_BOOK3S_64
>>>>
>>>> Shouldn't this go away in patch 6 as well ?
>>>> Or is that needed at all ? In syscall_exit_prepare() it is not ifdefed=
 .
>>>
>>> Hmm, not sure. I'll take a look. It probably shouldn't be ifdefed at al=
l
>>> but definitely by the end it should run without warning.
>>=20
>> Oh I got confused and thought that was the syscall exit. Interrupt exit
>> has to keep this until patch 6 because 64e context tracking does
>> everything in interrupt wrappers, so by the time we get here it will
>> already be set to CONTEXT_USER.
>>=20
>=20
> ok, but that it has to go in patch 6 ? At the time being the #ifdef is st=
ill there at the end of the=20
> series
>=20

Yes, that was an oversight. I'll remove it.

Thanks,
Nick
