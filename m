Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94585326A93
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 01:00:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRVk4bHVz3d6f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 11:00:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YXHe0DQn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YXHe0DQn; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRVG4vqpz30Pg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 11:00:06 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id z7so6125988plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 16:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=q02clYmBzkhA5KqgdXouRwP+oXWTfl58JTIK8ZTCmTY=;
 b=YXHe0DQn4b6+dqgikiXwYRMKXIV1X+48BP/H/CaXof+vJvD/amZ5QS6A98n+ta0lYy
 7kcyZONlhBJYCjHJPBs7tH/lZHx+gbaeYloCx3JA9h6h31AsGu8MmynY446IabBan1CK
 EQPXahRCRQ4aipd5iwbw1hkBbgSR4ymONQ1+qa5xhJloTYkFs+44VMs83Ny4DLWOhJfc
 p0WNMZNwn9P48ckU+icl3dR5FU1Soo6/J3kS10SOdSS0D24ZnxcQT7h42NtLSGmp0qJR
 RZ7l15YV8Ybq/1e89GRD/xHgTGrxVltuuCNVlYxBaELUXfysMYaHdyuCLdRX5pTKiTfy
 PCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=q02clYmBzkhA5KqgdXouRwP+oXWTfl58JTIK8ZTCmTY=;
 b=dyv759tsbjD3rufNCl+Tu0hkANR3JqoPrwpdldyKPtOJaT7vDDU4PcngT5FgA1Li2f
 bEdUiOUnIcxG6wmGrbFSX977qcht4Sdr1J4Xx5i1vJF+m/3oQYyfid808hwKEYgTlfiG
 WagYzNErK2o5NUhi4MiA0g/ZVzcIU8SG4OLIYAgp0V5j3MWLkDLQDFUrgFqDJTrXK4y6
 9L2LL0V8ALD1wTPP5w83kgU7V66ldYCy9g0imxukagLsM2pW9vab4p3l8FdfxQjiknLl
 zhD1uUbDx7Mvx+6E7KIQhd8BdEVy8FCh2CpqCMZtkJuwoe1HEePZuIDLkTpPcs7yo26C
 Rhvw==
X-Gm-Message-State: AOAM530SkZ4JWPbgnIbYCSWom4TVtnbOIP/yqLCFK5h+dga0QWjb9UqI
 RZOpGQapusWbWMfBUXw9Plk=
X-Google-Smtp-Source: ABdhPJzd713AUpA/1Snjwu12meI0pB6TlIXc+LXz9tfvjOqxFXD/6jF06ddyvunz+QQrm+07XdeQFA==
X-Received: by 2002:a17:90a:8901:: with SMTP id
 u1mr5689828pjn.21.1614384002713; 
 Fri, 26 Feb 2021 16:00:02 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id gm13sm9940265pjb.47.2021.02.26.16.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:00:02 -0800 (PST)
Date: Sat, 27 Feb 2021 09:59:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/37] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-18-npiggin@gmail.com> <8735xiyebs.fsf@linux.ibm.com>
In-Reply-To: <8735xiyebs.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614383980.ftu5gtbvbm.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of February 27, 2021 2:38 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> LPCR[HDICE]=3D0 suppresses hypervisor decrementer exceptions on some
>> processors, so it must be enabled before HDEC is set.
>>
>> Rather than set it in the host LPCR then setting HDEC, move the HDEC
>> update to after the guest MMU context (including LPCR) is loaded.
>> There shouldn't be much concern with delaying HDEC by some 10s or 100s
>> of nanoseconds by setting it a bit later.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++--------------
>>  1 file changed, 10 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index d4770b222d7e..63cc92c45c5d 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3490,23 +3490,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_=
vcpu *vcpu, u64 time_limit,
>>  		host_dawrx1 =3D mfspr(SPRN_DAWRX1);
>>  	}
>>
>> -	/*
>> -	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] =3D 0,
>> -	 * so set HDICE before writing HDEC.
>> -	 */
>> -	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>> -	isync();
>> -
>> -	hdec =3D time_limit - mftb();
>=20
> Would it be possible to leave the mftb() in this patch and then replace
> them all at once in patch 20/37 - "KVM: PPC: Book3S HV P9: Reduce mftb
> per guest entry/exit"?

I suppose that makes sense. I'll see how that looks.

Thanks,
Nick
