Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2AF352647
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 06:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBS2K0vSjz3c71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 15:37:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=i7X7w/qV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=i7X7w/qV; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBS1q3rvyz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 15:36:44 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id w11so2021496ply.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E2+2K3YuhICmIZy3FfP287zZZKue4eQlYkBllz5xhj8=;
 b=i7X7w/qVR6oXGuAX4Cpqd4mEavkX98QbHfxmeud+tWrHUp3tJrtWWHYK8YcmG2sCP5
 91jKHc9hCspg5Xz0yF7RT+d7DtCcP4VWPXHMwt5rSBGI1b4+w8BDDpTbOs7tzbi8l5r8
 F4JwOBQi8jPeFcF5DROxSmSOvWXtz4Wkmo8vwvuJ91meJDm/SwVrE5gQZD6jorMs/IQl
 Zv+lg7DauUFnm8efvKphUX5smwPOHQ1ZQWHv+fJFOxTOR241PYn2Eqx/1NkMthQ2pCEZ
 w1zumY+Ot0bSz4/brFCnIx2P2Gu+FoTmPGvmZlmWKFOBD2Vx/DOZwSHi9YjCLSf2wAiT
 X2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E2+2K3YuhICmIZy3FfP287zZZKue4eQlYkBllz5xhj8=;
 b=pwhghXwvrb/LublK31UIEIV1lvGxpM+6yVXF/DqLBQfc7zcoyvLtszYkbvQ6amwvkB
 h35yT0UNjA0BQpPouPq5hljwRJnt6uFT2HPAosCFJoPRLTfeH17igeDAPPA4X7SMuXaN
 rys8aPUDDSRAtqkiDDSVyQDE/bZhZih4jcQkOgmJdHYL6CbkkAdjC9Dl4PyNelWdm6V9
 s/OaSwEkWcGlWlWzGryo4CvaIZkdcw5HSBOb772aZRWHZL/czfpcZY/kZ21tUUESlSKx
 yC0RLavPbLOjDqwPIKZLhvQSpPc7Xl4PC7TOu2FBtmyYbWc9hTtwYVPxyg5NiZJSlbnO
 gXHA==
X-Gm-Message-State: AOAM532N8OrTJRdKqBRqCVTDtVrZ3YQCHQUhF5ra1sO/15mNHPxyJGCJ
 R/oIybMNGmEZiv6mVulSAONhYg4qDeLQpg==
X-Google-Smtp-Source: ABdhPJx9yt1Pbgujyj0nTUahZvhDJEZqTZbYM34GB5mNdw1jbKih/0BDlAcu1bA6coc7uzcMVmfXRA==
X-Received: by 2002:a17:90a:86c9:: with SMTP id
 y9mr12071776pjv.205.1617338201518; 
 Thu, 01 Apr 2021 21:36:41 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id q14sm6871303pgt.54.2021.04.01.21.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 21:36:40 -0700 (PDT)
Message-ID: <e2fc29aa-f38c-4650-06e2-d918c59547bf@ozlabs.ru>
Date: Fri, 2 Apr 2021 15:36:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v4 29/46] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-30-npiggin@gmail.com>
 <56dc4f3f-789d-0bbe-1b1f-508dbdfae487@ozlabs.ru>
 <1617272101.bcglven6fh.astroid@bobo.none>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <1617272101.bcglven6fh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 01/04/2021 21:35, Nicholas Piggin wrote:
