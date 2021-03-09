Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E27331C28
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:14:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvcgj5tCYz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 12:14:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lVlZGRiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lVlZGRiD; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvcgJ3z8Cz30M3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 12:14:19 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so257453pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 17:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Wc0SoZywmjWAT/jdH96VBXqz2eHZ3d2LDSWvCfsp7KI=;
 b=lVlZGRiDtrreiTrpulUlFzHDBD44hlOS5m7kKSj1EOBxt4YwtgB8egJRoulC2O/GWt
 L8H3kVHTbdsQakgLEcLyQRwznd3fLm8iYGY7yjy9C1h14PZF/v1FJN4+LicVM2x8qRQ5
 NnZ3YH0wtPlw9g0EcZtWwtyAEx2sWMW63s5ZXAfK0j9F/HtAGXUpBwUVasV329+N7UJD
 IXDttzjxLz+i3OIDcDRn0KAqE2PvsckAkIOlsrTjv0BfNIV/GnrYKmXtg2m6Im3/1UXh
 GKcuHHxL1ElwmEuyv/CBoVMLuuHg/YvJJTg7YRXQ38kmcd+oq/P+9TenanI+CFgszm6r
 IPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Wc0SoZywmjWAT/jdH96VBXqz2eHZ3d2LDSWvCfsp7KI=;
 b=SGoHHnjGf/NcM3JLEiRgcU2dcHx0FuaLTupbdxNGgNoCEVKQuG5+BQkGVDptyBC6Hx
 EswAY/ogpkSgkXS3CsVugqsh3pcmtZO25fqD42K/wTeWq7sKNVdeo4E6nE+QEua1ECYa
 o1S5bAIMzOf6RnA18xKVhFlE9nxUuQR1tPRaqe46/tE56pAl7D7dn4C2VZ823WrO2+MW
 3mbJf3Pcn3ls42I3AAY7/Zs0xm2ZH0aWJWahs6tL/WsN3tJLQtR5tofsIaZhxfU5WJvS
 T/goiF5VTA3ospOXEOaZseF2Z6WySaMPKUThEDPKVW2gZqoGjiFsvkIVo3H5zV3a2qIs
 SRsQ==
X-Gm-Message-State: AOAM531BHpQnT7nFDOkQBEfHIaBgYXkD6mQm3q4lDhWbjcDP7KFLEyUR
 UT/4diW5APYfAIC8JtBT3k8AKESi6z0=
X-Google-Smtp-Source: ABdhPJyNGwWrJqaWLl7md/K1BaW8e6HFy1xr9TJcgKTn4BDYGt5KtcYs/8Jo4eenqJx6NHtzo+kxRQ==
X-Received: by 2002:a17:90a:ae14:: with SMTP id
 t20mr1799958pjq.90.1615252456120; 
 Mon, 08 Mar 2021 17:14:16 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id jt21sm497062pjb.51.2021.03.08.17.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 17:14:15 -0800 (PST)
Date: Tue, 09 Mar 2021 11:14:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 02/41] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-3-npiggin@gmail.com> <878s6xmyv4.fsf@linux.ibm.com>
In-Reply-To: <878s6xmyv4.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1615252361.wjh446wma8.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 9, 2021 1:47 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This bit only applies to hash partitions.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c        | 6 ++++--
>>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index c40eeb20be39..2e29b96ef775 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1666,10 +1666,12 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcp=
u, u64 new_lpcr,
>>
>>  	/*
>>  	 * Userspace can only modify DPFD (default prefetch depth),
>> -	 * ILE (interrupt little-endian) and TC (translation control).
>> +	 * ILE (interrupt little-endian) and TC (translation control) if HPT.
>>  	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt =
loc.).
>>  	 */
>> -	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC;
>> +	mask =3D LPCR_DPFD | LPCR_ILE;
>> +	if (!kvm_is_radix(kvm))
>> +		mask |=3D LPCR_TC;
>=20
> I think in theory there is a possibility that userspace sets the LPCR
> while we running Radix and then calls the KVM_PPC_CONFIGURE_V3_MMU ioctl
> right after to switch to HPT. I'm not sure if that would make sense but
> maybe it's something to consider...

Oh actually it is an issue for the later AIL patch I think.

So LPCR will have to be filtered again when switching MMU mode.

Good catch, I'll add something for that.

Thanks,
Nick

>=20
>>  	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>>  		mask |=3D LPCR_AIL;
>>  		/* LPCR[AIL]=3D1/2 is disallowed */
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book=
3s_hv_nested.c
>> index b496079e02f7..0e6cf650cbfe 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -141,7 +141,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, =
struct hv_guest_state *hr)
>>  	 * Don't let L1 change LPCR bits for the L2 except these:
>>  	 * Keep this in sync with kvmppc_set_lpcr.
>>  	 */
>> -	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_LD | LPCR_LPES | LPCR_M=
ER;
>> +	mask =3D LPCR_DPFD | LPCR_ILE | LPCR_LD | LPCR_LPES | LPCR_MER;
>>  	/* LPCR[AIL]=3D1/2 is disallowed */
>>  	if ((hr->lpcr & LPCR_AIL) && (hr->lpcr & LPCR_AIL) !=3D LPCR_AIL_3)
>>  		hr->lpcr &=3D ~LPCR_AIL;
>=20
