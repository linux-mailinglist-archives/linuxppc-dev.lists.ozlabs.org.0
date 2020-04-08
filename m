Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDC1A2200
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:27:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y3Sd4py3zDqvT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:27:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+90f925bb5134fe9b5196+6072+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=GMLbPDv5; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2sX6vyZzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:00:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WzOt0GdNQnN9W8rWLv3kSycAULlc6HEQKX8/oCDxHuU=; b=GMLbPDv5CKJVuoIiX6Qpd0FpUQ
 dPpYg6qQF1jZKryrp6PHJKxeXakwTjTPAtRacgwRzfMttFQ/3S8mMj+ngjyDY0d8gksH5TDW35WMg
 rHsQFLJLjFMhFtBTRzf1nbgywfs0xdwNxh384zReYJjaRUgVPNSSU5JN2M23dbOcWA0rRmiPEttIO
 5KVNv70PJhaSCZPinD4MBT/Ocy8K0cT2epCFc8i/hKnENAsBf6f4WGjWsjTRfd44NwfvyPYg4PgDR
 P+OFfdp+u3v8tPVn68ns4fPRuGKHVslpBJj5vCgJ+9Y8B4MRBfOqdLaGv888mzrw9td0sRTWMHSYJ
 hDt03PQw==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9NJ-0002pA-RG; Wed, 08 Apr 2020 12:00:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 11/28] mm: pass addr as unsigned long to vb_free
Date: Wed,  8 Apr 2020 13:59:09 +0200
Message-Id: <20200408115926.1467567-12-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ever use of addr in vb_free casts to unsigned long first, and the caller
has an unsigned long version of the address available anyway.  Just pass
that and avoid all the casts.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/vmalloc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 9183fc0d365a..aada9e9144bd 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1664,7 +1664,7 @@ static void *vb_alloc(unsigned long size, gfp_t gfp_mask)
 	return vaddr;
 }
 
-static void vb_free(const void *addr, unsigned long size)
+static void vb_free(unsigned long addr, unsigned long size)
 {
 	unsigned long offset;
 	unsigned long vb_idx;
@@ -1674,24 +1674,22 @@ static void vb_free(const void *addr, unsigned long size)
 	BUG_ON(offset_in_page(size));
 	BUG_ON(size > PAGE_SIZE*VMAP_MAX_ALLOC);
 
-	flush_cache_vunmap((unsigned long)addr, (unsigned long)addr + size);
+	flush_cache_vunmap(addr, addr + size);
 
 	order = get_order(size);
 
-	offset = (unsigned long)addr & (VMAP_BLOCK_SIZE - 1);
-	offset >>= PAGE_SHIFT;
+	offset = (addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
 
-	vb_idx = addr_to_vb_idx((unsigned long)addr);
+	vb_idx = addr_to_vb_idx(addr);
 	rcu_read_lock();
 	vb = radix_tree_lookup(&vmap_block_tree, vb_idx);
 	rcu_read_unlock();
 	BUG_ON(!vb);
 
-	vunmap_page_range((unsigned long)addr, (unsigned long)addr + size);
+	vunmap_page_range(addr, addr + size);
 
 	if (debug_pagealloc_enabled_static())
-		flush_tlb_kernel_range((unsigned long)addr,
-					(unsigned long)addr + size);
+		flush_tlb_kernel_range(addr, addr + size);
 
 	spin_lock(&vb->lock);
 
@@ -1791,7 +1789,7 @@ void vm_unmap_ram(const void *mem, unsigned int count)
 
 	if (likely(count <= VMAP_MAX_ALLOC)) {
 		debug_check_no_locks_freed(mem, size);
-		vb_free(mem, size);
+		vb_free(addr, size);
 		return;
 	}
 
-- 
2.25.1

