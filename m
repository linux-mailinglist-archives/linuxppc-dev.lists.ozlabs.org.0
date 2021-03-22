Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3134459D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:24:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3wFw5S6lz3000
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kHtWm9t/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kHtWm9t/; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3wFV6N9bz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 00:24:12 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id t18so8431208pjs.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Nu+NVbKpPKRL1OVq1SN53YDC13FQgrm7Fd6Q7r4UNgs=;
 b=kHtWm9t/l5O+7jXsszv5sj0MbD++/S9Qq8W5la7GyVVuBSb3ZUkwX8CinQI4ze8EsB
 6qw11GF5sAHOs2uNI+tyzrwTeA4zaK8IUhGFuIr2F4Th1jPbcbSsMni/2naDu9OA7tKv
 H78Gqi2fdoLxHCJ2xT9ILYLi32ryN9dE6PDf0fE3GqZtLSNJzbjZF6jVcnXVq92KCaEu
 VayFooqslPOWnWOjuFHdQYxjZvOYG7l8KlGPYOvf2kJhqsvrASHLwDNXTAzH0FJsAaG/
 mp29g9cAruTiYZ/aUwi7CMzSMhGFLwK7xPXGf1JhcMs3hmnYMZEaVPUieZ/Zvtv+xfz1
 ncNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Nu+NVbKpPKRL1OVq1SN53YDC13FQgrm7Fd6Q7r4UNgs=;
 b=XJ4o8XOtGhpjTOfO3blRJkXQuVyrPBIBZDnaRa8xti/2MnXTMOgZZMg4HBOJ4ViqXj
 n9RKwXks1Cb8urO5ZELyhmZ8UIsW62OBsKL+DUvPBPSTNXvR898Mvlt8crVu7WZNWeHk
 CYcCIYh6JyLvNJ+MgmTfjM7RRl9gvWnuB31KrOxkwKBZGuuysu01OZqBSvyVKucAqU8C
 0jBUdvnbxWT0ZTkgd40JqFSb/D3WPLf6uQvHlE5ekA5DnY3H22EJBGpHpj8ZaTCT/VQs
 anhIOMooZkk/7Adhxl5Uep4yW8BV7DTtGgrR39JS9F3iQhcrumazMb846J1Ng5zzgy1v
 tDhQ==
X-Gm-Message-State: AOAM530JcpC8oDCl4TrrKUQAG6PSXzGqJGQ0AmDzuMaDmd+tiStcFtzh
 /6ZHvMDiIg6c+Oc6/0o8RbU=
X-Google-Smtp-Source: ABdhPJxuwC3VK3puFXyX8g82bXnNKGDImeSMTVymEd0/pJiQnE0njHHZC9isB8Wq5myU+QACk+4STA==
X-Received: by 2002:a17:902:850b:b029:e6:bb9f:4bd9 with SMTP id
 bj11-20020a170902850bb02900e6bb9f4bd9mr27597143plb.41.1616419450370; 
 Mon, 22 Mar 2021 06:24:10 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id 4sm14601675pjl.51.2021.03.22.06.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:24:09 -0700 (PDT)
Date: Mon, 22 Mar 2021 23:24:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 20/41] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-21-npiggin@gmail.com>
 <21be26e7-d8c9-6681-d89d-4ffdf46d23f7@ozlabs.ru>
In-Reply-To: <21be26e7-d8c9-6681-d89d-4ffdf46d23f7@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616418940.ifn8pbued8.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of March 22, 2021 6:39 pm:
>=20
>=20
> On 06/03/2021 02:06, Nicholas Piggin wrote:
>> LPCR[HDICE]=3D0 suppresses hypervisor decrementer exceptions on some
>> processors, so it must be enabled before HDEC is set.
>=20
> Educating myself - is not it a processor bug when it does not suppress=20
> hdec exceptions with HDICE=3D0?

It seems to be contrary to the architecture if it does suppress them.
The HDEC exception is supposed to come into existence when the top bit
of HDEC SPR, regardless of HDICE AFAIKS.

Interrupt being taken in response to an exception existing is different.
The interrupt is suppressed when HDICE=3D0, which is also a requirement
of the architecture.

> Also, why do we want to enable interrupts before writing HDEC? Enabling=20
> it may cause an interrupt right away a

HDICE does not enable HDEC interrupts when HV=3D1 unless EE is 1.

In other words, HDEC interrupts are masked with EE just like DEC=20
interrupts when you are the hypervisor, but they ignore EE when the=20
guest is running (so guest can't delay them).

>=20
> Anyway whatever the answers are, this is not changed by this patch and=20
> the change makes sense so
>=20
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks,
Nick

>=20
>=20
>> Rather than set it in the host LPCR then setting HDEC, move the HDEC
>> update to after the guest MMU context (including LPCR) is loaded.
>> There shouldn't be much concern with delaying HDEC by some 10s or 100s
>> of nanoseconds by setting it a bit later.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
>>   1 file changed, 7 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 1f2ba8955c6a..ffde1917ab68 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3505,20 +3505,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_v=
cpu *vcpu, u64 time_limit,
>>   		host_dawrx1 =3D mfspr(SPRN_DAWRX1);
>>   	}
>>  =20
>> -	/*
>> -	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] =3D 0,
>> -	 * so set HDICE before writing HDEC.
>> -	 */
>> -	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>> -	isync();
>> -
>>   	hdec =3D time_limit - mftb();
>> -	if (hdec < 0) {
>> -		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>> -		isync();
>> +	if (hdec < 0)
>>   		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>> -	}
>> -	mtspr(SPRN_HDEC, hdec);
>>  =20
>>   	if (vc->tb_offset) {
>>   		u64 new_tb =3D mftb() + vc->tb_offset;
>> @@ -3564,6 +3553,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_v=
cpu *vcpu, u64 time_limit,
>>  =20
>>   	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>>  =20
>> +	/*
>> +	 * P9 suppresses the HDEC exception when LPCR[HDICE] =3D 0,
>> +	 * so set guest LPCR (with HDICE) before writing HDEC.
>> +	 */
>> +	mtspr(SPRN_HDEC, hdec);
>> +
>>   	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
>>   	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
>>  =20
>>=20
>=20
> --=20
> Alexey
>=20
