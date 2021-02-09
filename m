Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD974314913
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:47:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZYNP6gRWzDscM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:47:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QwHj1zYj; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXrd14TlzDsf1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:23:13 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id q72so985730pjq.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHso+1dmoTPyqg/ZF0QCJG3XeyxPCOLU98naLUieJmU=;
 b=QwHj1zYjx8/U4T+NrsaexKnUNeJz6V3FI8pfT++P1AguN4L2+bwgyhZpJV9bSAwRQa
 twEx8bTmtbIBs2lxyKwlCbga0ygDkQ0nQZXX5ABNhH9W7/F1oNHJLy6ve5KSFZapowUH
 93XaB33tmsf953SSQYHK0jmBpqLV34Qb65Vhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHso+1dmoTPyqg/ZF0QCJG3XeyxPCOLU98naLUieJmU=;
 b=d/FnzJYqioDJpwic0k/Fw3Xd+9NqYSAWMoKAha2hc2Q4baNXeamp5k7fqtr717ONqm
 rhm88ZZnMLcR6j+fwGRUxth8KtkzsRr1q6zkRRSRDTArbs113DJwi33RzyYv9/UnfIcZ
 EKY5+mkwxZEJTmO8bBgWdzzU2oKyCe9z7PKUkZIrMiMvE61SiTM8s0ljMP1PSdwJnWMQ
 m2+ubyzhPlGNa/CcedUNa93g0WMxBxlEkj1n9TBRbjs51QJJm+44fT6PuhgCLR8usJwE
 DmQIQ7qeWdfkIUcoTXAO4M3rG0k51dyXqQ9Jwg2/gC49LajgFX0m72hwGnRQcgA/xbgF
 BB7A==
X-Gm-Message-State: AOAM533fzeZpEiDdrmCCLBdM7hoQo74N3TlPswwXD6mQOAB8ZUbXE19C
 k5jscii+wlX+0maQpIRHgy4+Tw==
X-Google-Smtp-Source: ABdhPJxWN5Jg96v3iIqbJoN9yhUIoNv8pB4+CsEk+MHaFgKY0zVKfDlN6kq7qCIcEpJ1CyA9UerivQ==
X-Received: by 2002:a17:90a:c82:: with SMTP id
 v2mr2529855pja.171.1612851790238; 
 Mon, 08 Feb 2021 22:23:10 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id p12sm1179850pju.35.2021.02.08.22.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:23:09 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
Date: Tue,  9 Feb 2021 14:21:29 +0800
Message-Id: <20210209062131.2300005-13-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the functions, dev_swiotlb_{alloc,free} to support the memory
allocation from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |  2 ++
 kernel/dma/direct.c     | 30 ++++++++++++++++++++++--------
 kernel/dma/swiotlb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b9f2a250c8da..2cd39e102915 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -74,6 +74,8 @@ extern enum swiotlb_force swiotlb_force;
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 bool is_swiotlb_force(struct device *dev);
 bool is_dev_swiotlb_force(struct device *dev);
+struct page *dev_swiotlb_alloc(struct device *dev, size_t size, gfp_t gfp);
+bool dev_swiotlb_free(struct device *dev, struct page *page, size_t size);
 #else
 static inline bool is_swiotlb_force(struct device *dev)
 {
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index a76a1a2f24da..f9a9321f7559 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -12,6 +12,7 @@
 #include <linux/pfn.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/swiotlb.h>
 #include <linux/slab.h>
 #include "direct.h"
 
@@ -77,6 +78,10 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 
 static void __dma_direct_free_pages(struct device *dev, struct page *page, size_t size)
 {
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev_swiotlb_free(dev, page, size))
+		return;
+#endif
 	dma_free_contiguous(dev, page, size);
 }
 
@@ -89,6 +94,12 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	page = dev_swiotlb_alloc(dev, size, gfp);
+	if (page)
+		return page;
+#endif
+
 	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					   &phys_limit);
 	page = dma_alloc_contiguous(dev, size, gfp);
@@ -147,7 +158,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		gfp |= __GFP_NOWARN;
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
 		page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
 		if (!page)
 			return NULL;
@@ -160,8 +171,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	}
 
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !dev_is_dma_coherent(dev))
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
+	    !is_dev_swiotlb_force(dev))
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 
 	/*
@@ -171,7 +182,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    !gfpflags_allow_blocking(gfp) &&
 	    (force_dma_unencrypted(dev) ||
-	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
+	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	      !dev_is_dma_coherent(dev))) &&
+	    !is_dev_swiotlb_force(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	/* we always manually zero the memory once we are done */
@@ -252,15 +265,15 @@ void dma_direct_free(struct device *dev, size_t size,
 	unsigned int page_order = get_order(size);
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
 	}
 
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !dev_is_dma_coherent(dev)) {
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
+	    !is_dev_swiotlb_force(dev)) {
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
 		return;
 	}
@@ -288,7 +301,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	void *ret;
 
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
-	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
+	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
+	    !is_dev_swiotlb_force(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	page = __dma_direct_alloc_pages(dev, size, gfp);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index fd9c1bd183ac..8b77fd64199e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -836,6 +836,40 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *dev_swiotlb_alloc(struct device *dev, size_t size, gfp_t gfp)
+{
+	struct swiotlb *swiotlb;
+	phys_addr_t tlb_addr;
+	unsigned int index;
+
+	/* dev_swiotlb_alloc can be used only in the context which permits sleeping. */
+	if (!dev->dev_swiotlb || !gfpflags_allow_blocking(gfp))
+		return NULL;
+
+	swiotlb = dev->dev_swiotlb;
+	index = swiotlb_tbl_find_free_region(dev, swiotlb->start, size, 0);
+	if (index < 0)
+		return NULL;
+
+	tlb_addr = swiotlb->start + (index << IO_TLB_SHIFT);
+
+	return pfn_to_page(PFN_DOWN(tlb_addr));
+}
+
+bool dev_swiotlb_free(struct device *dev, struct page *page, size_t size)
+{
+	unsigned int index;
+	phys_addr_t tlb_addr = page_to_phys(page);
+
+	if (!is_swiotlb_buffer(dev, tlb_addr))
+		return false;
+
+	index = (tlb_addr - dev->dev_swiotlb->start) >> IO_TLB_SHIFT;
+	swiotlb_tbl_release_region(dev, index, size);
+
+	return true;
+}
+
 bool is_swiotlb_force(struct device *dev)
 {
 	return unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dev_swiotlb;
-- 
2.30.0.478.g8a0d178c01-goog

