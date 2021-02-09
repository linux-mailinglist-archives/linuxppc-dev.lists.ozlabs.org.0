Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3433148FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:39:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZYCh6T5MzDscQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:39:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NhEm9T2A; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXr35YzgzDsdK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:43 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id gb24so976798pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUcKCdqxUtmE3c3/sCLCFX58+aEPLItGYu5wwEcivTc=;
 b=NhEm9T2AwADa9VsvefRZO3hJf81eglORlqEc/M/a8rR0kuSIY5UrlWGbaksqIVirGr
 J6QDJ3CyNkeplzaOrje+vpzgt129yWbwHTzlb+beGZFWZQ8LQ0tH754TJy6h0q3jS8jo
 cGxvFhbRKlBHTIBko/408oiJovV3JTKwJW8QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUcKCdqxUtmE3c3/sCLCFX58+aEPLItGYu5wwEcivTc=;
 b=p8N5qda4AKCBsrW4Vi45k0/uC6RQpo2c0UtCvFF0ZAB6n1B8BdaxkMwMUoKukMurEt
 0gt/6fnGyz45ngd9HJLPGM1HRA+K/Z28e4vBNQafJo+pr7zCb+1n1b8Y0lZpfiY/sUin
 4szcESwHngZ7qQ/GwvKAciZvr8WHDZcMJiRw+YelhD4YI2qg6BgbsUKVllIFn6gZ2WVV
 Bb1unlNUXddsWsobFw0M7piNXg7y3ccQhXv0x5HiZ2fTZOhUxxxEqQOTOg29V/x8Jpgn
 J4GTB/3NuIVdeYhe7zGLn5PvmbxZBbg3TyEW2hosLRjw/9Tq13Nv7y8gmAku25mN+XBk
 amGw==
X-Gm-Message-State: AOAM530tAzD9p4f9vOPe05Uwd50ztDfeuKMrpImzDmwRA3SyjfgDtxRT
 9NNBJe1cnfyQaMHb5H1uEihliA==
X-Google-Smtp-Source: ABdhPJxTkbyFhURADasjsjB42g8YIEdg4z+Ug1Qla2hS5HdHoxmM0uHRHvdpONYXgEmtPzgr5O1D4Q==
X-Received: by 2002:a17:90a:49c4:: with SMTP id
 l4mr2647464pjm.33.1612851760260; 
 Mon, 08 Feb 2021 22:22:40 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id x14sm20837364pfj.15.2021.02.08.22.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:39 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 08/14] swiotlb: Use restricted DMA pool if available
Date: Tue,  9 Feb 2021 14:21:25 +0800
Message-Id: <20210209062131.2300005-9-tientzu@chromium.org>
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

Regardless of swiotlb setting, the restricted DMA pool is preferred if
available.

The restricted DMA pools provide a basic level of protection against the
DMA overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system
needs to provide a way to lock down the memory access, e.g., MPU.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 13 +++++++++++++
 kernel/dma/direct.h     |  2 +-
 kernel/dma/swiotlb.c    | 20 +++++++++++++++++---
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index f13a52a97382..76f86c684524 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -71,6 +71,15 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+bool is_swiotlb_force(struct device *dev);
+#else
+static inline bool is_swiotlb_force(struct device *dev)
+{
+	return unlikely(swiotlb_force == SWIOTLB_FORCE);
+}
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
 bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
@@ -80,6 +89,10 @@ phys_addr_t get_swiotlb_start(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long new_size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
+static inline bool is_swiotlb_force(struct device *dev)
+{
+	return false;
+}
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 7b83b1595989..b011db1b625d 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+	if (is_swiotlb_force(dev))
 		return swiotlb_map(dev, phys, size, dir, attrs);
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e22e7ae75f1c..6fdebde8fb1f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -40,6 +40,7 @@
 #include <linux/debugfs.h>
 #endif
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -109,6 +110,10 @@ static struct swiotlb default_swiotlb;
 
 static inline struct swiotlb *get_swiotlb(struct device *dev)
 {
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dev_swiotlb)
+		return dev->dev_swiotlb;
+#endif
 	return &default_swiotlb;
 }
 
@@ -508,7 +513,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, swiotlb->start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
@@ -519,7 +524,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	unsigned long max_slots;
 	unsigned long tmp_io_tlb_used;
 
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (no_iotlb_memory && !hwdev->dev_swiotlb)
+#else
 	if (no_iotlb_memory)
+#endif
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
 	if (mem_encrypt_active())
@@ -641,7 +650,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, size_t alloc_size,
 			      enum dma_data_direction dir, unsigned long attrs)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
 	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
@@ -689,7 +698,7 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	struct swiotlb *swiotlb = &default_swiotlb;
+	struct swiotlb *swiotlb = get_swiotlb(hwdev);
 	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = swiotlb->orig_addr[index];
 
@@ -801,6 +810,11 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+bool is_swiotlb_force(struct device *dev)
+{
+	return unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dev_swiotlb;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.30.0.478.g8a0d178c01-goog

