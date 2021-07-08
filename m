Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBE3C189A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 19:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLNyT1cyWz3bhs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 03:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k15KPhk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k15KPhk4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLNxw6jPJz309k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 03:46:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168HX6eL142007; Thu, 8 Jul 2021 13:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HumTD5dmqMHM+IL75USGD7DZmNOf9ty3CPFf2Nd/5Uo=;
 b=k15KPhk4Rd0N9c8ObrEYh4WGBP1iQqr3NnDjztU2xFaJfKcfTtanUYRTpFLzgifpC2OH
 SpllDxG6dlwW3wm0zgp7rg42Qy+DgxU/ZegJzWm+UNmXf1/oUjMbCIbJHKj/mr7RFz4Y
 8ABBCfxbr0l+FVNQE6GCMFCzxlJIFVGequL6F253wxzsJxbSKac1QE5UimP4YQnnG44j
 BjM+G0gutYjp06/9sk3t/W6ehBNbpYX/hBIk0yt36m5MIo0QosUt19ydmpc8qAQhr68o
 1zfTiJPW0xKfScWqtobVENGQGkPr+PYa3sOTSiweTHbVgDWzODHfUWMT32rNG+FMahES DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nhkj0e84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:46:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168HXIdf142526;
 Thu, 8 Jul 2021 13:46:08 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nhkj0e7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:46:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168HjXt7030825;
 Thu, 8 Jul 2021 17:46:07 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 39jfhegwn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 17:46:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168Hk7UU52822330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 17:46:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA0CFAC06A;
 Thu,  8 Jul 2021 17:46:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B1CDAC060;
 Thu,  8 Jul 2021 17:46:06 +0000 (GMT)
Received: from localhost (unknown [9.211.64.106])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 17:46:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 34/43] KVM: PPC: Book3S HV P9: Demand fault EBB
 facility registers
In-Reply-To: <20210622105736.633352-35-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-35-npiggin@gmail.com>
Date: Thu, 08 Jul 2021 14:46:03 -0300
Message-ID: <87v95kog10.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SN-I4IBP-dEh2VrHg_C2om3dlXZlGbdN
X-Proofpoint-ORIG-GUID: GaLm_k-_nZy4_-BQGIweMJI2VR4u55jg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_10:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107080093
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

> Use HFSCR facility disabling to implement demand faulting for EBB, with
> a hysteresis counter similar to the load_fp etc counters in context
> switching that implement the equivalent demand faulting for userspace
> facilities.
>
> This speeds up guest entry/exit by avoiding the register save/restore
> when a guest is not frequently using them. When a guest does use them
> often, there will be some additional demand fault overhead, but these
> are not commonly used facilities.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_host.h   |  1 +
>  arch/powerpc/kvm/book3s_hv.c          | 11 +++++++++++
>  arch/powerpc/kvm/book3s_hv_nested.c   |  3 ++-
>  arch/powerpc/kvm/book3s_hv_p9_entry.c | 26 ++++++++++++++++++++------
>  4 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 118b388ea887..bee95106c1f2 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -585,6 +585,7 @@ struct kvm_vcpu_arch {
>  	ulong cfar;
>  	ulong ppr;
>  	u32 pspb;
> +	u8 load_ebb;
>  	ulong fscr;
>  	ulong shadow_fscr;
>  	ulong ebbhr;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index ae528eb37792..99e9da078e7d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1366,6 +1366,13 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
>  	return RESUME_GUEST;
>  }
>
> +static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.hfscr |= HFSCR_EBB;
> +
> +	return RESUME_GUEST;
> +}
> +
>  static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  				 struct task_struct *tsk)
>  {
> @@ -1645,6 +1652,8 @@ XXX benchmark guest exits
>  				r = kvmppc_emulate_doorbell_instr(vcpu);
>  			if (cause == FSCR_PM_LG)
>  				r = kvmppc_pmu_unavailable(vcpu);
> +			if (cause == FSCR_EBB_LG)
> +				r = kvmppc_ebb_unavailable(vcpu);
>  		}
>  		if (r == EMULATE_FAIL) {
>  			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> @@ -1764,6 +1773,8 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
>  		r = EMULATE_FAIL;
>  		if (cause == FSCR_PM_LG && (vcpu->arch.nested_hfscr & HFSCR_PM))
>  			r = kvmppc_pmu_unavailable(vcpu);
> +		if (cause == FSCR_EBB_LG && (vcpu->arch.nested_hfscr & HFSCR_EBB))
> +			r = kvmppc_ebb_unavailable(vcpu);
>
>  		if (r == EMULATE_FAIL)
>  			r = RESUME_HOST;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 024b0ce5b702..ee8668f056f9 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -168,7 +168,8 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  	 * but preserve the interrupt cause field and facilities that might
>  	 * be disabled for demand faulting in the L1.
>  	 */
> -	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | vcpu->arch.hfscr);
> +	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_EBB |
> +			vcpu->arch.hfscr);
>
>  	/* Don't let data address watchpoint match in hypervisor state */
>  	hr->dawrx0 &= ~DAWRX_HYP;
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> index 4d1a2d1ff4c1..cf41261daa97 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -218,9 +218,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
>  				struct p9_host_os_sprs *host_os_sprs)
>  {
>  	mtspr(SPRN_TAR, vcpu->arch.tar);
> -	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
> -	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
> -	mtspr(SPRN_BESCR, vcpu->arch.bescr);
> +
> +	if (vcpu->arch.hfscr & HFSCR_EBB) {
> +		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
> +		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
> +		mtspr(SPRN_BESCR, vcpu->arch.bescr);
> +	}
>
>  	if (!cpu_has_feature(CPU_FTR_ARCH_31))
>  		mtspr(SPRN_TIDR, vcpu->arch.tid);
> @@ -251,9 +254,20 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
>  static void store_spr_state(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.tar = mfspr(SPRN_TAR);
> -	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
> -	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
> -	vcpu->arch.bescr = mfspr(SPRN_BESCR);
> +
> +	if (vcpu->arch.hfscr & HFSCR_EBB) {
> +		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
> +		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
> +		vcpu->arch.bescr = mfspr(SPRN_BESCR);
> +		/*
> +		 * This is like load_fp in context switching, turn off the
> +		 * facility after it wraps the u8 to try avoiding saving
> +		 * and restoring the registers each partition switch.
> +		 */
> +		vcpu->arch.load_ebb++;
> +		if (!vcpu->arch.load_ebb)
> +			vcpu->arch.hfscr &= ~HFSCR_EBB;
> +	}
>
>  	if (!cpu_has_feature(CPU_FTR_ARCH_31))
>  		vcpu->arch.tid = mfspr(SPRN_TIDR);
