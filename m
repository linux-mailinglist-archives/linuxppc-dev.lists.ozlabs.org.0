Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF41A2266
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 14:58:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y4805N0lzDq8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 22:58:08 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=O5jAerjD; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2tD32mrzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:01:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kSiif4wtedwpdt50zgS9p2DvMcuq0oyuGm5DAffS2Lc=; b=O5jAerjDMyDSpUBMTA/oevrNio
 S+TlXAsFGadlEtQRn1K3WEKNHl4L8/5pvGWwOLyvixbzEcvd+/ni+/XU7d+F+gFhv2eHAswYI0p5y
 3vblTkwNDKub9/GntTSs3x8s7XoXcgKJWPdjELcFB03oSS6bmMLVCycLYwliDuP1T49LyprcML2MU
 I+lYkcJVsuhyarlTX3/yPf/XwGZTqxWVjwXdtAKHkAKx9VvIp4YlafGpxerk1luAU75O4vT1PQ0f6
 jtPBngw3NtlCkVbEBYkQYZEyDSVKr4FEj31ywgR/Pkbn4h44juFzKCV/mmP8+2Spa1LpO8PFmgUYF
 +AaNY5dQ==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Nw-0005cH-PA; Wed, 08 Apr 2020 12:00:49 +0000
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
Subject: [PATCH 22/28] mm: remove both instances of __vmalloc_node_flags
Date: Wed,  8 Apr 2020 13:59:20 +0200
Message-Id: <20200408115926.1467567-23-hch@lst.de>
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

The real version just had a few callers that can open code it and
remove one layer of indirection.  The nommu stub was public but only
had a single caller, so remove it and avoid a CONFIG_MMU ifdef in
vmalloc.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vmalloc.h |  9 ---------
 mm/nommu.c              |  3 ++-
 mm/vmalloc.c            | 20 ++++++--------------
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c1b9d6eca05f..4a46d296e70d 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -115,17 +115,8 @@ extern void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
 			const void *caller);
-#ifndef CONFIG_MMU
-extern void *__vmalloc_node_flags(unsigned long size, int node, gfp_t flags);
-static inline void *__vmalloc_node_flags_caller(unsigned long size, int node,
-						gfp_t flags, void *caller)
-{
-	return __vmalloc_node_flags(size, node, flags);
-}
-#else
 extern void *__vmalloc_node_flags_caller(unsigned long size,
 					 int node, gfp_t flags, void *caller);
-#endif
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
diff --git a/mm/nommu.c b/mm/nommu.c
index 2df549adb22b..9553efa59787 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -150,7 +150,8 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc);
 
-void *__vmalloc_node_flags(unsigned long size, int node, gfp_t flags)
+void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
+		void *caller)
 {
 	return __vmalloc(size, flags);
 }
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index de7952959e82..3d59d848ad48 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2566,14 +2566,6 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(__vmalloc);
 
-static inline void *__vmalloc_node_flags(unsigned long size,
-					int node, gfp_t flags)
-{
-	return __vmalloc_node(size, 1, flags, node,
-				__builtin_return_address(0));
-}
-
-
 void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
 				  void *caller)
 {
@@ -2594,8 +2586,8 @@ void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
  */
 void *vmalloc(unsigned long size)
 {
-	return __vmalloc_node_flags(size, NUMA_NO_NODE,
-				    GFP_KERNEL);
+	return __vmalloc_node(size, 1, GFP_KERNEL, NUMA_NO_NODE,
+				__builtin_return_address(0));
 }
 EXPORT_SYMBOL(vmalloc);
 
@@ -2614,8 +2606,8 @@ EXPORT_SYMBOL(vmalloc);
  */
 void *vzalloc(unsigned long size)
 {
-	return __vmalloc_node_flags(size, NUMA_NO_NODE,
-				GFP_KERNEL | __GFP_ZERO);
+	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, NUMA_NO_NODE,
+				__builtin_return_address(0));
 }
 EXPORT_SYMBOL(vzalloc);
 
@@ -2670,8 +2662,8 @@ EXPORT_SYMBOL(vmalloc_node);
  */
 void *vzalloc_node(unsigned long size, int node)
 {
-	return __vmalloc_node_flags(size, node,
-			 GFP_KERNEL | __GFP_ZERO);
+	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, node,
+				__builtin_return_address(0));
 }
 EXPORT_SYMBOL(vzalloc_node);
 
-- 
2.25.1

