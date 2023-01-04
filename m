Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02265CDD3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:47:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn1sQ46lSz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 18:47:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kveBcYfo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kveBcYfo;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn1rW2cqRz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 18:46:35 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3AAE38CE3;
	Wed,  4 Jan 2023 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1672818382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlUS4rFMq/APir3cFferSBeDNPK/ORyz2z3RjBS+Um4=;
	b=kveBcYfoIUBtm3F0Ar3Wt0T3ZwXS220F+aCXcfEt2trlB9EBAJ7qi0tZCSyVz9Jy394vRi
	bIuf4P+Yn+4Jd+aASe+doB5O3LBOQ7JR8s7BLXkkgluwrr98grKK2n4HmMHlAGF69yc/5M
	zuCrK+UYdOn2OzeZlK/la6hCRvOh7Cc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93117133D1;
	Wed,  4 Jan 2023 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LFCDIM4utWORBgAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 04 Jan 2023 07:46:22 +0000
Date: Wed, 4 Jan 2023 08:46:21 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7UuzV94Yo59PwTa@dhcp22.suse.cz>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
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
Cc: Christian Brauner <brauner@kernel.org>, linux-s390@vger.kernel.org, Nadav Amit <nadav.amit@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>, netdev@vger.kernel.org, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 03-01-23 16:27:32, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

This looks even better than the previous version.
Acked-by: Michal Hocko <mhocko@suse.com>

minor nit

[...]
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index ad608ef2a243..ffa36cfe5884 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2713,7 +2713,7 @@ void folio_account_cleaned(struct folio *folio, struct bdi_writeback *wb)
>   *
>   * The caller must hold lock_page_memcg().  Most callers have the folio
>   * locked.  A few have the folio blocked from truncation through other
> - * means (eg zap_page_range() has it mapped and is holding the page table
> + * means (eg zap_vma_pages() has it mapped and is holding the page table
>   * lock).  This can also be called from mark_buffer_dirty(), which I
>   * cannot prove is always protected against truncate.

strictly speaking this should be unmap_page_range
-- 
Michal Hocko
SUSE Labs
