Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 600AC3C189D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 19:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLNyy2NSlz3bj3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 03:47:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fO6u1q1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fO6u1q1k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLNy96kQ5z3bXQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 03:46:25 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168HZD1W134754; Thu, 8 Jul 2021 13:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=S+k/2XrjzcIeCCheo0RDX/pHqR0LSN/AoTTgZTwaEsU=;
 b=fO6u1q1kSBMJBfbWGvz4+BWblI1v1aNwSFmeWt08SoHRs/llECM5yOVUCtuc2b3W1Mb7
 KzCF7uOjrZqv4DT7xtBj49SLKgrRlIq+PuOYt2XZ2p4dMgCFcCbXrsgdlw93woqNGvg6
 o/1GEjW5WxR/vu05rSoENI+4TtRbTEovf4rtnQAkqjOjmJyevUGYs+liyBnSuUocWORh
 6QDxmXrQ2+XTsQLCThiN8kQEFLbB5pd/p0ZBDBNpfK38XPQoH6a/pxa1iZFF+e0lVGNT
 1WJlKiUjvT57RhBMi8zyoPwt6DXSXjJknBzrKHo4WKMA5WiPctA4gT3GzO+jMB4v5i2I wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxx25qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:46:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168HZdSJ137858;
 Thu, 8 Jul 2021 13:46:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxx25qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:46:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168HcxI8027558;
 Thu, 8 Jul 2021 17:46:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 39jfhe9102-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 17:46:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168HkLUW50921728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 17:46:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBFCEAE064;
 Thu,  8 Jul 2021 17:46:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D5CCAE01E;
 Thu,  8 Jul 2021 17:46:20 +0000 (GMT)
Received: from localhost (unknown [9.211.64.106])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 17:46:19 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 35/43] KVM: PPC: Book3S HV P9: Demand fault TM
 facility registers
In-Reply-To: <20210622105736.633352-36-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-36-npiggin@gmail.com>
Date: Thu, 08 Jul 2021 14:46:17 -0300
Message-ID: <87sg0oog0m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OVlxfrbb9QkcqXNki0P7cmQopCcMPgGB
X-Proofpoint-GUID: 14n-xzrWVhtweidoZ5ymY5BWSY7mJj7Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_10:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080093
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