> Excerpts from Alexey Kardashevskiy's message of April 1, 2021 3:30 pm:
>>
>>
>> On 3/23/21 12:02 PM, Nicholas Piggin wrote:
>>> Almost all logic is moved to C, by introducing a new in_guest mode that
>>> selects and branches very early in the interrupt handler to the P9 exit
>>> code.
> 
> [...]
> 
>>> +/*
>>> + * kvmppc_p9_exit_hcall and kvmppc_p9_exit_interrupt are branched to from
>>> + * above if the interrupt was taken for a guest that was entered via
>>> + * kvmppc_p9_enter_guest().
>>> + *
>>> + * This code recovers the host stack and vcpu pointer, saves all GPRs and
>>> + * CR, LR, CTR, XER as well as guest MSR and NIA into the VCPU, then re-
>>> + * establishes the host stack and registers to return from  the
>>> + * kvmppc_p9_enter_guest() function.
>>
>> What does "this code" refer to? If it is the asm below, then it does not
>> save CTR, it is in the c code. Otherwise it is confusing (to me) :)
> 
> Yes you're right, CTR is saved in C.
> 
>>> + */
>>> +.balign	IFETCH_ALIGN_BYTES
>>> +kvmppc_p9_exit_hcall:
>>> +	mfspr	r11,SPRN_SRR0
>>> +	mfspr	r12,SPRN_SRR1
>>> +	li	r10,0xc00
>>> +	std	r10,HSTATE_SCRATCH0(r13)
>>> +
>>> +.balign	IFETCH_ALIGN_BYTES
>>> +kvmppc_p9_exit_interrupt:
> 
> [...]
> 
>>> +static inline void slb_invalidate(unsigned int ih)
>>> +{
>>> +	asm volatile("slbia %0" :: "i"(ih));
>>> +}
>>
>> This one is not used.
> 
> It gets used in a later patch, I guess I should move it there.
> 
> [...]
> 
>>> +int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
>>> +{
>>> +	u64 *exsave;
>>> +	unsigned long msr = mfmsr();
>>> +	int trap;
>>> +
>>> +	start_timing(vcpu, &vcpu->arch.rm_entry);
>>> +
>>> +	vcpu->arch.ceded = 0;
>>> +
>>> +	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
>>> +	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
>>> +
>>> +	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
>>> +	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
>>> +
>>> +	/*
>>> +	 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
>>> +	 * Interrupt (HDSI) the HDSISR is not be updated at all.
>>> +	 *
>>> +	 * To work around this we put a canary value into the HDSISR before
>>> +	 * returning to a guest and then check for this canary when we take a
>>> +	 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
>>> +	 * update the HDSISR. In this case we return to the guest to retake the
>>> +	 * HDSI which should correctly update the HDSISR the second time HDSI
>>> +	 * entry.
>>> +	 *
>>> +	 * Just do this on all p9 processors for now.
>>> +	 */
>>> +	mtspr(SPRN_HDSISR, HDSISR_CANARY);
>>> +
>>> +	accumulate_time(vcpu, &vcpu->arch.guest_time);
>>> +
>>> +	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
>>> +	kvmppc_p9_enter_guest(vcpu);
>>> +	// Radix host and guest means host never runs with guest MMU state
>>> +	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
>>> +
>>> +	accumulate_time(vcpu, &vcpu->arch.rm_intr);
>>> +
>>> +	/* Get these from r11/12 and paca exsave */
>>> +	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
>>> +	vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
>>> +	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
>>> +	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
>>> +
>>> +	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
>>> +	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
>>> +	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>>> +		exsave = local_paca->exgen;
>>> +	} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
>>> +		exsave = local_paca->exnmi;
>>> +	} else { /* trap == 0x200 */
>>> +		exsave = local_paca->exmc;
>>> +	}
>>> +
>>> +	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
>>> +	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
>>> +	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
>>> +	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
>>> +	vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
>>> +	vcpu->arch.regs.gpr[12] = exsave[EX_R12/sizeof(u64)];
>>> +	vcpu->arch.regs.gpr[13] = exsave[EX_R13/sizeof(u64)];
>>> +	vcpu->arch.ppr = exsave[EX_PPR/sizeof(u64)];
>>> +	vcpu->arch.cfar = exsave[EX_CFAR/sizeof(u64)];
>>> +	vcpu->arch.regs.ctr = exsave[EX_CTR/sizeof(u64)];
>>> +
>>> +	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
>>> +
>>> +	if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
>>> +		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
>>> +		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
>>> +		kvmppc_realmode_machine_check(vcpu);
>>> +
>>> +	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
>>> +		kvmppc_realmode_hmi_handler();
>>> +
>>> +	} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
>>> +		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
>>> +
>>> +	} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
>>> +		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
>>> +		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
>>> +		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
>>> +
>>> +	} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
>>> +		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
>>> +
>>> +	} else if (trap == BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
>>> +		vcpu->arch.hfscr = mfspr(SPRN_HFSCR);
>>> +
>>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>> +	/*
>>> +	 * Softpatch interrupt for transactional memory emulation cases
>>> +	 * on POWER9 DD2.2.  This is early in the guest exit path - we
>>> +	 * haven't saved registers or done a treclaim yet.
>>> +	 */
>>> +	} else if (trap == BOOK3S_INTERRUPT_HV_SOFTPATCH) {
>>> +		vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
>>> +
>>> +		/*
>>> +		 * The cases we want to handle here are those where the guest
>>> +		 * is in real suspend mode and is trying to transition to
>>> +		 * transactional mode.
>>> +		 */
>>> +		if (local_paca->kvm_hstate.fake_suspend &&
>>> +				(vcpu->arch.shregs.msr & MSR_TS_S)) {
>>> +			if (kvmhv_p9_tm_emulation_early(vcpu)) {
>>> +				/* Prevent it being handled again. */
>>> +				trap = 0;
>>> +			}
>>> +		}
>>> +#endif
>>> +	}
>>> +
>>> +	radix_clear_slb();
>>> +
>>> +	__mtmsrd(msr, 0);
>>
>>
>> The asm code only sets RI but this potentially sets more bits including
>> MSR_EE, is it expected to be 0 when __kvmhv_vcpu_entry_p9() is called?
> 
> Yes.
> 
>>> +	mtspr(SPRN_CTRLT, 1);
>>
>> What is this for? ISA does not shed much light:
>> ===
>> 63 RUN This  bit  controls  an  external  I/O  pin.
>> ===
> 
> I don't think it even does that these days. It interacts with the PMU.
> I was looking whether it's feasible to move it into PMU code entirely,
> but apparently some tool or something might sample it. I'm a bit
> suspicious about that because an untrusted guest could be running and
> claim not to so I don't know what said tool really achieves, but I'll
> go through that fight another day.
> 
> But KVM has to set it to 1 at exit because Linux host has it set to 1
> except in CPU idle.


