Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A315549A7A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:56:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjY1v4MBRz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:56:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cHT6Nf7k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cHT6Nf7k; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjY1C3vXQz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 14:55:57 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id w190so11946829pfw.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 19:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=5fGf+wEao71yMjIiFUM3p35+yMYGzstWK7uCq2zvGxg=;
 b=cHT6Nf7kuHZXtb+YFoY0m8G5YJbR+iP2YZe3Krs+5XIyobwMeCnY/AN1Mzzb4TZo4u
 4ETRyjMWq8CT4LrdQPVj9HpsJDeDrrnNxKTmJ7z5XzHYXqq22osC/xedVVT+nkEAM4FY
 o2SbXq3xalo4k+sEQiO3ZELiSJFKq+VYHQg/+YlCBZ9TNBqBYX/QzuymWXsh06rVJ7bO
 DKBKdpTLMGA9CPYmFbzGuL4uVIvLxTIaAgoiS+NNPPsWkxl5pN4RHHes7SgxqFFbb4vE
 QWsn+eFSsyDvA2P8PYo0QjN/VipTAYOgQNO75SETpUbzpsqztS6h3wvvn8TRyqsY02+w
 ywWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5fGf+wEao71yMjIiFUM3p35+yMYGzstWK7uCq2zvGxg=;
 b=nObgkkMJjBpuEeRyvW5O/1/bIUHp8qAC8h63ZEZxIZsNx56MBAg0/ptaLlcOqvkinB
 /fomO96BCE/ppXyPVctc5mBJY/gMAbxHzhZxECvrpw7n7ellY7etDYasORIkOGQPT5OD
 xdre21rgTK1BRb1vnFLFtoLJbD+Q9HB6NC7Vk9YHbz6aGsVaXyWwRRiCDFaAwtCHKJxJ
 bbSIDiBEfGtZusHIhgy4rzTp5t2o/hqJUKtXG1b9y8T7aRbYOkhUAlnAk+tR422eFMXt
 UJ53Yt7EV5SwOu4QmZ/Zdbn3zQbFI1JeoP0KkRAQgE5/lkP6x/yUv0sBMNj1Qnd2WPcZ
 Tppg==
X-Gm-Message-State: AOAM531W5sEDLbUKlHN4bnFZXt85ir7UnOlrKcpwDkBeyBtzUEKTukFV
 ChxTR+QCrl8KrvK1yFxjz/A=
X-Google-Smtp-Source: ABdhPJwhjxoUC9ylJDYeOd3vfen1kcgZg8lcE0d7h6T6xUADjtIp2wFIEZt9+isIkEn76493aEtJqA==
X-Received: by 2002:a05:6a00:1501:b0:4ca:c3ab:b845 with SMTP id
 q1-20020a056a00150100b004cac3abb845mr1557270pfu.84.1643082954287; 
 Mon, 24 Jan 2022 19:55:54 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id a62sm17588999pfb.197.2022.01.24.19.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 19:55:53 -0800 (PST)
Date: Tue, 25 Jan 2022 13:55:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S PR: Disable SCV when running AIL is
 disabled
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220124102417.3741427-1-npiggin@gmail.com>
 <20220124102417.3741427-2-npiggin@gmail.com> <877daoeol4.fsf@linux.ibm.com>
