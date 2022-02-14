Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A64B42C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 08:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxwkt6FQzz3cVn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 18:26:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxwkT2DsWz30jP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 18:26:07 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B18F568AFE; Mon, 14 Feb 2022 08:26:01 +0100 (CET)
Date: Mon, 14 Feb 2022 08:26:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Message-ID: <20220214072601.GA17306@lst.de>
References: <20220211164135.1803616-1-zi.yan@sent.com>
 <20220211164135.1803616-4-zi.yan@sent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211164135.1803616-4-zi.yan@sent.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Mike Rapoport <rppt@kernel.org>, Eric Ren <renzhengeek@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +int
> +isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_flags, int isolate_before_boundary);

Please avoid the completely unreadably long line. i.e.

int isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_flags,
		int isolate_before_boundary);

Same in various other spots.
