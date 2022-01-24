Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F4497C7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 10:56:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj53Y0K5sz3cBl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 20:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KGtiw7Mb;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pccFyVCh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KGtiw7Mb; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pccFyVCh; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj52r510zz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 20:55:48 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C8DE1F88E;
 Mon, 24 Jan 2022 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643018144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY9IYgd8hkKnbM1EBvRlpgL7L8s4nRO/7Rp2w0hALcQ=;
 b=KGtiw7MbrqbtdwmTIN21tihOEMjPY1IV7E0JkU89QUCci4JpOtfDiI1XTrJgmG4yZjZ9h7
 s1QgPOwhButRlG3q7JdTF3j9Cqv/X0oB27ZmmEEx3x//gMB3DOms+1sYO1DHzzism3ATYl
 636sePlLdPVWWR3UHlLv7khhAx6FVgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643018144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY9IYgd8hkKnbM1EBvRlpgL7L8s4nRO/7Rp2w0hALcQ=;
 b=pccFyVChZpI+deG/lwWKxfYZX5Ho6yT54MMe43//zUOjCgx34C1UbYttn5zp4g777PCZbJ
 q1YdEzxEBH/2CrCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 062BA13AB8;
 Mon, 24 Jan 2022 09:55:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id etlEAaB37mEqVwAAMHmgww
 (envelope-from <osalvador@suse.de>); Mon, 24 Jan 2022 09:55:44 +0000
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 10:55:43 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
In-Reply-To: <20220119190623.1029355-4-zi.yan@sent.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
User-Agent: Roundcube Webmail
Message-ID: <b7c311d4b2cd377cdc4f92bc9ccf6af1@suse.de>
X-Sender: osalvador@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

On 2022-01-19 20:06, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> Enable set_migratetype_isolate() to check specified sub-range for
> unmovable pages during isolation. Page isolation is done
> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not all
> pages within that granularity are intended to be isolated. For example,
> alloc_contig_range(), which uses page isolation, allows ranges without
> alignment. This commit makes unmovable page check only look for
> interesting pages, so that page isolation can succeed for any
> non-overlapping ranges.

Hi Zi Yan,

I had to re-read this several times as I found this a bit misleading.
I was mainly confused by the fact that memory_hotplug does isolation on 
PAGES_PER_SECTION granularity, and reading the above seems to indicate 
that either do it at MAX_ORDER_NR_PAGES or at pageblock_nr_pages 
granularity.

True is that start_isolate_page_range() expects the range to be 
pageblock aligned and works in pageblock_nr_pages chunks, but I do not 
think that is what you meant to say here.

Now, to the change itself, below:


> @@ -47,8 +51,8 @@ static struct page *has_unmovable_pages(struct zone
> *zone, struct page *page,
>  		return page;
>  	}
> 
> -	for (; iter < pageblock_nr_pages - offset; iter++) {
> -		page = pfn_to_page(pfn + iter);
> +	for (pfn = first_pfn; pfn < last_pfn; pfn++) {

You already did pfn = first_pfn before.

>  /**
>   * start_isolate_page_range() - make page-allocation-type of range of 
> pages to
>   * be MIGRATE_ISOLATE.
> - * @start_pfn:		The lower PFN of the range to be isolated.
> - * @end_pfn:		The upper PFN of the range to be isolated.
> + * @start_pfn:		The lower PFN of the range to be checked for
> + *			possibility of isolation.
> + * @end_pfn:		The upper PFN of the range to be checked for
> + *			possibility of isolation.
> + * @isolate_start:		The lower PFN of the range to be isolated.
> + * @isolate_end:		The upper PFN of the range to be isolated.

So, what does "possibility" means here. I think this need to be 
clarified a bit better.

 From what you pointed out in the commit message I think what you are 
doing is:

- alloc_contig_range() gets a range to be isolated.
- then you pass two ranges to start_isolate_page_range()
   (start_pfn, end_pfn]: which is the unaligned range you got in 
alloc_contig_range()
   (isolate_start, isolate_end]: which got aligned to, let's say, to 
MAX_ORDER_NR_PAGES

Now, most likely, (start_pfn, end_pfn] only covers a sub-range of 
(isolate_start, isolate_end], and that
sub-range is what you really want to isolate (so (start_pfn, end_pfn])?

If so, should not the names be reversed?


-- 
Oscar Salvador
SUSE Labs