It this CTRLT setting a new thing or the asm does it too? I could not 
spot it.

>>
>>
>>> +
>>> +	accumulate_time(vcpu, &vcpu->arch.rm_exit);
>>
>> This should not compile without CONFIG_KVM_BOOK3S_HV_EXIT_TIMING.
> 
> It has an ifdef wrapper so it should work (it does on my local tree
> which is slightly newer than what you have but I don't think I fixed
> anything around this recently).


You are absolutely right, my bad.

> 
>>> +
>>> +	end_timing(vcpu);
>>> +
>>> +	return trap;
>>
>>
>> The asm does "For hash guest, read the guest SLB and save it away", this
>> code does not. Is this new fast-path-in-c only for radix-on-radix or
>> hash VMs are supported too?
> 
> That asm code does not run for "guest_exit_short_path" case (aka the
> p9 path aka the fast path).
> 
> Upstream code only supports radix host and radix guest in this path.
> The old path supports hash and radix. That's unchanged with this patch.
> 
> After the series, the new path supports all P9 modes (hash/hash,
> radix/radix, and radix/hash), and the old path supports P7 and P8 only.


Thanks for clarification. Besides that CTRLT, I checked if the new c 
code matches the old asm code (which made diving into ISA incredible fun 
:) ) so fwiw

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


I'd really like to see longer commit logs clarifying all intended 
changes but it is probably just me.


> 
> Thanks,
> Nick
> 

-- 
Alexey
