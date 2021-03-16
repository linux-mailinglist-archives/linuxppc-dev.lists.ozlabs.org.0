Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E933CE5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F045H6G92z3034
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O8J2aaaB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O8J2aaaB; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F044t18hHz302X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:03:22 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id f8so2987754plg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E/g7RnSv5p3IxvChPjknJ6cZhmvK9F3MQHi7rAMrLtI=;
 b=O8J2aaaB6QWDk7ezUh5tfoFPz5jX0FmFj1YDAQl/RiLJLVvYup+0eP7+xiF/jtkI41
 25gIm8/puno5JE6wUI7MJ72kaxnnMYgZX4K1iwrtxW/46W4QmgKBWdaBd/xwbPvNBZ5Q
 cPO193P61G5NDzsLcf9qA/kLwMd8zpJ97LxklQhazsdb6txB7kGgIBQoFb3x2Zq2n5kB
 XAqdN3427gyT+0dKwZ0Hane2cTiYUc9aD8jy8FYdFqXMLUTdAJyQMYoz/6rM7n45tJ/A
 KzIsrYHF7Jj5A+ns0NUCfE+dUdC73iHgqVicXViVUjTv+wLg68yWKXHjqfKR6B4I1MT/
 ZIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E/g7RnSv5p3IxvChPjknJ6cZhmvK9F3MQHi7rAMrLtI=;
 b=UvUBY9kiZz5HeUHjhzlWmwezTBl6tYQnRfB9I4oxzxHNOBVXHyuEJdpWetkpcU2n8/
 fylVg2T9TYiG0vdj4fJ9AEKa5xbUNdMLdTIxfMJ5UOOphRzvPjpyRfHvAd34MI3Q5YR4
 0Eho2MucXv4/FMZjc6jEBqwFrA6dy+Gr1S9VWypLhb4caPxq7ODaUd3UpOAqZ005MAfA
 K7oh62x/IXJ+zXnBRxSHL1MVThOi2YnaaBWKEfBAGai3rhCuOPm1lCxY1neDaGtmdT8L
 tr7cBBYyNnv59V33ACQH7ovh4SzOCgZKRVtMn+2pZIsXdMqM5ij419AFLIP0P2Ah5YGS
 qepg==
X-Gm-Message-State: AOAM532pkqUnT+fkX5ROsO+z46UoUpue6R/aBgWyZWpJ05MptiZywgo8
 XgICoLqYJXkk4k4kHkYRC5oBO01u9zU=
X-Google-Smtp-Source: ABdhPJzbenB1FT4llkd6a/2lgdZmJO7xxKNErz+90K6N5joGX8WmqmtWFWUXWPYnc0BoDJc5WDb0Ag==
X-Received: by 2002:a17:902:463:b029:e4:c045:4831 with SMTP id
 90-20020a1709020463b02900e4c0454831mr15303617ple.34.1615878199291; 
 Tue, 16 Mar 2021 00:03:19 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id w17sm12198521pfu.29.2021.03.16.00.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:03:18 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:03:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
 <186d3513-d7ab-a658-cdb2-6fe5146c1fc4@csgroup.eu>
In-Reply-To: <186d3513-d7ab-a658-cdb2-6fe5146c1fc4@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615877942.nnm41hogl1.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 15, 2021 5:50 pm:
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

...

>> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/=
exceptions-64e.S
>> index da78eb6ab92f..1bb4e9b37748 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -139,7 +139,8 @@ ret_from_level_except:
>>   	ld	r3,_MSR(r1)
>>   	andi.	r3,r3,MSR_PR
>>   	beq	1f
>> -	b	ret_from_except
>> +	REST_NVGPRS(r1)
>=20
> Could this be in a separate preceding patch (only the adding of REST_NVGP=
RS(), the call to=20
> ret_from_except can remain as is by removing the REST_NVGPRS() which is t=
here to make=20
> ret_from_except and ret_from_except_lite identical).
>=20
> Or maybe you can also do the name change to interrupt_return in that prec=
eeding patch, so than the=20
> "use new interrupt return" patch only contains the interesting parts.

I don't like that so much, maybe the better split is to first change the=20
common code to add the 64e bits, and then convert 64e from=20
ret_from_except to interrupt_return and remove the old code.

...

>> @@ -1016,284 +1021,8 @@ alignment_more:
>=20
> ...
>=20
>> -fast_exception_return:
>> -	wrteei	0
>> -1:	mr	r0,r13
>> -	ld	r10,_MSR(r1)
>> -	REST_4GPRS(2, r1)
>> -	andi.	r6,r10,MSR_PR
>> -	REST_2GPRS(6, r1)
>> -	beq	1f
>> -	ACCOUNT_CPU_USER_EXIT(r13, r10, r11)
>=20
> Then ACCOUNT_CPU_USER_EXIT can be removed from asm/ppc_asm.h

Will do.

>> @@ -387,7 +396,11 @@ notrace unsigned long interrupt_exit_user_prepare(s=
truct pt_regs *regs, unsigned
>>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM)))=
 {
>>   		local_irq_enable(); /* returning to user: may enable */
>>   		if (ti_flags & _TIF_NEED_RESCHED) {
>> +#ifdef CONFIG_PPC_BOOK3E_64
>> +			schedule_user();
>> +#else
>>   			schedule();
>> +#endif
>>   		} else {
>>   			if (ti_flags & _TIF_SIGPENDING)
>>   				ret |=3D _TIF_RESTOREALL;
>> @@ -435,7 +448,10 @@ notrace unsigned long interrupt_exit_user_prepare(s=
truct pt_regs *regs, unsigned
>>   	/*
>>   	 * We do this at the end so that we do context switch with KERNEL AMR
>>   	 */
>> +#ifndef CONFIG_PPC_BOOK3E_64
>>   	kuap_user_restore(regs);
>=20
> Why do you need to ifdef this out ?
> Only PPC_8xx, PPC_BOOK3S_32 and PPC_RADIX_MMU select PPC_HAVE_KUAP.
> When PPC_KUAP is not selected, kuap_user_restore() is a static inline {} =
defined in asm/kup.h

It came in from an old patch rebase. I'll get rid of them.

...

Thanks,
Nick
