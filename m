Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B908D32AC57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 22:38:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqr8p5WwJz3cZV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 08:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Aa3hCBRP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Aa3hCBRP; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqr8L3pzHz30NB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 08:37:53 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122LbpRx142401; Tue, 2 Mar 2021 16:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xyRk9JqCOw0DbMLSDIH8dqEKE2+C9t7x4iN6YIhaldg=;
 b=Aa3hCBRP8ZfCJn8LOSJblx9BB41jMl0AfGIzxQce7j2jIfdO6xBQ9+koTiVkOPHh7YHZ
 LZdMPcksBXjep8ZB3PLdZJ+uRO+9MPRsZVFRFiN22ikbU4LKaWj/l2EgM4K8Q/dVxs9F
 SYPb+hEiNuPA7e0DMgbwgrN8L/dW+AmLpeBo4ihTPEukogY2vpcrJVy8K+PA2pBPBre5
 BkHXVpc8GkjVMb/8ASrg3oc5rZOp53TvXp9/kxyTsJ+v6/40Kztt/E52yjpd2O2juPDX
 9jnwx0t8CKXIrQwNv7RnomJsk1iWk0eJw/uzhhPOF+5l3lwzAY8wEbkXWeo3vqDfBJ1N DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371wamr12g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 16:37:49 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122LDIgJ073673;
 Tue, 2 Mar 2021 16:22:04 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371w3387dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 16:22:03 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122LH3MM007830;
 Tue, 2 Mar 2021 21:21:50 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3711dwtnv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 21:21:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122LLnkX23331290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 21:21:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77BCAAE05C;
 Tue,  2 Mar 2021 21:21:49 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80138AE062;
 Tue,  2 Mar 2021 21:21:48 +0000 (GMT)
Received: from localhost (unknown [9.211.36.193])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Mar 2021 21:21:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 30/37] KVM: PPC: Book3S HV: Implement radix prefetch
 workaround by disabling MMU
In-Reply-To: <20210225134652.2127648-31-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-31-npiggin@gmail.com>
Date: Tue, 02 Mar 2021 18:21:45 -0300
Message-ID: <87lfb5w8t2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020163
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Rather than partition the guest PID space and catch and flush a rogue
> guest, instead work around this issue by ensuring the MMU is always
> disabled in HV mode while the guest MMU context is switched in.
>
> This may be a bit less efficient, but it is a lot less complicated and
> allows the P9 path to trivally implement the workaround too. Newer CPUs
> are not subject to this issue.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/mmu_context.h   |  6 ----
>  arch/powerpc/kvm/book3s_hv.c             | 10 ++++--
>  arch/powerpc/kvm/book3s_hv_interrupt.c   | 14 ++++++--
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S  | 34 ------------------
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 27 +++++---------
>  arch/powerpc/mm/book3s64/radix_tlb.c     | 46 ------------------------
>  arch/powerpc/mm/mmu_context.c            |  4 +--
>  7 files changed, 28 insertions(+), 113 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 652ce85f9410..bb5c7e5e142e 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -122,12 +122,6 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
>  }
>  #endif
>
> -#if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
> -extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> -#else
> -static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
> -#endif
> -
>  extern void switch_cop(struct mm_struct *next);
>  extern int use_cop(unsigned long acop, struct mm_struct *mm);
>  extern void drop_cop(unsigned long acop, struct mm_struct *mm);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index ad16331c3370..c3064075f1d7 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -806,6 +806,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
>  		/* KVM does not support mflags=2 (AIL=2) */
>  		if (mflags != 0 && mflags != 3)
>  			return H_UNSUPPORTED_FLAG_START;
> +		/* Prefetch bug */
> +		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
> +				kvmhv_vcpu_is_radix(vcpu) && mflags == 3)
> +			return H_UNSUPPORTED_FLAG_START;

