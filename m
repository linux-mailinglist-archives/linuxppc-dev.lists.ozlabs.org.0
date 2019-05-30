Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C32662F7B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 09:08:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DzF42w9HzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 17:08:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Dz9116DfzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 17:04:37 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 6AD23AE807DF;
 Thu, 30 May 2019 03:04:04 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 2/3] powerpc/powernv/ioda2: Allocate TCE table
 levels on demand for default DMA window
Date: Thu, 30 May 2019 17:03:54 +1000
Message-Id: <20190530070355.121802-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530070355.121802-1-aik@ozlabs.ru>
References: <20190530070355.121802-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We allocate only the first level of multilevel TCE tables for KVM
already (alloc_userspace_copy==true), and the rest is allocated on demand.
This is not enabled though for baremetal.

This removes the KVM limitation (implicit, via the alloc_userspace_copy
parameter) and always allocates just the first level. The on-demand
allocation of missing levels is already implemented.

As from now on DMA map might happen with disabled interrupts, this
allocates TCEs with GFP_ATOMIC.

To save time when creating a new clean table, this skips non-allocated
indirect TCE entries in pnv_tce_free just like we already do in
the VFIO IOMMU TCE driver.

This changes the default level number from 1 to 2 to reduce the amount
of memory required for the default 32bit DMA window at the boot time.
The default window size is up to 2GB which requires 4MB of TCEs which is
unlikely to be used entirely or at all as most devices these days are
64bit capable so by switching to 2 levels by default we save 4032KB of
RAM per a device.

While at this, add __GFP_NOWARN to alloc_pages_node() as the userspace
can trigger this path via VFIO, see the failure and try creating a table
again with different parameters which might succeed.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* added __GFP_NOWARN to alloc_pages_node
---
 arch/powerpc/platforms/powernv/pci.h          |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 20 +++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 1a51e7bfc541..a55dabc8d057 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -225,7 +225,7 @@ extern struct iommu_table_group *pnv_npu_compound_attach(
 		struct pnv_ioda_pe *pe);
 
 /* pci-ioda-tce.c */
-#define POWERNV_IOMMU_DEFAULT_LEVELS	1
+#define POWERNV_IOMMU_DEFAULT_LEVELS	2
 #define POWERNV_IOMMU_MAX_LEVELS	5
 
 extern int pnv_tce_build(struct iommu_table *tbl, long index, long npages,
diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index e28f03e1eb5e..c75ec37bf0cd 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -36,7 +36,8 @@ static __be64 *pnv_alloc_tce_level(int nid, unsigned int shift)
 	struct page *tce_mem = NULL;
 	__be64 *addr;
 
-	tce_mem = alloc_pages_node(nid, GFP_KERNEL, shift - PAGE_SHIFT);
+	tce_mem = alloc_pages_node(nid, GFP_ATOMIC | __GFP_NOWARN,
+			shift - PAGE_SHIFT);
 	if (!tce_mem) {
 		pr_err("Failed to allocate a TCE memory, level shift=%d\n",
 				shift);
@@ -161,6 +162,9 @@ void pnv_tce_free(struct iommu_table *tbl, long index, long npages)
 
 		if (ptce)
 			*ptce = cpu_to_be64(0);
+		else
+			/* Skip the rest of the level */
+			i |= tbl->it_level_size - 1;
 	}
 }
 
@@ -260,7 +264,6 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 	unsigned int table_shift = max_t(unsigned int, entries_shift + 3,
 			PAGE_SHIFT);
 	const unsigned long tce_table_size = 1UL << table_shift;
-	unsigned int tmplevels = levels;
 
 	if (!levels || (levels > POWERNV_IOMMU_MAX_LEVELS))
 		return -EINVAL;
@@ -268,9 +271,6 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 	if (!is_power_of_2(window_size))
 		return -EINVAL;
 
-	if (alloc_userspace_copy && (window_size > (1ULL << 32)))
-		tmplevels = 1;
-
 	/* Adjust direct table size from window_size and levels */
 	entries_shift = (entries_shift + levels - 1) / levels;
 	level_shift = entries_shift + 3;
@@ -281,7 +281,7 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 
 	/* Allocate TCE table */
 	addr = pnv_pci_ioda2_table_do_alloc_pages(nid, level_shift,
-			tmplevels, tce_table_size, &offset, &total_allocated);
+			1, tce_table_size, &offset, &total_allocated);
 
 	/* addr==NULL means that the first level allocation failed */
 	if (!addr)
@@ -292,18 +292,18 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 	 * we did not allocate as much as we wanted,
 	 * release partially allocated table.
 	 */
-	if (tmplevels == levels && offset < tce_table_size)
+	if (levels == 1 && offset < tce_table_size)
 		goto free_tces_exit;
 
 	/* Allocate userspace view of the TCE table */
 	if (alloc_userspace_copy) {
 		offset = 0;
 		uas = pnv_pci_ioda2_table_do_alloc_pages(nid, level_shift,
-				tmplevels, tce_table_size, &offset,
+				1, tce_table_size, &offset,
 				&total_allocated_uas);
 		if (!uas)
 			goto free_tces_exit;
-		if (tmplevels == levels && (offset < tce_table_size ||
+		if (levels == 1 && (offset < tce_table_size ||
 				total_allocated_uas != total_allocated))
 			goto free_uas_exit;
 	}
@@ -318,7 +318,7 @@ long pnv_pci_ioda2_table_alloc_pages(int nid, __u64 bus_offset,
 
 	pr_debug("Created TCE table: ws=%08llx ts=%lx @%08llx base=%lx uas=%p levels=%d/%d\n",
 			window_size, tce_table_size, bus_offset, tbl->it_base,
-			tbl->it_userspace, tmplevels, levels);
+			tbl->it_userspace, 1, levels);
 
 	return 0;
 
-- 
2.17.1

