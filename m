Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF489A1449
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:04:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxW05X7NzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:04:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46JxGC3shszDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:53:07 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 56F47AE80597;
 Thu, 29 Aug 2019 04:52:43 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 5/5] powerpc/powernv/ioda: Remove obsolete
 iommu_table_ops::exchange callbacks
Date: Thu, 29 Aug 2019 18:52:52 +1000
Message-Id: <20190829085252.72370-6-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829085252.72370-1-aik@ozlabs.ru>
References: <20190829085252.72370-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As now we have xchg_no_kill/tce_kill, these are not used anymore so
remove them.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/iommu.h          | 10 -----
 arch/powerpc/kernel/iommu.c               | 26 +-----------
 arch/powerpc/platforms/powernv/pci-ioda.c | 50 -----------------------
 3 files changed, 1 insertion(+), 85 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 837b5122f257..350101e11ddb 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -48,16 +48,6 @@ struct iommu_table_ops {
 	 * returns old TCE and DMA direction mask.
 	 * @tce is a physical address.
 	 */
-	int (*exchange)(struct iommu_table *tbl,
-			long index,
-			unsigned long *hpa,
-			enum dma_data_direction *direction);
-	/* Real mode */
-	int (*exchange_rm)(struct iommu_table *tbl,
-			long index,
-			unsigned long *hpa,
-			enum dma_data_direction *direction);
-
 	int (*xchg_no_kill)(struct iommu_table *tbl,
 			long index,
 			unsigned long *hpa,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 070492f9b46e..9704f3f76e63 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1013,30 +1013,6 @@ int iommu_tce_check_gpa(unsigned long page_shift, unsigned long gpa)
 }
 EXPORT_SYMBOL_GPL(iommu_tce_check_gpa);
 
-long iommu_tce_xchg(struct mm_struct *mm, struct iommu_table *tbl,
-		unsigned long entry, unsigned long *hpa,
-		enum dma_data_direction *direction)
-{
-	long ret;
-	unsigned long size = 0;
-
-	ret = tbl->it_ops->exchange(tbl, entry, hpa, direction);
-
-	if (!ret && ((*direction == DMA_FROM_DEVICE) ||
-			(*direction == DMA_BIDIRECTIONAL)) &&
-			!mm_iommu_is_devmem(mm, *hpa, tbl->it_page_shift,
-					&size))
-		SetPageDirty(pfn_to_page(*hpa >> PAGE_SHIFT));
-
-	/* if (unlikely(ret))
-		pr_err("iommu_tce: %s failed on hwaddr=%lx ioba=%lx kva=%lx ret=%d\n",
-			__func__, hwaddr, entry << tbl->it_page_shift,
-				hwaddr, ret); */
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_tce_xchg);
-
 extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 		struct iommu_table *tbl,
 		unsigned long entry, unsigned long *hpa,
@@ -1076,7 +1052,7 @@ int iommu_take_ownership(struct iommu_table *tbl)
 	 * requires exchange() callback defined so if it is not
 	 * implemented, we disallow taking ownership over the table.
 	 */
-	if (!tbl->it_ops->exchange)
+	if (!tbl->it_ops->xchg_no_kill)
 		return -EINVAL;
 
 	spin_lock_irqsave(&tbl->large_pool.lock, flags);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 4e56b2c620ec..c28d0d9b7ee0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1946,28 +1946,6 @@ static int pnv_ioda_tce_xchg_no_kill(struct iommu_table *tbl, long index,
 {
 	return pnv_tce_xchg(tbl, index, hpa, direction, !realmode);
 }
-
-static int pnv_ioda1_tce_xchg(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction)
-{
-	long ret = pnv_tce_xchg(tbl, index, hpa, direction, true);
-
-	if (!ret)
-		pnv_pci_p7ioc_tce_invalidate(tbl, index, 1, false);
-
-	return ret;
-}
-
-static int pnv_ioda1_tce_xchg_rm(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction)
-{
-	long ret = pnv_tce_xchg(tbl, index, hpa, direction, false);
-
-	if (!ret)
-		pnv_pci_p7ioc_tce_invalidate(tbl, index, 1, true);
-
-	return ret;
-}
 #endif
 
 static void pnv_ioda1_tce_free(struct iommu_table *tbl, long index,
@@ -1981,8 +1959,6 @@ static void pnv_ioda1_tce_free(struct iommu_table *tbl, long index,
 static struct iommu_table_ops pnv_ioda1_iommu_ops = {
 	.set = pnv_ioda1_tce_build,
 #ifdef CONFIG_IOMMU_API
-	.exchange = pnv_ioda1_tce_xchg,
-	.exchange_rm = pnv_ioda1_tce_xchg_rm,
 	.xchg_no_kill = pnv_ioda_tce_xchg_no_kill,
 	.tce_kill = pnv_pci_p7ioc_tce_invalidate,
 	.useraddrptr = pnv_tce_useraddrptr,
@@ -2113,30 +2089,6 @@ static int pnv_ioda2_tce_build(struct iommu_table *tbl, long index,
 	return ret;
 }
 
-#ifdef CONFIG_IOMMU_API
-static int pnv_ioda2_tce_xchg(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction)
-{
-	long ret = pnv_tce_xchg(tbl, index, hpa, direction, true);
-
-	if (!ret)
-		pnv_pci_ioda2_tce_invalidate(tbl, index, 1, false);
-
-	return ret;
-}
-
-static int pnv_ioda2_tce_xchg_rm(struct iommu_table *tbl, long index,
-		unsigned long *hpa, enum dma_data_direction *direction)
-{
-	long ret = pnv_tce_xchg(tbl, index, hpa, direction, false);
-
-	if (!ret)
-		pnv_pci_ioda2_tce_invalidate(tbl, index, 1, true);
-
-	return ret;
-}
-#endif
-
 static void pnv_ioda2_tce_free(struct iommu_table *tbl, long index,
 		long npages)
 {
@@ -2148,8 +2100,6 @@ static void pnv_ioda2_tce_free(struct iommu_table *tbl, long index,
 static struct iommu_table_ops pnv_ioda2_iommu_ops = {
 	.set = pnv_ioda2_tce_build,
 #ifdef CONFIG_IOMMU_API
-	.exchange = pnv_ioda2_tce_xchg,
-	.exchange_rm = pnv_ioda2_tce_xchg_rm,
 	.xchg_no_kill = pnv_ioda_tce_xchg_no_kill,
 	.tce_kill = pnv_pci_ioda2_tce_invalidate,
 	.useraddrptr = pnv_tce_useraddrptr,
-- 
2.17.1

