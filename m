Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A6346723
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 19:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4fRV0JtYz3brD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 05:05:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyUZ7sB9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nyUZ7sB9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4fQz49rSz304Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 05:04:58 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NI4lYf080622; Tue, 23 Mar 2021 14:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PRL7bv9gghuvxChrR9RudUUECiJzs6aT43sKiRZP+r8=;
 b=nyUZ7sB9N42deJp4tAaAgMUb52UaAtWHgYhyN6btsgYO+yOua2Zr94uFNLxtaCOHMrPn
 BLCKN++wexwl9k2JMTBB1BN8Kba/OQ0LeepXH9HGOXcfWDoq8RxVu2rEs0Yz9oM7CVMF
 sO43S/Ufp3YRrxegMN0usJVSxHLe6k3ofICKXDUBABsYOj39CHf23tHyeKjgE1upCvS/
 6WXG0CHpy1HGu5pxM11eG/aCS+2PXPPXSMu10GNcIaAqSmMFogEtCR1abRZy510rzoG3
 8lnB8xbvKD8VLXMEKe13QKqYL8y3Q7PO2DwfEebf2eR0sfoQR/OGgH0vxUtmgOWGH5Ux 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fmkfs9gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:04:54 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NI4pDc081190;
 Tue, 23 Mar 2021 14:04:51 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fmkfs8uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:04:50 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NI1Upl016450;
 Tue, 23 Mar 2021 18:03:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 37d9akdpw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 18:03:24 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NI3MUH35062024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 18:03:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A68AA112066;
 Tue, 23 Mar 2021 18:03:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A078B112062;
 Tue, 23 Mar 2021 18:03:21 +0000 (GMT)
