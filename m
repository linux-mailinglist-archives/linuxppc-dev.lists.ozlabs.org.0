Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DE343883
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 06:25:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3jdV5S4Qz30FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:25:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Sl+CNKST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sl+CNKST; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3jd431jqz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:25:27 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id h3so10161421pfr.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=uzY4tCy3Un1NIoZPHMY+DUR/9H0qjepbar7BMyM+Hfk=;
 b=Sl+CNKST/gVJrIcZWSgxzJO2Ve2wQhSGXJ7ilQdD9as3pFz5Adh57SY5j3pGRB/Rl8
 F0xZ5e8/1ZUOQnUBP0tK18NpOrL05bDgX1yk7/UOc0Xf/6GbJ/BShV4H794GLsxDwzd3
 mf4tgOMiz+04jDJ6M5ykA+JRGuoL0SEcwCMzrMOs6ymZXJePV9u89BytUV26xP1Egk/B
 4PKQGFuP/auOgxFiWrZ8PLa1Mg/wLvUMvdl32Co7sVcggN9gYb4ucGzwak910fFrdbrp
 0WE9SrtymY5DfUzEsXg0U/93zUdPLCxgKLCZKPYteDGXoSUEliklgWOQcnFPzCg25mLt
 /8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uzY4tCy3Un1NIoZPHMY+DUR/9H0qjepbar7BMyM+Hfk=;
 b=FbhTPUog7JDc0YT+PBxw7tMSnrcgcNm2Au+2ZG73ITt9sZ40A4oMDgu7Vd0/pAM60Q
 U++Hmfk8qdM7461k2L+qTDi5XzQxnrdL1lMaVa/KbZmwGwpjVvR7qn3hAcFXpytPxKIs
 wr97vY+lk26rFgkN2SqtXHPdQPaoHbpOahyrAuBkBj/u/o7p+WvvpyXTjaYk/bTQZ0CB
 7/voTyfKKF50uCvgtjzy9lVsv8YlBVZBhR/V6KxjqzV0137E//ycPkhaBCosRCITQIaM
 X/fatmJN9nf7X6ltFNaJyCdqfT9q14aHtBgVaHqZKEqJ+gcIZr3xAaTMVzQn6mp0iDFD
 KotA==
X-Gm-Message-State: AOAM5326dVpRBFqCeLRbihQ7gIjFm68vh/B7C4KNUTw4SuhhYVTMYbdz
 WPaZwmgJG1JIK8TCxjnDdw4=
X-Google-Smtp-Source: ABdhPJyLkBHE/57ffHb/uzPVCcTsai1Lv4Q+uhnOcc/pOAS2Y77J73U0QHMzCox0TNeodlw1/VAVmg==
X-Received: by 2002:a63:cc:: with SMTP id 195mr13417643pga.282.1616390723632; 
 Sun, 21 Mar 2021 22:25:23 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id d6sm11415177pfn.197.2021.03.21.22.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 22:25:22 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:25:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 16/41] KVM: PPC: Book3S HV P9: Move radix MMU switching
 instructions together
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-17-npiggin@gmail.com>
 <47284fdd-51ef-5ba7-487b-dfb46ec2816e@ozlabs.ru>
In-Reply-To: <47284fdd-51ef-5ba7-487b-dfb46ec2816e@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616390221.1zx2axnuhk.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of March 22, 2021 2:24 pm:
>=20
>=20
> On 06/03/2021 02:06, Nicholas Piggin wrote:
>> Switching the MMU from radix<->radix mode is tricky particularly as the
>> MMU can remain enabled and requires a certain sequence of SPR updates.
>> Move these together into their own functions.
>>=20
>> This also includes the radix TLB check / flush because it's tied in to
>> MMU switching due to tlbiel getting LPID from LPIDR.
>>=20
>> (XXX: isync / hwsync synchronisation TBD)
>=20
>=20
> Looks alright but what is this comment about? Is something missing or=20
> just sub optimal?

Ah, yeah the architecture says for example a CSI is required before +=20
after each, but the fine print is that you only need those to separate=20
between previous or subsequent accesses that may use those contexts
being switched from/to.

Then there is the question of CSI between the instructions so e.g., you=20
don't get the TLB prefetch bug if the mtPIDR could go out of order ahead
of the mtLPIDR, but those instructions are serialized so they wouldn't.

There's possibly a few clarifications coming to the architecture around=20
this as well.

I think things are relatively okay but probably need a bit more=20
commenting to justify where the isyncs() aren't. It's possible we might=20
be able to even remove the isyncs that are there.

