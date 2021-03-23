Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0B346D9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 23:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mwl3Dxjz3br1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 09:57:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XupEEdYL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XupEEdYL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4mwJ3BzYz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 09:57:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NMd97E018419; Tue, 23 Mar 2021 18:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TiEHHsahInRHmSU3qC9dnBo0r1OtAPNnhOmbEM2E9hI=;
 b=XupEEdYLaCjOzy/ew1+RjZlN5Q9DnLzx951YqD5+GIUkiniZbsCGooFmnrfbo59q+4Ds
 Fy1WTPAvsqAOxzpklbDmVRnXN9A2YIbvWdelJNzAfgMbI5K8u1M11OTprcQcvrLRliNr
 Mk0iSb0OLofpso+ovvJYSS8jodzrwvr3fjLCaW2PC/XP5Sle3VYp+0k/D3WfYbuULvoU
 +2rms2Nqzkfc4Z8dBpFmu1tQpEl6pSF7W/1T1G8l+zYQNVCES7d+kp8id20qN5njNpQK
 1E5jD/P+6rBLa82lgzvGaU45Qy9QZOBQO3uCr7+3U0FwdY/QUniMq/C/uQzcp13DmpdT 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fn8uejx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 18:57:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NMvG83085701;
 Tue, 23 Mar 2021 18:57:16 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fn8uejww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 18:57:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NMpc9a031649;
 Tue, 23 Mar 2021 22:57:15 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 37dycckdme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 22:57:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NMvFX234013646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 22:57:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29E9B112069;
 Tue, 23 Mar 2021 22:57:15 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 446E3112061;
 Tue, 23 Mar 2021 22:57:14 +0000 (GMT)
Received: from localhost (unknown [9.163.8.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 22:57:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls
 in real-mode in the P9 path
In-Reply-To: <20210323010305.1045293-23-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 19:57:11 -0300
Message-ID: <87y2ed5vi0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_11:2021-03-23,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230166
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

This patch bypasses sc_1_fast_return so it breaks KVM-PR. L1 loops with
the following output:

[    9.503929][ T3443] Couldn't emulate instruction 0x4e800020 (op 19 xop 16)
[    9.503990][ T3443] kvmppc_exit_pr_progint: emulation at 48f4 failed (4e800020)
[    9.504080][ T3443] Couldn't emulate instruction 0x4e800020 (op 19 xop 16)
[    9.504170][ T3443] kvmppc_exit_pr_progint: emulation at 48f4 failed (4e800020)

0x4e800020 is a blr after a sc 1 in SLOF.

For KVM-PR we need to inject a 0xc00 at some point, either here or
before branching to no_try_real in book3s_hv_rmhandlers.S.

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

Note that this hunk might need to be dropped.

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
