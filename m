Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8430685C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 01:07:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR14Z6spYzDr48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 11:07:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=btCRPZ9B; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR12d60LWzDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:05:42 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id q131so2593292pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 16:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=VCuZxPGQl5NqiS3kjT/OWcgqac0mzVDF5lSD+vD32D0=;
 b=btCRPZ9B3xtKI72xr/MsJCAW2wAxm4A8gJ4F6dVVplQvEh4WnEkIEYfrNyfTzyXJ8I
 C6QAAbMwFfZJbYe0vKO8LLsJkZzuLuNYl57UYRxlFpe0t6FVCK/NFkyhD64zb5eBIOP9
 023883u7f19UjMcGf4tJ68lco4BYoJOL5IvdONcL/iu6Zuhvi30hmAE2T5CEH59vB3Bf
 IIO0dGO3dZVvPKNAptm+lC+7lwLse6uz3DDfMTLi+TBBKIL2LrVHMJ/fMTVxP1tJhxcX
 ghar3vUwr/OO+4j8XZr1zGBSPKQu29qzZSRork8uQxvsD3WCZZFJE5qiZtO5zjD53j9v
 KD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VCuZxPGQl5NqiS3kjT/OWcgqac0mzVDF5lSD+vD32D0=;
 b=jPGndDpy5gb/4w8ZYML/dMkgmzSI+PCbrZIzqg2hZnm0S9VP/T3vMveVD4FPSdzz/2
 cnwfVbjXqrpdQbtAR4KV3kaeyyHVfC1lBOL2VNV5gxN870F8h9DAQDEzVNfEukBMlU91
 GeYiuHZS5Cs4gMMSx37LggozZop4qFQ1fm/77WApxIZV3C7jUbkOjRIKL35dLNy+HnJP
 OoDPDq8cZuUVzdTNjSB1UuC5srkoG/Xu2uiQV/KqXSIUt1ibPK55UZpnNfzP/OR1nvNP
 vMVYD8BBrSFT/P31Hr/pJYvbRe6mqfpBGuywptPWaqNKdc2RB+IkYuSEIYcOQyegfihO
 NnZA==
X-Gm-Message-State: AOAM533y+68SaBEH1ce+mL5OxQzTeegq4nno9aevgLdUVs2h/5LbgH0S
 gHsYLfJpmNIr6Yqpqf+w+7k=
X-Google-Smtp-Source: ABdhPJxHdcUgEXTDLhjWpnIGYvjT6RaGsI5F+Vl39gaO28hNIMzK9IPrPTgi9BHzQJw+iU98fTH/mw==
X-Received: by 2002:a62:36c4:0:b029:1b9:7ca6:5d6b with SMTP id
 d187-20020a6236c40000b02901b97ca65d6bmr13054982pfa.43.1611792339701; 
 Wed, 27 Jan 2021 16:05:39 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id x67sm3468888pfd.106.2021.01.27.16.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:05:38 -0800 (PST)
Date: Thu, 28 Jan 2021 10:05:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 05/39] powerpc: remove arguments from fault handler
 functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-6-npiggin@gmail.com>
 <86bdad6b-2591-6992-b739-caa0874ca558@csgroup.eu>
In-Reply-To: <86bdad6b-2591-6992-b739-caa0874ca558@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611791489.gto0xh54hf.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 27, 2021 4:38 pm:
>=20
>=20
> Le 15/01/2021 =C3=A0 17:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Make mm fault handlers all just take the pt_regs * argument and load
>> DAR/DSISR from that. Make those that return a value return long.
>>=20
>> This is done to make the function signatures match other handlers, which
>> will help with a future patch to add wrappers. Explicit arguments could
>> be added for performance but that would require more wrapper macro
>> variants.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h     |  4 ++--
>>   arch/powerpc/include/asm/book3s/64/mmu-hash.h |  2 +-
>>   arch/powerpc/include/asm/bug.h                |  2 +-
>>   arch/powerpc/kernel/entry_32.S                |  7 +------
>>   arch/powerpc/kernel/exceptions-64e.S          |  2 --
>>   arch/powerpc/kernel/exceptions-64s.S          | 17 ++++-------------
>>   arch/powerpc/kernel/head_40x.S                | 10 +++++-----
>>   arch/powerpc/kernel/head_8xx.S                |  6 +++---
>>   arch/powerpc/kernel/head_book3s_32.S          |  5 ++---
>>   arch/powerpc/kernel/head_booke.h              |  4 +---
>>   arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
>>   arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
>>   arch/powerpc/mm/fault.c                       |  5 ++---
>>   13 files changed, 34 insertions(+), 49 deletions(-)
>>=20
>=20
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_=
32.S
>> index 238eacfda7b0..d6ea3f2d6cc0 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -276,8 +276,7 @@ reenable_mmu:
>>   	 * We save a bunch of GPRs,
>>   	 * r3 can be different from GPR3(r1) at this point, r9 and r11
>>   	 * contains the old MSR and handler address respectively,
>> -	 * r4 & r5 can contain page fault arguments that need to be passed
>> -	 * along as well. r0, r6-r8, r12, CCR, CTR, XER etc... are left
>> +	 * r0, r4-r8, r12, CCR, CTR, XER etc... are left
>>   	 * clobbered as they aren't useful past this point.
>>   	 */
>>  =20
>> @@ -285,15 +284,11 @@ reenable_mmu:
>>   	stw	r9,8(r1)
>>   	stw	r11,12(r1)
>>   	stw	r3,16(r1)
>=20
> As all functions only take 'regs' as input parameter, maybe we can avoid =
saving 'r3' by=20
> recalculating it from r1 after the call with 'addi	r3,r1,STACK_FRAME_OVER=
HEAD' ?

It seems like it. All functions have regs as first parameter already=20
don't they? So this change could be done before this patch as well.

>=20
>> -	stw	r4,20(r1)
>> -	stw	r5,24(r1)
>=20
> Patch 6 needs to go before this change. Probably the easiest would be to =
apply patch 6 before patch=20
> 5. Or this change needs to go after.

Hmm okay thanks for finding that.

Thanks,
Nick
