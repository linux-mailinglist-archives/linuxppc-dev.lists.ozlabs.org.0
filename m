Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C308346EE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4rQn4WLzz30L4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RgFXgZDP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RgFXgZDP; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4rQK4p15z301B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:35:03 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id u19so13547669pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 18:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2Esp6d9qJMuOjUmKYgGj6kVKFLxI1yLM0VLvKW/6jTo=;
 b=RgFXgZDPWXDd162vmCVB+rkePQayzeoHj4DoEkOAShQhrMkc3AIsH4j0tegvfg55Q2
 3qE3/oex7CeR1lRpKlr/wpe9afxT2IPc2n6uRRtIGXb7f4sYAfraEkDq52yau2lI8XxI
 OTFPEQwhuJpHS5Ho7yrioaZtvH62Ed48NWmVfiI9zkt1NqjIKRxyCOta6if6svESjrN1
 iKGDvLG1VhjpLJ9/oG9FML8h/0ISt3RteykmLSAGLnPQEGhYxX6fqSAivr/MqRYH7aUx
 mlJMVj+l/nZNar1NP+Aebnk8WM3Rfsh2Lgb6vzPj3rOYgj0US4tVHpMYuqwgcesQrvul
 qjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2Esp6d9qJMuOjUmKYgGj6kVKFLxI1yLM0VLvKW/6jTo=;
 b=lRtkwySNljFwwgklvCEKfRPM52QbODivwstfnoEggMbPua9crL8+jrkRwaKwJYLGid
 sCQ8wHN/MQ6Nh4ds83ur1ny/VAzjiYM6vtYTtUhItJYPRo9L8cZjMN3VjSFyQGJk+mV4
 EFl9IRPmQWjg90NMXSPi3vtWukGG4mWNd8EAxN6FpPChoF22nf508Jvp2FqQ6RTuAq2R
 WtEkb96fAIZKbzQP7ua0hsQI3TRh/t012Dfbnpzz4WliDQaTOjEsB3FxrYNV56+EqUcw
 tnWZXRILv8miwCG3SRm3Nf/UucMOMoAhb74KjfG51IhNmmkX902hKIM591JUzt11rqwR
 R4Ag==
X-Gm-Message-State: AOAM530dT7FAt3+rtBfrzFZwZi5+02tV1v6cRO8EC98gOhsUwaE7Q1NU
 fTpDD96uBNSSIasvsx1ucVI=
X-Google-Smtp-Source: ABdhPJx2+SzcdmpzPYGk5x1oUCWIBBJ+/x+AV+tqcF8TyXqNmywur28Opjzjq1KMs92ok0kzzsyPhA==
X-Received: by 2002:a62:a108:0:b029:1c1:119b:8713 with SMTP id
 b8-20020a62a1080000b02901c1119b8713mr861259pff.74.1616549699978; 
 Tue, 23 Mar 2021 18:34:59 -0700 (PDT)
Received: from localhost (193-116-197-97.tpgi.com.au. [193.116.197.97])
 by smtp.gmail.com with ESMTPSA id 9sm370057pgy.79.2021.03.23.18.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:34:59 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:34:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 44/46] KVM: PPC: Book3S HV P9: implement hash guest
 support
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-45-npiggin@gmail.com> <87tup1kgtb.fsf@linux.ibm.com>
In-Reply-To: <87tup1kgtb.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616549242.r712wrhm08.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of March 24, 2021 1:53 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Guest entry/exit has to restore and save/clear the SLB, plus several
>> other bits to accommodate hash guests in the P9 path.
>>
>> Radix host, hash guest support is removed from the P7/8 path.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> <snip>
>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/b=
ook3s_hv_interrupt.c
>> index cd84d2c37632..03fbfef708a8 100644
>> --- a/arch/powerpc/kvm/book3s_hv_interrupt.c
>> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
>> @@ -55,6 +55,50 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, =
struct kvmhv_tb_accumulator
>>  #define accumulate_time(vcpu, next) do {} while (0)
>>  #endif
>>
>> +static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
>> +{
>> +	asm volatile("slbmfev  %0,%1" : "=3Dr" (*slbev) : "r" (idx));
>> +	asm volatile("slbmfee  %0,%1" : "=3Dr" (*slbee) : "r" (idx));
>> +}
>> +
>> +static inline void __mtslb(u64 slbee, u64 slbev)
>> +{
>> +	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
>> +}
>> +
>> +static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
>> +{
>> +	BUG_ON((slbee & 0xfff) !=3D idx);
>> +
>> +	__mtslb(slbee, slbev);
>> +}
>> +
>> +static inline void slb_invalidate(unsigned int ih)
>> +{
>> +	asm volatile("slbia %0" :: "i"(ih));
>> +}
>=20
> Fyi, in my environment the assembler complains:
>=20
> {standard input}: Assembler messages:                                   =20
> {standard input}:1293: Error: junk at end of line: `6'                   =
         =20
> {standard input}:2138: Error: junk at end of line: `6'                   =
=20
> make[3]: *** [../scripts/Makefile.build:271:
> arch/powerpc/kvm/book3s_hv_interrupt.o] Error 1
>=20
> This works:
>=20
> -       asm volatile("slbia %0" :: "i"(ih));
> +       asm volatile(PPC_SLBIA(%0) :: "i"(ih));
>=20
> But I don't know what is going on.

Ah yes, we still need to use PPC_SLBIA. IH parameter to slbia was only=20
added in binutils 2.27 and we support down to 2.23.

Thanks for the fix I'll add it.

Thanks,
Nick