In-Reply-To: <877daoeol4.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643082584.vw2965pwww.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of January 25, 2022 8:49 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> PR KVM does not support running with AIL enabled, and SCV does is not
>> supported with AIL disabled.
>>
>> Fix this by ensuring the SCV facility is disabled with FSCR while a
>> CPU can be running with AIL=3D0. PowerNV host supports disabling AIL on =
a
>> per-CPU basis, so SCV just needs to be disabled when a vCPU is run.
>>
>> The pSeries machine can only switch AIL on a system-wide basis, so it
>> must disable SCV support at boot if the configuration can potentially
>> run a PR KVM guest.
>>
>> SCV is not emulated for the PR guest at the moment, this just fixes the
>> host crashes.
>>
>> Alternatives considered and rejected:
>> - SCV support can not be disabled by PR KVM after boot, because it is
>>   advertised to userspace with HWCAP.
>> - AIL can not be disabled on a per-CPU basis. At least when running on
>>   pseries it is a per-LPAR setting.
>> - Support for real-mode SCV vectors will not be added because they are
>>   at 0x17000 so making such a large fixed head space causes immediate
>>   value limits to be exceeded, requiring a lot rework and more code.
>> - Disabling SCV for any PR KVM possible kernel will cause a slowdown
>>   when not using PR KVM.
>> - A boot time option to disable SCV to use PR KVM is user-hostile.
>> - System call instruction emulation for SCV facility unavailable
>>   instructions is too complex and old emulation code was subtly broken
>>   and removed.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/exceptions-64s.S |  4 ++++
>>  arch/powerpc/kernel/setup_64.c       | 15 +++++++++++++++
>>  arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
>>  3 files changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 55caeee37c08..b66dd6f775a4 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -809,6 +809,10 @@ __start_interrupts:
>>   * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
>>   * - Standard kernel environment is set up (stack, paca, etc)
>>   *
>> + * KVM:
>> + * These interrupts do not elevate HV 0->1, so HV is not involved. PR K=
VM
>> + * ensures that FSCR[SCV] is disabled whenever it has to force AIL off.
>> + *
>>   * Call convention:
>>   *
>>   * syscall register convention is in Documentation/powerpc/syscall64-ab=
i.rst
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_=
64.c
>> index be8577ac9397..ac52c69a3811 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -197,6 +197,21 @@ static void __init configure_exceptions(void)
>>
>>  	/* Under a PAPR hypervisor, we need hypercalls */
>>  	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
>> +		/*
>> +		 * PR KVM does not support AIL mode interrupts in the host, and
>> +		 * SCV system call interrupt vectors are only implemented for
>> +		 * AIL mode. Under pseries, AIL mode can only be enabled and
>> +		 * disabled system-wide so when PR KVM is loaded, all CPUs in
>> +		 * the host are set to AIL=3D0 mode. SCV can not be disabled
>> +		 * dynamically because the feature is advertised to host
>> +		 * userspace, so SCV support must not be enabled if PR KVM can
>> +		 * possibly be run.
>> +		 */
>> +		if (IS_ENABLED(CONFIG_KVM_BOOK3S_PR_POSSIBLE) && !radix_enabled()) {
>> +			init_task.thread.fscr &=3D ~FSCR_SCV;
>> +			cur_cpu_spec->cpu_user_features2 &=3D ~PPC_FEATURE2_SCV;
>> +		}
>> +
>=20
> "Under pseries, AIL mode can only be enabled and disabled system-wide so
>  when PR KVM is loaded, all CPUs in the host are set to AIL=3D0 mode."
>=20
> Loaded as in 'modprobe kvm_pr'?

In kvmppc_core_init_vm_pr(), so while there is a PR guest running in the=20
system.

> And host as in "nested host"
> surely. Unless I completely misunderstood the patch (likely).

Yes the PR KVM host. I didn't want to say nested because it runs in=20
supervisor mode so is basically no difference whether under a HV or
not so I'm not sure if that's the right term for PR KVM or could
confused with nested HV.

I will see if I can make it a bit clearer.

> Is there a way to make this less unexpected to users? Maybe a few words
> in the Kconfig entry for PR_POSSIBLE saying "if you enable this and run
> a Hash MMU guest, you lose SCV"?

That's not a bad idea, also if you run a PR guest under it you lose
AIL in the host which also slows down interrupts and system calls.

Thanks,
Nick

>=20
>>  		/* Enable AIL if possible */
>>  		if (!pseries_enable_reloc_on_exc()) {
>>  			init_task.thread.fscr &=3D ~FSCR_SCV;
>> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
>> index 34a801c3604a..4d1c84b94b77 100644
>> --- a/arch/powerpc/kvm/book3s_pr.c
>> +++ b/arch/powerpc/kvm/book3s_pr.c
>> @@ -140,9 +140,12 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcp=
u *vcpu, int cpu)
>>  #endif
>>
>>  	/* Disable AIL if supported */
>> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
>> -	    cpu_has_feature(CPU_FTR_ARCH_207S))
>> -		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
>> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> +		if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
>> +		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR=
_SCV))
>> +			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
>> +	}
>>
>>  	vcpu->cpu =3D smp_processor_id();
>>  #ifdef CONFIG_PPC_BOOK3S_32
>> @@ -175,9 +178,12 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu=
 *vcpu)
>>  	kvmppc_save_tm_pr(vcpu);
>>
>>  	/* Enable AIL if supported */
>> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
>> -	    cpu_has_feature(CPU_FTR_ARCH_207S))
>> -		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
>> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> +		if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
>> +		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR=
_SCV))
>> +			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
>> +	}
>>
>>  	vcpu->cpu =3D -1;
>>  }
>> @@ -1037,6 +1043,8 @@ static int kvmppc_handle_fac(struct kvm_vcpu *vcpu=
, ulong fac)
>>
>>  void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr)
>>  {
>> +	if (fscr & FSCR_SCV)
>> +		fscr &=3D ~FSCR_SCV; /* SCV must not be enabled */
>>  	if ((vcpu->arch.fscr & FSCR_TAR) && !(fscr & FSCR_TAR)) {
>>  		/* TAR got dropped, drop it in shadow too */
>>  		kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
>=20
