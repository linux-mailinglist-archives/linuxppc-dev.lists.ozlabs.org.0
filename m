Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3E3AF1A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 19:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7x1l34KCz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:13:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZgsKpayF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZgsKpayF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7x1J47kJz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:12:52 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AE3260FF2;
 Mon, 21 Jun 2021 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624295567;
 bh=8VLeKNLmsN8yXnBWPFldftKQFXRHteWlP0dfds+25Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZgsKpayFEaDCuVwz+OZinwWFqETsbJtTXJCiFObQdpFQX7NCwkGyNry1/4i+bxPwc
 IgneRIQNtPf1tAqhMbCdTltryRoFFaERZhcV+IWsxlIeKJ+seoRPFfTOkft47bDJwH
 9loBYe1aYLli1xB+U8ukIQQV93f7z/3US/mhPwRknJRw++1PwN2toUr3ytEzC1EpYb
 5ZQ235QrnKRv7K6+p1Zt4S1PGDuJzSNmNtpUaSIugYEPniQnHLU7/Ud4GpOwlcPkRY
 UcQIyMjxEP7Gb9a+wLXbspLqnDFlI70JkE1gfXsteZFJrJ8dr1a5TR4s45WBmY+lwM
 qM4gNqlhViH2w==
Date: Mon, 21 Jun 2021 10:12:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v8 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
Message-ID: <YNDIitJ3Hn1/G8Jw@Ryzen-9-3900X.localdomain>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-5-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621085003.904767-5-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 02:20:01PM +0530, Bharata B Rao wrote:
> Enable support for process-scoped invalidations from nested
> guests and partition-scoped invalidations for nested guests.
> 
> Process-scoped invalidations for any level of nested guests
> are handled by implementing H_RPT_INVALIDATE handler in the
> nested guest exit path in L0.
> 
> Partition-scoped invalidation requests are forwarded to the
> right nested guest, handled there and passed down to L0
> for eventual handling.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 	[Nested guest partition-scoped invalidation changes]
> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/kvm/book3s_hv.c                  |  59 ++++++++-
>  arch/powerpc/kvm/book3s_hv_nested.c           | 117 ++++++++++++++++++
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
>  5 files changed, 180 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> index 8b33601cdb9d..a46fd37ad552 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -4,6 +4,10 @@
>  
>  #include <asm/hvcall.h>
>  
> +#define RIC_FLUSH_TLB 0
> +#define RIC_FLUSH_PWC 1
> +#define RIC_FLUSH_ALL 2
> +
>  struct vm_area_struct;
>  struct mm_struct;
>  struct mmu_gather;
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index e6b53c6e21e3..caaa0f592d8e 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -307,6 +307,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end);
>  int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  			  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 7e6da4687d88..3d5b8ba3786d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -925,6 +925,34 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
>  	return yield_count;
>  }
>  
> +/*
> + * H_RPT_INVALIDATE hcall handler for nested guests.
> + *
> + * Handles only nested process-scoped invalidation requests in L0.
> + */
> +static int kvmppc_nested_h_rpt_invalidate(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long type = kvmppc_get_gpr(vcpu, 6);
> +	unsigned long pid, pg_sizes, start, end;
> +
> +	/*
> +	 * The partition-scoped invalidations aren't handled here in L0.
> +	 */
> +	if (type & H_RPTI_TYPE_NESTED)
> +		return RESUME_HOST;
> +
> +	pid = kvmppc_get_gpr(vcpu, 4);
> +	pg_sizes = kvmppc_get_gpr(vcpu, 7);
> +	start = kvmppc_get_gpr(vcpu, 8);
> +	end = kvmppc_get_gpr(vcpu, 9);
> +
> +	do_h_rpt_invalidate_prt(pid, vcpu->arch.nested->shadow_lpid,
> +				type, pg_sizes, start, end);
> +
> +	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> +	return RESUME_GUEST;
> +}
> +
>  static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
>  				    unsigned long id, unsigned long target,
>  				    unsigned long type, unsigned long pg_sizes,
> @@ -938,10 +966,18 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
>  
>  	/*
>  	 * Partition-scoped invalidation for nested guests.
> -	 * Not yet supported
>  	 */
> -	if (type & H_RPTI_TYPE_NESTED)
> -		return H_P3;
> +	if (type & H_RPTI_TYPE_NESTED) {
> +		if (!nesting_enabled(vcpu->kvm))
> +			return H_FUNCTION;
> +
> +		/* Support only cores as target */
> +		if (target != H_RPTI_TARGET_CMMU)
> +			return H_P2;
> +
> +		return do_h_rpt_invalidate_pat(vcpu, id, type, pg_sizes,
> +					       start, end);
> +	}
>  
>  	/*
>  	 * Process-scoped invalidation for L1 guests.
> @@ -1629,6 +1665,23 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
>  		if (!xics_on_xive())
>  			kvmppc_xics_rm_complete(vcpu, 0);
>  		break;
> +	case BOOK3S_INTERRUPT_SYSCALL:
> +	{
> +		unsigned long req = kvmppc_get_gpr(vcpu, 3);
> +
> +		/*
> +		 * The H_RPT_INVALIDATE hcalls issued by nested
> +		 * guests for process-scoped invalidations when
> +		 * GTSE=0, are handled here in L0.
> +		 */
> +		if (req == H_RPT_INVALIDATE) {
> +			r = kvmppc_nested_h_rpt_invalidate(vcpu);
> +			break;
> +		}
> +
> +		r = RESUME_HOST;
> +		break;
> +	}
>  	default:
>  		r = RESUME_HOST;
>  		break;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 60724f674421..056d3df68de1 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1214,6 +1214,123 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
>  	return H_SUCCESS;
>  }
>  
> +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid,
> +					 unsigned long page_size,
> +					 unsigned long ap,
> +					 unsigned long start,
> +					 unsigned long end)
> +{
> +	unsigned long addr = start;
> +	int ret;
> +
> +	do {
> +		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> +						   get_epn(addr));
> +		if (ret)
> +			return ret;
> +		addr += page_size;
> +	} while (addr < end);
> +
> +	return ret;
> +}
> +
> +static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid, unsigned long ric)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_nested_guest *gp;
> +
> +	gp = kvmhv_get_nested(kvm, lpid, false);
> +	if (gp) {
> +		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
> +		kvmhv_put_nested(gp);
> +	}
> +	return H_SUCCESS;
> +}
> +
> +/*
> + * Number of pages above which we invalidate the entire LPID rather than
> + * flush individual pages.
> + */
> +static unsigned long tlb_range_flush_page_ceiling __read_mostly = 33;
> +
> +/*
> + * Performs partition-scoped invalidations for nested guests
> + * as part of H_RPT_INVALIDATE hcall.
> + */
> +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> +			     unsigned long type, unsigned long pg_sizes,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct kvm_nested_guest *gp;
> +	long ret;
> +	unsigned long psize, ap;
> +
> +	/*
> +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> +	 *
> +	 * However, nested KVM issues a L2 lpid flush call when creating
> +	 * partition table entries for L2. This happens even before the
> +	 * corresponding shadow lpid is created in HV which happens in
> +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> +	 * the invalid case, we ignore such flush requests and return success.
> +	 */
> +	gp = kvmhv_find_nested(vcpu->kvm, lpid);
> +	if (!gp)
> +		return H_SUCCESS;
> +
> +	/*
> +	 * A flush all request can be handled by a full lpid flush only.
> +	 */
> +	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
> +
> +	/*
> +	 * We don't need to handle a PWC flush like process table here,
> +	 * because intermediate partition scoped table in nested guest doesn't
> +	 * really have PWC. Only level we have PWC is in L0 and for nested
> +	 * invalidate at L0 we always do kvm_flush_lpid() which does
> +	 * radix__flush_all_lpid(). For range invalidate at any level, we
> +	 * are not removing the higher level page tables and hence there is
> +	 * no PWC invalidate needed.
> +	 *
> +	 * if (type & H_RPTI_TYPE_PWC) {
> +	 *	ret = do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
> +	 *	if (ret)
> +	 *		return H_P4;
> +	 * }
> +	 */
> +
> +	if (start == 0 && end == -1)
> +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
> +
> +	if (type & H_RPTI_TYPE_TLB) {
> +		struct mmu_psize_def *def;
> +		bool flush_lpid;
> +		unsigned long nr_pages;
> +
> +		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> +			def = &mmu_psize_defs[psize];
> +			if (!(pg_sizes & def->h_rpt_pgsize))
> +				continue;
> +
> +			nr_pages = (end - start) >> def->shift;
> +			flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
> +			if (flush_lpid)
> +				return do_tlb_invalidate_nested_all(vcpu, lpid,
> +								RIC_FLUSH_TLB);
> +
> +			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
> +							   (1UL << def->shift),
> +							   ap, start, end);

I have not seen this reported yet so apologies if it has and there is a
fix I am missing:

arch/powerpc/kvm/book3s_hv_nested.c:1334:11: error: variable 'ap' is uninitialized when used here [-Werror,-Wuninitialized]
                                                           ap, start, end);
                                                           ^~
arch/powerpc/kvm/book3s_hv_nested.c:1276:25: note: initialize the variable 'ap' to silence this warning
        unsigned long psize, ap;
                               ^
                                = 0
1 error generated.

Cheers,
Nathan

> +			if (ret)
> +				return H_P4;
> +		}
> +	}
> +	return H_SUCCESS;
> +}
> +
>  /* Used to convert a nested guest real address to a L1 guest real address */
>  static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
>  				       struct kvm_nested_guest *gp,
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index cdd98b9e7b15..4f38cf34ea40 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -20,10 +20,6 @@
>  
>  #include "internal.h"
>  
> -#define RIC_FLUSH_TLB 0
> -#define RIC_FLUSH_PWC 1
> -#define RIC_FLUSH_ALL 2
> -
>  /*
>   * tlbiel instruction for radix, set invalidation
>   * i.e., r=1 and is=01 or is=10 or is=11
> -- 
> 2.31.1
