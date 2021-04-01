Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8DC3513B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 12:36:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB03H2Rpwz3btM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 21:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=V4N8Ualv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V4N8Ualv; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB02q0jqhz300c
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 21:36:01 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so782532pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=rDtc7FZ8xpkvkm2Fbi68BZIDe+E4Gs8byKrQt4XXtv8=;
 b=V4N8Ualv1D7aT/hUxdW6c4iZnlXM4maPzdju95tSYPj4xj62IUpEt0nySHxuOfcN2w
 mr/HpSZbU4b7Plq3kpnGt8eTtH23n1fB46ZBVd9IvxOO/+v2V/WBHnW0nPmogZOJYLNn
 2JZ9dcSZaVrfSP4a4IxR9PAiJV6GVGx8aNcGg8p7z7rldFhriwHn7aT+DQQrMHhWVxAt
 gloajUsjwZjHSd5H8OA85UklLLq557XXGTJJZeda5OD1YMrkVzcjQD4uVTDahw41x91r
 wYun0ADtvHO/PDWkQ64pG2BS8KPe2M2dBoh/wtnNBmaok8mwBfwCAh3mjlG7A0OujwzI
 cPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rDtc7FZ8xpkvkm2Fbi68BZIDe+E4Gs8byKrQt4XXtv8=;
 b=NUISKiwQcPPPE2I3KI9rNPPfmmw1l5BBITQunyMQKsX2YY2uZr8Zpt+80E55WLEN3M
 vCwpUd8vUPqZ4FUNBSNEfCudlMsQcWd/z69XuXxfbf7GGejn81S/eeSSlwdJaHAqOySy
 F8F149qErSLDHr5Hu5E1onSJzM57te+gdFJW7F6IIfrBfA4vmV9t06WQdj3fxTquf6Pa
 IkXctG40m8Ox70zIsGllkc+CT9a4NckQOMvvzgFkpyrnqDvtfn8MBaXpUiPFuyYBfnMV
 TlhH2g4MWCuLFC8s40gyxMKIIYyu7soDV508DnFMHuN96mizoDS6+kfmv10RjbpIx8Z/
 qJzA==
X-Gm-Message-State: AOAM533qbRk3vXNF1a1qaiffRl9AiKs4gDnKJm0eaJK4ZrjgVorKsyDL
 lWpY8sXKM4Anla7Y+3vWgZ8=
X-Google-Smtp-Source: ABdhPJxaESI8ujtKqPBJ/sMjKL48hxa1jBkmH+O15w0At7TMA4VSEmJJER66Gskp/vPSEYUK0KDkjQ==
X-Received: by 2002:a17:902:bd8b:b029:e7:147e:ee5b with SMTP id
 q11-20020a170902bd8bb02900e7147eee5bmr7124464pls.9.1617273358580; 
 Thu, 01 Apr 2021 03:35:58 -0700 (PDT)
Received: from localhost ([1.128.218.191])
 by smtp.gmail.com with ESMTPSA id e21sm4478263pgv.74.2021.04.01.03.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:35:58 -0700 (PDT)
Date: Thu, 01 Apr 2021 20:35:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 29/46] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-30-npiggin@gmail.com>
 <56dc4f3f-789d-0bbe-1b1f-508dbdfae487@ozlabs.ru>
In-Reply-To: <56dc4f3f-789d-0bbe-1b1f-508dbdfae487@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1617272101.bcglven6fh.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of April 1, 2021 3:30 pm:
>=20
>=20
> On 3/23/21 12:02 PM, Nicholas Piggin wrote:
>> Almost all logic is moved to C, by introducing a new in_guest mode that
>> selects and branches very early in the interrupt handler to the P9 exit
>> code.

[...]

