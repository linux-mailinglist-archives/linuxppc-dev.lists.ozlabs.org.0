Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864877F0D83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 09:27:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0fDRvzT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYgcD39kNz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 19:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0fDRvzT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+a0ffaaa08e78c14af992+7393+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgbJ1b6Hz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:26:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uMp2fMZBMPCr8C/u9KI5jUF0TwPRUJ/bxniQfy1HXoM=; b=p0fDRvzTKV43hpBu0+sr2+Pz73
	TZn39hehC2t56EK4IteS4aWT9jFaZ/21cuIc5qudV4m5Ud+NRJkwVpbq8c5J8qHTSB4a6MmJfMGQb
	UGdRc0QuQs7kP/u7CJn7pQQtY6YQ+YaY49Y8BXDregSPUnGGmRCcKYJDAwMO83hqWydxfVubHETSQ
	msAyW9/Ot5qrWxGUV5lWqNKOg6V804Rw4GUzSg+z910mQcNCcEQonRyGMY/ioEsmhcR9b9WezX2IK
	SZhguB0DFZGf+XBBLeKDx4/juMQhOMdzferrd/qZg8BsBikUOtQtsfl/e4DPxBeXe6NnJIRnwm8xr
	dyfRwizg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zbs-00BVBv-2U;
	Mon, 20 Nov 2023 08:26:24 +0000
Date: Mon, 20 Nov 2023 00:26:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZVsYMMJpmFV2T/Zc@infradead.org>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116012908.392077-7-peterx@redhat.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 15, 2023 at 08:29:02PM -0500, Peter Xu wrote:
> Hugepd format is only used in PowerPC with hugetlbfs.  In commit
> a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
> file-backed mappings"), we added a check to fail gup-fast if there's
> potential risk of violating GUP over writeback file systems.  That should
> never apply to hugepd.
>
> Drop that check, not only because it'll never be true for hugepd, but also
> it paves way for reusing the function outside fast-gup.

What prevents us from ever using hugepd with file mappings?  I think
it would naturally fit in with how large folios for the pagecache work.

So keeping this check and generalizing it seems like the better idea to
me.
