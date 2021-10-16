Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914BC4302D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 15:46:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWkvR6FK0z3cFV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 00:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2QKXF76;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j2QKXF76; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWktf4bMrz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 00:46:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19GDh3DM020464; 
 Sat, 16 Oct 2021 09:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=k/UssDw6/7/RWox/ShF0pmVAYapRprpN+DgE7UCp+X8=;
 b=j2QKXF76axu5vb91IoxTmJaJUFlwqLpAXqnXdxRZ7+vc77683JkCp8Wlyq8bAs1cajVC
 HJe5LBHwXlLeky3ngf9RVfepgUxSvfBzvWfrOkmVwYiv1bOXqXA1GwJfSVwGN3nuedr8
 +j4H5w8NP+RD3o1JYOnzLG5Tee1yVcJsYRjIk4zD+FFoxD0E6xr36Y2EQBwZ8z8LidJF
 LlpruuFtWBcIvIhGj18qIV/N5AlF5xQku+eDOFXO4ElVlX43bYN1ga87eEF9v5bE58uc
 dlzicsUny+YfaPvVvO5v7wxcxqIhtsH/uP0D/PF0EdVjxgAgdoMWBNI2X34uhfad4RJc 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqyuyr19h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 09:45:59 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19GDiS6N026406;
 Sat, 16 Oct 2021 09:45:58 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqyuyr19a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 09:45:58 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19GDc093021037;
 Sat, 16 Oct 2021 13:45:57 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3bqpc9cy7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 13:45:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19GDjuf836307392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 13:45:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCD5C7805C;
 Sat, 16 Oct 2021 13:45:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD5C67805E;
 Sat, 16 Oct 2021 13:45:55 +0000 (GMT)
Received: from localhost (unknown [9.211.42.218])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 16 Oct 2021 13:45:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 19/52] KVM: PPC: Book3S HV P9: Reduce mtmsrd
 instructions required to save host SPRs
In-Reply-To: <20211004160049.1338837-20-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-20-npiggin@gmail.com>
Date: Sat, 16 Oct 2021 10:45:52 -0300
Message-ID: <87r1clw0a7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8QOUa6ifNdhmphrp4rHEQWvsxXtxPpAv
X-Proofpoint-GUID: xpki4e9ZWkLiJ7qmmSDZI8HZiLYWhAzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-16_04,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=760 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110160089
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This reduces the number of mtmsrd required to enable facility bits when
> saving/restoring registers, by having the KVM code set all bits up front
> rather than using individual facility functions that set their particular
> MSR bits.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

Aside: at msr_check_and_set what's with MSR_VSX always being implicitly
set whenever MSR_FP is set? I get that it depends on MSR_FP, but if FP
always implies VSX, then you could stop setting MSR_VSX in this patch.

