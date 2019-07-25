Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39374769
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 08:41:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vN101MTCzDqHd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 16:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+83ed8b149c19f06b98a5+5814+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vMrJ0fF2zDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 16:34:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/paqKhhFQqncweYrMpXmsaTtizhp0lMTpMnsOyVDMs=; b=sdITCpYN2RhPS1bFyZTaeMFYv+
 PNO1DyB+d/qmHI3dJMLtQVY7U98ZnkH2I/vJKmpI7xcZKxGx+fhP8TjtjJfPXPjhpzEPAIotxhnca
 VgV589/GCDvlFpldqqESQcX+Xhk5Wp3SEfn/J+iPhMLvSwTMAMC9UUEWyy/M2hoD/DyKIQnzN26gH
 5bGKE61RCB0YxNgiTlSIpd0VM+YsnhBif5qVfgWfcmsAf1BNqoegK4FcKw/K98tXwIj94553wri1Z
 UwFfJVEMPjyzjVdkjnjmL+wLYrSFePM5CjofSggfg+9fZyBQOrVrgApyGugZ2UaN+Hlff57rMje8a
 DQ0MnbBA==;
Received: from p57b3f613.dip0.t-ipconnect.de ([87.179.246.19] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqXKR-0000KM-CH; Thu, 25 Jul 2019 06:34:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/5] dma-mapping: provide a better default ->get_required_mask
Date: Thu, 25 Jul 2019 08:34:00 +0200
Message-Id: <20190725063401.29904-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725063401.29904-1-hch@lst.de>
References: <20190725063401.29904-1-hch@lst.de>
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
of IOVA space, and the generic direct mapping code already provides its
own routines that is intelligent based on the amount of memory actually
present.  Wire up the dma-direct routine for the ARM direct mapping code
as well, and otherwise default to the constant 32-bit mask.  This way
we only need to override it for the occasional odd IOMMU that requires
64-bit IOVA support, or IOMMU drivers that are more efficient if they
can fall back to the direct mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c               |  3 +++
 arch/powerpc/platforms/ps3/system-bus.c |  7 ------
 arch/x86/kernel/amd_gart_64.c           |  1 +
 kernel/dma/mapping.c                    | 30 +++++++++----------------
 4 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 4410af33c5c4..9c9a23e5600d 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -14,6 +14,7 @@
 #include <linux/list.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/dma-contiguous.h>
@@ -192,6 +193,7 @@ const struct dma_map_ops arm_dma_ops = {
 	.sync_sg_for_cpu	= arm_dma_sync_sg_for_cpu,
 	.sync_sg_for_device	= arm_dma_sync_sg_for_device,
 	.dma_supported		= arm_dma_supported,
+	.get_required_mask	= dma_direct_get_required_mask,
 };
 EXPORT_SYMBOL(arm_dma_ops);
 
@@ -212,6 +214,7 @@ const struct dma_map_ops arm_coherent_dma_ops = {
 	.map_sg			= arm_dma_map_sg,
 	.map_resource		= dma_direct_map_resource,
 	.dma_supported		= arm_dma_supported,
+	.get_required_mask	= dma_direct_get_required_mask,
 };
 EXPORT_SYMBOL(arm_coherent_dma_ops);
 
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 70fcc9736a8c..3542b7bd6a46 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -686,18 +686,12 @@ static int ps3_dma_supported(struct device *_dev, u64 mask)
 	return mask >= DMA_BIT_MASK(32);
 }
 
-static u64 ps3_dma_get_required_mask(struct device *_dev)
-{
-	return DMA_BIT_MASK(32);
-}
-
 static const struct dma_map_ops ps3_sb_dma_ops = {
 	.alloc = ps3_alloc_coherent,
 	.free = ps3_free_coherent,
 	.map_sg = ps3_sb_map_sg,
 	.unmap_sg = ps3_sb_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.get_required_mask = ps3_dma_get_required_mask,
 	.map_page = ps3_sb_map_page,
 	.unmap_page = ps3_unmap_page,
 	.mmap = dma_common_mmap,
@@ -710,7 +704,6 @@ static const struct dma_map_ops ps3_ioc0_dma_ops = {
 	.map_sg = ps3_ioc0_map_sg,
 	.unmap_sg = ps3_ioc0_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.get_required_mask = ps3_dma_get_required_mask,
 	.map_page = ps3_ioc0_map_page,
 	.unmap_page = ps3_unmap_page,
 	.mmap = dma_common_mmap,
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index a65b4a9c7f87..d02662238b57 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -680,6 +680,7 @@ static const struct dma_map_ops gart_dma_ops = {
 	.dma_supported			= dma_direct_supported,
 	.mmap				= dma_common_mmap,
 	.get_sgtable			= dma_common_get_sgtable,
+	.get_required_mask		= dma_direct_get_required_mask,
 };
 
 static void gart_iommu_shutdown(void)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index cdb157cd70e7..7dff1829c8c5 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -231,25 +231,6 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL(dma_mmap_attrs);
 
-static u64 dma_default_get_required_mask(struct device *dev)
-{
-	u32 low_totalram = ((max_pfn - 1) << PAGE_SHIFT);
-	u32 high_totalram = ((max_pfn - 1) >> (32 - PAGE_SHIFT));
-	u64 mask;
-
-	if (!high_totalram) {
-		/* convert to mask just covering totalram */
-		low_totalram = (1 << (fls(low_totalram) - 1));
-		low_totalram += low_totalram - 1;
-		mask = low_totalram;
-	} else {
-		high_totalram = (1 << (fls(high_totalram) - 1));
-		high_totalram += high_totalram - 1;
-		mask = (((u64)high_totalram) << 32) + 0xffffffff;
-	}
-	return mask;
-}
-
 u64 dma_get_required_mask(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
@@ -258,7 +239,16 @@ u64 dma_get_required_mask(struct device *dev)
 		return dma_direct_get_required_mask(dev);
 	if (ops->get_required_mask)
 		return ops->get_required_mask(dev);
-	return dma_default_get_required_mask(dev);
+
+	/*
+	 * We require every DMA ops implementation to at least support a 32-bit
+	 * DMA mask (and use bounce buffering if that isn't supported in
+	 * hardware).  As the direct mapping code has its own routine to
+	 * actually report an optimal mask we default to 32-bit here as that
+	 * is the right thing for most IOMMUs, and at least not actively
+	 * harmful in general.
+	 */
+	return DMA_BIT_MASK(32);
 }
 EXPORT_SYMBOL_GPL(dma_get_required_mask);
 
-- 
2.20.1

