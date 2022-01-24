Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E26499CD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjPQg40tkz3bTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AC4eJfZl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AC4eJfZl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjPPx1jyGz2x9S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:13:25 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OLlgks011899
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=JzGFUDCRsAL1J0CfS0MLbrCg3QwYO48NFx3ZBRmIXP8=;
 b=AC4eJfZl0MwcHlH6ltmO5BYc6lo3ZbH5UQIdX2XhuRt6Zb9rN2eK0CTN5HE7v7BvZWi3
 txTTFzurWPE2Ko0FnQLHneu4jgbhkrVessdAv68ovRH5he2tY1vqdVJFdyi80OernMN7
 H4tlixhU6uWwV80XylaMAPViof1VHhvrDqkjqbBAAibR28OateGNab9+HSC0EQsM7fAL
 Ztyrm/DCQqwG8rO2eWR2lPoyOfby/YO69lrDktsKCW8LXbamQUJl9E9HfDcWjaV3w8vT
 vHCbpleO3puTjRAWWHfLu1Gb33WR3kytrDaAo3T8ZjMqK/jfrrOBm4ha49pVZ2INYtL5 kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt4bb0enb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:13:22 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OM39Ms030025
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:13:22 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt4bb0en4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:13:22 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OM78OY012268;
 Mon, 24 Jan 2022 22:13:21 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3dr9j9sqx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:13:21 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMDKdY34537782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:13:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65545BE059;
 Mon, 24 Jan 2022 22:13:20 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B563EBE053;
 Mon, 24 Jan 2022 22:13:19 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:13:19 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] KVM: PPC: Book3S HV: Update LPID allocator init for
 POWER9, Nested
In-Reply-To: <20220123120043.3586018-3-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
 <20220123120043.3586018-3-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:13:17 -0300
Message-ID: <87lez4eq9u.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yZ6OCjtQN5Yc4xyGbG-ZT9ye-pZIfC32
X-Proofpoint-ORIG-GUID: aETFTex8oXKY3QxS2MOxXWT39R8D1v_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240143
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

> The LPID allocator init is changed to:
> - use mmu_lpid_bits rather than hard-coding;
> - use KVM_MAX_NESTED_GUESTS for nested hypervisors;
> - not reserve the top LPID on POWER9 and newer CPUs.
>
> The reserved LPID is made a POWER7/8-specific detail.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

>  arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
>  arch/powerpc/include/asm/reg.h            |  2 --
>  arch/powerpc/kvm/book3s_64_mmu_hv.c       | 29 ++++++++++++++++-------
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  8 +++++++
>  arch/powerpc/mm/init_64.c                 |  3 +++
>  5 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
> index b6d31bff5209..e6bda70b1d93 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> @@ -15,7 +15,7 @@
>  #define XICS_IPI		2	/* interrupt source # for IPIs */
>
>  /* LPIDs we support with this build -- runtime limit may be lower */
> -#define KVMPPC_NR_LPIDS			(LPID_RSVD + 1)
> +#define KVMPPC_NR_LPIDS			(1UL << 12)
>
>  /* Maximum number of threads per physical core */
>  #define MAX_SMT_THREADS		8
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 1e14324c5190..1e8b2e04e626 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -473,8 +473,6 @@
>  #ifndef SPRN_LPID
>  #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
>  #endif
> -#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching */
> -#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
>  #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
>  #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
>  #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 09fc52b6f390..5be92d5bc099 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -256,7 +256,7 @@ void kvmppc_map_vrma(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>
>  int kvmppc_mmu_hv_init(void)
>  {
> -	unsigned long rsvd_lpid;
> +	unsigned long nr_lpids;
>
>  	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE))
>  		return -EINVAL;
> @@ -264,16 +264,29 @@ int kvmppc_mmu_hv_init(void)
>  	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>  		if (WARN_ON(mfspr(SPRN_LPID) != 0))
>  			return -EINVAL;
> +		nr_lpids = 1UL << mmu_lpid_bits;
> +	} else {
> +		nr_lpids = KVM_MAX_NESTED_GUESTS;
>  	}
>
> -	/* POWER8 and above have 12-bit LPIDs (10-bit in POWER7) */
> -	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> -		rsvd_lpid = LPID_RSVD;
> -	else
> -		rsvd_lpid = LPID_RSVD_POWER7;
> +	if (nr_lpids > KVMPPC_NR_LPIDS)
> +		nr_lpids = KVMPPC_NR_LPIDS;
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
> +		/* POWER7 has 10-bit LPIDs, POWER8 has 12-bit LPIDs */
> +		if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +			WARN_ON(nr_lpids != 1UL << 12);
> +		else
> +			WARN_ON(nr_lpids != 1UL << 10);
> +
> +		/*
> +		 * Reserve the last implemented LPID use in partition
> +		 * switching for POWER7 and POWER8.
> +		 */
> +		nr_lpids -= 1;
> +	}
>
> -	/* rsvd_lpid is reserved for use in partition switching */
> -	kvmppc_init_lpid(rsvd_lpid);
> +	kvmppc_init_lpid(nr_lpids);
>
>  	return 0;
>  }
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index d185dee26026..0c552885a032 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -50,6 +50,14 @@
>  #define STACK_SLOT_UAMOR	(SFS-88)
>  #define STACK_SLOT_FSCR		(SFS-96)
>
> +/*
> + * Use the last LPID (all implemented LPID bits = 1) for partition switching.
> + * This is reserved in the LPID allocator. POWER7 only implements 0x3ff, but
> + * we write 0xfff into the LPID SPR anyway, which seems to work and just
> + * ignores the top bits.
> + */
> +#define   LPID_RSVD		0xfff
> +
>  /*
>   * Call kvmppc_hv_entry in real mode.
>   * Must be called with interrupts hard-disabled.
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 35f46bf54281..ad1a41e3ff1c 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -371,6 +371,9 @@ void register_page_bootmem_memmap(unsigned long section_nr,
>
>  #ifdef CONFIG_PPC_BOOK3S_64
>  unsigned int mmu_lpid_bits;
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +EXPORT_SYMBOL_GPL(mmu_lpid_bits);
> +#endif
>  unsigned int mmu_pid_bits;
>
>  static bool disable_radix = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