Received: from localhost (unknown [9.163.8.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 18:03:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls
 in real-mode in the P9 path
In-Reply-To: <20210323010305.1045293-23-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 15:03:18 -0300
Message-ID: <871rc5g32x.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_09:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103230133
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

> In the interest of minimising the amount of code that is run in
> "real-mode", don't handle hcalls in real mode in the P9 path.
>
> POWER8 and earlier are much more expensive to exit from HV real mode
> and switch to host mode, because on those processors HV interrupts get
> to the hypervisor with the MMU off, and the other threads in the core
> need to be pulled out of the guest, and SLBs all need to be saved,
> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
> in host mode. Hash guests also require a lot of hcalls to run. The
> XICS interrupt controller requires hcalls to run.
>
> By contrast, POWER9 has independent thread switching, and in radix mode
> the hypervisor is already in a host virtual memory mode when the HV
> interrupt is taken. Radix + xive guests don't need hcalls to handle
> interrupts or manage translations.
>
> So it's much less important to handle hcalls in real mode in P9.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

I tried this again in the L2 with xive=off and it works as expected now.

Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_ppc.h      |  5 ++
>  arch/powerpc/kvm/book3s_hv.c            | 57 ++++++++++++++++----
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 ++
>  arch/powerpc/kvm/book3s_xive.c          | 70 +++++++++++++++++++++++++
>  4 files changed, 127 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 73b1ca5a6471..db6646c2ade2 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>  extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>  extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>  extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>  extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>  extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>  extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
>  static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>  static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>  	{ return 0; }
> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +	{ return 0; }
>  #endif
>
>  #ifdef CONFIG_KVM_XIVE
> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>  			       int level, bool line_status);
>  extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>  extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);
>
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  {
> @@ -714,6 +718,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>  				      int level, bool line_status) { return -ENODEV; }
>  static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>  static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
> +static inline void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu) { }
>
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  	{ return 0; }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index fa7614c37e08..17739aaee3d8 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1142,12 +1142,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  }
>
>  /*
> - * Handle H_CEDE in the nested virtualization case where we haven't
> - * called the real-mode hcall handlers in book3s_hv_rmhandlers.S.
> + * Handle H_CEDE in the P9 path where we don't call the real-mode hcall
> + * handlers in book3s_hv_rmhandlers.S.
> + *
>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>   */
> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.shregs.msr |= MSR_EE;
>  	vcpu->arch.ceded = 1;
> @@ -1403,9 +1404,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  		/* hcall - punt to userspace */
>  		int i;
>
> -		/* hypercall with MSR_PR has already been handled in rmode,
> -		 * and never reaches here.
> -		 */
> +		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
> +			/*
> +			 * Guest userspace executed sc 1, reflect it back as a
> +			 * privileged program check interrupt.
> +			 */
> +			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
> +			r = RESUME_GUEST;
> +			break;
> +		}
>
>  		run->papr_hcall.nr = kvmppc_get_gpr(vcpu, 3);
>  		for (i = 0; i < 9; ++i)
> @@ -3663,6 +3670,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  	return trap;
>  }
>
> +static inline bool hcall_is_xics(unsigned long req)
> +{
> +	return (req == H_EOI || req == H_CPPR || req == H_IPI ||
> +		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X);
> +}
> +
>  /*
>   * Virtual-mode guest entry for POWER9 and later when the host and
>   * guest are both using the radix MMU.  The LPIDR has already been set.
> @@ -3774,15 +3787,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		/* H_CEDE has to be handled now, not later */
>  		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>  		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
> -			kvmppc_nested_cede(vcpu);
> +			kvmppc_cede(vcpu);
>  			kvmppc_set_gpr(vcpu, 3, 0);
>  			trap = 0;
>  		}
>  	} else {
>  		kvmppc_xive_push_vcpu(vcpu);
>  		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
> +		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
> +
> +			/* H_CEDE has to be handled now, not later */
> +			if (req == H_CEDE) {
> +				kvmppc_cede(vcpu);
> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
> +				kvmppc_set_gpr(vcpu, 3, 0);
> +				trap = 0;
> +
> +			/* XICS hcalls must be handled before xive is pulled */
> +			} else if (hcall_is_xics(req)) {
> +				int ret;
> +
> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
> +				if (ret != H_TOO_HARD) {
> +					kvmppc_set_gpr(vcpu, 3, ret);
> +					trap = 0;
> +				}
> +			}
> +		}
>  		kvmppc_xive_pull_vcpu(vcpu);
> -
>  	}
>
>  	vcpu->arch.slb_max = 0;
> @@ -4442,8 +4476,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		else
>  			r = kvmppc_run_vcpu(vcpu);
>
> -		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> +		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
> +			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
> +				r = RESUME_GUEST;
> +				continue;
> +			}
>  			trace_kvm_hcall_enter(vcpu);
>  			r = kvmppc_pseries_do_hcall(vcpu);
>  			trace_kvm_hcall_exit(vcpu, r);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index c11597f815e4..2d0d14ed1d92 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	mr	r4,r9
>  	bge	fast_guest_return
>  2:
> +	/* If we came in through the P9 short path, no real mode hcalls */
> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
> +	cmpwi	r0, 0
> +	bne	no_try_real
>  	/* See if this is an hcall we can handle in real mode */
>  	cmpwi	r12,BOOK3S_INTERRUPT_SYSCALL
>  	beq	hcall_try_real_mode
> +no_try_real:
>
>  	/* Hypervisor doorbell - exit only if host IPI flag set */
>  	cmpwi	r12, BOOK3S_INTERRUPT_H_DOORBELL
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 741bf1f4387a..dcc07ceaf5ca 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -158,6 +158,40 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>
> +void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu)
> +{
> +	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
> +
> +	if (!esc_vaddr)
> +		return;
> +
> +	/* we are using XIVE with single escalation */
> +
> +	if (vcpu->arch.xive_esc_on) {
> +		/*
> +		 * If we still have a pending escalation, abort the cede,
> +		 * and we must set PQ to 10 rather than 00 so that we don't
> +		 * potentially end up with two entries for the escalation
> +		 * interrupt in the XIVE interrupt queue.  In that case
> +		 * we also don't want to set xive_esc_on to 1 here in
> +		 * case we race with xive_esc_irq().
> +		 */
> +		vcpu->arch.ceded = 0;
> +		/*
> +		 * The escalation interrupts are special as we don't EOI them.
> +		 * There is no need to use the load-after-store ordering offset
> +		 * to set PQ to 10 as we won't use StoreEOI.
> +		 */
> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_10);
> +	} else {
> +		vcpu->arch.xive_esc_on = true;
> +		mb();
> +		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
> +	}
> +	mb();
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_xive_cede_vcpu);
> +
>  /*
>   * This is a simple trigger for a generic XIVE IRQ. This must
>   * only be called for interrupts that support a trigger page
> @@ -2106,6 +2140,42 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  	return 0;
>  }
>
> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +
> +	/*
> +	 * This test covers the case in which a vCPU does XICS hcalls without
> +	 * QEMU having connected the vCPU to a XICS ICP. The ICP is the KVM
> +	 * XICS device on P8 or XICS-on-XIVE on P9. It catches QEMU errors when
> +	 * the interrupt mode is negotiated, we don't want the OS to do XICS
> +	 * hcalls after having negotiated the XIVE interrupt mode.
> +	 */
> +	if (!kvmppc_xics_enabled(vcpu))
> +		return H_TOO_HARD;
> +
> +	switch (req) {
> +	case H_XIRR:
> +		return xive_vm_h_xirr(vcpu);
> +	case H_CPPR:
> +		return xive_vm_h_cppr(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_EOI:
> +		return xive_vm_h_eoi(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_IPI:
> +		return xive_vm_h_ipi(vcpu, kvmppc_get_gpr(vcpu, 4),
> +					  kvmppc_get_gpr(vcpu, 5));
> +	case H_IPOLL:
> +		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
> +	case H_XIRR_X:
> +		xive_vm_h_xirr(vcpu);
> +		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
> +		return H_SUCCESS;
> +	}
> +
> +	return H_UNSUPPORTED;
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
> +
>  int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
>  {
>  	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