So does this mean that if the host has the prefetch bug, all of its
guests will run with AIL=0 all the time? And what we're avoiding here is
a guest setting AIL=3 which would (since there's no HAIL) cause
hypervisor interrupts to be taken with MMU on, is that it?

Do we need to add this verification to kvmppc_set_lpcr as well? QEMU
could in theory call the KVM_SET_ONE_REG ioctl and set AIL to any value.

>  		return H_TOO_HARD;
>  	default:
>  		return H_TOO_HARD;
> @@ -4286,8 +4290,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		 * The TLB prefetch bug fixup is only in the kvmppc_run_vcpu
>  		 * path, which also handles hash and dependent threads mode.
>  		 */
> -		if (kvm->arch.threads_indep && kvm_is_radix(kvm) &&
> -		    !cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
> +		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
>  			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
>  						  vcpu->arch.vcore->lpcr);
>  		else
> @@ -4914,6 +4917,9 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>  		if (!indep_threads_mode && !cpu_has_feature(CPU_FTR_HVMODE)) {
>  			pr_warn("KVM: Ignoring indep_threads_mode=N in nested hypervisor\n");
>  			kvm->arch.threads_indep = true;
> +		} else if (!indep_threads_mode && cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
> +			pr_warn("KVM: Ignoring indep_threads_mode=N on pre-DD2.2 POWER9\n");
> +			kvm->arch.threads_indep = true;
>  		} else {
>  			kvm->arch.threads_indep = indep_threads_mode;
>  		}
> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
> index b93d861d8538..9784da3f8565 100644
> --- a/arch/powerpc/kvm/book3s_hv_interrupt.c
> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
> @@ -223,6 +223,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>
>  	mtspr(SPRN_AMOR, ~0UL);
>
> +	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
> +		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
> +
>  	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>
>  	/*
> @@ -231,7 +234,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>  	 */
>  	mtspr(SPRN_HDEC, hdec);
>
> -	__mtmsrd(0, 1); /* clear RI */
> +	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
> +		__mtmsrd(0, 1); /* clear RI */
>
>  	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
>  	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
> @@ -338,8 +342,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>
>  	radix_clear_slb();
>
> -	__mtmsrd(msr, 0);
> -
>  	accumulate_time(vcpu, &vcpu->arch.rm_exit);
>
>  	/* Advance host PURR/SPURR by the amount used by guest */
> @@ -406,6 +408,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>
>  	switch_mmu_to_host_radix(kvm, host_pidr);
>
> +	/*
> +	 * If we are in real mode, don't switch MMU on until the MMU is
> +	 * switched to host, to avoid the P9 radix prefetch bug.
> +	 */
> +	__mtmsrd(msr, 0);
> +
>  	end_timing(vcpu);
>
>  	return trap;
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 6118e8a97ddd..61f71a7df238 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1710,40 +1710,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
>  	eieio
>  	tlbsync
>  	ptesync
> -
> -BEGIN_FTR_SECTION
> -	/* Radix: Handle the case where the guest used an illegal PID */
> -	LOAD_REG_ADDR(r4, mmu_base_pid)
> -	lwz	r3, VCPU_GUEST_PID(r9)
> -	lwz	r5, 0(r4)
> -	cmpw	cr0,r3,r5
> -	blt	2f
> -
> -	/*
> -	 * Illegal PID, the HW might have prefetched and cached in the TLB
> -	 * some translations for the  LPID 0 / guest PID combination which
> -	 * Linux doesn't know about, so we need to flush that PID out of
> -	 * the TLB. First we need to set LPIDR to 0 so tlbiel applies to
> -	 * the right context.
> -	*/
> -	li	r0,0
> -	mtspr	SPRN_LPID,r0
> -	isync
> -
> -	/* Then do a congruence class local flush */
> -	ld	r6,VCPU_KVM(r9)
> -	lwz	r0,KVM_TLB_SETS(r6)
> -	mtctr	r0
> -	li	r7,0x400		/* IS field = 0b01 */
> -	ptesync
> -	sldi	r0,r3,32		/* RS has PID */
> -1:	PPC_TLBIEL(7,0,2,1,1)		/* RIC=2, PRS=1, R=1 */
> -	addi	r7,r7,0x1000
> -	bdnz	1b
> -	ptesync
> -END_FTR_SECTION_IFSET(CPU_FTR_P9_RADIX_PREFETCH_BUG)
> -
> -2:
>  #endif /* CONFIG_PPC_RADIX_MMU */
>
>  	/*
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 98f0b243c1ab..1ea95891a79e 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -357,30 +357,19 @@ static void __init radix_init_pgtable(void)
>  	}
>
>  	/* Find out how many PID bits are supported */
> -	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
> -		if (!mmu_pid_bits)
> -			mmu_pid_bits = 20;
> -		mmu_base_pid = 1;
> -	} else if (cpu_has_feature(CPU_FTR_HVMODE)) {
> -		if (!mmu_pid_bits)
> -			mmu_pid_bits = 20;
> -#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
> +			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
>  		/*
> -		 * When KVM is possible, we only use the top half of the
> -		 * PID space to avoid collisions between host and guest PIDs
> -		 * which can cause problems due to prefetch when exiting the
> -		 * guest with AIL=3
> +		 * Older versions of KVM on these machines perfer if the
> +		 * guest only uses the low 19 PID bits.
>  		 */
> -		mmu_base_pid = 1 << (mmu_pid_bits - 1);
> -#else
> -		mmu_base_pid = 1;
> -#endif
> -	} else {
> -		/* The guest uses the bottom half of the PID space */
>  		if (!mmu_pid_bits)
>  			mmu_pid_bits = 19;
> -		mmu_base_pid = 1;
> +	} else {
> +		if (!mmu_pid_bits)
> +			mmu_pid_bits = 20;
>  	}
> +	mmu_base_pid = 1;
>
>  	/*
>  	 * Allocate Partition table and process table for the
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 409e61210789..312236a6b085 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1336,49 +1336,3 @@ void radix__flush_tlb_all(void)
>  		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(0) : "memory");
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
> -
> -#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> -extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
> -{
> -	unsigned long pid = mm->context.id;
> -
> -	if (unlikely(pid == MMU_NO_CONTEXT))
> -		return;
> -
> -	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
> -		return;
> -
> -	/*
> -	 * If this context hasn't run on that CPU before and KVM is
> -	 * around, there's a slim chance that the guest on another
> -	 * CPU just brought in obsolete translation into the TLB of
> -	 * this CPU due to a bad prefetch using the guest PID on
> -	 * the way into the hypervisor.
> -	 *
> -	 * We work around this here. If KVM is possible, we check if
> -	 * any sibling thread is in KVM. If it is, the window may exist
> -	 * and thus we flush that PID from the core.
> -	 *
> -	 * A potential future improvement would be to mark which PIDs
> -	 * have never been used on the system and avoid it if the PID
> -	 * is new and the process has no other cpumask bit set.
> -	 */
> -	if (cpu_has_feature(CPU_FTR_HVMODE) && radix_enabled()) {
> -		int cpu = smp_processor_id();
> -		int sib = cpu_first_thread_sibling(cpu);
> -		bool flush = false;
> -
> -		for (; sib <= cpu_last_thread_sibling(cpu) && !flush; sib++) {
> -			if (sib == cpu)
> -				continue;
> -			if (!cpu_possible(sib))
> -				continue;
> -			if (paca_ptrs[sib]->kvm_hstate.kvm_vcpu)
> -				flush = true;
> -		}
> -		if (flush)
> -			_tlbiel_pid(pid, RIC_FLUSH_ALL);
> -	}
> -}
> -EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
> -#endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
> index 18f20da0d348..7479d39976c9 100644
> --- a/arch/powerpc/mm/mmu_context.c
> +++ b/arch/powerpc/mm/mmu_context.c
> @@ -81,9 +81,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
>  	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>  		asm volatile ("dssall");
>
> -	if (new_on_cpu)
> -		radix_kvm_prefetch_workaround(next);
> -	else
> +	if (!new_on_cpu)
>  		membarrier_arch_switch_mm(prev, next, tsk);
>
>  	/*
