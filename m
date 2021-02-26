Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A03326A8D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 00:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRSG0d8xz3clS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 10:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NvJm3piA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NvJm3piA; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRRq61w4z30QK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 10:57:59 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id m6so7327736pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/lBA1zv1UxWht2v/wCXkQiJ6c7hVo8hO0x5Rs6OSvsM=;
 b=NvJm3piAhGuOWdSfCOfGUxO6u1hhyfDyIwvCkkrA1JI4kHC/GCg7mmVeshkXt54Kun
 QIDcnUJqhJCanvE6eGJsuMQJuwYIUEZiju5Srw3rsAY/d/BOTxYDBq6DYJ0Vj1uUNqIq
 F4DsJC4Dl7DtHEmeMjlCMXyc0600VNq5lnCBULUXdnNYzQNin4U/Iym3a+8vjfyECalJ
 784WOoS+TIkzBbMchzbE4eWhic8o4kIT5E9kFuxt25DmZKUw1xYL4XEsPzX37qZOxA48
 c0gCh4WszJ6Q2G+wRgzgdrOFJtv6As+YnNvHvIHGgVpRYgkRgIToJmxVYuqPN3sD47Uv
 N1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/lBA1zv1UxWht2v/wCXkQiJ6c7hVo8hO0x5Rs6OSvsM=;
 b=JpuqIPfXyE0I9VMK2+1xLZ5nHvZFeubxsA/nMgmHxJueh996kjZCzwNiJ0nj1WSJRZ
 6QzzVSFFxiYyr3vat8NZMingaRzlukHdRGk+hJx/rnl7Awa/yTDkP2Uw3+IPIb31SF/+
 RijZtE6nK4JnMlrwRqqMUHDaUmhZywm06VF9QjiN6QEZLHUwnUMm4ajBp3jMKTOVMRP9
 mHtWjXCppVoZWMNsi0arO1iNgS8j2QbwNe0E92aMDPDiUVBLNcmZdyKvyLx6D+yGYGnO
 geCAstXwGTmDps3iT13xoJ5SfyMzaa5Na/gLqUh8YY1qlgctWDKHpGrniSiWqyr0e8QP
 crAQ==
X-Gm-Message-State: AOAM532hJXahZF4Vdc79ggxvvFwJ1chfWFnHVSwfnGPxwM+BV+2nAuVT
 INuw4svBV13sHu6LFyo/H2SfPRlCjDw=
X-Google-Smtp-Source: ABdhPJy9pXwMwEsAUxRwLUQ4JH23P/bZdSEvd9XcJd1Wiq9J2koErQpxZOqgGkoe96yz1qXs3fGvqA==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr4875531pgr.127.1614383876506; 
 Fri, 26 Feb 2021 15:57:56 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id h123sm8570082pfe.115.2021.02.26.15.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 15:57:56 -0800 (PST)
Date: Sat, 27 Feb 2021 09:57:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 13/37] KVM: PPC: Book3S HV P9: Move radix MMU switching
 instructions together
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-14-npiggin@gmail.com> <875z2eyg9r.fsf@linux.ibm.com>
In-Reply-To: <875z2eyg9r.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614383766.p50pfrro5l.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of February 27, 2021 1:56 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Switching the MMU from radix<->radix mode is tricky particularly as the
>> MMU can remain enabled and requires a certain sequence of SPR updates.
>> Move these together into their own functions.
>>
>> This also includes the radix TLB check / flush because it's tied in to
>> MMU switching due to tlbiel getting LPID from LPIDR.
>>
>> (XXX: isync / hwsync synchronisation TBD)
>=20
> I see bot mtlpidr and mtlpcr requiring a CSI in the ISA. Do you say we
> might need more than an isync?

We might need a CSI before it, we might also need a hwsync before it. I
don't know whether we need isyncs between any of them (I don't think we
should because they're all mtsprs).


>=20
> Regardless, I'd expect that to be separate from the refactoring here,
> so:
>=20
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

