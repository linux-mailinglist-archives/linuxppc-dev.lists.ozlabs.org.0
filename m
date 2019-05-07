Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E2D15D5A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 08:28:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yqSH55FvzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 16:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 44yqPp0pKKzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 16:26:38 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CF444AE80026;
 Tue,  7 May 2019 02:26:04 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 1/2] powerpc/pseries/dma: Allow swiotlb
Date: Tue,  7 May 2019 16:25:58 +1000
Message-Id: <20190507062559.20295-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507062559.20295-1-aik@ozlabs.ru>
References: <20190507062559.20295-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 8617a5c5bc00 ("powerpc/dma: handle iommu bypass in
dma_iommu_ops") merged direct DMA ops into the IOMMU DMA ops allowing
SWIOTLB as well but only for mapping; the unmapping and bouncing parts
were left unmodified.

This adds missing direct unmapping calls to .unmap_page() and .unmap_sg().

This adds missing sync callbacks and directs them to the direct DMA hooks.

Fixes: 8617a5c5bc00 (powerpc/dma: handle iommu bypass in dma_iommu_ops)
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/dma-iommu.c | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 09231ef06d01..92b318df1aa1 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -82,6 +82,8 @@ static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	if (!dma_iommu_map_bypass(dev, attrs))
 		iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size,
 				direction,  attrs);
+	else
+		dma_direct_unmap_page(dev, dma_handle, size, direction, attrs);
 }
 
 
@@ -102,6 +104,8 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 	if (!dma_iommu_map_bypass(dev, attrs))
 		ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
 			   direction, attrs);
+	else
+		dma_direct_unmap_sg(dev, sglist, nelems, direction, attrs);
 }
 
 static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
@@ -163,6 +167,34 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	return mask;
 }
 
+static void dma_iommu_sync_for_cpu(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir)
+{
+	if (dma_iommu_alloc_bypass(dev))
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+}
+
+static void dma_iommu_sync_for_device(struct device *dev, dma_addr_t addr,
+		size_t sz, enum dma_data_direction dir)
+{
+	if (dma_iommu_alloc_bypass(dev))
+		dma_direct_sync_single_for_device(dev, addr, sz, dir);
+}
+
+extern void dma_iommu_sync_sg_for_cpu(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+	if (dma_iommu_alloc_bypass(dev))
+		dma_direct_sync_sg_for_cpu(dev, sgl, nents, dir);
+}
+
+extern void dma_iommu_sync_sg_for_device(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+	if (dma_iommu_alloc_bypass(dev))
+		dma_direct_sync_sg_for_device(dev, sgl, nents, dir);
+}
+
 const struct dma_map_ops dma_iommu_ops = {
 	.alloc			= dma_iommu_alloc_coherent,
 	.free			= dma_iommu_free_coherent,
@@ -172,4 +204,8 @@ const struct dma_map_ops dma_iommu_ops = {
 	.map_page		= dma_iommu_map_page,
 	.unmap_page		= dma_iommu_unmap_page,
 	.get_required_mask	= dma_iommu_get_required_mask,
+	.sync_single_for_cpu	= dma_iommu_sync_for_cpu,
+	.sync_single_for_device	= dma_iommu_sync_for_device,
+	.sync_sg_for_cpu	= dma_iommu_sync_sg_for_cpu,
+	.sync_sg_for_device	= dma_iommu_sync_sg_for_device,
 };
-- 
2.17.1

