Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD44B8F9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 18:47:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzQQ13Ctrz3cWF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 04:47:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YFMvYdQj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=YFMvYdQj; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzQPH06PCz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 04:46:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VbUBhMXlxHu1hd9TNvXiS+teJ/r1jPmqMT3yZi5DiXA=; b=YFMvYdQjx1CUVz3+iDv8dWZBQn
 TFKDs1U168DEQITKZe9AaZx16SKrXTx2ksq/NMGVl2W0EEwQuncChNlonnFXmyWZzd7nO4br2waQp
 FIgkLzZrsrUvnq4nuBcjXKyy1fnyqNj0lXhyCpSmqyKt5ZGUkkIfJBO65Hk2cQ3ChaRe9XHHz6jPB
 M8XvXJn08fOJCd660xA/nwi0ZEmXjq1ZazXF393WWBkQ9c0yMG9Hvb8tcJwbOf9eiruvfcfTVHanP
 CvnueVd5fYDaynrO0Gp+6KNCoLblmKTPC7IS0DJIQdOQwx2xahxTeVrMwQOJITjRwRUbk2Li5Ykps
 tZvmgLqw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nKONT-00Eupq-5V; Wed, 16 Feb 2022 17:46:07 +0000
Date: Wed, 16 Feb 2022 17:46:07 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [next-20220215] WARNING at fs/iomap/buffered-io.c:75 with xfstests
Message-ID: <Yg04X73lr5YK5kwH@casper.infradead.org>
References: <5AD0BD6A-2C31-450A-924E-A581CD454073@linux.ibm.com>
 <20220216173504.GM8313@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216173504.GM8313@magnolia>
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com,
 linux-next@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 09:35:04AM -0800, Darrick J. Wong wrote:
> On Wed, Feb 16, 2022 at 12:55:02PM +0530, Sachin Sant wrote:
> > [ 2547.662818] ------------[ cut here ]------------
> > [ 2547.662832] WARNING: CPU: 24 PID: 2463718 at fs/iomap/buffered-io.c:75 iomap_page_release+0x1b0/0x1e0
> 
> ...and I think this is complaining about this debugging test in
> iomap_page_release:
> 
> 	WARN_ON_ONCE(bitmap_full(iop->uptodate, nr_blocks) !=
> 			folio_test_uptodate(folio));
> 
> which checks that we're not releasing or invalidating a page that's
> partially uptodate on a blocksize < pagesize filesystem (or so I gather
> from "POWER10 LPAR" (64k pages?) and "XFS" (4k blocks?))...

This happens _all_ _the_ _time_ in my testing.  If your block size is
less than page size, you can expect it.

What it's supposed to be testing is that we remembered to set the
uptodate flag once all blocks in this page are uptodate.  What's
tripping the check is iomap_writepage_map()'s stupid clearing of the
uptodate flag on the folio:

        if (unlikely(error)) {
...
                if (!count) {
                        folio_clear_uptodate(folio);
                        folio_unlock(folio);
                        goto done;

What particularly annoys me about this is that the folio _was_ uptodate,
and it was dirty, so it has newer data in it than is on disk, but we're
going to re-read the folio from disk and throw away that user data.

> Given that in this case we've already cleared SB_ACTIVE from the
> superblock s_flags, I wonder if we could amend that code to read:
> 
> 	if (inode->i_sb->s_flags & SB_ACTIVE)
> 		WARN_ON_ONCE(bitmap_full(iop->uptodate, nr_blocks) !=
> 				folio_test_uptodate(folio));
> 
> Since we don't really care about memory pages that aren't fully up to
> date if we're in the midst of freeing all the incore filesystem state.
> 
> Thoughts?

Seems like papering over a bad design decision to me.
