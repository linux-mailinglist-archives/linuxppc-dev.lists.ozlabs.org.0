Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D8392ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 15:03:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrSfs5kN1z3d8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 23:03:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kcN4x88w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=kcN4x88w; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrSbC5JPNz3bvG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 23:00:07 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso340678pjq.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7RrpH6OgXx/lTZyexKL+IWeAI7yB0yfCFBVtG2zWbw=;
 b=kcN4x88wnIqA2eddyBkI1s+5ccQseApdZLb8/RSr2+Fa520MxJZZ6NkX9r/ML2uBrj
 kvMXO+zNUanE1yYV9wWE+HheUK89EpCu8v6POAAGHEkAn5qXZCd1I7/7KAUnWJ2R0GFj
 AiEWOWj6q+T+/qXKxk0sPdE2cDhBD8s6mX/Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7RrpH6OgXx/lTZyexKL+IWeAI7yB0yfCFBVtG2zWbw=;
 b=MVE667KmhuoRrqJPCtPA5BXJNvbPqUTkppSE1mKnykiutj5nmxIACA5Xe8BhZbZ/Nn
 ElQi8HcngntUQp+YrvbdcOsBFVTfQVBwRxi1UV4ZWz6iUyvCodwZRoqDihw0fUPl5PmH
 tUOaunCNdJ3R9q573x72TgA8/TrfjY8ZVAoiE0Drr5OLtCGrQ2htt60PHrzMug7njXxB
 0OYYgp8lAWMBdn0pEhzK5QohSOYNuoKQoFgO5xJcoiC2ZXaIOAfmAYKLMKmjWwjVd8zy
 2DZM0B2aedzwnDWZ4rbY5ABABmeZY83Dwtzl4teK5em0EhxlnpuAQfFafPnHVGtu7rzj
 O81g==
X-Gm-Message-State: AOAM530xV7/aAxkOMhDboRRAJjRN5t43/h737L68BaBSq6ZB681XjMjT
 sIeFFAn2eaFyWebpx8OXUD/vKA==
X-Google-Smtp-Source: ABdhPJx/S80brWa6yq+WbXDwFafH2VwKxtCuF8GRMQTIN21BHKQJi5x8f1RJPDSguTNDbXCIi1shzA==
X-Received: by 2002:a17:90b:33d1:: with SMTP id
 lk17mr3678617pjb.154.1622120405435; 
 Thu, 27 May 2021 06:00:05 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id m1sm2027143pgd.78.2021.05.27.05.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:00:04 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v8 08/15] swiotlb: Bounce data from/to restricted DMA pool if
 available
Date: Thu, 27 May 2021 20:58:38 +0800
Message-Id: <20210527125845.1852284-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Note that is_dev_swiotlb_force doesn't check if
swiotlb_force == SWIOTLB_FORCE. Otherwise the memory allocation behavior
with default swiotlb will be changed by the following patche
("dma-direct: Allocate memory from restricted DMA pool if available").

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 13 +++++++++++++
 kernel/dma/direct.c     |  3 ++-
 kernel/dma/direct.h     |  3 ++-
 kernel/dma/swiotlb.c    |  8 ++++----
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index c530c976d18b..0c5a18d9cf89 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -120,6 +120,15 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev->dma_io_tlb_mem)
+		return true;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+	return false;
+}
+
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
@@ -131,6 +140,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
+static inline bool is_dev_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline void swiotlb_exit(void)
 {
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 7a88c34d0867..078f7087e466 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -496,7 +496,8 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
 	if (is_swiotlb_active(dev) &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE ||
+	     is_dev_swiotlb_force(dev)))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 13e9e7158d94..f94813674e23 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,8 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (unlikely(swiotlb_force == SWIOTLB_FORCE) ||
+	    is_dev_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b2b6503ecd88..fa7f23fffc81 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -347,7 +347,7 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 			   enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
@@ -429,7 +429,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -506,7 +506,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int i;
 	int index;
@@ -557,7 +557,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
-- 
2.31.1.818.g46aad6cb9e-goog

