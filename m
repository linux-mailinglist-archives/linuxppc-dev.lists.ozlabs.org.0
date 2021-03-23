Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F1345C94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4TMD5wkJz30PK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 22:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gFxZgRsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gFxZgRsr; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4TLp6Zbfz30Cv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 22:15:45 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so4743819pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GgQoeoHoEyQVXeMsOEtdzhILOLPPs2n8xM2G4PNbRaU=;
 b=gFxZgRsreXCCkpMVFGxFpJC+nIVxbCX/eB/eaqev6jbq6Tg+UHe6uZBP07LowwB8hH
 94kzmaf/k7W4mw1QY6PZH1/jt84G5AhHpG5XKOZ0+iGl8rc68D4E3MoRDU/HQAnUqATd
 I2jOEFOGUz9cNPX9Zwj0QlnymRwtEXAch0mLQIr8Uapr8a2WNfPgxSQzcN0iMrQpHA2u
 ATgx4SkXqbySovRGOVz15ymRGB/IahikiHV0vKVTT3HbAMGxUgTXi6vL2HNlFQcmY4Cx
 x2bRaTMkSfQSS8viSzhMJ3VPiywmiXqZYNm4QbOBmYN56DM006pCdTWRXaABLwXL+glN
 tp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GgQoeoHoEyQVXeMsOEtdzhILOLPPs2n8xM2G4PNbRaU=;
 b=f8dEs5LM22141mpUYpB78VWib/7hl8D6S8nJT3JekBl/OLaTb5gyWXYgY6UMPAoGBe
 OHj/lNyAilGGv+Ld+531qvkOklluQyYxPMLXW3SjbGSkjOafmgToacU99U8LO4GetA5P
 mGp5kVdUhylCjQhMtvG+Ynd/62CO/mNuryY+yUa6Fdwp7eF2JDdMLRQ7QEn8Vl1Bi/F7
 R/f4p6XpbjNFASR+/o53JWZhWxS+ocBGrFQJ9jwGuDOFL7NgPGeh+0HkBIwMNITv2zIw
 8STx4HGbpbRaywwv+8W4sKBp1uEnRqu3MVn6juQRzQJX6ZZVbljLA+jhGOo64C6++l5X
 z79A==
X-Gm-Message-State: AOAM530V3539z8s54rEF/NsM8DHlCnoIOUHE67p+aICyJ6xRzZ0oGDpo
 okjmlyE4GiTjOEVYR76CoTHBGVnjJrvPxw==
X-Google-Smtp-Source: ABdhPJwYynjFSJjcc/BXLF46oyC36MTKii0rBTq3D8w1ufe+IszT332tCrztJEZM1MDtCXPYETL85w==
X-Received: by 2002:a17:90a:bd92:: with SMTP id
 z18mr4024787pjr.114.1616498143850; 
 Tue, 23 Mar 2021 04:15:43 -0700 (PDT)
Received: from localhost ([1.132.171.72])
 by smtp.gmail.com with ESMTPSA id p25sm16959460pfe.100.2021.03.23.04.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:15:43 -0700 (PDT)
Date: Tue, 23 Mar 2021 21:15:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 28/46] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-29-npiggin@gmail.com>
 <3ca0e504-70df-2a25-12af-a1addac842b6@ozlabs.ru>
 <1616495617.6070udmp89.astroid@bobo.none>
In-Reply-To: <1616495617.6070udmp89.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1616497884.p8em2a52ue.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of March 23, 2021 8:36 pm:
> Excerpts from Alexey Kardashevskiy's message of March 23, 2021 8:13 pm:
>>=20
>>=20
>> On 23/03/2021 12:02, Nicholas Piggin wrote:
>>> irq_work's use of the DEC SPR is racy with guest<->host switch and gues=
t
>>> entry which flips the DEC interrupt to guest, which could lose a host
>>> work interrupt.
>>>=20
>>> This patch closes one race, and attempts to comment another class of
>>> races.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/kvm/book3s_hv.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.=
c
>>> index 1f38a0abc611..989a1ff5ad11 100644
>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>> @@ -3745,6 +3745,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu =
*vcpu, u64 time_limit,
>>>   	if (!(vcpu->arch.ctrl & 1))
>>>   		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
>>>  =20
>>> +	/*
>>> +	 * When setting DEC, we must always deal with irq_work_raise via NMI =
vs
>>> +	 * setting DEC. The problem occurs right as we switch into guest mode
>>> +	 * if a NMI hits and sets pending work and sets DEC, then that will
>>> +	 * apply to the guest and not bring us back to the host.
>>> +	 *
>>> +	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
>>> +	 * example) and set HDEC to 1? That wouldn't solve the nested hv
>>> +	 * case which needs to abort the hcall or zero the time limit.
>>> +	 *
>>> +	 * XXX: Another day's problem.
>>> +	 */
>>>   	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
>>>  =20
>>>   	if (kvmhv_on_pseries()) {
>>> @@ -3879,7 +3891,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *=
vcpu, u64 time_limit,
>>>   	vc->entry_exit_map =3D 0x101;
>>>   	vc->in_guest =3D 0;
>>>  =20
>>> -	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
>>> +	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);
>>=20
>>=20
>> set_dec_or_work() will write local_paca->kvm_hstate.dec_expires - tb - 1=
=20
>> to SPRN_DEC which is not exactly the same, is this still alright?
>>=20
>> I asked in v3 but it is probably lost :)
>=20
> Oh I did see that then forgot.
>=20
> It will write dec_expires - tb, then it will write 1 if it found irq_work
> was pending.

Ah you were actually asking about set_dec writing val - 1. I totally=20
missed that.

Yes that was an unintentional change. This is the way timer.c code works=20
with respect to the decrementers_next_tb value, so it's probably better=20
to make them so it seems like it should be okay (and better to bring the=20
KVM code up to match timer code rather than be different or the other
way around). The difference should be noted in the changelog though.

Thanks,
Nick
