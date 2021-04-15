Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6C3611BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLnRn5YWYz3bVH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 04:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwiFKYOJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwiFKYOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YwiFKYOJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwiFKYOJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLnRK0tMCz304D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 04:09:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618510153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFSW/xx6h8VP0E9MM0SVm+J+UNt/2rTNWHWvDh7sIOU=;
 b=YwiFKYOJYdF2O5OXLTLdIvCDcL3i/DdPXp5qJc4UbDsKMeaO3McKQnV00m1hBlzSRhAHJu
 nR9QowriUBQfsMte88gkVa/Xz+hPvFQrncBvVebMxA/1fi3NY0E55k/BC2J0rikU2vHnFL
 z/bG8wDaXc3u7j3UD3sRnzksNgCHvxE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618510153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFSW/xx6h8VP0E9MM0SVm+J+UNt/2rTNWHWvDh7sIOU=;
 b=YwiFKYOJYdF2O5OXLTLdIvCDcL3i/DdPXp5qJc4UbDsKMeaO3McKQnV00m1hBlzSRhAHJu
 nR9QowriUBQfsMte88gkVa/Xz+hPvFQrncBvVebMxA/1fi3NY0E55k/BC2J0rikU2vHnFL
 z/bG8wDaXc3u7j3UD3sRnzksNgCHvxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-OE96HVLmORK72ygKyf7eRg-1; Thu, 15 Apr 2021 14:08:39 -0400
X-MC-Unique: OE96HVLmORK72ygKyf7eRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FD610054F6;
 Thu, 15 Apr 2021 18:08:37 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8013D13487;
 Thu, 15 Apr 2021 18:08:33 +0000 (UTC)
