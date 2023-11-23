Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEA7F6357
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 16:49:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vLpbgGiz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbjGK6MmVz3vZj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbjFN1mYDz3dBD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:48:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vasH22+ZqE7NawyIR92P5uPhDSRcq1ysNxbjToJ1LBY=; b=vLpbgGizfUkL6qUgpsivl4JAm/
	l8J8tNyrQHt5ij+7+mH22jvJHwKDnm15G+Y8yMTDvxK5gRlnADcaWJ0gGwXnEL+X6/fGctU+gIkgH
	i7e0bTPjn5mArHPGmVnZ3Sd4irNBwcAJX3hcvaGLJPXbWqYn15n3uPyDZxtwkLGiuzrZBSL0W3h7g
	0NnaVmbnZK083gVv5tpkKKqa2NiGaBEqg1aGsZitgcpovI9OR2AvH5HpmcbdwkXTFME1UrDr2MgzP
	GZEnBpDtPaOAgDKKUAZp8G4YTEUeZWMFnI74HVPypN/duW75NVuUCoPbRlM89yKGH7bN101Tg5qlt
	qowOlYxw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r6Bvh-007gJ1-SR; Thu, 23 Nov 2023 15:47:49 +0000
Date: Thu, 23 Nov 2023 15:47:49 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV90JcnQ1RGud/0R@casper.infradead.org>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV21GCbG48nTLDzn@infradead.org>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 12:00:24AM -0800, Christoph Hellwig wrote:
> > The other option is I can always add a comment above gup_huge_pd()
> > explaining this special bit, so that when someone is adding hugepd support
> > to file large folios we'll hopefully not forget it?  But then that
> > generalization work will only happen when the code will be needed.
> 
> If dropping the check is the right thing for now (and I think the ppc
> maintainers and willy as the large folio guy might have a more useful
> opinions than I do), leaving a comment in would be very useful.

It looks like ARM (in the person of Ryan) are going to add support for
something equivalent to hugepd.  Insofar as I understand hugepd, anyway.
I've done my best to set up the generic code so that the arch code can
use whatever size TLB entries it supports.  I haven't been looking to the
hugetlb code as a reference for it, since it can assume natural alignment
and generic THP/large folio must be able to handle arbitrary alignment.

If powerpc want to join in on the fun, they're more than welcome, but I
get the feeling that investment in Linux-on-PPC is somewhat smaller than
Linux-on-ARM these days.  Even if we restrict that to the server space.
