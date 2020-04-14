Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBF1A7F1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:04:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491nKt4jpvzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 00:04:34 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=DI14kD1X; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491mDQ3tb5zDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 23:14:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mANdo6j2epctno1InF04j4Dw77xmPp8h8wAaCdRF8Vw=; b=DI14kD1XeS0W5KhA0t6BAHp3rd
 S0XmRj6BN9qLSnyQW4BWceI286H+sdL6l5wXQlp/PagEahqNQoc/Vte3z0dkmoN7WyC3QSq5Nos84
 1U7uvNkXXTqwdBB+sCYnGPpQyVchL29JLw12DGWfGNnoC2a1smEJ/BbCn+9fMvEZQqpo4LGRxbyRi
 q3g7FqT9277low0bB3O+WlMpXc/HBUbKaqELKnzXOdaelj3NHsFnhWBELU6D3sN43uGKnUsH35Fcl
 69oCltdRCL44kh1m43h+mvk3bQT0DCP+qBXhKFALQJtSDK19n3cB04OZpdAgN00ZPPjcchQ1N/Gd9
 4u8hovcQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLOU-0006eH-Ny; Tue, 14 Apr 2020 13:14:27 +0000
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
Subject: [PATCH 10/29] mm: rename CONFIG_PGTABLE_MAPPING to
 CONFIG_ZSMALLOC_PGTABLE_MAPPING
Date: Tue, 14 Apr 2020 15:13:29 +0200
Message-Id: <20200414131348.444715-11-hch@lst.de>
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

Rename the Kconfig variable to clarify the scope.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/configs/omap2plus_defconfig | 2 +-
 include/linux/zsmalloc.h             | 2 +-
 mm/Kconfig                           | 2 +-
 mm/zsmalloc.c                        | 8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3cc3ca5fa027..583d8abd80a4 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -81,7 +81,7 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
 CONFIG_CMA=y
 CONFIG_ZSMALLOC=m
-CONFIG_PGTABLE_MAPPING=y
+CONFIG_ZSMALLOC_PGTABLE_MAPPING=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 2219cce81ca4..0fdbf653b173 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -20,7 +20,7 @@
  * zsmalloc mapping modes
  *
  * NOTE: These only make a difference when a mapped object spans pages.
- * They also have no effect when PGTABLE_MAPPING is selected.
+ * They also have no effect when ZSMALLOC_PGTABLE_MAPPING is selected.
  */
 enum zs_mapmode {
 	ZS_MM_RW, /* normal read-write mapping */
diff --git a/mm/Kconfig b/mm/Kconfig
index c1acc34c1c35..09a9edfb8461 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -705,7 +705,7 @@ config ZSMALLOC
 	  returned by an alloc().  This handle must be mapped in order to
 	  access the allocated space.
 
-config PGTABLE_MAPPING
+config ZSMALLOC_PGTABLE_MAPPING
 	bool "Use page table mapping to access object in zsmalloc"
 	depends on ZSMALLOC
 	help
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 2f836a2b993f..ac0524330b9b 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -293,7 +293,7 @@ struct zspage {
 };
 
 struct mapping_area {
-#ifdef CONFIG_PGTABLE_MAPPING
+#ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
 	struct vm_struct *vm; /* vm area for mapping object that span pages */
 #else
 	char *vm_buf; /* copy buffer for objects that span pages */
@@ -1113,7 +1113,7 @@ static struct zspage *find_get_zspage(struct size_class *class)
 	return zspage;
 }
 
-#ifdef CONFIG_PGTABLE_MAPPING
+#ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
 static inline int __zs_cpu_up(struct mapping_area *area)
 {
 	/*
@@ -1151,7 +1151,7 @@ static inline void __zs_unmap_object(struct mapping_area *area,
 	unmap_kernel_range(addr, PAGE_SIZE * 2);
 }
 
-#else /* CONFIG_PGTABLE_MAPPING */
+#else /* CONFIG_ZSMALLOC_PGTABLE_MAPPING */
 
 static inline int __zs_cpu_up(struct mapping_area *area)
 {
@@ -1233,7 +1233,7 @@ static void __zs_unmap_object(struct mapping_area *area,
 	pagefault_enable();
 }
 
-#endif /* CONFIG_PGTABLE_MAPPING */
+#endif /* CONFIG_ZSMALLOC_PGTABLE_MAPPING */
 
 static int zs_cpu_prepare(unsigned int cpu)
 {
-- 
2.25.1

