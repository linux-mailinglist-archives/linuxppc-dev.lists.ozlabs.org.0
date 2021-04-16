Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF3362BCC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 01:08:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMX2T1pYNz309c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 09:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sTOSCTMe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=sTOSCTMe; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMX1Y1YdDz30BK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 09:08:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tfA9/CMMjzVJbfa5k3nU3g5wOaQhTGv4Y2DdGMdqE7Q=; b=sTOSCTMeSHNrr2R6hLTjOnMirn
 /l111sXXa+hkgheaR3XHlrEYp9dRyu1Hx8aLdl7v/0IpOQHkQIeiAwc7DnALGgsfq1OfrOHRpSTWO
 SYlZOacvnN9dQNE9YhagejFjJKq3xQKyWtSOPbovu7laaFnuJSs6yA3l8k88k+5LfIDyBsGCKy7um
 vF5omj4LN2RyRJXB6KRFFzh/OdYT/oj1ZLEfFu9KqMqY1JcBqzP8ZhrETltLNmZvDtTz/WlHs3SMZ
 6KuL/e0wM16OjO/w9S7tttTFE1ATb7HFLwJ8ZeoYI0HagCJy/8znvaOXSqeZQgTAoUqdG6HDHOzRs
 28cEctHw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXXYg-00AZOD-UA; Fri, 16 Apr 2021 23:07:32 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: brouer@redhat.com
Subject: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Date: Sat, 17 Apr 2021 00:07:23 +0100
Message-Id: <20210416230724.2519198-2-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416230724.2519198-1-willy@infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mips@vger.kernel.org,
 mhocko@kernel.org, linux-mm@kvack.org, mgorman@suse.de,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

32-bit architectures which expect 8-byte alignment for 8-byte integers
and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
page inadvertently expanded in 2019.  When the dma_addr_t was added,
it forced the alignment of the union to 8 bytes, which inserted a 4 byte
gap between 'flags' and the union.

Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
This restores the alignment to that of an unsigned long, and also fixes a
potential problem where (on a big endian platform), the bit used to denote
PageTail could inadvertently get set, and a racing get_user_pages_fast()
could dereference a bogus compound_head().

Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm_types.h |  4 ++--
 include/net/page_pool.h  | 12 +++++++++++-
 net/core/page_pool.c     | 12 +++++++-----
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6613b26a8894..5aacc1c10a45 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -97,10 +97,10 @@ struct page {
 		};
 		struct {	/* page_pool used by netstack */
 			/**
-			 * @dma_addr: might require a 64-bit value even on
+			 * @dma_addr: might require a 64-bit value on
 			 * 32-bit architectures.
 			 */
-			dma_addr_t dma_addr;
+			unsigned long dma_addr[2];
 		};
 		struct {	/* slab, slob and slub */
 			union {
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index b5b195305346..db7c7020746a 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
 
 static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 {
-	return page->dma_addr;
+	dma_addr_t ret = page->dma_addr[0];
+	if (sizeof(dma_addr_t) > sizeof(unsigned long))
+		ret |= (dma_addr_t)page->dma_addr[1] << 32;
+	return ret;
+}
+
+static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
+{
+	page->dma_addr[0] = addr;
+	if (sizeof(dma_addr_t) > sizeof(unsigned long))
+		page->dma_addr[1] = addr >> 32;
 }
 
 static inline bool is_page_pool_compiled_in(void)
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index ad8b0707af04..f014fd8c19a6 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -174,8 +174,10 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
 					  struct page *page,
 					  unsigned int dma_sync_size)
 {
+	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
+
 	dma_sync_size = min(dma_sync_size, pool->p.max_len);
-	dma_sync_single_range_for_device(pool->p.dev, page->dma_addr,
+	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
 					 pool->p.offset, dma_sync_size,
 					 pool->p.dma_dir);
 }
@@ -226,7 +228,7 @@ static struct page *__page_pool_alloc_pages_slow(struct page_pool *pool,
 		put_page(page);
 		return NULL;
 	}
-	page->dma_addr = dma;
+	page_pool_set_dma_addr(page, dma);
 
 	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);
@@ -294,13 +296,13 @@ void page_pool_release_page(struct page_pool *pool, struct page *page)
 		 */
 		goto skip_dma_unmap;
 
-	dma = page->dma_addr;
+	dma = page_pool_get_dma_addr(page);
 
-	/* When page is unmapped, it cannot be returned our pool */
+	/* When page is unmapped, it cannot be returned to our pool */
 	dma_unmap_page_attrs(pool->p.dev, dma,
 			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
 			     DMA_ATTR_SKIP_CPU_SYNC);
-	page->dma_addr = 0;
+	page_pool_set_dma_addr(page, 0);
 skip_dma_unmap:
 	/* This may be the last page returned, releasing the pool, so
 	 * it is not safe to reference pool afterwards.
-- 
2.30.2

