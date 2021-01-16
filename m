Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4AF2F8CD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 11:35:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHvbB6JWlzDspB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 21:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hI1pZ3py; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHvYT5xKnzDsmR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 21:34:19 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id y205so1318606pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 02:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=Zbi9c6TlTu8Pnu5w2s9Xwax6JzQkCYrNQdeLe/ph60E=;
 b=hI1pZ3pyHERNby1kms2KxDCSfyj0ucx1pK6xrxHkOMBYLDCTY1tfstl0J2ghViC6ja
 H5pf47HBBntYLsBbW9eWDrBrogZOpB1B6EklnXGnOW3My5TnzgfFIwpxSM3ABk2q4PlD
 4WEvDGQLKgHcSdq9CMg9y661pEekORs2ii1fxe66bcM0QxPY1eaPOPvopnr1L9HI0JSE
 Cq6LPD7sNhVMFKZsPuYy6f12id5wSKtGnV9rD2jTwidLVZOIGYRHIATDCd1mfrtIFuN1
 tfNcQtjVa4yHeHKd/tl6Pgbl+fz6p3PNIUAo1wo1fmSlXxzL4riQCGCuJIgZZ1XjvWg3
 TjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Zbi9c6TlTu8Pnu5w2s9Xwax6JzQkCYrNQdeLe/ph60E=;
 b=EgkoeVkZM81LcOL+LMWVQTi8n1WDuWAcUsrEfOlbA4qEnzGq3uhnojFB5ra24kLQee
 b+qWM9Q4MB+mEG+aER5dgTgL64GfiAilOdVH9kqO9xXcbfx7l/eVwylZ678sINSt1vmI
 hcYNfZpZJyldqFkxZVIL4lDuk14Mtrl5jHd+hMdjh+zhzVNNztXQ0oGoADB3u1OwPGcZ
 +vp7ogEGkhzLqks1zuvwf9U79O6ERV5z0MgKFLqTSSAF4CHFjOiUFqegjolcdBziB6e6
 wkpbamSstdqA9dlkKB4CboHq1CYmmUCW9QokFIfHGDAkXmVfQdrNwwovS0wvr8Xx2A/W
 c5Iw==
X-Gm-Message-State: AOAM530XEBdQnQ6g0aB+GircBBSafhwQ8NIz/Y8j7JtUC9I+HXUWQ3ja
 yQGh/bdRWZthu21KjRuWhrk=
X-Google-Smtp-Source: ABdhPJxetsYDU4CI8E3k0zspqa8razqW9Z/yvzVotg2lsYdzDhaqxWAJ1nWWxEG0QeBK1HrAik7w2Q==
X-Received: by 2002:a65:644b:: with SMTP id s11mr681219pgv.4.1610793255423;
 Sat, 16 Jan 2021 02:34:15 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id w2sm10751413pfj.110.2021.01.16.02.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:34:14 -0800 (PST)
Date: Sat, 16 Jan 2021 20:34:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 17/39] powerpc/fsl_booke/32: CacheLockingException
 remove args
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-18-npiggin@gmail.com>
 <1bd92a69-71ab-cc7f-fec5-e2a67830c81b@csgroup.eu>
 <1610757796.o87kxvdq5e.astroid@bobo.none>
 <0d953b03-b908-0fd6-61bf-d0e461312874@csgroup.eu>
In-Reply-To: <0d953b03-b908-0fd6-61bf-d0e461312874@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610793173.p0wt85cufb.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 16, 2021 5:38 pm:
>=20
>=20
> Le 16/01/2021 =C3=A0 01:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of January 16, 2021 3:14 am:
>>>
>>>
>>> Le 15/01/2021 =C3=A0 17:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Like other interrupt handler conversions, switch to getting registers
>>>> from the pt_regs argument.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>    arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>>>>    arch/powerpc/kernel/traps.c          | 5 +++--
>>>>    2 files changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kerne=
l/head_fsl_booke.S
>>>> index fdd4d274c245..0d4d9a6fcca1 100644
>>>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>>>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>>>> @@ -364,12 +364,12 @@ interrupt_base:
>>>>    	/* Data Storage Interrupt */
>>>>    	START_EXCEPTION(DataStorage)
>>>>    	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
>>>> -	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
>>>> +	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
>>>>    	stw	r5,_ESR(r11)
>>>> -	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
>>>> +	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
>>>> +	stw	r4, _DEAR(r11)
>>>>    	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
>>>>    	bne	1f
>>>> -	stw	r4, _DEAR(r11)
>>>>    	EXC_XFER_LITE(0x0300, handle_page_fault)
>>>>    1:
>>>>    	addi	r3,r1,STACK_FRAME_OVERHEAD
>>>
>>> Why isn't the above done in patch 5 ?
>>=20
>> I don't think it's required there, is it?
>=20
> Ah yes, moving the 'stw' is needed only here.
>=20
> But the comments changes belong to patch 5, you have done exactly similar=
 changes there in=20
> kernel/head_40x.S
>=20
> By the way, I think patch 17 could immediately follow patch 5 and patch 1=
8 could follow patch 6.

I can probably do all these. I'll wait a couple of days and check if=20
Michael will merge the series before sending an update for small
changes.

Thanks,
Nick