Date: Thu, 15 Apr 2021 20:08:32 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210415200832.32796445@carbon>
In-Reply-To: <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 'Matthew Wilcox' <willy@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, brouer@redhat.com,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Apr 2021 21:56:39 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> From: Matthew Wilcox
> > Sent: 14 April 2021 22:36
> > 
> > On Wed, Apr 14, 2021 at 09:13:22PM +0200, Jesper Dangaard Brouer wrote:  
> > > (If others want to reproduce).  First I could not reproduce on ARM32.
> > > Then I found out that enabling CONFIG_XEN on ARCH=arm was needed to
> > > cause the issue by enabling CONFIG_ARCH_DMA_ADDR_T_64BIT.  
> > 
> > hmmm ... you should be able to provoke it by enabling ARM_LPAE,
> > which selects PHYS_ADDR_T_64BIT, and
> > 
> > config ARCH_DMA_ADDR_T_64BIT
> >         def_bool 64BIT || PHYS_ADDR_T_64BIT
> >   
> > >  struct page {
> > >         long unsigned int          flags;                /*     0     4 */
> > >
> > >         /* XXX 4 bytes hole, try to pack */
> > >
> > >         union {
> > >                 struct {
> > >                         struct list_head lru;            /*     8     8 */
> > >                         struct address_space * mapping;  /*    16     4 */
> > >                         long unsigned int index;         /*    20     4 */
> > >                         long unsigned int private;       /*    24     4 */
> > >                 };                                       /*     8    20 */
> > >                 struct {
> > >                         dma_addr_t dma_addr  
> 
> Adding __packed here will remove the 4 byte hole before the union
> and the compiler seems clever enough to know that anything following
> a 'long' must also be 'long' aligned.

Played with __packed in below patch, and I can confirm it seems to work.

> So you don't get anything horrid like byte accesses.
> On 64bit dma_addr will remain 64bit aligned.
> On arm32 dma_addr will be 32bit aligned - but forcing two 32bit access
> won't make any difference.

See below patch.  Where I swap32 the dma address to satisfy
page->compound having bit zero cleared. (It is the simplest fix I could
come up with).


[PATCH] page_pool: handling 32-bit archs with 64-bit dma_addr_t

From: Jesper Dangaard Brouer <brouer@redhat.com>

Workaround for storing 64-bit DMA-addr on 32-bit machines in struct
page.  The page->dma_addr share area with page->compound_head which
use bit zero to mark compound pages. This is okay, as DMA-addr are
aligned pointers which have bit zero cleared.

In the 32-bit case, page->compound_head is 32-bit.  Thus, when
dma_addr_t is 64-bit it will be located in top 32-bit.  Solve by
swapping dma_addr 32-bit segments.

Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
---
 include/linux/mm_types.h |    2 +-
 include/linux/types.h    |    1 +
 include/net/page_pool.h  |   21 ++++++++++++++++++++-
 net/core/page_pool.c     |    8 +++++---
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6613b26a8894..27406e3b1e1b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -100,7 +100,7 @@ struct page {
 			 * @dma_addr: might require a 64-bit value even on
 			 * 32-bit architectures.
 			 */
-			dma_addr_t dma_addr;
+			dma_addr_t dma_addr __packed;
 		};
 		struct {	/* slab, slob and slub */
 			union {
diff --git a/include/linux/types.h b/include/linux/types.h
index ac825ad90e44..65fd5d630016 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -141,6 +141,7 @@ typedef u64 blkcnt_t;
  */
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 typedef u64 dma_addr_t;
+//typedef u64 __attribute__((aligned(sizeof(void *)))) dma_addr_t;
 #else
 typedef u32 dma_addr_t;
 #endif
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index b5b195305346..c2329088665c 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -196,9 +196,28 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
 	page_pool_put_full_page(pool, page, true);
 }
 
+static inline
+dma_addr_t page_pool_dma_addr_read(dma_addr_t dma_addr)
+{
+	/* Workaround for storing 64-bit DMA-addr on 32-bit machines in struct
+	 * page.  The page->dma_addr share area with page->compound_head which
+	 * use bit zero to mark compound pages. This is okay, as DMA-addr are
+	 * aligned pointers which have bit zero cleared.
+	 *
+	 * In the 32-bit case, page->compound_head is 32-bit.  Thus, when
+	 * dma_addr_t is 64-bit it will be located in top 32-bit.  Solve by
+	 * swapping dma_addr 32-bit segments.
+	 */
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	if (sizeof(long unsigned int) == 4) /* 32-bit system */
+		dma_addr = (dma_addr << 32) | (dma_addr >> 32);
+#endif
+	return dma_addr;
+}
+
 static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 {
-	return page->dma_addr;
+	return page_pool_dma_addr_read(page->dma_addr);
 }
 
 static inline bool is_page_pool_compiled_in(void)
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index ad8b0707af04..813598ea23f6 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -174,8 +174,10 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
 					  struct page *page,
 					  unsigned int dma_sync_size)
 {
+	dma_addr_t dma = page_pool_dma_addr_read(page->dma_addr);
+
 	dma_sync_size = min(dma_sync_size, pool->p.max_len);
-	dma_sync_single_range_for_device(pool->p.dev, page->dma_addr,
+	dma_sync_single_range_for_device(pool->p.dev, dma,
 					 pool->p.offset, dma_sync_size,
 					 pool->p.dma_dir);
 }
@@ -226,7 +228,7 @@ static struct page *__page_pool_alloc_pages_slow(struct page_pool *pool,
 		put_page(page);
 		return NULL;
 	}
-	page->dma_addr = dma;
+	page->dma_addr = page_pool_dma_addr_read(dma);
 
 	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);
@@ -294,7 +296,7 @@ void page_pool_release_page(struct page_pool *pool, struct page *page)
 		 */
 		goto skip_dma_unmap;
 
-	dma = page->dma_addr;
+	dma = page_pool_dma_addr_read(page->dma_addr);
 
 	/* When page is unmapped, it cannot be returned our pool */
 	dma_unmap_page_attrs(pool->p.dev, dma,


--
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