Thanks,
Nick
>=20
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 55 +++++++++++++++++++++---------------
>>  1 file changed, 32 insertions(+), 23 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 895090636295..23d6dc04b0e9 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3440,12 +3440,38 @@ static noinline void kvmppc_run_core(struct kvmp=
pc_vcore *vc)
>>  	trace_kvmppc_run_core(vc, 1);
>>  }
>>
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
>>  /*
>>   * Load up hypervisor-mode registers on P9.
>>   */
>>  static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_li=
mit,
>>  				     unsigned long lpcr)
>>  {
>> +	struct kvm *kvm =3D vcpu->kvm;
>>  	struct kvmppc_vcore *vc =3D vcpu->arch.vcore;
>>  	s64 hdec;
>>  	u64 tb, purr, spurr;
>> @@ -3468,12 +3494,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_=
vcpu *vcpu, u64 time_limit,
>>  	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] =3D 0,
>>  	 * so set HDICE before writing HDEC.
>>  	 */
>> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
>> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>>  	isync();
>>
>>  	hdec =3D time_limit - mftb();
>>  	if (hdec < 0) {
>> -		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
>> +		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>>  		isync();
>>  		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>>  	}
>> @@ -3508,7 +3534,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>  	}
>>  	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
>>  	mtspr(SPRN_IC, vcpu->arch.ic);
>> -	mtspr(SPRN_PID, vcpu->arch.pid);
>>
>>  	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
>>  	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
>> @@ -3522,8 +3547,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>
>>  	mtspr(SPRN_AMOR, ~0UL);
>>
>> -	mtspr(SPRN_LPCR, lpcr);
>> -	isync();
>> +	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>>
>>  	kvmppc_xive_push_vcpu(vcpu);
>>
>> @@ -3562,7 +3586,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>  		mtspr(SPRN_DAWR1, host_dawr1);
>>  		mtspr(SPRN_DAWRX1, host_dawrx1);
>>  	}
>> -	mtspr(SPRN_PID, host_pidr);
>>
>>  	/*
>>  	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
>> @@ -3577,9 +3600,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>  	if (cpu_has_feature(CPU_FTR_ARCH_31))
>>  		asm volatile(PPC_CP_ABORT);
>>
>> -	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
>> -	isync();
>> -
>>  	vc->dpdes =3D mfspr(SPRN_DPDES);
>>  	vc->vtb =3D mfspr(SPRN_VTB);
>>  	mtspr(SPRN_DPDES, 0);
>> @@ -3596,7 +3616,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vc=
pu *vcpu, u64 time_limit,
>>  	}
>>
>>  	mtspr(SPRN_HDEC, 0x7fffffff);
>> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
>> +
>> +	switch_mmu_to_host_radix(kvm, host_pidr);
>>
>>  	return trap;
>>  }
>> @@ -4130,7 +4151,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u=
64 time_limit,
>>  {
>>  	struct kvm_run *run =3D vcpu->run;
>>  	int trap, r, pcpu;
>> -	int srcu_idx, lpid;
>> +	int srcu_idx;
>>  	struct kvmppc_vcore *vc;
>>  	struct kvm *kvm =3D vcpu->kvm;
>>  	struct kvm_nested_guest *nested =3D vcpu->arch.nested;
>> @@ -4204,13 +4225,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
>>  	vc->vcore_state =3D VCORE_RUNNING;
>>  	trace_kvmppc_run_core(vc, 0);
>>
>> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> -		lpid =3D nested ? nested->shadow_lpid : kvm->arch.lpid;
>> -		mtspr(SPRN_LPID, lpid);
>> -		isync();
>> -		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
>> -	}
>> -
>>  	guest_enter_irqoff();
>>
>>  	srcu_idx =3D srcu_read_lock(&kvm->srcu);
>> @@ -4229,11 +4243,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
>>
>>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>>
>> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> -		mtspr(SPRN_LPID, kvm->arch.host_lpid);
>> -		isync();
>> -	}
>> -
>>  	set_irq_happened(trap);
>>
>>  	kvmppc_set_host_core(pcpu);
>=20