> ---
>  arch/powerpc/include/asm/switch_to.h  |  2 +
>  arch/powerpc/kernel/process.c         | 28 +++++++++++++
>  arch/powerpc/kvm/book3s_hv.c          | 59 ++++++++++++++++++---------
>  arch/powerpc/kvm/book3s_hv_p9_entry.c |  1 +
>  4 files changed, 71 insertions(+), 19 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
> index 9d1fbd8be1c7..e8013cd6b646 100644
> --- a/arch/powerpc/include/asm/switch_to.h
> +++ b/arch/powerpc/include/asm/switch_to.h
> @@ -112,6 +112,8 @@ static inline void clear_task_ebb(struct task_struct *t)
>  #endif
>  }
>
> +void kvmppc_save_user_regs(void);
> +
>  extern int set_thread_tidr(struct task_struct *t);
>
>  #endif /* _ASM_POWERPC_SWITCH_TO_H */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 50436b52c213..3fca321b820d 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1156,6 +1156,34 @@ static inline void save_sprs(struct thread_struct *t)
>  #endif
>  }
>
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +void kvmppc_save_user_regs(void)
> +{
> +	unsigned long usermsr;
> +
> +	if (!current->thread.regs)
> +		return;
> +
> +	usermsr = current->thread.regs->msr;
> +
> +	if (usermsr & MSR_FP)
> +		save_fpu(current);
> +
> +	if (usermsr & MSR_VEC)
> +		save_altivec(current);
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	if (usermsr & MSR_TM) {
> +		current->thread.tm_tfhar = mfspr(SPRN_TFHAR);
> +		current->thread.tm_tfiar = mfspr(SPRN_TFIAR);
> +		current->thread.tm_texasr = mfspr(SPRN_TEXASR);
> +		current->thread.regs->msr &= ~MSR_TM;
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_save_user_regs);
> +#endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> +
>  static inline void restore_sprs(struct thread_struct *old_thread,
>  				struct thread_struct *new_thread)
>  {
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index fca89ed2244f..16365c0e9872 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4140,6 +4140,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	struct p9_host_os_sprs host_os_sprs;
>  	s64 dec;
>  	u64 tb, next_timer;
> +	unsigned long msr;
>  	int trap;
>
>  	WARN_ON_ONCE(vcpu->arch.ceded);
> @@ -4151,8 +4152,23 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	if (next_timer < time_limit)
>  		time_limit = next_timer;
>
> +	vcpu->arch.ceded = 0;
> +
>  	save_p9_host_os_sprs(&host_os_sprs);
>
> +	/* MSR bits may have been cleared by context switch */
> +	msr = 0;
> +	if (IS_ENABLED(CONFIG_PPC_FPU))
> +		msr |= MSR_FP;
> +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> +		msr |= MSR_VEC;
> +	if (cpu_has_feature(CPU_FTR_VSX))
> +		msr |= MSR_VSX;
> +	if (cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +		msr |= MSR_TM;
> +	msr = msr_check_and_set(msr);
> +
>  	kvmppc_subcore_enter_guest();
>
>  	vc->entry_exit_map = 1;
> @@ -4161,12 +4177,13 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	vcpu_vpa_increment_dispatch(vcpu);
>
>  	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
>  		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
> +		msr = mfmsr(); /* TM restore can update msr */
> +	}
>
>  	switch_pmu_to_guest(vcpu, &host_os_sprs);
>
> -	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
>  	load_fp_state(&vcpu->arch.fp);
>  #ifdef CONFIG_ALTIVEC
>  	load_vr_state(&vcpu->arch.vr);
> @@ -4275,7 +4292,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
>
> -	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
>  	store_fp_state(&vcpu->arch.fp);
>  #ifdef CONFIG_ALTIVEC
>  	store_vr_state(&vcpu->arch.vr);
> @@ -4825,19 +4841,24 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  	unsigned long user_tar = 0;
>  	unsigned int user_vrsave;
>  	struct kvm *kvm;
> +	unsigned long msr;
>
>  	if (!vcpu->arch.sane) {
>  		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
>  		return -EINVAL;
>  	}
>
> +	/* No need to go into the guest when all we'll do is come back out */
> +	if (signal_pending(current)) {
> +		run->exit_reason = KVM_EXIT_INTR;
> +		return -EINTR;
> +	}
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	/*
>  	 * Don't allow entry with a suspended transaction, because
>  	 * the guest entry/exit code will lose it.
> -	 * If the guest has TM enabled, save away their TM-related SPRs
> -	 * (they will get restored by the TM unavailable interrupt).
>  	 */
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	if (cpu_has_feature(CPU_FTR_TM) && current->thread.regs &&
>  	    (current->thread.regs->msr & MSR_TM)) {
>  		if (MSR_TM_ACTIVE(current->thread.regs->msr)) {
> @@ -4845,12 +4866,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  			run->fail_entry.hardware_entry_failure_reason = 0;
>  			return -EINVAL;
>  		}
> -		/* Enable TM so we can read the TM SPRs */
> -		mtmsr(mfmsr() | MSR_TM);
> -		current->thread.tm_tfhar = mfspr(SPRN_TFHAR);
> -		current->thread.tm_tfiar = mfspr(SPRN_TFIAR);
> -		current->thread.tm_texasr = mfspr(SPRN_TEXASR);
> -		current->thread.regs->msr &= ~MSR_TM;
>  	}
>  #endif
>
> @@ -4865,18 +4880,24 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>
>  	kvmppc_core_prepare_to_enter(vcpu);
>
> -	/* No need to go into the guest when all we'll do is come back out */
> -	if (signal_pending(current)) {
> -		run->exit_reason = KVM_EXIT_INTR;
> -		return -EINTR;
> -	}
> -
>  	kvm = vcpu->kvm;
>  	atomic_inc(&kvm->arch.vcpus_running);
>  	/* Order vcpus_running vs. mmu_ready, see kvmppc_alloc_reset_hpt */
>  	smp_mb();
>
> -	flush_all_to_thread(current);
> +	msr = 0;
> +	if (IS_ENABLED(CONFIG_PPC_FPU))
> +		msr |= MSR_FP;
> +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> +		msr |= MSR_VEC;
> +	if (cpu_has_feature(CPU_FTR_VSX))
> +		msr |= MSR_VSX;
> +	if (cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +		msr |= MSR_TM;
> +	msr = msr_check_and_set(msr);
> +
> +	kvmppc_save_user_regs();
>
>  	/* Save userspace EBB and other register values */
>  	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> index a7f63082b4e3..fb9cb34445ea 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -224,6 +224,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>  		vc->tb_offset_applied = vc->tb_offset;
>  	}
>
> +	/* Could avoid mfmsr by passing around, but probably no big deal */
>  	msr = mfmsr();
>
>  	host_hfscr = mfspr(SPRN_HFSCR);
