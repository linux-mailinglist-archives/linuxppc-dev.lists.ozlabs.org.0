Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9E352728
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 09:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBXWY6tQ9z3c5f
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 18:59:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y23F1TKh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y23F1TKh; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBXW630fHz2xg0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 18:58:55 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id j34so1123809pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Apr 2021 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=sfUDlv8TEQnF3amIZaOhfr8OZHMQatLPnT5rxdWjzBc=;
 b=Y23F1TKh7dp+PAE6XKkg16MXTveoGkkuYUsut5V9rZww74JgCkEsxUmMmTFlCb1hJR
 y5xCT6wc1/U42m66eWz6/kOzgCQD53m1BBWemhg4+n6/CPGjhwSYi1+/Y8p6NeUt9TCD
 4tRQBLXj3D2ZhADGWLs6aSNTiCUYiZ4ZcFgNnJSUpE4vAVuXQD2+ABUCaQ5E2hyWGNCy
 PArjfr+edgIhtmjMd8q2tBJZ6S/1DWivcbsG99XdLko7VxfFgnbyX4pkK/vOph66vU1a
 5lU1Pkg4bzhDZj7ONgSW4mQerUSw6JEAw182oYA7n/jnwNg+Lqzoc9FiLzdUXt6ncFej
 2oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=sfUDlv8TEQnF3amIZaOhfr8OZHMQatLPnT5rxdWjzBc=;
 b=kLYrVXefe9BYj8NXcVr+wpdNGsAA8eCnh1WXl9ZZiUof4gUioz0Qi6Q15V0WuavEj+
 lsRJIBjUYT4VifnmbMXD7dEs7yL9nmWqgjOWbwdbFawr/uNSCs30vYHV4kV+CLXYJLfG
 WDDyUvVD286RLgXFvNv/onj1l+P8BetVF1FNFjYC7aE7/7U4cgXJdbxTaB8KUF6e0c0e
 J6mmnvl64K9BKJR6QaFtfCQVULsu+jUouY1aVJTyQooessrtJJJwMYpnadebGFzNcDFf
 +XXpVyJKpts/b6VJKl5PuAVJSS5XNO9gKmZEYXvwonXv6QKs3a2DSRSVN6p1Qi62Ij93
 et1w==
X-Gm-Message-State: AOAM531N+NmSm1xnGGQJqOZwJ2Y93AIU7emKFBKOfsyk+Yq8Qecw4x4d
 kmMrTyoPPu/Zq5FJQ+b4KG+defic+52iPg==
X-Google-Smtp-Source: ABdhPJzGhgP4bm0tz6t7hZbQsJMcnu9F82fr/ZnSkjuI0PQcfpH7mrHpXrg+IehMW3y0uBxNL/919A==
X-Received: by 2002:a63:4084:: with SMTP id n126mr10776902pga.80.1617350333941; 
 Fri, 02 Apr 2021 00:58:53 -0700 (PDT)
Received: from localhost ([1.128.195.20])
 by smtp.gmail.com with ESMTPSA id q11sm7114067pfh.132.2021.04.02.00.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 00:58:53 -0700 (PDT)
Date: Fri, 02 Apr 2021 17:58:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 29/46] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-30-npiggin@gmail.com>
 <56dc4f3f-789d-0bbe-1b1f-508dbdfae487@ozlabs.ru>
 <1617272101.bcglven6fh.astroid@bobo.none>
 <e2fc29aa-f38c-4650-06e2-d918c59547bf@ozlabs.ru>
