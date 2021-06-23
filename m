Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58D3B142D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 08:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8v3108w3z306y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 16:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HHLjOHa0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HHLjOHa0; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8v2Y2WDbz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 16:47:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8v2W0GvHz9sWk;
 Wed, 23 Jun 2021 16:47:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624430835;
 bh=cfdZDPaNgewJgbrEDz9CrXOtl9f4wxZsiDWM3b0oOsc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=HHLjOHa0l8wehDoQRoUmB7K89vAt7AGtQnqrO1GoYx8127aX/N0e97UuEFpUjJLnS
 DzTQiXYykMDaFRljVWd4wcpcnfWpp34x3a8OMmErz7HmqlIcsEy7Nf3Epenl3ET23l
 dgEZptDLeRXB96fP/y3FXZfYpwqnUshpKu+/NwiaElSLcy+oYvQjaKqsOXKwwcN7T8
 lZqGgdoHrN1DvEafmfA6/l7JfwVt3Qt4cUoSq9NlkS43SieSWMMnuWADtPnRFB2o33
 uS7tVKSgV73CpLQY4N2LuihYkdpXAxMqMfBtPWgbUwKj8UvWBRMQeCLBA5xDQD/qut
 wMjSRJMqF0ywg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bharata@linux.ibm.com, Nathan Chancellor <nathan@kernel.org>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Subject: Re: [PATCH v8 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
In-Reply-To: <YNGNWRsUgRiMqrGs@in.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-5-bharata@linux.ibm.com>
 <YNDIitJ3Hn1/G8Jw@Ryzen-9-3900X.localdomain> <YNFom3Ojb4TGsKj2@in.ibm.com>
 <YNGNWRsUgRiMqrGs@in.ibm.com>
Date: Wed, 23 Jun 2021 16:47:12 +1000
Message-ID: <87o8bx13in.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:
> On Tue, Jun 22, 2021 at 10:05:45AM +0530, Bharata B Rao wrote:
>> On Mon, Jun 21, 2021 at 10:12:42AM -0700, Nathan Chancellor wrote:
>> > I have not seen this reported yet so apologies if it has and there is a
>> > fix I am missing:
>> > 
>> > arch/powerpc/kvm/book3s_hv_nested.c:1334:11: error: variable 'ap' is uninitialized when used here [-Werror,-Wuninitialized]
>> >                                                            ap, start, end);
>> >                                                            ^~
>> > arch/powerpc/kvm/book3s_hv_nested.c:1276:25: note: initialize the variable 'ap' to silence this warning
>> >         unsigned long psize, ap;
>> >                                ^
>> >                                 = 0
>> 
>> Thanks for catching this, this wasn't caught in my environment.
>> 
>> I will repost the series with proper initialization to ap.
>
> Michael,
>
> Here is the fix for this on top of powerpc/next. If it is easier
> and cleaner to fold this into the original series and re-post
> the whole series against any updated tree, let me know.

Thanks. I squashed this in.

cheers

> From 2e7198e28c0d1137f3230d4645e9cfddaccf4987 Mon Sep 17 00:00:00 2001
> From: Bharata B Rao <bharata@linux.ibm.com>
> Date: Tue, 22 Jun 2021 12:07:01 +0530
> Subject: [PATCH 1/1] KVM: PPC: Book3S HV: Use proper ap value in
>  H_RPT_INVALIDATE
>
> The ap value that is used when performing range based partition
> scoped invalidations for the nested guests wasn't initialized
> correctly.
>
> Fix this and while we are here, reorganize the routine that does
> this invalidation for better readability.
>
> Fixes: 0e67d866cb32 ("KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE")
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 90 +++++++++++++----------------
>  1 file changed, 40 insertions(+), 50 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index d78efb5f5bb3..3a06ac0b53e2 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1222,27 +1222,6 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
>  	return H_SUCCESS;
>  }
>  
> -static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> -					 unsigned long lpid,
> -					 unsigned long page_size,
> -					 unsigned long ap,
> -					 unsigned long start,
> -					 unsigned long end)
> -{
> -	unsigned long addr = start;
> -	int ret;
> -
> -	do {
> -		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> -						   get_epn(addr));
> -		if (ret)
> -			return ret;
> -		addr += page_size;
> -	} while (addr < end);
> -
> -	return ret;
> -}
> -
>  static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
>  					 unsigned long lpid, unsigned long ric)
>  {
> @@ -1263,6 +1242,42 @@ static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
>   */
>  static unsigned long tlb_range_flush_page_ceiling __read_mostly = 33;
>  
> +static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
> +					 unsigned long lpid,
> +					 unsigned long pg_sizes,
> +					 unsigned long start,
> +					 unsigned long end)
> +{
> +	int ret = H_P4;
> +	unsigned long addr, nr_pages;
> +	struct mmu_psize_def *def;
> +	unsigned long psize, ap, page_size;
> +	bool flush_lpid;
> +
> +	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> +		def = &mmu_psize_defs[psize];
> +		if (!(pg_sizes & def->h_rpt_pgsize))
> +			continue;
> +
> +		nr_pages = (end - start) >> def->shift;
> +		flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
> +		if (flush_lpid)
> +			return do_tlb_invalidate_nested_all(vcpu, lpid,
> +							RIC_FLUSH_TLB);
> +		addr = start;
> +		ap = mmu_get_ap(psize);
> +		page_size = 1UL << def->shift;
> +		do {
> +			ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
> +						   get_epn(addr));
> +			if (ret)
> +				return H_P4;
> +			addr += page_size;
> +		} while (addr < end);
> +	}
> +	return ret;
> +}
> +
>  /*
>   * Performs partition-scoped invalidations for nested guests
>   * as part of H_RPT_INVALIDATE hcall.
> @@ -1271,10 +1286,6 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
>  			     unsigned long type, unsigned long pg_sizes,
>  			     unsigned long start, unsigned long end)
>  {
> -	struct kvm_nested_guest *gp;
> -	long ret;
> -	unsigned long psize, ap;
> -
>  	/*
>  	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
>  	 *
> @@ -1284,8 +1295,7 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
>  	 * H_ENTER_NESTED call. Since we can't differentiate this case from
>  	 * the invalid case, we ignore such flush requests and return success.
>  	 */
> -	gp = kvmhv_find_nested(vcpu->kvm, lpid);
> -	if (!gp)
> +	if (!kvmhv_find_nested(vcpu->kvm, lpid))
>  		return H_SUCCESS;
>  
>  	/*
> @@ -1313,29 +1323,9 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
>  	if (start == 0 && end == -1)
>  		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
>  
> -	if (type & H_RPTI_TYPE_TLB) {
> -		struct mmu_psize_def *def;
> -		bool flush_lpid;
> -		unsigned long nr_pages;
> -
> -		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> -			def = &mmu_psize_defs[psize];
> -			if (!(pg_sizes & def->h_rpt_pgsize))
> -				continue;
> -
> -			nr_pages = (end - start) >> def->shift;
> -			flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
> -			if (flush_lpid)
> -				return do_tlb_invalidate_nested_all(vcpu, lpid,
> -								RIC_FLUSH_TLB);
> -
> -			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
> -							   (1UL << def->shift),
> -							   ap, start, end);
> -			if (ret)
> -				return H_P4;
> -		}
> -	}
> +	if (type & H_RPTI_TYPE_TLB)
> +		return do_tlb_invalidate_nested_tlb(vcpu, lpid, pg_sizes,
> +						    start, end);
>  	return H_SUCCESS;
>  }
>  
> -- 
> 2.31.1
