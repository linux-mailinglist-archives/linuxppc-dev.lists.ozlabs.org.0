Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD57583F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 19:58:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mMpImavf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R56B91Njmz30fd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 03:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mMpImavf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R569G4RLmz30Db
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 03:57:20 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8b2b60731so33532885ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689703035; x=1692295035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRD9blNIxHluSUPOIYULRJbi8uFOds7uOEZDc3kDErE=;
        b=mMpImavfY2ADOOfTsM0dULPAztPWwAkAxaN5EBRdgTONlUbuDv0bc/jnql1JEnUeOO
         bda5Tj4uvdDQ4B+NJ/gmvkMeUhOrHdA5CxK42FliEYPeTWhjOiI8i0+G+nUodHSTQx/g
         HanMLQr/dHe8w7iHPBOx35pnzrQWodjmfukbs1BbseIHXHWTRnEizqCumzGYhUaGm+dQ
         jRxPO5RqjGL1hwX87TamgliuO3lsmronneNDvHaIucdFlccgiBcVHg4FAmdI6hkUO0Ji
         3UXm13B3+3pT+2iToWzn8Ie1OvrVbaXYWR6AEsbzg//AwTK48dHUa2cpqzFIrDJGPtWZ
         5PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703035; x=1692295035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRD9blNIxHluSUPOIYULRJbi8uFOds7uOEZDc3kDErE=;
        b=ZBWB0fCvU1mKOZGDBd4yTnNDJJzLD+sE5CYvbGkG4O9R/M9tvfWGkzqEixSG7JDGNa
         tf2iuTgSqchzQfp4bRpfcx/g8VawwLJxjP+m1spAuGpmYS0kYDQuIDx933CSkH8zGrag
         hbj/5bqHrSHDj44MOvyoTMIyVwScubCP6zcm8RBoy2k1zcnpKq/XytGocdnVTsgsF75j
         m4acKXQIOh5RHLfl/Zp07bglQJsDDsNk/rltQIqkQ0sRa7AIziXVeH9GOYhrKOTLuuQq
         Oze5by/4dryBq72yYI65WTbenSgqX458zLxxQ714B05lrSJXKcWb02/st4Ht+vyIdO+7
         ZJjg==
X-Gm-Message-State: ABy/qLaD/cZf6stZalu5mj4JByi1x82y3TztSbZfuWFQqhQ+QztmSkOp
	9gJyHNb6eSpvBg5fKst+79RBdA==
X-Google-Smtp-Source: APBJJlH/DFdDcamBY608z6if+lXRDqfUJnrs4w53GX7UPxfbPo+Y0+UeHJe6ZmJVTzN0SvAK3Kq8RA==
X-Received: by 2002:a17:902:e549:b0:1b8:aef2:773e with SMTP id n9-20020a170902e54900b001b8aef2773emr17009609plf.46.1689703034916;
        Tue, 18 Jul 2023 10:57:14 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id iw10-20020a170903044a00b001b89612dc7dsm2167740plb.142.2023.07.18.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:57:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qLowi-002aex-Bi;
	Tue, 18 Jul 2023 14:57:12 -0300
Date: Tue, 18 Jul 2023 14:57:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 1/4] mm_notifiers: Rename invalidate_range notifier
Message-ID: <ZLbSeO+XjSx1W795@ziepe.ca>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
 <c0daf0870f7220bbf815713463aff86970a5d0fa.1689666760.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0daf0870f7220bbf815713463aff86970a5d0fa.1689666760.git-series.apopple@nvidia.com>
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, linux-mm@kvack.org, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 05:56:15PM +1000, Alistair Popple wrote:
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index b466172..48c81b9 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -456,7 +456,7 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
>  		return;
>  
>  	tlb_flush(tlb);
> -	mmu_notifier_invalidate_range(tlb->mm, tlb->start, tlb->end);
> +	mmu_notifier_invalidate_secondary_tlbs(tlb->mm, tlb->start, tlb->end);
>  	__tlb_reset_range(tlb);

Does this compile? I don't see
"mmu_notifier_invalidate_secondary_tlbs" ?

Maybe we don't need to rename this function since you pretty much
remove it in the next patches?

> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 50c0dde..34c5a84 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -207,7 +207,7 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
>  	 *    spin_lock
>  	 *     seq = ++subscriptions->invalidate_seq
>  	 *    spin_unlock
> -	 *     op->invalidate_range():
> +	 *     op->invalidate_secondary_tlbs():

The later patch should delete this stuff from the comment too, we
no longer guarantee this relationship?

> @@ -560,23 +560,23 @@ mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
>  	hlist_for_each_entry_rcu(subscription, &subscriptions->list, hlist,
>  				 srcu_read_lock_held(&srcu)) {
>  		/*
> -		 * Call invalidate_range here too to avoid the need for the
> -		 * subsystem of having to register an invalidate_range_end
> -		 * call-back when there is invalidate_range already. Usually a
> -		 * subsystem registers either invalidate_range_start()/end() or
> -		 * invalidate_range(), so this will be no additional overhead
> -		 * (besides the pointer check).
> +		 * Subsystems should register either invalidate_secondary_tlbs()
> +		 * or invalidate_range_start()/end() callbacks.
>  		 *
> -		 * We skip call to invalidate_range() if we know it is safe ie
> -		 * call site use mmu_notifier_invalidate_range_only_end() which
> -		 * is safe to do when we know that a call to invalidate_range()
> -		 * already happen under page table lock.
> +		 * We call invalidate_secondary_tlbs() here so that subsystems
> +		 * can use larger range based invalidations. In some cases
> +		 * though invalidate_secondary_tlbs() needs to be called while
> +		 * holding the page table lock. In that case call sites use
> +		 * mmu_notifier_invalidate_range_only_end() and we know it is
> +		 * safe to skip secondary TLB invalidation as it will have
> +		 * already been done.
>  		 */
> -		if (!only_end && subscription->ops->invalidate_range)
> -			subscription->ops->invalidate_range(subscription,
> -							    range->mm,
> -							    range->start,
> -							    range->end);
> +		if (!only_end && subscription->ops->invalidate_secondary_tlbs)
> +			subscription->ops->invalidate_secondary_tlbs(

More doesn't compile, and the comment has the same issue..

But I think the approach in this series looks fine, it is so much
cleaner after we remove all the cruft in patch 4, just look at the
diffstat..

Jason