In-Reply-To: <e2fc29aa-f38c-4650-06e2-d918c59547bf@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1617348209.exf6apm5d0.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of April 2, 2021 2:36 pm:
>=20
>=20
> On 01/04/2021 21:35, Nicholas Piggin wrote:
>> Excerpts from Alexey Kardashevskiy's message of April 1, 2021 3:30 pm:
>>>
>>>
>>> On 3/23/21 12:02 PM, Nicholas Piggin wrote:
>>>> Almost all logic is moved to C, by introducing a new in_guest mode tha=
t
>>>> selects and branches very early in the interrupt handler to the P9 exi=
t
>>>> code.
>>=20
>> [...]
>>=20
>>>> +/*
>>>> + * kvmppc_p9_exit_hcall and kvmppc_p9_exit_interrupt are branched to =
from
>>>> + * above if the interrupt was taken for a guest that was entered via
>>>> + * kvmppc_p9_enter_guest().
>>>> + *
>>>> + * This code recovers the host stack and vcpu pointer, saves all GPRs=
 and
>>>> + * CR, LR, CTR, XER as well as guest MSR and NIA into the VCPU, then =
re-
>>>> + * establishes the host stack and registers to return from  the
>>>> + * kvmppc_p9_enter_guest() function.
>>>
>>> What does "this code" refer to? If it is the asm below, then it does no=
t
>>> save CTR, it is in the c code. Otherwise it is confusing (to me) :)
>>=20
>> Yes you're right, CTR is saved in C.
>>=20
>>>> + */
>>>> +.balign	IFETCH_ALIGN_BYTES
>>>> +kvmppc_p9_exit_hcall:
>>>> +	mfspr	r11,SPRN_SRR0
>>>> +	mfspr	r12,SPRN_SRR1
>>>> +	li	r10,0xc00
>>>> +	std	r10,HSTATE_SCRATCH0(r13)
>>>> +
>>>> +.balign	IFETCH_ALIGN_BYTES
>>>> +kvmppc_p9_exit_interrupt:
>>=20
>> [...]
>>=20
>>>> +static inline void slb_invalidate(unsigned int ih)
>>>> +{
>>>> +	asm volatile("slbia %0" :: "i"(ih));
>>>> +}
>>>
>>> This one is not used.
>>=20
>> It gets used in a later patch, I guess I should move it there.
>>=20
>> [...]
>>=20
>>>> +int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
>>>> +{
>>>> +	u64 *exsave;
>>>> +	unsigned long msr =3D mfmsr();
>>>> +	int trap;
>>>> +
>>>> +	start_timing(vcpu, &vcpu->arch.rm_entry);
>>>> +
>>>> +	vcpu->arch.ceded =3D 0;
>>>> +
>>>> +	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
>>>> +	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
>>>> +
>>>> +	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
>>>> +	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
>>>> +
>>>> +	/*
>>>> +	 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
>>>> +	 * Interrupt (HDSI) the HDSISR is not be updated at all.
>>>> +	 *
>>>> +	 * To work around this we put a canary value into the HDSISR before
>>>> +	 * returning to a guest and then check for this canary when we take =
a
>>>> +	 * HDSI. If we find the canary on a HDSI, we know the hardware didn'=
t
>>>> +	 * update the HDSISR. In this case we return to the guest to retake =
the
>>>> +	 * HDSI which should correctly update the HDSISR the second time HDS=
I
>>>> +	 * entry.
>>>> +	 *
>>>> +	 * Just do this on all p9 processors for now.
>>>> +	 */
>>>> +	mtspr(SPRN_HDSISR, HDSISR_CANARY);
>>>> +
>>>> +	accumulate_time(vcpu, &vcpu->arch.guest_time);
>>>> +
>>>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_GUEST_HV_FAST;
>>>> +	kvmppc_p9_enter_guest(vcpu);
>>>> +	// Radix host and guest means host never runs with guest MMU state
>>>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_NONE;
>>>> +
>>>> +	accumulate_time(vcpu, &vcpu->arch.rm_intr);
>>>> +
>>>> +	/* Get these from r11/12 and paca exsave */
>>>> +	vcpu->arch.shregs.srr0 =3D mfspr(SPRN_SRR0);
>>>> +	vcpu->arch.shregs.srr1 =3D mfspr(SPRN_SRR1);
>>>> +	vcpu->arch.shregs.dar =3D mfspr(SPRN_DAR);
>>>> +	vcpu->arch.shregs.dsisr =3D mfspr(SPRN_DSISR);
>>>> +
>>>> +	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it *=
/
>>>> +	trap =3D local_paca->kvm_hstate.scratch0 & ~0x2;
>>>> +	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>>>> +		exsave =3D local_paca->exgen;
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_SYSTEM_RESET) {
>>>> +		exsave =3D local_paca->exnmi;
>>>> +	} else { /* trap =3D=3D 0x200 */
>>>> +		exsave =3D local_paca->exmc;
>>>> +	}
>>>> +
>>>> +	vcpu->arch.regs.gpr[1] =3D local_paca->kvm_hstate.scratch1;
>>>> +	vcpu->arch.regs.gpr[3] =3D local_paca->kvm_hstate.scratch2;
>>>> +	vcpu->arch.regs.gpr[9] =3D exsave[EX_R9/sizeof(u64)];
>>>> +	vcpu->arch.regs.gpr[10] =3D exsave[EX_R10/sizeof(u64)];
>>>> +	vcpu->arch.regs.gpr[11] =3D exsave[EX_R11/sizeof(u64)];
>>>> +	vcpu->arch.regs.gpr[12] =3D exsave[EX_R12/sizeof(u64)];
>>>> +	vcpu->arch.regs.gpr[13] =3D exsave[EX_R13/sizeof(u64)];
>>>> +	vcpu->arch.ppr =3D exsave[EX_PPR/sizeof(u64)];
>>>> +	vcpu->arch.cfar =3D exsave[EX_CFAR/sizeof(u64)];
>>>> +	vcpu->arch.regs.ctr =3D exsave[EX_CTR/sizeof(u64)];
>>>> +
>>>> +	vcpu->arch.last_inst =3D KVM_INST_FETCH_FAILED;
>>>> +
>>>> +	if (unlikely(trap =3D=3D BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>>>> +		vcpu->arch.fault_dar =3D exsave[EX_DAR/sizeof(u64)];
>>>> +		vcpu->arch.fault_dsisr =3D exsave[EX_DSISR/sizeof(u64)];
>>>> +		kvmppc_realmode_machine_check(vcpu);
>>>> +
>>>> +	} else if (unlikely(trap =3D=3D BOOK3S_INTERRUPT_HMI)) {
>>>> +		kvmppc_realmode_hmi_handler();
>>>> +
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
>>>> +		vcpu->arch.emul_inst =3D mfspr(SPRN_HEIR);
>>>> +
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_DATA_STORAGE) {
>>>> +		vcpu->arch.fault_dar =3D exsave[EX_DAR/sizeof(u64)];
>>>> +		vcpu->arch.fault_dsisr =3D exsave[EX_DSISR/sizeof(u64)];
>>>> +		vcpu->arch.fault_gpa =3D mfspr(SPRN_ASDR);
>>>> +
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_INST_STORAGE) {
>>>> +		vcpu->arch.fault_gpa =3D mfspr(SPRN_ASDR);
>>>> +
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
>>>> +		vcpu->arch.hfscr =3D mfspr(SPRN_HFSCR);
>>>> +
>>>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>>> +	/*
>>>> +	 * Softpatch interrupt for transactional memory emulation cases
>>>> +	 * on POWER9 DD2.2.  This is early in the guest exit path - we
>>>> +	 * haven't saved registers or done a treclaim yet.
>>>> +	 */
>>>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_HV_SOFTPATCH) {
>>>> +		vcpu->arch.emul_inst =3D mfspr(SPRN_HEIR);
>>>> +
>>>> +		/*
>>>> +		 * The cases we want to handle here are those where the guest
>>>> +		 * is in real suspend mode and is trying to transition to
>>>> +		 * transactional mode.
>>>> +		 */
>>>> +		if (local_paca->kvm_hstate.fake_suspend &&
>>>> +				(vcpu->arch.shregs.msr & MSR_TS_S)) {
>>>> +			if (kvmhv_p9_tm_emulation_early(vcpu)) {
>>>> +				/* Prevent it being handled again. */
>>>> +				trap =3D 0;
>>>> +			}
>>>> +		}
>>>> +#endif
>>>> +	}
>>>> +
>>>> +	radix_clear_slb();
>>>> +
>>>> +	__mtmsrd(msr, 0);
>>>
>>>
>>> The asm code only sets RI but this potentially sets more bits including
>>> MSR_EE, is it expected to be 0 when __kvmhv_vcpu_entry_p9() is called?
>>=20
>> Yes.
>>=20
>>>> +	mtspr(SPRN_CTRLT, 1);
>>>
>>> What is this for? ISA does not shed much light:
>>> =3D=3D=3D
>>> 63 RUN This  bit  controls  an  external  I/O  pin.
>>> =3D=3D=3D
>>=20
>> I don't think it even does that these days. It interacts with the PMU.
>> I was looking whether it's feasible to move it into PMU code entirely,
>> but apparently some tool or something might sample it. I'm a bit
>> suspicious about that because an untrusted guest could be running and
>> claim not to so I don't know what said tool really achieves, but I'll
>> go through that fight another day.
>>=20
>> But KVM has to set it to 1 at exit because Linux host has it set to 1
>> except in CPU idle.
>=20
>=20
> It this CTRLT setting a new thing or the asm does it too? I could not=20
> spot it.

It's quite old actually. Earlier processors (maybe POWER6) you had to=20
even read-modify-write but new ones you can just store 1:

Guest exit:
        /* Save guest CTRL register, set runlatch to 1 */
        mfspr   r6,SPRN_CTRLF
        stw     r6,VCPU_CTRL(r9)
        andi.   r0,r6,1
        bne     4f
        ori     r6,r6,1
        mtspr   SPRN_CTRLT,r6
4:

entry:
        /* Restore state of CTRL run bit; assume 1 on entry */
        lwz     r5,VCPU_CTRL(r4)
        andi.   r5,r5,1
        bne     4f
        mfspr   r6,SPRN_CTRLF
        clrrdi  r6,r6,1
        mtspr   SPRN_CTRLT,r6

It used to light an indicator on the front of the system once upon a=20
time and I think on some processors (Cell maybe?) it actually controlled=20
SMT threads in some way. But certainly in P9 it does almost nothing and
we'll probably try to phase it out.

>>> The asm does "For hash guest, read the guest SLB and save it away", thi=
s
>>> code does not. Is this new fast-path-in-c only for radix-on-radix or
>>> hash VMs are supported too?
>>=20
>> That asm code does not run for "guest_exit_short_path" case (aka the
>> p9 path aka the fast path).
>>=20
>> Upstream code only supports radix host and radix guest in this path.
>> The old path supports hash and radix. That's unchanged with this patch.
>>=20
>> After the series, the new path supports all P9 modes (hash/hash,
>> radix/radix, and radix/hash), and the old path supports P7 and P8 only.
>=20
>=20
> Thanks for clarification. Besides that CTRLT, I checked if the new c=20
> code matches the old asm code (which made diving into ISA incredible fun=20
> :) ) so fwiw
>=20
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks for reviewing.

> I'd really like to see longer commit logs clarifying all intended=20
> changes but it is probably just me.

I'm not sure what the best balance is, at some point code is a more=20
precise description. For this particular patch I probably do need to go=20
over the changelog again and try to make sure it makes sense and covers=20
things. If you have specifics that are missing or changes you'd like
I would definitely consider them.

Thanks,
Nick