> Use HFSCR facility disabling to implement demand faulting for TM, with
> a hysteresis counter similar to the load_fp etc counters in context
> switching that implement the equivalent demand faulting for userspace
> facilities.
>
> This speeds up guest entry/exit by avoiding the register save/restore
> when a guest is not frequently using them. When a guest does use them
> often, there will be some additional demand fault overhead, but these
> are not commonly used facilities.
>
> -304 cycles (6681) POWER9 virt-mode NULL hcall with the previous patch
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_host.h   |  1 +
>  arch/powerpc/kvm/book3s_hv.c          | 21 +++++++++++++++++----
>  arch/powerpc/kvm/book3s_hv_nested.c   |  2 +-
>  arch/powerpc/kvm/book3s_hv_p9_entry.c | 18 ++++++++++++------
>  4 files changed, 31 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index bee95106c1f2..d79f0b1b1578 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -586,6 +586,7 @@ struct kvm_vcpu_arch {
>  	ulong ppr;
>  	u32 pspb;
>  	u8 load_ebb;
> +	u8 load_tm;
>  	ulong fscr;
>  	ulong shadow_fscr;
>  	ulong ebbhr;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 99e9da078e7d..2430725f29f7 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1373,6 +1373,13 @@ static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
>  	return RESUME_GUEST;
>  }
>
> +static int kvmppc_tm_unavailable(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.hfscr |= HFSCR_TM;
> +
> +	return RESUME_GUEST;
> +}
> +
>  static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  				 struct task_struct *tsk)
>  {
> @@ -1654,6 +1661,8 @@ XXX benchmark guest exits
>  				r = kvmppc_pmu_unavailable(vcpu);
>  			if (cause == FSCR_EBB_LG)
>  				r = kvmppc_ebb_unavailable(vcpu);
> +			if (cause == FSCR_TM_LG)
> +				r = kvmppc_tm_unavailable(vcpu);
>  		}
>  		if (r == EMULATE_FAIL) {
>  			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> @@ -1775,6 +1784,8 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
>  			r = kvmppc_pmu_unavailable(vcpu);
>  		if (cause == FSCR_EBB_LG && (vcpu->arch.nested_hfscr & HFSCR_EBB))
>  			r = kvmppc_ebb_unavailable(vcpu);
> +		if (cause == FSCR_TM_LG && (vcpu->arch.nested_hfscr & HFSCR_TM))
> +			r = kvmppc_tm_unavailable(vcpu);
>
>  		if (r == EMULATE_FAIL)
>  			r = RESUME_HOST;
> @@ -3737,8 +3748,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
>  		msr |= MSR_VEC;
>  	if (cpu_has_feature(CPU_FTR_VSX))
>  		msr |= MSR_VSX;
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +	if ((cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
> +			(vcpu->arch.hfscr & HFSCR_TM))
>  		msr |= MSR_TM;
>  	msr = msr_check_and_set(msr);
>
> @@ -4453,8 +4465,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		msr |= MSR_VEC;
>  	if (cpu_has_feature(CPU_FTR_VSX))
>  		msr |= MSR_VSX;
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +	if ((cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
> +			(vcpu->arch.hfscr & HFSCR_TM))
>  		msr |= MSR_TM;
>  	msr = msr_check_and_set(msr);
>
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index ee8668f056f9..5a534f7924f2 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -168,7 +168,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  	 * but preserve the interrupt cause field and facilities that might
>  	 * be disabled for demand faulting in the L1.
>  	 */
> -	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_EBB |
> +	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_TM | HFSCR_EBB |
>  			vcpu->arch.hfscr);
>
>  	/* Don't let data address watchpoint match in hypervisor state */
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> index cf41261daa97..653f2765a399 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -284,8 +284,9 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
>  void load_vcpu_state(struct kvm_vcpu *vcpu,
>  			   struct p9_host_os_sprs *host_os_sprs)
>  {
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
> +	if ((cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
> +		       (vcpu->arch.hfscr & HFSCR_TM)) {
>  		unsigned long msr = vcpu->arch.shregs.msr;
>  		if (MSR_TM_ACTIVE(msr)) {
>  			kvmppc_restore_tm_hv(vcpu, msr, true);
> @@ -316,8 +317,9 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
>  #endif
>  	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
>
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
> +	if ((cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
> +		       (vcpu->arch.hfscr & HFSCR_TM)) {
>  		unsigned long msr = vcpu->arch.shregs.msr;
>  		if (MSR_TM_ACTIVE(msr)) {
>  			kvmppc_save_tm_hv(vcpu, msr, true);
> @@ -326,6 +328,9 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
>  			vcpu->arch.tfhar = mfspr(SPRN_TFHAR);
>  			vcpu->arch.tfiar = mfspr(SPRN_TFIAR);
>  		}
> +		vcpu->arch.load_tm++; /* see load_ebb comment for details */
> +		if (!vcpu->arch.load_tm)
> +			vcpu->arch.hfscr &= ~HFSCR_TM;
>  	}
>  }
>  EXPORT_SYMBOL_GPL(store_vcpu_state);
> @@ -615,8 +620,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>  		msr |= MSR_VEC;
>  	if (cpu_has_feature(CPU_FTR_VSX))
>  		msr |= MSR_VSX;
> -	if (cpu_has_feature(CPU_FTR_TM) ||
> -	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> +	if ((cpu_has_feature(CPU_FTR_TM) ||
> +	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
> +			(vcpu->arch.hfscr & HFSCR_TM))
>  		msr |= MSR_TM;
>  	msr = msr_check_and_set(msr);
>  	/* Save MSR for restore. This is after hard disable, so EE is clear. */
