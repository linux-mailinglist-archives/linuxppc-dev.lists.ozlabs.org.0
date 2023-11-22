Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBB7F3F65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 09:01:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCtBrTBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZtxD4SdLz3clb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 19:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCtBrTBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f356749d2870cc4c8790+7395+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZtwM0zkdz3c82
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 19:00:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rG9CnI6rb1E9NFvnbYt1RG2l2gXTlO1XMx7PoiRe2Ec=; b=PCtBrTBvxv7SOp8UE5vFdvbfF0
	P5NaPlXmpvqNViNINDPdipO0w9S7846a/jfPx/chfTBwwTwYjneEH25vRgUw635dBIYYVnMCDmiM6
	OeTvKWjvS5RPTRtLFJM8VWWVC1A3xvPIQ+lpajb19q+Chh4kjK5j81FkX1DAOmUYdLz8CY2/xQjU/
	eHO+ESOk90z7nvlFOUb/rkbJstkzzg3x3vrH7Vvfk96TWlMZ6TRu1MnpeRKEUoHL7WMK53ciD/Y6Q
	bdvOGQ2aAG+0OYv9E7rZOWLEOZLfUmhAOJwT7XbQn2p/6gB5NGOg/D88uulBsscSZ7PfrfCGM1nAw
	u/zzeo7A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r5i9o-000z5V-1I;
	Wed, 22 Nov 2023 08:00:24 +0000
Date: Wed, 22 Nov 2023 00:00:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV21GCbG48nTLDzn@infradead.org>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVzT5_3Zn-Y-6xth@x1n>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 10:59:35AM -0500, Peter Xu wrote:
> > What prevents us from ever using hugepd with file mappings?  I think
> > it would naturally fit in with how large folios for the pagecache work.
> > 
> > So keeping this check and generalizing it seems like the better idea to
> > me.
> 
> But then it means we're still keeping that dead code for fast-gup even if
> we know that fact..  Or do we have a plan to add that support very soon, so
> this code will be destined to add back?

The question wasn't mean retorical - we support arbitrary power of two
sized folios for the pagepage, what prevents us from using hugepd with
them right now?

> The other option is I can always add a comment above gup_huge_pd()
> explaining this special bit, so that when someone is adding hugepd support
> to file large folios we'll hopefully not forget it?  But then that
> generalization work will only happen when the code will be needed.

If dropping the check is the right thing for now (and I think the ppc
maintainers and willy as the large folio guy might have a more useful
opinions than I do), leaving a comment in would be very useful.

