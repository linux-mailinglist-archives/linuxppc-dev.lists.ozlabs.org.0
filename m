Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464F33F55C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 17:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0wSG6rv4z3bs9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 03:23:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QhTj8hrT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QhTj8hrT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0wRp0cqlz3047
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 03:22:45 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HGEqqd134757; Wed, 17 Mar 2021 12:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=AaRv1lCjJnXBKG54W8/mErqbuMHW+AG57/a2M1z9nnQ=;
 b=QhTj8hrTt1gFwp5EqGeD9BW0kr4rCZAOMFXzxfhmkGvM5QBXr/VAx5oai/L81vuvl/Ye
 5N70EIV3N3uzapaKbfZEo0qNC3A5kjYwK6aUej9fSuryfAa26bDAFz4qmTbNpaml2PX9
 0H6yuuNBMaUwlG1Ri4ONyyOiasUE3W7oUuvJ4Md+BOd8OtIBPbKnYbgmk4YdrZbphZS+
 79TqlyAomZV5ruJN9WlHJI72V/teBig1/rY7uR7T7p+Pnyo0NdOSRNiEB7T1s1fO7Kyg
 uesqXi5pGw6gpfXlR52e0Un0EGbEtvS/wtkmmUY9cUWyOdG4/DRuCkYNdepjk0qC59gQ jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bn4b8a6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 12:22:43 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12HGFW8o141942;
 Wed, 17 Mar 2021 12:22:42 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bn4b8a63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 12:22:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HGI7RM019633;
 Wed, 17 Mar 2021 16:22:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 378n1a8c1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 16:22:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12HGMe0i15466782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 16:22:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E262C6057;
 Wed, 17 Mar 2021 16:22:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8012C605B;
 Wed, 17 Mar 2021 16:22:39 +0000 (GMT)
Received: from localhost (unknown [9.163.19.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 17 Mar 2021 16:22:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 19/41] KVM: PPC: Book3S HV P9: Stop handling hcalls
 in real-mode in the P9 path
In-Reply-To: <20210305150638.2675513-20-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-20-npiggin@gmail.com>
Date: Wed, 17 Mar 2021 13:22:37 -0300
Message-ID: <87o8fh21iq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_10:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170113
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
> ---

<snip>

> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 497f216ad724..1f2ba8955c6a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1147,7 +1147,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>   * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>   * that the cede logic in kvmppc_run_single_vcpu() works properly.
>   */
> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
> +static void kvmppc_cede(struct kvm_vcpu *vcpu)

The comment above needs to be updated I think.

>  {
>  	vcpu->arch.shregs.msr |= MSR_EE;
>  	vcpu->arch.ceded = 1;
> @@ -1403,9 +1403,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
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
> @@ -3740,15 +3746,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
> -		kvmppc_xive_pull_vcpu(vcpu);
> +		/* H_CEDE has to be handled now, not later */
> +		/* XICS hcalls must be handled before xive is pulled */
> +		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>
> +			if (req == H_CEDE) {
> +				kvmppc_cede(vcpu);
> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
> +				kvmppc_set_gpr(vcpu, 3, 0);
> +				trap = 0;
> +			}
> +			if (req == H_EOI || req == H_CPPR ||
> +			    req == H_IPI || req == H_IPOLL ||
> +			    req == H_XIRR || req == H_XIRR_X) {
> +				unsigned long ret;
> +
> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
> +				kvmppc_set_gpr(vcpu, 3, ret);
> +				trap = 0;
> +			}
> +		}

I tried running L2 with xive=off and this code slows down the boot
considerably. I think we're missing a !vcpu->arch.nested in the
conditional.

This may also be missing these checks from kvmppc_pseries_do_hcall:

		if (kvmppc_xics_enabled(vcpu)) {
			if (xics_on_xive()) {
				ret = H_NOT_AVAILABLE;
				return RESUME_GUEST;
			}
			ret = kvmppc_xics_hcall(vcpu, req);
                        (...)

For H_CEDE there might be a similar situation since we're shadowing the
code above that runs after H_ENTER_NESTED by setting trap to 0 here.

> +		kvmppc_xive_pull_vcpu(vcpu);
>  	}
>
>  	vcpu->arch.slb_max = 0;
> @@ -4408,8 +4435,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
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
> index 52cdb9e2660a..1e4871bbcad4 100644
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
> @@ -2106,6 +2140,32 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  	return 0;
>  }
>
> +int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
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
