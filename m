Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E7B89D265
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:27:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=QHxxcWbm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGFz2bHVz3dWv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=QHxxcWbm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGDN3LhLz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:25:40 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 9BB83440317;
	Tue,  9 Apr 2024 09:17:44 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712643465;
	bh=0hgo4O4gn7WmugyfT+01Avn3n1mKMQvAQDRnfRZipYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHxxcWbmyQfXE4BxeT+gjPvaPi11vN5dFnOJCh6m6YGFDE6Ayf9vzoDbb3jvclyxE
	 CV+N6wKFW2R2QiAAHIPg0WoSZZCitar4W0XwFxeOCU6Ai2D0ILnBH7bKtmwl1G17dI
	 SPr0H3+mxsawR/qdRsnQdCnOV/VK98dRPCJ809l6+9bN/SvD8QTz0eTB9sXfTF1Ni7
	 R/Zs0VH2/FkwT+DDYxbE+PCqeb/FK48Sonx6NvR6U5lrErLPSaqzewMWw3lNyhhzyE
	 VNVoE4h+tIMMbffxgZfaLdETp8y05fRfAS+iarX8zrJZJAxr15pEpm6dtoLvfg7ZQr
	 qq+dMKlFlARfw==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC v2 4/5] dma-direct: add base offset to zone_dma_bits
Date: Tue,  9 Apr 2024 09:17:57 +0300
Message-ID: <1d7b0d59590aae631b6f0b894257ab961b907b44.1712642324.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712642324.git.baruch@tkos.co.il>
References: <cover.1712642324.git.baruch@tkos.co.il>
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
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, linux-s390@vger.kernel.org, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current code using zone_dma_bits assume that all addresses range in the
bits mask are suitable for DMA. For some existing platforms this
assumption is not correct. DMA range might have non zero lower limit.

Add 'zone_dma_base' for platform code to set base address for DMA zone.

Rename the dma_direct_supported() local 'min_mask' variable to better
describe its use as limit.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 include/linux/dma-direct.h | 1 +
 kernel/dma/direct.c        | 9 +++++----
 kernel/dma/pool.c          | 2 +-
 kernel/dma/swiotlb.c       | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 7cf76f1d3239..dd0330cbef81 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -13,6 +13,7 @@
 #include <linux/swiotlb.h>
 
 extern phys_addr_t zone_dma_limit;
+extern phys_addr_t zone_dma_base;
 
 /*
  * Record the mapping of CPU physical to DMA addresses for a given region.
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 3b2ebcd4f576..92bb241645d6 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -21,6 +21,7 @@
  * override the variable below for dma-direct to work properly.
  */
 phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
+phys_addr_t zone_dma_base __ro_after_init;
 
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
@@ -59,7 +60,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
 	 * zones.
 	 */
 	*phys_limit = dma_to_phys(dev, dma_limit);
-	if (*phys_limit <= zone_dma_limit)
+	if (*phys_limit <= zone_dma_base + zone_dma_limit)
 		return GFP_DMA;
 	if (*phys_limit <= DMA_BIT_MASK(32))
 		return GFP_DMA32;
@@ -567,7 +568,7 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 
 int dma_direct_supported(struct device *dev, u64 mask)
 {
-	u64 min_mask = (max_pfn - 1) << PAGE_SHIFT;
+	u64 min_limit = (max_pfn - 1) << PAGE_SHIFT;
 
 	/*
 	 * Because 32-bit DMA masks are so common we expect every architecture
@@ -584,8 +585,8 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	 * part of the check.
 	 */
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		min_mask = min_t(u64, min_mask, zone_dma_limit);
-	return mask >= phys_to_dma_unencrypted(dev, min_mask);
+		min_limit = min_t(u64, min_limit, zone_dma_base + zone_dma_limit);
+	return mask >= phys_to_dma_unencrypted(dev, min_limit);
 }
 
 /*
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 410a7b40e496..61a86f3d83ae 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -70,7 +70,7 @@ static bool cma_in_zone(gfp_t gfp)
 	/* CMA can't cross zone boundaries, see cma_activate_area() */
 	end = cma_get_base(cma) + size - 1;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
-		return end <= zone_dma_limit;
+		return end <= zone_dma_base + zone_dma_limit;
 	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
 		return end <= DMA_BIT_MASK(32);
 	return true;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 96d6eee7d215..814052df07c5 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -446,7 +446,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
-		io_tlb_default_mem.phys_limit = zone_dma_limit;
+		io_tlb_default_mem.phys_limit = zone_dma_base + zone_dma_limit;
 	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
 		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
 	else
@@ -625,7 +625,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
 	}
 
 	gfp &= ~GFP_ZONEMASK;
-	if (phys_limit <= zone_dma_limit)
+	if (phys_limit <= zone_dma_base + zone_dma_limit)
 		gfp |= __GFP_DMA;
 	else if (phys_limit <= DMA_BIT_MASK(32))
 		gfp |= __GFP_DMA32;
-- 
2.43.0

