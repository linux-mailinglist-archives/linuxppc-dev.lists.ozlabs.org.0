Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D491A93F346
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 12:53:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=vBf0lRuB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXZvq5gXtz3cW4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:53:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=vBf0lRuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXZtL3CyLz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 20:51:54 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 29561440F5F;
	Mon, 29 Jul 2024 13:50:33 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1722250233;
	bh=jwVrNkJU6TTXZr03Aq1yS4EYBFAKJQ5ZGtsXERqr5z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vBf0lRuBpzD9o62Xp531a74Gq1NOBiZZUSIxG/oPDdoC8/1xjDtYtq/akdkDcE0kj
	 D1/LaqCflZE12HPEnrCkolPF8KvnZtr0KrWCTKoSR/xXowyJXF3UOmXUIhLeKQV+o1
	 DIHAXmMYS3wurN++0F2Ju5m35D+DKYCAgyT5xBmceFFbv2mGTM4Ju+wr8gnSO79YxY
	 /GvtYpbvpKizJHES0JaD2aqYkam5SjvYosOTgWeHXdlvH1I8p3GU3NQ2+uxTWff2bQ
	 uF95ALYYrb+0bwo2KdyQGoaHC7xT0IU01q0mAmBI5/zLflThrleJzDthkYSfLQq70b
	 sxZH+zJqWlzmA==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 3/3] dma-direct: use RAM start to offset zone_dma_limit
Date: Mon, 29 Jul 2024 13:51:26 +0300
Message-ID: <629b184354fa22cb32a90bd1fa0e1dc258251f81.1722249878.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1722249878.git.baruch@tkos.co.il>
References: <cover.1722249878.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current code using zone_dma_limit assume that all address range below
limit is suitable for DMA. For some existing platforms this assumption
is not correct. DMA range might have non zero lower limit.

Commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the
max_zone_phys() calculation") made DMA/DMA32 zones span the entire RAM
when RAM starts above 32-bits. This breaks hardware with DMA area that
start above 32-bits. But the commit log says that "we haven't noticed
any such hardware". It turns out that such hardware does exist.

One such platform has RAM starting at 32GB with an internal bus that has
the following DMA limits:

  #address-cells = <2>;
  #size-cells = <2>;
  dma-ranges = <0x00 0xc0000000 0x08 0x00000000 0x00 0x40000000>;

Devices under this bus can see 1GB of DMA range between 3GB-4GB in each
device address space. This range is mapped to CPU memory at 32GB-33GB.
With current code DMA allocations for devices under this bus are not
limited to DMA area, leading to run-time allocation failure.

Add start of RAM address to zone_dma_limit to make DMA allocation for
constrained devices possible.

The result is DMA zone that properly reflects the hardware constraints
as follows:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000840000000-0x0000000bffffffff]

Rename the dma_direct_supported() local 'min_mask' variable to better
describe its use as limit.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 kernel/dma/direct.c  | 7 ++++---
 kernel/dma/pool.c    | 3 ++-
 kernel/dma/swiotlb.c | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 3dbc0b89d6fb..bd7972d3b101 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -563,7 +563,7 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 
 int dma_direct_supported(struct device *dev, u64 mask)
 {
-	u64 min_mask = (max_pfn - 1) << PAGE_SHIFT;
+	u64 min_limit = (max_pfn - 1) << PAGE_SHIFT;
 
 	/*
 	 * Because 32-bit DMA masks are so common we expect every architecture
@@ -580,8 +580,9 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	 * part of the check.
 	 */
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		min_mask = min_t(u64, min_mask, zone_dma_limit);
-	return mask >= phys_to_dma_unencrypted(dev, min_mask);
+		min_limit = min_t(u64, min_limit,
+				memblock_start_of_DRAM() + zone_dma_limit);
+	return mask >= phys_to_dma_unencrypted(dev, min_limit);
 }
 
 /*
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 410a7b40e496..ded3d841c88c 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -12,6 +12,7 @@
 #include <linux/set_memory.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/memblock.h>
 
 static struct gen_pool *atomic_pool_dma __ro_after_init;
 static unsigned long pool_size_dma;
@@ -70,7 +71,7 @@ static bool cma_in_zone(gfp_t gfp)
 	/* CMA can't cross zone boundaries, see cma_activate_area() */
 	end = cma_get_base(cma) + size - 1;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
-		return end <= zone_dma_limit;
+		return end <= memblock_start_of_DRAM() + zone_dma_limit;
 	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
 		return end <= DMA_BIT_MASK(32);
 	return true;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index dfd83e5ee0b3..2813eeb8b375 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -450,7 +450,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
-		io_tlb_default_mem.phys_limit = zone_dma_limit;
+		io_tlb_default_mem.phys_limit = memblock_start_of_DRAM() + zone_dma_limit;
 	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
 		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
 	else
@@ -629,7 +629,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
 	}
 
 	gfp &= ~GFP_ZONEMASK;
-	if (phys_limit <= zone_dma_limit)
+	if (phys_limit <= memblock_start_of_DRAM() + zone_dma_limit)
 		gfp |= __GFP_DMA;
 	else if (phys_limit <= DMA_BIT_MASK(32))
 		gfp |= __GFP_DMA32;
-- 
2.43.0

