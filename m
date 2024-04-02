Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C789591B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 18:01:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R2IN4t4h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8CKb0wKkz3dWV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 03:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R2IN4t4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8CJm2CW1z3dLQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 03:00:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J1C2/bPg/F9WrdiBHSYL5RX039VeHvKnxuGgTbDm1H0=; b=R2IN4t4he6Ikh2eCoolYn2D1ln
	bR/xnpgwp5nTMZdagY0yP7uhv+3h48ujjYE5yB9UplVKqXGoqHhQDFx6Jkksdob89JG3X92Toiy2n
	tpdQXC31wQj8/IoO4Y+ZlLIelTem8wG91gEnWIZCkA/fbYyUxmEHFosVKc03Os3c8PAmqwJMB0gB9
	hyAJUfPQ7tDBLByuN78X7TsKnwe4D8xS+YIdylZ9PDwDcfTzdsT+W4Zn0ntQp+aMaESEJLalvpLlI
	gcDIt6Sh0qyQ2cSKN8hyf81O7nNdTQGTV5wXPOX30EbVaeNoRNVmi6sGvQxqceiq9vEjpBDFFKqBe
	GnoA5Zzw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgYO-00000003OYG-2Yps;
	Tue, 02 Apr 2024 16:00:04 +0000
Date: Tue, 2 Apr 2024 17:00:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <ZgwrhKuypBtSpKdI@casper.infradead.org>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Ryan Roberts <ryan.roberts@arm.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
> > The oops trigger is at mm/gup.c:778:
> > VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> > 
> > So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
> 
> I assume we find the expected tail page, it's just that the check
> 
> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> 
> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
> cont-pmd entry", we trigger this check.
> 
> Likely this sanity check must also allow for hugetlb folios. Or we should
> just remove it completely.
> 
> In the past, we wanted to make sure that we never get tail pages of THP from
> PMD entries, because something would currently be broken (we don't support
> THP > PMD).

That was a practical limitation on my part.  We have various parts of
the MM which assume that pmd_page() returns a head page and until we
get all of those fixed, adding support for folios larger than PMD_SIZE
was only going to cause trouble for no significant wins.

I agree with you we should get rid of this assertion entirely.  We should
fix all the places which assume that pmd_page() returns a head page,
but that may take some time.

As an example, filemap_map_pmd() has:

       if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
                struct page *page = folio_file_page(folio, start);
                vm_fault_t ret = do_set_pmd(vmf, page);

and then do_set_pmd() has:

        if (page != &folio->page || folio_order(folio) != HPAGE_PMD_ORDER)
                return ret;

so we'd simply refuse to use a PMD to map a folio larger than PMD_SIZE.
There's a lot of work to be done to make this work generally (not to
mention figuring out how to handle mapcount for such folios ;-).

This particular case seems straightforward though.  Just remove the
assertion.
