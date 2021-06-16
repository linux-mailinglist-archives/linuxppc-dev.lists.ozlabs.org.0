Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ED33A922B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Zs234gqz307Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:24:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EVy8q8LR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=EVy8q8LR; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4ZqL2Dhfz3bwV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:22:38 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id x16so1313020pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pEdYN/CfqowQHo6LUUVSljtyJhX5z4kEbgyPSIqEKts=;
 b=EVy8q8LRlBwXjbv5ZgdM2So19WcSXgvUoCIgbciZgrT3bQ/Raz5EfpUl8QY1EeXxlR
 AtchZXRhTiVu8fzyfGqQsWJ/9eTD+e6JzMhRxq8qv1qy08hGq8Fg+qotTCOaejp1tcgi
 Xzx8bRHUlFhvQX+18c32FXdPsodjGeZnyhYIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pEdYN/CfqowQHo6LUUVSljtyJhX5z4kEbgyPSIqEKts=;
 b=jsOTjzEpm9EvbJscfr2GA9sWNX92NyXtwWmgQB1Al1yihrqoe6xDdtC1xuYMJTd0yr
 utrIUNInggwicM2SY9mNxzN4iFQvZ7oPk0/yRW7Gl5mogbZLnH71uKZa1livWBw4nFVW
 HkYagxNYAMGV7bEtJ3yywg6oHMHqdZGgxQ40Idhnxo+qdzl4Kj1KFKMW/HhhpKIV9KEK
 jpJFIjB1mCgVMrO7iAo8SAXyZA3MY0nTOnJJwu5AKwBDA5l6kyrQQ9a1YZol1pmSFWLJ
 8H9yKkvDxLR+rMua+fRR2mB5tMlO5InSOTDVRnVvkfgf4ikDoZfUUVZATTOVrSffSw4O
 crBw==
X-Gm-Message-State: AOAM5300+CUHCa4NfImQzOffUUBCCciQqYkJ5d5ab/t/oAviEPMYMbOD
 G035zCb4BQr1+t0licMFIeJfsQ==
X-Google-Smtp-Source: ABdhPJwSkx5TMyTilGiVCcnPAeSvfxyOuh/e9rZIyr4xzr0620kbXFmZJ3BjZw8BvaIHoMpQs8L2Sw==
X-Received: by 2002:a62:2785:0:b029:2ec:b165:db1f with SMTP id
 n127-20020a6227850000b02902ecb165db1fmr7950026pfn.34.1623824555026; 
 Tue, 15 Jun 2021 23:22:35 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id m2sm1096854pjf.24.2021.06.15.23.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:22:34 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v12 03/12] swiotlb: Set dev->dma_io_tlb_mem to the swiotlb
 pool used
Date: Wed, 16 Jun 2021 14:21:48 +0800
Message-Id: <20210616062157.953777-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616062157.953777-1-tientzu@chromium.org>
References: <20210616062157.953777-1-tientzu@chromium.org>
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

Always have the pointer to the swiotlb pool used in struct device. This
could help simplify the code for other pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/base/core.c    | 4 ++++
 include/linux/device.h | 4 ++++
 kernel/dma/swiotlb.c   | 8 ++++----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f29839382f81..cb3123e3954d 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -27,6 +27,7 @@
 #include <linux/netdevice.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
+#include <linux/swiotlb.h>
 #include <linux/sysfs.h>
 #include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
@@ -2736,6 +2737,9 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
 #endif
+#ifdef CONFIG_SWIOTLB
+	dev->dma_io_tlb_mem = io_tlb_default_mem;
+#endif
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index ba660731bd25..240d652a0696 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -416,6 +416,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
+ * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -518,6 +519,9 @@ struct device {
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
+#endif
+#ifdef CONFIG_SWIOTLB
+	struct io_tlb_mem *dma_io_tlb_mem;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index af416bcd1914..a9f5c08dd94a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -339,7 +339,7 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 			   enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	unsigned int offset = (tlb_addr - mem->start) & (IO_TLB_SIZE - 1);
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
@@ -430,7 +430,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -507,7 +507,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int i;
 	int index;
@@ -558,7 +558,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
-- 
2.32.0.272.g935e593368-goog

