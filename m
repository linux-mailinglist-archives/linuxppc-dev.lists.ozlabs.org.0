Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26A3FB1F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 09:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyhrK6NN0z2yn9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 17:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UjwQrSKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UjwQrSKM; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyhqd4mvtz2xrK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:32:44 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so13215802pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=7EaoJNCvTLCNSER4RDqfxsecokh3j98I4eqk0OMigPc=;
 b=UjwQrSKM/l9RvBb1RRqaqvsDKY/RT1RWQaGbzj43kosAP6WhxN/USNSEgY11sMiHby
 kydIgnkvzmj6ouhs9Odqlv2R5qUML0cFC1aWh/Klxus9YLjhn30R28xNHaqqDFOTBBzp
 Y4QqFbvuC0akH/P/t9X1NsZjENYO6s8HL2jWsQ7na0ozpKagNFfROkIa9bKmEaaQO4Pv
 RBlmwoH3y4vvd5r5eubWzYgYRmmTTFes1dqVuk/xOEHtfLDxMYA3CgVpvdxIMIgQ4kil
 STMsy5lZ64mV3GgWm0gjFnDlgRfXJ4wtk/yfMckotRX+pNB+wOnJDXjnkfp1CurpSAj9
 AO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7EaoJNCvTLCNSER4RDqfxsecokh3j98I4eqk0OMigPc=;
 b=cEIGzwDfO8sdL2jXb33uHzDGUAR4gGIhB5TFO5TzRV8uqxgX8ZYzww++0RpKpTZMFs
 HE5kt+U4SFprStBVo/UYxcTfp6tRNMkFml4e98Is3MtcMwH+Q8izgPlt1cD83aFZCrSd
 vvNLOoLdwOjl+9monnN1Sz28ERWlWpzOx37PuOinnOnz/VAhZABKas/GZdCYB27LbS1A
 QDzRlUrtPTAq9awfHQpL6S7feWp9IqNPWuYPEf1yVUegPruARrFpxic3z+21Z0IjeRix
 LfwhtC1bDWXYoRsLf59FVDnlxkBw+jysi1KEY2pliEo1A6eqayS2E4LQzYcUjTjX3ugD
 Z0yg==
X-Gm-Message-State: AOAM533zLRjuMo5xfjJqIhSmP/Bee0f3uIUxZKpOHPbVESRNzZ9NhffC
 mfcCMO68IK23ZJHZyapN0/D+Q84LZU8=
X-Google-Smtp-Source: ABdhPJypwWXbV+35sG5Nzwcgx/otVdiP8vVoeLR3eIvbz4L/qaMUkyXLXrLOjB5IU6PN0pot2d2MMg==
X-Received: by 2002:a17:90a:680c:: with SMTP id
 p12mr25873624pjj.33.1630308761792; 
 Mon, 30 Aug 2021 00:32:41 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id k25sm13905970pfa.213.2021.08.30.00.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 00:32:41 -0700 (PDT)
Date: Mon, 30 Aug 2021 17:32:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] powerpc/64: handle MSR EE and RI in interrupt
 entry wrapper
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20210825123714.706201-1-npiggin@gmail.com>
 <20210825123714.706201-2-npiggin@gmail.com>
 <87mtp3e43c.fsf@linkitivity.dja.id.au>
In-Reply-To: <87mtp3e43c.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1630308035.lflq6532v1.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of August 27, 2021 5:31 pm:
> Hi,
>=20
>> Similarly to the system call change in the previous patch, the mtmsrd to
>=20
> I don't actually know what patch this was - I assume it's from a series
> that has since been applied?

Good catch yes that used to be in the same series. Now merged, it's=20
dd152f, I'll update the changelog.

>> enable RI can be combined with the mtmsrd to enable EE for interrupts
>> which enable the latter, which tends to be the important synchronous
>> interrupts (i.e., page faults).
>>
>> Do this by enabling EE and RI together at the beginning of the entry
>> wrapper if PACA_IRQ_HARD_DIS is clear, and just enabling RI if it is set
>> (which means something wanted EE=3D0).
>=20
>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 6b800d3e2681..e3228a911b35 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -148,9 +148,21 @@ static inline void interrupt_enter_prepare(struct p=
t_regs *regs, struct interrup
>>  #endif
>> =20
>>  #ifdef CONFIG_PPC64
>> -	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) =3D=3D IRQS_ENABLED)
>> +	bool trace_enable =3D false;
>> +
>> +	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
>> +		if (irq_soft_mask_set_return(IRQS_DISABLED) =3D=3D IRQS_ENABLED)
>=20
> In the previous code we had IRQS_ALL_DISABLED, now we just have
> IRQS_DISABLED. Is that intentional?

Hmm, no it should be IRQS_ALL_DISABLED. It doesn't matter much in
practice I think because MSR[EE] is disabled, but obviously shouldn't
be changed by this patch (and shouldn't be changed at all IMO having
ALL_DISABLED).

>=20
>> +			trace_enable =3D true;
>> +	} else {
>> +		irq_soft_mask_set(IRQS_DISABLED);
>> +	}
>> +	/* If the interrupt was taken with HARD_DIS set, don't enable MSR[EE] =
*/
>> +	if (local_paca->irq_happened & PACA_IRQ_HARD_DIS)
>> +		__hard_RI_enable();
>> +	else
>> +		__hard_irq_enable();
>> +	if (trace_enable)
>>  		trace_hardirqs_off();
>> -	local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
>> =20
>>  	if (user_mode(regs)) {
>>  		CT_WARN_ON(ct_state() !=3D CONTEXT_USER);
>=20
>=20
>> @@ -901,11 +892,6 @@ INT_DEFINE_BEGIN(system_reset)
>>  	IVEC=3D0x100
>>  	IAREA=3DPACA_EXNMI
>>  	IVIRT=3D0 /* no virt entry point */
>> -	/*
>> -	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
>> -	 * being used, so a nested NMI exception would corrupt it.
>> -	 */
>> -	ISET_RI=3D0
>>  	ISTACK=3D0
>>  	IKVM_REAL=3D1
>>  INT_DEFINE_END(system_reset)
>=20
>> @@ -986,8 +972,6 @@ EXC_COMMON_BEGIN(system_reset_common)
>=20
> Right before this change, there's a comment that reads:
>=20
> 	/*
> 	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
> 	 * to recover, but nested NMI will notice in_nmi and not recover
>     ...
>=20
> You've taken out the bit that enables MSR_RI, which means the comment is
> no longer accurate.

Ah yep, that should be okay because we moved the RI enable to the NMI=20
entry wrapper. Comment just needs a tweak.

>=20
> Beyond that, I'm still trying to follow all the various changes in code
> flows. It seems to make at least vague sense: we move the setting of
> MSR_RI from the early asm to interrupt*enter_prepare. I'm just
> struggling to convince myself that when we hit the underlying handler
> that the RI states all line up.

Thanks,
Nick
