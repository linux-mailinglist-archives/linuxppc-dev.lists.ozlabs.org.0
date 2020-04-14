Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1401A7FF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:39:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491p5h0XxdzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 00:39:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=TTGzefDl; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491mFJ4bFNzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 23:15:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mUi9tON4ej1ewdvxH/Y3Bh1Uu75foZsu5k8BSiOetPw=; b=TTGzefDlxM5zZ7ZI9vyPdQLQWU
 8Co/GO5oQR1RbAWsucIza4bRrae0VkT1XczDcSY+opQD4yShZXYZRAV+jCBatoQN2iWJNJg6ZlEpN
 FarRuTpqIjex3XQ+IfsMAaHzeOiiUKLLhCXfmUG8aiVfeq+JILJkmPRUkKAV/p/Jj2aw0kc1QLdWi
 zRQBCGuk4frwrVFmUY/3lWKXa7u0GfeN2T9xEQBSjZFS8ka3ApgFA9sdsDCbOGIcfjCZWRZV0IUIo
 M97ON7GyK6vpmBBd4ABS2BnT2HhsQ8xHuc5PX+MV2/FNsVWj/czHgRYmikUpENv48KzYfQFQby5Xc
 8wfVpKbQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLPG-0000Nu-Up; Tue, 14 Apr 2020 13:15:15 +0000
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
Subject: [PATCH 24/29] mm: remove __vmalloc_node_flags_caller
Date: Tue, 14 Apr 2020 15:13:43 +0200
Message-Id: <20200414131348.444715-25-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
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

Just use __vmalloc_node instead which gets and extra argument.  To be
able to to use __vmalloc_node in all caller make it available outside
of vmalloc and implement it in nommu.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/vmalloc.h |  4 ++--
 kernel/bpf/syscall.c    |  5 ++---
 mm/nommu.c              |  4 ++--
 mm/util.c               |  2 +-
 mm/vmalloc.c            | 10 +---------
 5 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 4a46d296e70d..108f49b47756 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -115,8 +115,8 @@ extern void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
 			const void *caller);
-extern void *__vmalloc_node_flags_caller(unsigned long size,
-					 int node, gfp_t flags, void *caller);
+void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
+		int node, const void *caller);
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 64783da34202..48d98ea8fad6 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -299,9 +299,8 @@ static void *__bpf_map_area_alloc(u64 size, int numa_node, bool mmapable)
 		return vmalloc_user_node_flags(size, numa_node, GFP_KERNEL |
 					       __GFP_RETRY_MAYFAIL | flags);
 	}
-	return __vmalloc_node_flags_caller(size, numa_node,
-					   GFP_KERNEL | __GFP_RETRY_MAYFAIL |
-					   flags, __builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_RETRY_MAYFAIL | flags,
+			      numa_node, __builtin_return_address(0));
 }
 
 void *bpf_map_area_alloc(u64 size, int numa_node)
diff --git a/mm/nommu.c b/mm/nommu.c
index 9553efa59787..81a86cd85893 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -150,8 +150,8 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc);
 
-void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
-		void *caller)
+void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
+		int node, const void *caller)
 {
 	return __vmalloc(size, flags);
 }
diff --git a/mm/util.c b/mm/util.c
index 988d11e6c17c..6d5868adbe18 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -580,7 +580,7 @@ void *kvmalloc_node(size_t size, gfp_t flags, int node)
 	if (ret || size <= PAGE_SIZE)
 		return ret;
 
-	return __vmalloc_node_flags_caller(size, node, flags,
+	return __vmalloc_node(size, 1, flags, node,
 			__builtin_return_address(0));
 }
 EXPORT_SYMBOL(kvmalloc_node);
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3d59d848ad48..ae8249ef5821 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2400,8 +2400,6 @@ void *vmap(struct page **pages, unsigned int count,
 }
 EXPORT_SYMBOL(vmap);
 
-static void *__vmalloc_node(unsigned long size, unsigned long align,
-			    gfp_t gfp_mask, int node, const void *caller);
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, int node)
 {
@@ -2552,7 +2550,7 @@ EXPORT_SYMBOL_GPL(__vmalloc_node_range);
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-static void *__vmalloc_node(unsigned long size, unsigned long align,
+void *__vmalloc_node(unsigned long size, unsigned long align,
 			    gfp_t gfp_mask, int node, const void *caller)
 {
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
@@ -2566,12 +2564,6 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc);
 
-void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
-				  void *caller)
-{
-	return __vmalloc_node(size, 1, flags, node, caller);
-}
-
 /**
  * vmalloc - allocate virtually contiguous memory
  * @size:    allocation size
-- 
2.25.1