>> +/*
>> + * kvmppc_p9_exit_hcall and kvmppc_p9_exit_interrupt are branched to fr=
om
>> + * above if the interrupt was taken for a guest that was entered via
>> + * kvmppc_p9_enter_guest().
>> + *
>> + * This code recovers the host stack and vcpu pointer, saves all GPRs a=
nd
>> + * CR, LR, CTR, XER as well as guest MSR and NIA into the VCPU, then re=
-
>> + * establishes the host stack and registers to return from  the
>> + * kvmppc_p9_enter_guest() function.
>=20
> What does "this code" refer to? If it is the asm below, then it does not=20
> save CTR, it is in the c code. Otherwise it is confusing (to me) :)

Yes you're right, CTR is saved in C.

>> + */
>> +.balign	IFETCH_ALIGN_BYTES
>> +kvmppc_p9_exit_hcall:
>> +	mfspr	r11,SPRN_SRR0
>> +	mfspr	r12,SPRN_SRR1
>> +	li	r10,0xc00
>> +	std	r10,HSTATE_SCRATCH0(r13)
>> +
>> +.balign	IFETCH_ALIGN_BYTES
>> +kvmppc_p9_exit_interrupt:

[...]

>> +static inline void slb_invalidate(unsigned int ih)
>> +{
>> +	asm volatile("slbia %0" :: "i"(ih));
>> +}
>=20
> This one is not used.

It gets used in a later patch, I guess I should move it there.

[...]

