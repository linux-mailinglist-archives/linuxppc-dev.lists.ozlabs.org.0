Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F506346769
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 19:17:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4fjs3lj8z3bPX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 05:17:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pnjrK5jo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pnjrK5jo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4fjR1J7Fz309X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 05:17:30 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NI4lOJ080671; Tue, 23 Mar 2021 14:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=nE2BM7jtXZK+omjHyZTslaGaTZV2HHqps9nGRO3/HfE=;
 b=pnjrK5jotrNtqRwSkohvcQTZ/PZEzedxuiIaTHhGpnWtFB8mGWkPqPPA2jVyiUODDVg9
 YhJuJU6/O+S6UanDqWL1+iFWZg5bSegixzmSKgYUZB8ahvE0Cc6l/5rI9fTK3pqJ5a2q
 mVfVw+ze4Rv4ZYtuykvKZLbEO9RBNV+A4MNj31DVthNn1KN78u4+GwHwKs8nF68dTFxY
 D5Gjm53l6OrFFWkzAmV923kuorr3MfBMG5w+7ZbjojO3AwRRmgfFOiC7sMOqqdhgy10/
 XYPbLlenBtakZYxJAo2/BcnA2V5VvcLAbMoyn722bSsVvzOiRczArExKzVHvOuKsy4QG tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fmkfsnv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:17:28 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NI4mM7080772;
 Tue, 23 Mar 2021 14:17:28 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fmkfsnv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:17:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NIBcRf014684;
 Tue, 23 Mar 2021 18:17:27 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 37dycchu0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 18:17:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NIHQHA21955026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 18:17:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9499FC6057;
 Tue, 23 Mar 2021 18:17:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD5C7C605A;
 Tue, 23 Mar 2021 18:17:25 +0000 (GMT)
Received: from localhost (unknown [9.163.8.110])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 18:17:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v4 02/46] KVM: PPC: Book3S HV: Add a function to filter
 guest LPCR bits
In-Reply-To: <20210323010305.1045293-3-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-3-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 15:17:23 -0300
Message-ID: <87v99henv0.fsf@linux.ibm.com>
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

> Guest LPCR depends on hardware type, and future changes will add
> restrictions based on errata and guest MMU mode. Move this logic
> to a common function and use it for the cases where the guest
> wants to update its LPCR (or the LPCR of a nested guest).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_book3s.h |  2 +
>  arch/powerpc/kvm/book3s_hv.c          | 60 ++++++++++++++++++---------
>  arch/powerpc/kvm/book3s_hv_nested.c   |  3 +-
>  3 files changed, 45 insertions(+), 20 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index 2f5f919f6cd3..3eec3ef6f083 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -258,6 +258,8 @@ extern long kvmppc_hv_get_dirty_log_hpt(struct kvm *kvm,
>  extern void kvmppc_harvest_vpa_dirty(struct kvmppc_vpa *vpa,
>  			struct kvm_memory_slot *memslot,
>  			unsigned long *map);
> +extern unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc,
> +			unsigned long lpcr);
>  extern void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr,
>  			unsigned long mask);
>  extern void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 13bad6bf4c95..c4539c38c639 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1635,6 +1635,27 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>
> +/*
> + * Enforce limits on guest LPCR values based on hardware availability,
> + * guest configuration, and possibly hypervisor support and security
> + * concerns.
> + */
> +unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc, unsigned long lpcr)
> +{
> +	/* On POWER8 and above, userspace can modify AIL */
> +	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
> +		lpcr &= ~LPCR_AIL;
> +
> +	/*
> +	 * On POWER9, allow userspace to enable large decrementer for the
> +	 * guest, whether or not the host has it enabled.
> +	 */
> +	if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +		lpcr &= ~LPCR_LD;
> +
> +	return lpcr;
> +}
> +
>  static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
>  		bool preserve_top32)
>  {
> @@ -1643,6 +1664,23 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
>  	u64 mask;
>
>  	spin_lock(&vc->lock);
> +
> +	/*
> +	 * Userspace can only modify
> +	 * DPFD (default prefetch depth), ILE (interrupt little-endian),
> +	 * TC (translation control), AIL (alternate interrupt location),
> +	 * LD (large decrementer).
> +	 * These are subject to restrictions from kvmppc_filter_lcpr_hv().
> +	 */
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD;
> +
> +	/* Broken 32-bit version of LPCR must not clear top bits */
> +	if (preserve_top32)
> +		mask &= 0xFFFFFFFF;
> +
> +	new_lpcr = kvmppc_filter_lpcr_hv(vc,
> +			(vc->lpcr & ~mask) | (new_lpcr & mask));
> +
>  	/*
>  	 * If ILE (interrupt little-endian) has changed, update the
>  	 * MSR_LE bit in the intr_msr for each vcpu in this vcore.
> @@ -1661,25 +1699,8 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
>  		}
>  	}
>
> -	/*
> -	 * Userspace can only modify DPFD (default prefetch depth),
> -	 * ILE (interrupt little-endian) and TC (translation control).
> -	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt loc.).
> -	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC;
> -	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> -		mask |= LPCR_AIL;
> -	/*
> -	 * On POWER9, allow userspace to enable large decrementer for the
> -	 * guest, whether or not the host has it enabled.
> -	 */
> -	if (cpu_has_feature(CPU_FTR_ARCH_300))
> -		mask |= LPCR_LD;
> +	vc->lpcr = new_lpcr;
>
> -	/* Broken 32-bit version of LPCR must not clear top bits */
> -	if (preserve_top32)
> -		mask &= 0xFFFFFFFF;
> -	vc->lpcr = (vc->lpcr & ~mask) | (new_lpcr & mask);
>  	spin_unlock(&vc->lock);
>  }
>
> @@ -4641,8 +4662,9 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
>  		struct kvmppc_vcore *vc = kvm->arch.vcores[i];
>  		if (!vc)
>  			continue;
> +
>  		spin_lock(&vc->lock);
> -		vc->lpcr = (vc->lpcr & ~mask) | lpcr;
> +		vc->lpcr = kvmppc_filter_lpcr_hv(vc, (vc->lpcr & ~mask) | lpcr);
>  		spin_unlock(&vc->lock);
>  		if (++cores_done >= kvm->arch.online_vcores)
>  			break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 2fe1fea4c934..f7b441b3eb17 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -142,7 +142,8 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  	 */
>  	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>  		LPCR_LPES | LPCR_MER;
> -	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
> +	hr->lpcr = kvmppc_filter_lpcr_hv(vc,
> +			(vc->lpcr & ~mask) | (hr->lpcr & mask));
>
>  	/*
>  	 * Don't let L1 enable features for L2 which we've disabled for L1,
