Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2C32A158
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 14:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqdlT2d9kz3d3N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 00:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXtksNvC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IXtksNvC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqdl11m5qz3cGL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 00:48:44 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122DgP9b061236; Tue, 2 Mar 2021 08:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=riTCkS+WaX3vectjV6Ikzt39eqT8+5dLlkbJa1ICReI=;
 b=IXtksNvCqCHBTWXqCPawNijBGQrjxD9Ds3wbONAC0QOxVww1V4HPnULKY4qAfYtqI4Tg
 p7mlTTM2YuGxf9WD7rizfhnhqhVm95FRN3QkK36mvk5nF/AwWLj2vM9eE7PzigfdY2+M
 eNYD3IUdnRC2cIfICvvm0E/LqGy5MEQKFRJI/4oxVhHYeNQGfb4uY39/O1uFpAUSLy7y
 cZGUc1kEolCLAZwOjq4ZAbhYbyWIfn+Xl5ThdYeZpa+5wI890aO9vyq99WYzLsjSJXFa
 CW5wY0BDvBAEhDyI346mjooEeQIEiw3zBeACOH332uqv4UWiqmVlzrSuA1Edvg/mkTjQ JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371p7p0dxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 08:48:41 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Dhgwd063920;
 Tue, 2 Mar 2021 08:48:41 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371p7p0dwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 08:48:41 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122DgO6K017550;
 Tue, 2 Mar 2021 13:48:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 36ydq957jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 13:48:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122Dmcwf21234132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 13:48:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F5D878063;
 Tue,  2 Mar 2021 13:48:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1C547805C;
 Tue,  2 Mar 2021 13:48:37 +0000 (GMT)
Received: from localhost (unknown [9.211.36.193])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Mar 2021 13:48:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 24/37] KVM: PPC: Book3S HV P9: inline
 kvmhv_load_hv_regs_and_go into __kvmhv_vcpu_entry_p9
In-Reply-To: <20210225134652.2127648-25-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-25-npiggin@gmail.com>
Date: Tue, 02 Mar 2021 10:48:35 -0300
Message-ID: <87tuptwtsc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020111
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