>> +int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
>> +{
>> +	u64 *exsave;
>> +	unsigned long msr =3D mfmsr();
>> +	int trap;
>> +
>> +	start_timing(vcpu, &vcpu->arch.rm_entry);
>> +
>> +	vcpu->arch.ceded =3D 0;
>> +
>> +	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
>> +	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
>> +
>> +	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
>> +	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
>> +
>> +	/*
>> +	 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
>> +	 * Interrupt (HDSI) the HDSISR is not be updated at all.
>> +	 *
>> +	 * To work around this we put a canary value into the HDSISR before
>> +	 * returning to a guest and then check for this canary when we take a
>> +	 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
>> +	 * update the HDSISR. In this case we return to the guest to retake th=
e
>> +	 * HDSI which should correctly update the HDSISR the second time HDSI
>> +	 * entry.
>> +	 *
>> +	 * Just do this on all p9 processors for now.
>> +	 */
>> +	mtspr(SPRN_HDSISR, HDSISR_CANARY);
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.guest_time);
>> +
>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_GUEST_HV_FAST;
>> +	kvmppc_p9_enter_guest(vcpu);
>> +	// Radix host and guest means host never runs with guest MMU state
>> +	local_paca->kvm_hstate.in_guest =3D KVM_GUEST_MODE_NONE;
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.rm_intr);
>> +
>> +	/* Get these from r11/12 and paca exsave */
>> +	vcpu->arch.shregs.srr0 =3D mfspr(SPRN_SRR0);
>> +	vcpu->arch.shregs.srr1 =3D mfspr(SPRN_SRR1);
>> +	vcpu->arch.shregs.dar =3D mfspr(SPRN_DAR);
>> +	vcpu->arch.shregs.dsisr =3D mfspr(SPRN_DSISR);
>> +
>> +	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
>> +	trap =3D local_paca->kvm_hstate.scratch0 & ~0x2;
>> +	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>> +		exsave =3D local_paca->exgen;
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_SYSTEM_RESET) {
>> +		exsave =3D local_paca->exnmi;
>> +	} else { /* trap =3D=3D 0x200 */
>> +		exsave =3D local_paca->exmc;
>> +	}
>> +
>> +	vcpu->arch.regs.gpr[1] =3D local_paca->kvm_hstate.scratch1;
>> +	vcpu->arch.regs.gpr[3] =3D local_paca->kvm_hstate.scratch2;
>> +	vcpu->arch.regs.gpr[9] =3D exsave[EX_R9/sizeof(u64)];
>> +	vcpu->arch.regs.gpr[10] =3D exsave[EX_R10/sizeof(u64)];
>> +	vcpu->arch.regs.gpr[11] =3D exsave[EX_R11/sizeof(u64)];
>> +	vcpu->arch.regs.gpr[12] =3D exsave[EX_R12/sizeof(u64)];
>> +	vcpu->arch.regs.gpr[13] =3D exsave[EX_R13/sizeof(u64)];
>> +	vcpu->arch.ppr =3D exsave[EX_PPR/sizeof(u64)];
>> +	vcpu->arch.cfar =3D exsave[EX_CFAR/sizeof(u64)];
>> +	vcpu->arch.regs.ctr =3D exsave[EX_CTR/sizeof(u64)];
>> +
>> +	vcpu->arch.last_inst =3D KVM_INST_FETCH_FAILED;
>> +
>> +	if (unlikely(trap =3D=3D BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>> +		vcpu->arch.fault_dar =3D exsave[EX_DAR/sizeof(u64)];
>> +		vcpu->arch.fault_dsisr =3D exsave[EX_DSISR/sizeof(u64)];
>> +		kvmppc_realmode_machine_check(vcpu);
>> +
>> +	} else if (unlikely(trap =3D=3D BOOK3S_INTERRUPT_HMI)) {
>> +		kvmppc_realmode_hmi_handler();
>> +
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
>> +		vcpu->arch.emul_inst =3D mfspr(SPRN_HEIR);
>> +
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_DATA_STORAGE) {
>> +		vcpu->arch.fault_dar =3D exsave[EX_DAR/sizeof(u64)];
>> +		vcpu->arch.fault_dsisr =3D exsave[EX_DSISR/sizeof(u64)];
>> +		vcpu->arch.fault_gpa =3D mfspr(SPRN_ASDR);
>> +
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_INST_STORAGE) {
>> +		vcpu->arch.fault_gpa =3D mfspr(SPRN_ASDR);
>> +
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
>> +		vcpu->arch.hfscr =3D mfspr(SPRN_HFSCR);
>> +
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	/*
>> +	 * Softpatch interrupt for transactional memory emulation cases
>> +	 * on POWER9 DD2.2.  This is early in the guest exit path - we
>> +	 * haven't saved registers or done a treclaim yet.
>> +	 */
>> +	} else if (trap =3D=3D BOOK3S_INTERRUPT_HV_SOFTPATCH) {
>> +		vcpu->arch.emul_inst =3D mfspr(SPRN_HEIR);
>> +
>> +		/*
>> +		 * The cases we want to handle here are those where the guest
>> +		 * is in real suspend mode and is trying to transition to
>> +		 * transactional mode.
>> +		 */
>> +		if (local_paca->kvm_hstate.fake_suspend &&
>> +				(vcpu->arch.shregs.msr & MSR_TS_S)) {
>> +			if (kvmhv_p9_tm_emulation_early(vcpu)) {
>> +				/* Prevent it being handled again. */
>> +				trap =3D 0;
>> +			}
>> +		}
>> +#endif
>> +	}
>> +
>> +	radix_clear_slb();
>> +
>> +	__mtmsrd(msr, 0);
>=20
>=20
> The asm code only sets RI but this potentially sets more bits including=20
> MSR_EE, is it expected to be 0 when __kvmhv_vcpu_entry_p9() is called?

Yes.

>> +	mtspr(SPRN_CTRLT, 1);
>=20
> What is this for? ISA does not shed much light:
> =3D=3D=3D
> 63 RUN This  bit  controls  an  external  I/O  pin.
> =3D=3D=3D

I don't think it even does that these days. It interacts with the PMU.
I was looking whether it's feasible to move it into PMU code entirely,=20
but apparently some tool or something might sample it. I'm a bit=20
suspicious about that because an untrusted guest could be running and=20
claim not to so I don't know what said tool really achieves, but I'll
go through that fight another day.

But KVM has to set it to 1 at exit because Linux host has it set to 1
except in CPU idle.

>=20
>=20
>> +
>> +	accumulate_time(vcpu, &vcpu->arch.rm_exit);
>=20
> This should not compile without CONFIG_KVM_BOOK3S_HV_EXIT_TIMING.

It has an ifdef wrapper so it should work (it does on my local tree=20
which is slightly newer than what you have but I don't think I fixed=20
anything around this recently).

>> +
>> +	end_timing(vcpu);
>> +
>> +	return trap;
>=20
>=20
> The asm does "For hash guest, read the guest SLB and save it away", this=20
> code does not. Is this new fast-path-in-c only for radix-on-radix or=20
> hash VMs are supported too?

That asm code does not run for "guest_exit_short_path" case (aka the
p9 path aka the fast path).

Upstream code only supports radix host and radix guest in this path.
The old path supports hash and radix. That's unchanged with this patch.

After the series, the new path supports all P9 modes (hash/hash,
radix/radix, and radix/hash), and the old path supports P7 and P8 only.

Thanks,
Nick