Making a like-for-like conversion is a bit tricky because there are
possible context synchronising instructions between them already.

Maybe for the first series, I'll just put an isync between all of them,
and then a later patch can replace some of them with comments.

>=20
>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>=20
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 55 +++++++++++++++++++++---------------
>>   1 file changed, 32 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index f1230f9d98ba..b9cae42b9cd5 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3449,12 +3449,38 @@ static noinline void kvmppc_run_core(struct kvmp=
pc_vcore *vc)
>>   	trace_kvmppc_run_core(vc, 1);
>>   }
>>  =20
>> +static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu =
*vcpu, u64 lpcr)
>> +{
>> +	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>> +	struct kvm_nested_guest *nested =3D vcpu->arch.nested;
>> +	u32 lpid;
>> +
>> +	lpid =3D nested ? nested->shadow_lpid : kvm->arch.lpid;
>> +
>> +	mtspr(SPRN_LPID, lpid);
>> +	mtspr(SPRN_LPCR, lpcr);
>> +	mtspr(SPRN_PID, vcpu->arch.pid);
>> +	isync();
>> +
>> +	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
>> +	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
>> +}
>> +
>> +static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
>> +{
>> +	mtspr(SPRN_PID, pid);
>> +	mtspr(SPRN_LPID, kvm->arch.host_lpid);
>> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>> +	isync();
>> +}
>> +
>>   /*
>>    * Load up hypervisor-mode registers on P9.
>>    */
>>   static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_l=
imit,
>>   				     unsigned long lpcr)
>>   {
>> +	struct kvm *kvm =3D vcpu->kvm;
>>   	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>>   	s64 hdec;
>>   	u64 tb, purr, spurr;
>> @@ -3477,12 +3503,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_=
vcpu *vcpu, u64 time_limit,
>>   	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] =3D 0,
>>   	 * so set HDICE before writing HDEC.
>>   	 */
>> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
>> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>>   	isync();
>>  =20
>>   	hdec =3D time_limit - mftb();
>>   	if (hdec < 0) {
>> -		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
>> +		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>>   		isync();
>>   		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>>   	}
>> @@ -3517,7 +3543,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>   	}
>>   	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
>>   	mtspr(SPRN_IC, vcpu->arch.ic);
>> -	mtspr(SPRN_PID, vcpu->arch.pid);
>>  =20
>>   	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
>>   	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG))=
;
>> @@ -3531,8 +3556,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>  =20
>>   	mtspr(SPRN_AMOR, ~0UL);
>>  =20
>> -	mtspr(SPRN_LPCR, lpcr);
>> -	isync();
>> +	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>>  =20
>>   	kvmppc_xive_push_vcpu(vcpu);
>>  =20
>> @@ -3571,7 +3595,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>   		mtspr(SPRN_DAWR1, host_dawr1);
>>   		mtspr(SPRN_DAWRX1, host_dawrx1);
>>   	}
>> -	mtspr(SPRN_PID, host_pidr);
>>  =20
>>   	/*
>>   	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
>> @@ -3586,9 +3609,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>   	if (cpu_has_feature(CPU_FTR_ARCH_31))
>>   		asm volatile(PPC_CP_ABORT);
>>  =20
>> -	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
>> -	isync();
>> -
>>   	vc->dpdes =3D mfspr(SPRN_DPDES);
>>   	vc->vtb =3D mfspr(SPRN_VTB);
>>   	mtspr(SPRN_DPDES, 0);
>> @@ -3605,7 +3625,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>   	}
>>  =20
>>   	mtspr(SPRN_HDEC, 0x7fffffff);
>> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
>> +
>> +	switch_mmu_to_host_radix(kvm, host_pidr);
>>  =20
>>   	return trap;
>>   }
>> @@ -4138,7 +4159,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u=
64 time_limit,
>>   {
>>   	struct kvm_run *run =3D vcpu->run;
>>   	int trap, r, pcpu;
>> -	int srcu_idx, lpid;
>> +	int srcu_idx;
>>   	struct kvmppc_vcore *vc;
>>   	struct kvm *kvm =3D vcpu->kvm;
>>   	struct kvm_nested_guest *nested =3D vcpu->arch.nested;
>> @@ -4212,13 +4233,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
>>   	vc->vcore_state =3D VCORE_RUNNING;
>>   	trace_kvmppc_run_core(vc, 0);
>>  =20
>> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>=20
>=20
> The new location of mtspr(SPRN_LPID, lpid) does not check for=20
> CPU_FTR_HVMODE anymore, is this going to work with HV KVM on pseries?=20

Yes, these are moved to HVMODE specific code now.

Thanks,
Nick
