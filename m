Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C548D6C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 12:37:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZMqV45rFz3bYs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 22:37:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y8pNbom+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y8pNbom+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZMpn0smDz2yZW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 22:37:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00A67B82192;
 Thu, 13 Jan 2022 11:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E819C36AE3;
 Thu, 13 Jan 2022 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642073818;
 bh=+YT0N1Ya5C3GpxZb3D9lx91/TA7aYugOCM+xLuWjYus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y8pNbom+not22khASxC0ueT85weSmm7kwqI+jqij2ZQjNxusyGBuws6c2xcGeS2aN
 9swZkNa2lHT+EqUFoHcqwscUUVPriy4Cm4fAIQjZLWNlg7hI9+AtHC/h6in4aJ2vRs
 7WBuPU+LvQc6MavLpwW30LJ5V1WHuEA17r/aBUHfdlyYbe4rxmup5KWNk0YUJhq6A4
 1fcD63FjDJCSMo+Po0f1aEVflhmsnSpMVI2j8jOkqcPkWMfP5sHyJP3P/iYTWNcU9P
 LXw/TsOnQN4ucHQJqihS6vgO2Ure2XIVDeeLBPlAh/jMjE6BsbJrJyGGEzGtqUOOm+
 bwsfmuQCDueEQ==
Date: Thu, 13 Jan 2022 13:36:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 1/8] mm: page_alloc: avoid merging
 non-fallbackable pageblocks with others.
Message-ID: <YeAO0vtyjWWMRliF@kernel.org>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-2-zi.yan@sent.com>
 <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, Eric Ren <renzhengeek@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022 at 11:54:49AM +0100, David Hildenbrand wrote:
> On 05.01.22 22:47, Zi Yan wrote:
> > From: Zi Yan <ziy@nvidia.com>
> > 
> > This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.
> > It prepares for the upcoming removal of the MAX_ORDER-1 alignment
> > requirement for CMA and alloc_contig_range().
> > 
> > MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
> > MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.
> > Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
> > 
> > [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingularity.net/
> > 
> > Signed-off-by: Zi Yan <ziy@nvidia.com>
> > ---
> >  include/linux/mmzone.h |  6 ++++++
> >  mm/page_alloc.c        | 28 ++++++++++++++++++----------
> >  2 files changed, 24 insertions(+), 10 deletions(-)
> > 

...

> > @@ -3545,8 +3553,8 @@ int __isolate_free_page(struct page *page, unsigned int order)
> >  		struct page *endpage = page + (1 << order) - 1;
> >  		for (; page < endpage; page += pageblock_nr_pages) {
> >  			int mt = get_pageblock_migratetype(page);
> > -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
> > -			    && !is_migrate_highatomic(mt))
> > +			/* Only change normal pageblock */
> > +			if (migratetype_has_fallback(mt))
> >  				set_pageblock_migratetype(page,
> >  							  MIGRATE_MOVABLE);
> >  		}
> 
> That part is a nice cleanup IMHO. Although the "has fallback" part is a
> bit imprecise. "migratetype_is_mergable()" might be a bit clearer.
> ideally "migratetype_is_mergable_with_other_types()". Can we come up
> with a nice name for that?

migratetype_is_mergable() kinda implies "_with_other_types", no?

I like migratetype_is_mergable() more than _has_fallback().

My $0.02 to bikeshedding :)
 
> -- 
> Thanks,
> 
> David / dhildenb
> 
> 

-- 
Sincerely yours,
Mike.
