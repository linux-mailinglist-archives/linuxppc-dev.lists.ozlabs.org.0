Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E664630D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 11:16:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3J5Y6rphz3cHf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 21:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=techsingularity.net (client-ip=46.22.139.233;
 helo=outbound-smtp16.blacknight.com; envelope-from=mgorman@techsingularity.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 395 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 21:15:37 AEDT
Received: from outbound-smtp16.blacknight.com (outbound-smtp16.blacknight.com
 [46.22.139.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3J556W8Vz300S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:15:37 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail03.blacknight.ie [81.17.254.16])
 by outbound-smtp16.blacknight.com (Postfix) with ESMTPS id
 A58001C408B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 10:08:55 +0000 (GMT)
Received: (qmail 25169 invoked from network); 30 Nov 2021 10:08:55 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.29])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 30 Nov 2021 10:08:55 -0000
Date: Tue, 30 Nov 2021 10:08:53 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Message-ID: <20211130100853.GP3366@techsingularity.net>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
 <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
 <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
 <35A20739-152A-450E-8535-2236D2B28748@nvidia.com>
 <1c67bb96-24db-f5a6-7520-3d97e54e5192@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1c67bb96-24db-f5a6-7520-3d97e54e5192@suse.cz>
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
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 10:11:36AM +0100, Vlastimil Babka wrote:
> >>> I find that two pageblocks with different migratetypes, like MIGRATE_RECLAIMABLE
> >>> and MIGRATE_MOVABLE can be merged into a single free page after I checked
> >>> __free_one_page() in detail and printed pageblock information during buddy page
> >>> merging.
> >>
> >> Yes, that can happen.
> >>
> >> I am not sure what consequence it will cause. Do you have any idea?
> >>
> >> For MIGRATE_RECLAIMABLE or MIGRATE_MOVABLE or even MIGRATE_UNMOVABLE it's
> >> absolutely fine. As long as these pageblocks are fully free (and they are if
> >> it's a single free page spanning 2 pageblocks), they can be of any of these
> >> type, as they can be reused as needed without causing fragmentation.
> >>
> >> But in case of MIGRATE_CMA and MIGRATE_ISOLATE, uncontrolled merging would
> >> break the specifics of those types. That's why the code is careful for
> >> MIGRATE_ISOLATE, and MIGRATE_CMA was until now done in MAX_ORDER granularity.
> > 
> > Thanks for the explanation. Basically migratetypes that can fall back to each
> > other can be merged into a single free page, right?
> 
> Yes.
> 
> > How about MIGRATE_HIGHATOMIC? It should not be merged with other migratetypes
> > from my understanding.
> 
> Hmm it shouldn't minimally because it has an accounting that would become
> broken. So it should prevent merging or make sure the reservations are with
> MAX_ORDER granularity, but seems that neither is true? CCing Mel.
> 

MIGRATE_HIGHATOMIC pageblocks can have pages allocated of different
types, particularly UNMOVABLE and potentially RECLAIMABLE. The
reserving or releasing MIGRATE_HIGHATOMIC pageblocks should be done with
reserve_highatomic_pageblock and unreserve_highatomic_pageblock to get
the accounting right.

However, there does not appear to be any special protection against a
page in a highatomic pageblock getting merged with a buddy of another
pageblock type. The pageblock would still have the right setting but on
allocation, the pages could split to the wrong free list and be lost
until the pages belonging to MIGRATE_HIGHATOMIC were freed again.

Not sure how much of a problem that is in practice, it's been a while
since I've heard of high-order atomic allocation failures.

-- 
Mel Gorman
SUSE Labs