> Now the initial C implementation is done, inline more HV code to make
> rearranging things easier.
>
> And rename __kvmhv_vcpu_entry_p9 to drop the leading underscores as it's
> now C, and is now a more complete vcpu entry.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_book3s_64.h |   2 +-
>  arch/powerpc/kvm/book3s_hv.c             | 181 +----------------------
>  arch/powerpc/kvm/book3s_hv_interrupt.c   | 168 ++++++++++++++++++++-
>  3 files changed, 169 insertions(+), 182 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
> index c214bcffb441..eaf3a562bf1e 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
> @@ -153,7 +153,7 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
>  	return radix;
>  }
>
> -int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
> +int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr);
>
>  #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
>  #endif
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 28a2761515e3..f99503acdda5 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3442,183 +3442,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>  	trace_kvmppc_run_core(vc, 1);
>  }
>
> -static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
> -{
> -	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> -	struct kvm_nested_guest *nested = vcpu->arch.nested;
> -	u32 lpid;
> -
> -	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
> -
> -	mtspr(SPRN_LPID, lpid);
> -	mtspr(SPRN_LPCR, lpcr);
> -	mtspr(SPRN_PID, vcpu->arch.pid);
> -	isync();
> -
> -	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
> -	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
> -}
> -
> -static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
> -{
> -	mtspr(SPRN_PID, pid);
> -	mtspr(SPRN_LPID, kvm->arch.host_lpid);
> -	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
> -	isync();
> -}
> -
> -/*
> - * Load up hypervisor-mode registers on P9.
> - */
> -static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> -				     unsigned long lpcr)
> -{
> -	struct kvm *kvm = vcpu->kvm;
> -	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> -	s64 hdec;
> -	u64 tb, purr, spurr;
> -	int trap;
> -	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
> -	unsigned long host_ciabr = mfspr(SPRN_CIABR);
> -	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
> -	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
> -	unsigned long host_psscr = mfspr(SPRN_PSSCR);
> -	unsigned long host_pidr = mfspr(SPRN_PID);
> -	unsigned long host_dawr1 = 0;
> -	unsigned long host_dawrx1 = 0;
> -
> -	if (cpu_has_feature(CPU_FTR_DAWR1)) {
> -		host_dawr1 = mfspr(SPRN_DAWR1);
> -		host_dawrx1 = mfspr(SPRN_DAWRX1);
> -	}
> -
> -	tb = mftb();
> -	hdec = time_limit - tb;
> -	if (hdec < 0)
> -		return BOOK3S_INTERRUPT_HV_DECREMENTER;
> -
> -	if (vc->tb_offset) {
> -		u64 new_tb = tb + vc->tb_offset;
> -		mtspr(SPRN_TBU40, new_tb);
> -		tb = mftb();
> -		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> -			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> -		vc->tb_offset_applied = vc->tb_offset;
> -	}
> -
> -	if (vc->pcr)
> -		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
> -	mtspr(SPRN_DPDES, vc->dpdes);
> -	mtspr(SPRN_VTB, vc->vtb);
> -
> -	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
> -	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
> -	mtspr(SPRN_PURR, vcpu->arch.purr);
> -	mtspr(SPRN_SPURR, vcpu->arch.spurr);
> -
> -	if (dawr_enabled()) {
> -		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
> -		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
> -		if (cpu_has_feature(CPU_FTR_DAWR1)) {
> -			mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
> -			mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
> -		}
> -	}
> -	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
> -	mtspr(SPRN_IC, vcpu->arch.ic);
> -
> -	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
> -	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> -
> -	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
> -
> -	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
> -	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
> -	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
> -	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
> -
> -	mtspr(SPRN_AMOR, ~0UL);
> -
> -	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
> -
> -	/*
> -	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
> -	 * so set guest LPCR (with HDICE) before writing HDEC.
> -	 */
> -	mtspr(SPRN_HDEC, hdec);
> -
> -	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
> -	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
> -
> -	trap = __kvmhv_vcpu_entry_p9(vcpu);
> -
> -	/* Advance host PURR/SPURR by the amount used by guest */
> -	purr = mfspr(SPRN_PURR);
> -	spurr = mfspr(SPRN_SPURR);
> -	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr +
> -	      purr - vcpu->arch.purr);
> -	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr +
> -	      spurr - vcpu->arch.spurr);
> -	vcpu->arch.purr = purr;
> -	vcpu->arch.spurr = spurr;
> -
> -	vcpu->arch.ic = mfspr(SPRN_IC);
> -	vcpu->arch.pid = mfspr(SPRN_PID);
> -	vcpu->arch.psscr = mfspr(SPRN_PSSCR) & PSSCR_GUEST_VIS;
> -
> -	vcpu->arch.shregs.sprg0 = mfspr(SPRN_SPRG0);
> -	vcpu->arch.shregs.sprg1 = mfspr(SPRN_SPRG1);
> -	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
> -	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
> -
> -	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
> -	mtspr(SPRN_PSSCR, host_psscr |
> -	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> -	mtspr(SPRN_HFSCR, host_hfscr);
> -	mtspr(SPRN_CIABR, host_ciabr);
> -	mtspr(SPRN_DAWR0, host_dawr0);
> -	mtspr(SPRN_DAWRX0, host_dawrx0);
> -	if (cpu_has_feature(CPU_FTR_DAWR1)) {
> -		mtspr(SPRN_DAWR1, host_dawr1);
> -		mtspr(SPRN_DAWRX1, host_dawrx1);
> -	}
> -
> -	/*
> -	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
> -	 * case we interrupted the guest between a tlbie and a ptesync.
> -	 */
> -	asm volatile("eieio; tlbsync; ptesync");
> -
> -	/*
> -	 * cp_abort is required if the processor supports local copy-paste
> -	 * to clear the copy buffer that was under control of the guest.
> -	 */
> -	if (cpu_has_feature(CPU_FTR_ARCH_31))
> -		asm volatile(PPC_CP_ABORT);
> -
> -	vc->dpdes = mfspr(SPRN_DPDES);
> -	vc->vtb = mfspr(SPRN_VTB);
> -	mtspr(SPRN_DPDES, 0);
> -	if (vc->pcr)
> -		mtspr(SPRN_PCR, PCR_MASK);
> -
> -	if (vc->tb_offset_applied) {
> -		u64 new_tb = mftb() - vc->tb_offset_applied;
> -		mtspr(SPRN_TBU40, new_tb);
> -		tb = mftb();
> -		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> -			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> -		vc->tb_offset_applied = 0;
> -	}
> -
> -	/* HDEC must be at least as large as DEC, so decrementer_max fits */
> -	mtspr(SPRN_HDEC, decrementer_max);
> -
> -	switch_mmu_to_host_radix(kvm, host_pidr);
> -
> -	return trap;
> -}
> -
>  /*
>   * Virtual-mode guest entry for POWER9 and later when the host and
>   * guest are both using the radix MMU.  The LPIDR has already been set.
> @@ -3710,7 +3533,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		 * We need to save and restore the guest visible part of the
>  		 * psscr (i.e. using SPRN_PSSCR_PR) since the hypervisor
>  		 * doesn't do this for us. Note only required if pseries since
> -		 * this is done in kvmhv_load_hv_regs_and_go() below otherwise.
> +		 * this is done in kvmhv_vcpu_entry_p9() below otherwise.
>  		 */
>  		unsigned long host_psscr;
>  		/* call our hypervisor to load up HV regs and go */
> @@ -3748,7 +3571,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	} else {
>  		kvmppc_xive_push_vcpu(vcpu);
> -		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
> +		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
>  		/* H_CEDE has to be handled now, not later */
>  		/* XICS hcalls must be handled before xive is pulled */
>  		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
> index 5a7b036c447f..dea3eca3648a 100644
> --- a/arch/powerpc/kvm/book3s_hv_interrupt.c
> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
> @@ -55,6 +55,31 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
>  #define accumulate_time(vcpu, next) do {} while (0)
>  #endif
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
>  static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
>  {
>  	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
> @@ -94,11 +119,86 @@ static void radix_clear_slb(void)
>  	}
>  }
>
> -int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
> +int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
>  {
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	s64 hdec;
> +	u64 tb, purr, spurr;
>  	u64 *exsave;
>  	unsigned long msr = mfmsr();
>  	int trap;
> +	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
> +	unsigned long host_ciabr = mfspr(SPRN_CIABR);
> +	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
> +	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
> +	unsigned long host_psscr = mfspr(SPRN_PSSCR);
> +	unsigned long host_pidr = mfspr(SPRN_PID);
> +	unsigned long host_dawr1 = 0;
> +	unsigned long host_dawrx1 = 0;
> +
> +	if (cpu_has_feature(CPU_FTR_DAWR1)) {
> +		host_dawr1 = mfspr(SPRN_DAWR1);
> +		host_dawrx1 = mfspr(SPRN_DAWRX1);
> +	}
> +
> +	tb = mftb();
> +	hdec = time_limit - tb;
> +	if (hdec < 0)
> +		return BOOK3S_INTERRUPT_HV_DECREMENTER;
> +
> +	if (vc->tb_offset) {
> +		u64 new_tb = tb + vc->tb_offset;
> +		mtspr(SPRN_TBU40, new_tb);
> +		tb = mftb();
> +		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> +			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> +		vc->tb_offset_applied = vc->tb_offset;
> +	}
> +
> +	if (vc->pcr)
> +		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
> +	mtspr(SPRN_DPDES, vc->dpdes);
> +	mtspr(SPRN_VTB, vc->vtb);
> +
> +	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
> +	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
> +	mtspr(SPRN_PURR, vcpu->arch.purr);
> +	mtspr(SPRN_SPURR, vcpu->arch.spurr);
> +
> +	if (dawr_enabled()) {
> +		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
> +		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
> +		if (cpu_has_feature(CPU_FTR_DAWR1)) {
> +			mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
> +			mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
> +		}
> +	}
> +	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
> +	mtspr(SPRN_IC, vcpu->arch.ic);
> +
> +	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
> +	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> +
> +	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
> +
> +	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
> +	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
> +	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
> +	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
> +
> +	mtspr(SPRN_AMOR, ~0UL);
> +
> +	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
> +
> +	/*
> +	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
> +	 * so set guest LPCR (with HDICE) before writing HDEC.
> +	 */
> +	mtspr(SPRN_HDEC, hdec);
> +
> +	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
> +	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
>
>  	start_timing(vcpu, &vcpu->arch.rm_entry);
>
> @@ -216,6 +316,70 @@ int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
>
>  	end_timing(vcpu);
>
> +	/* Advance host PURR/SPURR by the amount used by guest */
> +	purr = mfspr(SPRN_PURR);
> +	spurr = mfspr(SPRN_SPURR);
> +	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr +
> +	      purr - vcpu->arch.purr);
> +	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr +
> +	      spurr - vcpu->arch.spurr);
> +	vcpu->arch.purr = purr;
> +	vcpu->arch.spurr = spurr;
> +
> +	vcpu->arch.ic = mfspr(SPRN_IC);
> +	vcpu->arch.pid = mfspr(SPRN_PID);
> +	vcpu->arch.psscr = mfspr(SPRN_PSSCR) & PSSCR_GUEST_VIS;
> +
> +	vcpu->arch.shregs.sprg0 = mfspr(SPRN_SPRG0);
> +	vcpu->arch.shregs.sprg1 = mfspr(SPRN_SPRG1);
> +	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
> +	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
> +
> +	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
> +	mtspr(SPRN_PSSCR, host_psscr |
> +	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> +	mtspr(SPRN_HFSCR, host_hfscr);
> +	mtspr(SPRN_CIABR, host_ciabr);
> +	mtspr(SPRN_DAWR0, host_dawr0);
> +	mtspr(SPRN_DAWRX0, host_dawrx0);
> +	if (cpu_has_feature(CPU_FTR_DAWR1)) {
> +		mtspr(SPRN_DAWR1, host_dawr1);
> +		mtspr(SPRN_DAWRX1, host_dawrx1);
> +	}
> +
> +	/*
> +	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
> +	 * case we interrupted the guest between a tlbie and a ptesync.
> +	 */
> +	asm volatile("eieio; tlbsync; ptesync");
> +
> +	/*
> +	 * cp_abort is required if the processor supports local copy-paste
> +	 * to clear the copy buffer that was under control of the guest.
> +	 */
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		asm volatile(PPC_CP_ABORT);
> +
> +	vc->dpdes = mfspr(SPRN_DPDES);
> +	vc->vtb = mfspr(SPRN_VTB);
> +	mtspr(SPRN_DPDES, 0);
> +	if (vc->pcr)
> +		mtspr(SPRN_PCR, PCR_MASK);
> +
> +	if (vc->tb_offset_applied) {
> +		u64 new_tb = mftb() - vc->tb_offset_applied;
> +		mtspr(SPRN_TBU40, new_tb);
> +		tb = mftb();
> +		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> +			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> +		vc->tb_offset_applied = 0;
> +	}
> +
> +	/* HDEC must be at least as large as DEC, so decrementer_max fits */
> +	mtspr(SPRN_HDEC, decrementer_max);
> +
> +	switch_mmu_to_host_radix(kvm, host_pidr);
> +
>  	return trap;
>  }
> -EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9);
> +EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
