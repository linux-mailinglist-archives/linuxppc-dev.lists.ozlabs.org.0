Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826E498542
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 17:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjGH12tpBz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 03:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=techsingularity.net (client-ip=46.22.139.234;
 helo=outbound-smtp17.blacknight.com; envelope-from=mgorman@techsingularity.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 475 seconds by postgrey-1.36 at boromir;
 Tue, 25 Jan 2022 03:51:32 AEDT
Received: from outbound-smtp17.blacknight.com (outbound-smtp17.blacknight.com
 [46.22.139.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjGGX6cWYz30Mb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 03:51:32 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
 by outbound-smtp17.blacknight.com (Postfix) with ESMTPS id
 24C891C3C32
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 16:43:31 +0000 (GMT)
Received: (qmail 22301 invoked from network); 24 Jan 2022 16:43:30 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.223])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 24 Jan 2022 16:43:30 -0000
Date: Mon, 24 Jan 2022 16:43:29 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Message-ID: <20220124164329.GF3366@techsingularity.net>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-2-zi.yan@sent.com>
 <20220124140203.GE3366@techsingularity.net>
 <06467F5D-25F9-42DC-9FEC-6559E6058D01@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <06467F5D-25F9-42DC-9FEC-6559E6058D01@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 24, 2022 at 11:12:07AM -0500, Zi Yan wrote:
> On 24 Jan 2022, at 9:02, Mel Gorman wrote:
> 
> > On Wed, Jan 19, 2022 at 02:06:17PM -0500, Zi Yan wrote:
> >> From: Zi Yan <ziy@nvidia.com>
> >>
> >> This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.
> >> It prepares for the upcoming removal of the MAX_ORDER-1 alignment
> >> requirement for CMA and alloc_contig_range().
> >>
> >> MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
> >> MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.
> >> Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
> >>
> >> [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingularity.net/
> >>
> >> Signed-off-by: Zi Yan <ziy@nvidia.com>
> >>
> >> <SNIP>
> >>
> >> @@ -2484,6 +2483,7 @@ static int fallbacks[MIGRATE_TYPES][3] = {
> >>  	[MIGRATE_UNMOVABLE]   = { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,   MIGRATE_TYPES },
> >>  	[MIGRATE_MOVABLE]     = { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE, MIGRATE_TYPES },
> >>  	[MIGRATE_RECLAIMABLE] = { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,   MIGRATE_TYPES },
> >> +	[MIGRATE_HIGHATOMIC] = { MIGRATE_TYPES }, /* Never used */
> >>  #ifdef CONFIG_CMA
> >>  	[MIGRATE_CMA]         = { MIGRATE_TYPES }, /* Never used */
> >>  #endif
> >
> > If it's never used, why is it added?
> 
> Just to make the fallbacks list complete, since MIGRATE_CMA and
> MIGRATE_ISOLATE are in the list. Instead, I can remove MIGRATE_CMA and
> MIGRATE_ISOLATE. WDYT?
> 

It probably makes more sense to remove them or replace them with a comment
stating what migratetypes do not have a fallback list. Do it as a separate
patch that stands alone. It does not need to be part of this series.

-- 
Mel Gorman
SUSE Labs
