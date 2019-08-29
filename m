Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D4A1454
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:06:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxYp2mWgzDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46JxGd60gJzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:53:29 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id ADD2FAE800AD;
 Thu, 29 Aug 2019 04:52:34 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 1/5] powerpc/powernv/ioda: Split out TCE
 invalidation from TCE updates
Date: Thu, 29 Aug 2019 18:52:48 +1000
Message-Id: <20190829085252.72370-2-aik@ozlabs.ru>
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

At the moment updates in a TCE table are made by iommu_table_ops::exchange
which update one TCE and invalidates an entry in the PHB/NPU TCE cache
via set of registers called "TCE Kill" (hence the naming).
Writing a TCE is a simple xchg() but invalidating the TCE cache is
a relatively expensive OPAL call. Mapping a 100GB guest with PCI+NPU
passed through devices takes about 20s.

Thankfully we can do better. Since such big mappings happen at the boot
time and when memory is plugged/onlined (i.e. not often), these requests
come in 512 pages so we call call OPAL 512 times less which brings 20s
from the above to less than 10s. Also, since TCE caches can be flushed
entirely, calling OPAL for 512 TCEs helps skiboot [1] to decide whether
to flush the entire cache or not.

This implements 2 new iommu_table_ops callbacks:
- xchg_no_kill() to update a single TCE with no TCE invalidation;
- tce_kill() to invalidate multiple TCEs.
This uses the same xchg_no_kill() callback for IODA1/2.

This implements 2 new wrappers on top of the new callbacks similar to
the existing iommu_tce_xchg().

This does not use the new callbacks yet, the next patches will;
so this should not cause any behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/iommu.h          | 17 ++++++++++++++
 arch/powerpc/kernel/iommu.c               | 27 +++++++++++++++++++++++
 arch/powerpc/platforms/powernv/pci-ioda.c | 12 ++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index d7bf1f104c15..837b5122f257 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -58,6 +58,17 @@ struct iommu_table_ops {
 			unsigned long *hpa,
 			enum dma_data_direction *direction);
 
+	int (*xchg_no_kill)(struct iommu_table *tbl,
+			long index,
+			unsigned long *hpa,
+			enum dma_data_direction *direction,
+			bool realmode);
+
+	void (*tce_kill)(struct iommu_table *tbl,
+			unsigned long index,
+			unsigned long pages,
+			bool realmode);
+
 	__be64 *(*useraddrptr)(struct iommu_table *tbl, long index, bool alloc);
 #endif
 	void (*clear)(struct iommu_table *tbl,
@@ -209,6 +220,12 @@ extern void iommu_del_device(struct device *dev);
 extern long iommu_tce_xchg(struct mm_struct *mm, struct iommu_table *tbl,
 		unsigned long entry, unsigned long *hpa,
 		enum dma_data_direction *direction);
+extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
+		struct iommu_table *tbl,
+		unsigned long entry, unsigned long *hpa,
+		enum dma_data_direction *direction);
+extern void iommu_tce_kill(struct iommu_table *tbl,
+		unsigned long entry, unsigned long pages);
 #else
 static inline void iommu_register_group(struct iommu_table_group *table_group,
 					int pci_domain_number,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index e7a2b160d4c6..070492f9b46e 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1037,6 +1037,33 @@ long iommu_tce_xchg(struct mm_struct *mm, struct iommu_table *tbl,
 }
 EXPORT_SYMBOL_GPL(iommu_tce_xchg);
 
+extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
+		struct iommu_table *tbl,
+		unsigned long entry, unsigned long *hpa,
+		enum dma_data_direction *direction)
+{
+	long ret;
+	unsigned long size = 0;
+
+	ret = tbl->it_ops->xchg_no_kill(tbl, entry, hpa, direction, false);
+	if (!ret && ((*direction == DMA_FROM_DEVICE) ||
+			(*direction == DMA_BIDIRECTIONAL)) &&
+			!mm_iommu_is_devmem(mm, *hpa, tbl->it_page_shift,
+					&size))
+		SetPageDirty(pfn_to_page(*hpa >> PAGE_SHIFT));
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_tce_xchg_no_kill);
+
+void iommu_tce_kill(struct iommu_table *tbl,
+		unsigned long entry, unsigned long pages)
+{
+	if (tbl->it_ops->tce_kill)
+		tbl->it_ops->tce_kill(tbl, entry, pages, false);
+}
+EXPORT_SYMBOL_GPL(iommu_tce_kill);
+
 int iommu_take_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ec48ea25a674..4e56b2c620ec 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1939,6 +1939,14 @@ static int pnv_ioda1_tce_build(struct iommu_table *tbl, long index,
 }
 
 #ifdef CONFIG_IOMMU_API
+/* Common for IODA1 and IODA2 */
+static int pnv_ioda_tce_xchg_no_kill(struct iommu_table *tbl, long index,
+		unsigned long *hpa, enum dma_data_direction *direction,
+		bool realmode)
+{
+	return pnv_tce_xchg(tbl, index, hpa, direction, !realmode);
+}
+
 static int pnv_ioda1_tce_xchg(struct iommu_table *tbl, long index,
 		unsigned long *hpa, enum dma_data_direction *direction)
 {
@@ -1975,6 +1983,8 @@ static struct iommu_table_ops pnv_ioda1_iommu_ops = {
 #ifdef CONFIG_IOMMU_API
 	.exchange = pnv_ioda1_tce_xchg,
 	.exchange_rm = pnv_ioda1_tce_xchg_rm,
+	.xchg_no_kill = pnv_ioda_tce_xchg_no_kill,
+	.tce_kill = pnv_pci_p7ioc_tce_invalidate,
 	.useraddrptr = pnv_tce_useraddrptr,
 #endif
 	.clear = pnv_ioda1_tce_free,
@@ -2140,6 +2150,8 @@ static struct iommu_table_ops pnv_ioda2_iommu_ops = {
 #ifdef CONFIG_IOMMU_API
 	.exchange = pnv_ioda2_tce_xchg,
 	.exchange_rm = pnv_ioda2_tce_xchg_rm,
+	.xchg_no_kill = pnv_ioda_tce_xchg_no_kill,
+	.tce_kill = pnv_pci_ioda2_tce_invalidate,
 	.useraddrptr = pnv_tce_useraddrptr,
 #endif
 	.clear = pnv_ioda2_tce_free,
-- 
2.17.1

