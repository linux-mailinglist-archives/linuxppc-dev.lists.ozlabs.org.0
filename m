Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FF49B4D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjnXb4pntz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 00:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OAQFnCJ9;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=URWUxsOG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OAQFnCJ9; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=URWUxsOG; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjnWs0hj3z30gg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 00:19:52 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C010621129;
 Tue, 25 Jan 2022 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643116788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7ugEwGd8z1ciGcssO9NOuo6Y70kmTmAuz+RVBNhgQo=;
 b=OAQFnCJ9fJXwRf+XqgaH8z+GcXVjo9HxXhbpGWNi3xMFKm4awPudNVTJaJaXXs1dSxQj1I
 /htMCb/jE9Jo8zsCT8DVooqvtd6XAyQmf3X5bQaNYmHaXyRhOYiGujXcl4ae/nW4gqHHZG
 iIctFqchskLEpoSkcCX/nH6b9I06d44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643116788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7ugEwGd8z1ciGcssO9NOuo6Y70kmTmAuz+RVBNhgQo=;
 b=URWUxsOGxCPGESRThyQ7b2f2CoH5apJnVqlsxfRb5qW9qyCiYDfA7/lidO7XlY8xzuv09P
 oqD7gCa//062VVAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F330613DE5;
 Tue, 25 Jan 2022 13:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TzS6OPP472GbRwAAMHmgww
 (envelope-from <osalvador@suse.de>); Tue, 25 Jan 2022 13:19:47 +0000
Date: Tue, 25 Jan 2022 14:19:46 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
Message-ID: <20220125131943.GA5609@linux>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
 <b7c311d4b2cd377cdc4f92bc9ccf6af1@suse.de>
 <6AEF32AC-4E0D-41E0-8850-33B8BD955920@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6AEF32AC-4E0D-41E0-8850-33B8BD955920@nvidia.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 24, 2022 at 12:17:23PM -0500, Zi Yan wrote:
> You are right. Sorry for the confusion. I think it should be
> “Page isolation is done at least on max(MAX_ORDER_NR_PAEGS,
> pageblock_nr_pages) granularity.”
> 
> memory_hotplug uses PAGES_PER_SECTION. It is greater than that.

Or just specify that the max(MAX_ORDER_NR_PAGES, pageblock_nr_pages) granurality
only comes from alloc_contig_range at the moment. Other callers might want
to work in other granularity (e.g: memory-hotplug) although ultimately the
range has to be aligned to something.

> > True is that start_isolate_page_range() expects the range to be pageblock aligned and works in pageblock_nr_pages chunks, but I do not think that is what you meant to say here.
> 
> Actually, start_isolate_page_range() should expect max(MAX_ORDER_NR_PAEGS,
> pageblock_nr_pages) alignment instead of pageblock alignment. It seems to
> be an uncovered bug in the current code, since all callers uses at least
> max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) alignment.
> 
> The reason is that if start_isolate_page_range() is only pageblock aligned
> and a caller wants to isolate one pageblock from a MAX_ORDER-1
> (2 pageblocks on x84_64 systems) free page, this will lead to MIGRATE_ISOLATE
> accounting error. To avoid it, start_isolate_page_range() needs to isolate
> the max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) aligned range.

So, let me see if I get this straight:

You are saying that, currently, alloc_contig_ranges() works on the biggest
alignment otherwise we might have this scenario:

[      MAX_ORDER-1       ]
[pageblock#0][pageblock#1]

We only want to isolate pageblock#1, so we pass a pageblock-aligned range to
start_isolate_page_range(), but the page belonging to pageblock#1 spans
pageblock#0 and pageblock#1 because it is a MAX_ORDER-1 page.

So when we call set_migratetype_isolate()->set_pageblock_migratetype(), this will
mark either pageblock#0 or pageblock#1 as isolated, but the whole page will be put
in the MIGRATE_ISOLATE freelist by move_freepages_block()->move_freepages().
Meaning, we wil effectively have two pageblocks isolated, but only one marked
as such?

Did I get it right or did I miss something?

I know that this has been discussed previously, and the cover-letter already
mentions it, but I think it would be great to have some sort of information about
the problem in the commit message as well, so people do not have to go and find
it somewhere else.


-- 
Oscar Salvador
SUSE Labs
