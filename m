Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C49457EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 08:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1722578722;
	bh=tf2G3vKfwS9xCyFudIaZcp+Gz7QoJvq2aAGjGmve5gA=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Yd1pjRN68HLPyq7+Fhl5i6vOOEPwO48ResG07Lkiw4iwCPCOluB1NsbhSk8/5NR9B
	 ulpZzTc6XMQ25ir+7E9mknHSursqQ8ft0YCSP5xflUdMIv8GLVT7Z14aSOXmMNfiSo
	 A0YZpg6xM21BhhRyFg1AXQ32Y7H4mo9JB6krLG2Yl5Dklzx/eOq1CdS+iTNpK8jNbQ
	 fj6ucJUbPfLaBpdR2/bo6rVWLTDp5d/gLRob1BCRChPWhy2chMrQn4GEYN0rpn6nW1
	 echjGPXRoOThMmxqpch3s2JsklEscDD6pmCqCHFBHHnGA9wdZanM1CqcgeRVNmTt14
	 Iyf4/ojAbPjAQ==
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZwKt4t5wz3dTl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 16:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=PVdJ6HN7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZwJQ57PDz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 16:04:06 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id DC44044076F;
	Fri,  2 Aug 2024 09:02:39 +0300 (IDT)
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 1/3] dma: improve DMA zone selection
Date: Fri,  2 Aug 2024 09:03:46 +0300
Message-ID: <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1722578375.git.baruch@tkos.co.il>
References: <cover.1722578375.git.baruch@tkos.co.il>
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
From: Baruch Siach via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When device DMA limit does not fit in DMA32 zone it should use DMA zone,
even when DMA zone is stricter than needed.

Same goes for devices that can't allocate from the entire normal zone.
Limit to DMA32 in that case.

Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 kernel/dma/direct.c  | 6 +++---
 kernel/dma/swiotlb.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4480a3cd92e0..3b4be4ca3b08 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -4,7 +4,7 @@
  *
  * DMA operations that map physical memory directly without using an IOMMU.
  */
-#include <linux/memblock.h> /* for max_pfn */
+#include <linux/memblock.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/dma-map-ops.h>
@@ -59,9 +59,9 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
 	 * zones.
 	 */
 	*phys_limit = dma_to_phys(dev, dma_limit);
-	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
+	if (*phys_limit < DMA_BIT_MASK(32))
 		return GFP_DMA;
-	if (*phys_limit <= DMA_BIT_MASK(32))
+	if (*phys_limit < memblock_end_of_DRAM())
 		return GFP_DMA32;
 	return 0;
 }
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index df68d29740a0..043b0ecd3e8d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -629,9 +629,9 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
 	}
 
 	gfp &= ~GFP_ZONEMASK;
-	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
+	if (phys_limit < DMA_BIT_MASK(32))
 		gfp |= __GFP_DMA;
-	else if (phys_limit <= DMA_BIT_MASK(32))
+	else if (phys_limit < memblock_end_of_DRAM())
 		gfp |= __GFP_DMA32;
 
 	while (IS_ERR(page = alloc_dma_pages(gfp, bytes, phys_limit))) {
-- 
2.43.0

