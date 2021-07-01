Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CE3B8BBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 03:26:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFgY63lrzz3074
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 11:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Dy5M9sr1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dy5M9sr1; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFgXc4wN9z2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 11:26:22 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id m26so4597846pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 18:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=c/2UxbN1CeqU2tAhmAPGzOuXmE0hGZfNBDDg3vUqrq0=;
 b=Dy5M9sr1XKQG6GcH/dTzaE54uBadFvHv5qEh7Ntj4vAzleijzlc7yX9brSEAD5xCxw
 pxEwxZc+u2h/BIlPwc8zXi1VvmlnDdWPLm3JTJq17SVUN4xWrXiN9CsjqwUOXSBWCb3K
 lUp4SoT5WuOqcSjYudOMzGVKPt00FNotox9Mz/l3OFIqaGBnZ1st6DM01UT+lfTTdnoh
 vjpJjVhu9fzN2h3JSIDu2qO9B06oRqPR98+eDP9344CvZ74vFZvw2GLk6AZCAAoRrTbN
 JGQHcHVNZCUdIb/KFfGmqX2vxS6Rx8/KuF3ZoFqnQxZvZB5WLKSkqRlw2Q9wxU4p1Vm9
 9oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=c/2UxbN1CeqU2tAhmAPGzOuXmE0hGZfNBDDg3vUqrq0=;
 b=sHDy6+FYubqZFfsizmyoB/VjxR3tGReArQPqMFzCejePJYY6C/demu3oOGTLfn4f8u
 lRhCPVNynoOe9FY+gbd2qqqGpYUUbhphmPckCvbl2O6ER1DAKLOFrrh5ZtCwIXJ4O1N8
 rb/D1RlKO8OLtD6rcH6qzEV264wea11pI3JcMxibD57Iwm5B3lyQeo5RH1BLJhCVYXFZ
 M58dy4Ddci9G4NFc1fKxyzZgPyX+r4XOKwjQl6bfgM2yVYq7T4GXTUFgOpRvRl8MYbQ4
 fCmaJtjXExrk5R/Dad/Pv2PGD/fN/32C6D9HrZDd+dXR5ARSo4EWsjELGwNqp0V/7H+Z
 TowQ==
X-Gm-Message-State: AOAM530aR6IKsOS96c9Vbe3al5CLygQX+/fan+1o6IbN3qYDi7M+Xd4/
 2nvS0B+t4Q2paOMnC/kG02Is4ZdTqek=
X-Google-Smtp-Source: ABdhPJxFRGWAKpVv4H/XVliYp/jO741lJ3DwZSUY/1bF4SBDUuo5JCF1triNns+6GlgVP42cAKEgsQ==
X-Received: by 2002:a05:6a00:164b:b029:305:f45e:e1d9 with SMTP id
 m11-20020a056a00164bb0290305f45ee1d9mr39206287pfc.10.1625102777708; 
 Wed, 30 Jun 2021 18:26:17 -0700 (PDT)
Received: from localhost (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id t13sm23086066pfq.4.2021.06.30.18.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 18:26:17 -0700 (PDT)
Date: Thu, 01 Jul 2021 11:26:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/9] powerpc/64e: remove implicit soft-masking and
 interrupt exit restart logic
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210630074621.2109197-1-npiggin@gmail.com>
 <20210630074621.2109197-4-npiggin@gmail.com>
 <a7eef3ac-7ea8-8bf8-f656-c88aa876f5f6@csgroup.eu>
In-Reply-To: <a7eef3ac-7ea8-8bf8-f656-c88aa876f5f6@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1625101861.uej7gzc062.astroid@bobo.none>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of June 30, 2021 5:56 pm:
>=20
>=20
> Le 30/06/2021 =C3=A0 09:46, Nicholas Piggin a =C3=A9crit=C2=A0:
>> The implicit soft-masking to speed up interrupt return was going to be
>> used by 64e as well, but it has not been extensively tested on that
>> platform and is not considered ready. It was intended to be disabled
>> before merge. Disable it for now.
>>=20
>> Most of the restart code is common with 64s, so with more correctness
>> and performance testing this could be re-enabled again by adding the
>> extra soft-mask checks to interrupt handlers and flipping
>> exit_must_hard_disable().
>>=20
>> Fixes: 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs soft-mas=
ked")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h | 33 ++++++++++++++++++++--------
>>   arch/powerpc/kernel/exceptions-64e.S | 12 +---------
>>   arch/powerpc/kernel/interrupt.c      |  2 +-
>>   arch/powerpc/kernel/interrupt_64.S   | 16 ++++++++++++--
>>   4 files changed, 40 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 8b4b1e84e110..f13c93b033c7 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -73,20 +73,34 @@
>>   #include <asm/kprobes.h>
>>   #include <asm/runlatch.h>
>>  =20
>> -#ifdef CONFIG_PPC64
>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> Can we avoid that ifdef and use IS_ENABLED(CONFIG_PPC_BOOK3S_64) below ?

Hey Christophe,

Thanks for the review, sorry it was a bit rushed to get these fixes in
before the pull. I agree with this and there's a few other cleanups we
might do as well. Something to look at next.

>=20
>>   extern char __end_soft_masked[];
>>   unsigned long search_kernel_restart_table(unsigned long addr);
>> -#endif
>>  =20
>> -#ifdef CONFIG_PPC_BOOK3S_64
>>   DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>>  =20
>> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
>> +{
>> +	if (regs->msr & MSR_PR)
>> +		return false;
>> +
>> +	if (regs->nip >=3D (unsigned long)__end_soft_masked)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   static inline void srr_regs_clobbered(void)
>>   {
>>   	local_paca->srr_valid =3D 0;
>>   	local_paca->hsrr_valid =3D 0;
>>   }
>>   #else
>> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
>> +{
>> +	return false;
>> +}
>> +
>>   static inline void srr_regs_clobbered(void)
>>   {
>>   }
>> @@ -150,11 +164,13 @@ static inline void interrupt_enter_prepare(struct =
pt_regs *regs, struct interrup
>>   		 */
>>   		if (TRAP(regs) !=3D INTERRUPT_PROGRAM) {
>>   			CT_WARN_ON(ct_state() !=3D CONTEXT_KERNEL);
>> -			BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
>> +			BUG_ON(is_implicit_soft_masked(regs));
>>   		}
>> +#ifdef CONFIG_PPC_BOOK3S
>=20
> Allthough we are already in a PPC64 section, wouldn't it be better to use=
 CONFIG_PPC_BOOK3S_64 ?
>=20
> Can we use IS_ENABLED(CONFIG_PPC_BOOK3S_64) instead ?

Good question, it's a matter of preference. I have used PPC_BOOK3S in=20
other places, but maybe in files shared by 32-bit it would be better to=20
have the _64?

On the other hand, in cases where you have an else or #else, then you
still need the PPC64 context to understand that.

I don't really have a preference, I would go with either. Making some
convention and using it everywhere is probably a good idea though.

Thanks,
Nick
