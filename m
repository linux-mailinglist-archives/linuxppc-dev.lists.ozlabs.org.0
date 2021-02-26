Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2D32650B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 16:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnDmd6dhvz3d2Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 02:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RCmfAACO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RCmfAACO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnDmB4gMxz30hx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 02:56:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QFWrwk073167; Fri, 26 Feb 2021 10:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Wvg5g6Gh54cMHzHS2jBw834QI0fjDOd1dAkDCue37o8=;
 b=RCmfAACOeaLUYGI0RlqwyjUkOS2JR6doNWruDnG3/V/lZ1Vpl9qQj3uICqaQgMmqHS8e
 3C8qexM5VPk+UPt9ooe7CMoPPdHiC9hdxk/5o/GEtP962oeLxue1qZUpYM8mU9sFvm9E
 4HWM1c0W866Vro/i8WLwkN2yDxbcVvLGt2SHZWkmyUSckahklKt1h9qU8jFaFFzScymw
 mAxCq7tCIHTz+gbzXiATdF4uOJe02L/R32zq/GTp/6hv+bJm7/6Qs6GJCxdWtkFe/g3e
 y45+Que3TXXxckqizQx3rVbWSSS083MiYAIF4dz1MVCv0iwz8eGLg9FFQW+bUjA4Eb6z 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xrf552fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 10:56:21 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11QFYgLw079925;
 Fri, 26 Feb 2021 10:56:21 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xrf552f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 10:56:21 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QFlbT1026747;
 Fri, 26 Feb 2021 15:56:20 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 36tt2aknsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:56:20 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11QFuJ8J30540180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 15:56:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E47AE076;
 Fri, 26 Feb 2021 15:56:19 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0787AE060;
 Fri, 26 Feb 2021 15:56:18 +0000 (GMT)
Received: from localhost (unknown [9.65.76.206])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Feb 2021 15:56:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 13/37] KVM: PPC: Book3S HV P9: Move radix MMU
 switching instructions together
In-Reply-To: <20210225134652.2127648-14-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-14-npiggin@gmail.com>
Date: Fri, 26 Feb 2021 12:56:16 -0300
Message-ID: <875z2eyg9r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260119
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

> Switching the MMU from radix<->radix mode is tricky particularly as the
> MMU can remain enabled and requires a certain sequence of SPR updates.
> Move these together into their own functions.
>
> This also includes the radix TLB check / flush because it's tied in to
> MMU switching due to tlbiel getting LPID from LPIDR.
>
> (XXX: isync / hwsync synchronisation TBD)

I see bot mtlpidr and mtlpcr requiring a CSI in the ISA. Do you say we
might need more than an isync?

Regardless, I'd expect that to be separate from the refactoring here,
so:

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 55 +++++++++++++++++++++---------------
>  1 file changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 895090636295..23d6dc04b0e9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3440,12 +3440,38 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>  	trace_kvmppc_run_core(vc, 1);
>  }
>
> +static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	struct kvm_nested_guest *nested = vcpu->arch.nested;
> +	u32 lpid;
> +
> +	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
> +
> +	mtspr(SPRN_LPID, lpid);
> +	mtspr(SPRN_LPCR, lpcr);
> +	mtspr(SPRN_PID, vcpu->arch.pid);
> +	isync();
> +
> +	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
> +	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
> +}
> +
> +static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
> +{
> +	mtspr(SPRN_PID, pid);
> +	mtspr(SPRN_LPID, kvm->arch.host_lpid);
> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
> +	isync();
> +}
> +
>  /*
>   * Load up hypervisor-mode registers on P9.
>   */
>  static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  				     unsigned long lpcr)
>  {
> +	struct kvm *kvm = vcpu->kvm;
>  	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>  	s64 hdec;
>  	u64 tb, purr, spurr;
> @@ -3468,12 +3494,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
>  	 * so set HDICE before writing HDEC.
>  	 */
> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>  	isync();
>
>  	hdec = time_limit - mftb();
>  	if (hdec < 0) {
> -		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
> +		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>  		isync();
>  		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>  	}
> @@ -3508,7 +3534,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  	}
>  	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
>  	mtspr(SPRN_IC, vcpu->arch.ic);
> -	mtspr(SPRN_PID, vcpu->arch.pid);
>
>  	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
>  	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> @@ -3522,8 +3547,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	mtspr(SPRN_AMOR, ~0UL);
>
> -	mtspr(SPRN_LPCR, lpcr);
> -	isync();
> +	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>
>  	kvmppc_xive_push_vcpu(vcpu);
>
> @@ -3562,7 +3586,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  		mtspr(SPRN_DAWR1, host_dawr1);
>  		mtspr(SPRN_DAWRX1, host_dawrx1);
>  	}
> -	mtspr(SPRN_PID, host_pidr);
>
>  	/*
>  	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
> @@ -3577,9 +3600,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  	if (cpu_has_feature(CPU_FTR_ARCH_31))
>  		asm volatile(PPC_CP_ABORT);
>
> -	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
> -	isync();
> -
>  	vc->dpdes = mfspr(SPRN_DPDES);
>  	vc->vtb = mfspr(SPRN_VTB);
>  	mtspr(SPRN_DPDES, 0);
> @@ -3596,7 +3616,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  	}
>
>  	mtspr(SPRN_HDEC, 0x7fffffff);
> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
> +
> +	switch_mmu_to_host_radix(kvm, host_pidr);
>
>  	return trap;
>  }
> @@ -4130,7 +4151,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  {
>  	struct kvm_run *run = vcpu->run;
>  	int trap, r, pcpu;
> -	int srcu_idx, lpid;
> +	int srcu_idx;
>  	struct kvmppc_vcore *vc;
>  	struct kvm *kvm = vcpu->kvm;
>  	struct kvm_nested_guest *nested = vcpu->arch.nested;
> @@ -4204,13 +4225,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  	vc->vcore_state = VCORE_RUNNING;
>  	trace_kvmppc_run_core(vc, 0);
>
> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> -		lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
> -		mtspr(SPRN_LPID, lpid);
> -		isync();
> -		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
> -	}
> -
>  	guest_enter_irqoff();
>
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
> @@ -4229,11 +4243,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>
> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> -		mtspr(SPRN_LPID, kvm->arch.host_lpid);
> -		isync();
> -	}
> -
>  	set_irq_happened(trap);
>
>  	kvmppc_set_host_core(pcpu);
