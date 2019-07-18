Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9766C8B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:22:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2ZS6bRnzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:22:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q2Lw0zsZzDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:12:23 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id EA2BCAE807F2;
 Thu, 18 Jul 2019 01:11:46 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v5 4/4] powerpc/powernv/ioda2: Create bigger default
 window with 64k IOMMU pages
Date: Thu, 18 Jul 2019 15:11:39 +1000
Message-Id: <20190718051139.74787-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718051139.74787-1-aik@ozlabs.ru>
References: <20190718051139.74787-1-aik@ozlabs.ru>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment we create a small window only for 32bit devices, the window
maps 0..2GB of the PCI space only. For other devices we either use
a sketchy bypass or hardware bypass but the former can only work if
the amount of RAM is no bigger than the device's DMA mask and the latter
requires devices to support at least 59bit DMA.

This extends the default DMA window to the maximum size possible to allow
a wider DMA mask than just 32bit. The default window size is now limited
by the the iommu_table::it_map allocation bitmap which is a contiguous
array, 1 bit per an IOMMU page.

This increases the default IOMMU page size from hard coded 4K to
the system page size to allow wider DMA masks.

This increases the level number to not exceed the max order allocation
limit per TCE level. By the same time, this keeps minimal levels number
as 2 in order to save memory.

As the extended window now overlaps the 32bit MMIO region, this adds
an area reservation to iommu_init_table().

After this change the default window size is 0x80000000000==1<<43 so
devices limited to DMA mask smaller than the amount of system RAM can
still use more than just 2GB of memory for DMA.

This is an optimization and not a bug fix for DMA API usage.

With the on-demand allocation of indirect TCE table levels enabled and
2 levels, the first TCE level size is just
1<<ceil((log2(0x7ffffffffff+1)-16)/2)=16384 TCEs or 2 system pages.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v5:
* ditched iommu_init_table_res and pass start..end to iommu_init_table
directly
* fixed WARN_ON in iommu_table_reserve_pages (was opposite)

v4:
* fixed take/release ownership handlers
* fixed reserved region for tables with it_offset!=0 (this is not going
to be exploited here but still this is a correct behavior)

v3:
* fixed tce levels calculation

v2:
* adjusted level number to the max order
---
 arch/powerpc/include/asm/iommu.h          |  7 ++-
 arch/powerpc/kernel/iommu.c               | 74 ++++++++++++++++-------
 arch/powerpc/platforms/cell/iommu.c       |  2 +-
 arch/powerpc/platforms/pasemi/iommu.c     |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c | 42 ++++++++++---
 arch/powerpc/platforms/pseries/iommu.c    |  8 +--
 arch/powerpc/platforms/pseries/vio.c      |  2 +-
 arch/powerpc/sysdev/dart_iommu.c          |  2 +-
 8 files changed, 100 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 18d342b815e4..d7bf1f104c15 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -111,6 +111,8 @@ struct iommu_table {
 	struct iommu_table_ops *it_ops;
 	struct kref    it_kref;
 	int it_nid;
+	unsigned long it_reserved_start; /* Start of not-DMA-able (MMIO) area */
+	unsigned long it_reserved_end;
 };
 
 #define IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry) \
@@ -149,8 +151,9 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
 /* Initializes an iommu_table based in values set in the passed-in
  * structure
  */
-extern struct iommu_table *iommu_init_table(struct iommu_table * tbl,
-					    int nid);
+extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
+		int nid, unsigned long res_start, unsigned long res_end);
+
 #define IOMMU_TABLE_GROUP_MAX_TABLES	2
 
 struct iommu_table_group;
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0a67ce9f827e..e7a2b160d4c6 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -633,11 +633,54 @@ static void iommu_table_clear(struct iommu_table *tbl)
 #endif
 }
 
+static void iommu_table_reserve_pages(struct iommu_table *tbl,
+		unsigned long res_start, unsigned long res_end)
+{
+	int i;
+
+	WARN_ON_ONCE(res_end < res_start);
+	/*
+	 * Reserve page 0 so it will not be used for any mappings.
+	 * This avoids buggy drivers that consider page 0 to be invalid
+	 * to crash the machine or even lose data.
+	 */
+	if (tbl->it_offset == 0)
+		set_bit(0, tbl->it_map);
+
+	tbl->it_reserved_start = res_start;
+	tbl->it_reserved_end = res_end;
+
+	/* Check if res_start..res_end isn't empty and overlaps the table */
+	if (res_start && res_end &&
+			(tbl->it_offset + tbl->it_size < res_start ||
+			 res_end < tbl->it_offset))
+		return;
+
+	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
+		set_bit(i - tbl->it_offset, tbl->it_map);
+}
+
+static void iommu_table_release_pages(struct iommu_table *tbl)
+{
+	int i;
+
+	/*
+	 * In case we have reserved the first bit, we should not emit
+	 * the warning below.
+	 */
+	if (tbl->it_offset == 0)
+		clear_bit(0, tbl->it_map);
+
+	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
+		clear_bit(i - tbl->it_offset, tbl->it_map);
+}
+
 /*
  * Build a iommu_table structure.  This contains a bit map which
  * is used to manage allocation of the tce space.
  */
-struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid)
+struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
+		unsigned long res_start, unsigned long res_end)
 {
 	unsigned long sz;
 	static int welcomed = 0;
@@ -656,13 +699,7 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid)
 	tbl->it_map = page_address(page);
 	memset(tbl->it_map, 0, sz);
 
-	/*
-	 * Reserve page 0 so it will not be used for any mappings.
-	 * This avoids buggy drivers that consider page 0 to be invalid
-	 * to crash the machine or even lose data.
-	 */
-	if (tbl->it_offset == 0)
-		set_bit(0, tbl->it_map);
+	iommu_table_reserve_pages(tbl, res_start, res_end);
 
 	/* We only split the IOMMU table if we have 1GB or more of space */
 	if ((tbl->it_size << tbl->it_page_shift) >= (1UL * 1024 * 1024 * 1024))
@@ -714,12 +751,7 @@ static void iommu_table_free(struct kref *kref)
 		return;
 	}
 
-	/*
-	 * In case we have reserved the first bit, we should not emit
-	 * the warning below.
-	 */
-	if (tbl->it_offset == 0)
-		clear_bit(0, tbl->it_map);
+	iommu_table_release_pages(tbl);
 
 	/* verify that table contains no entries */
 	if (!bitmap_empty(tbl->it_map, tbl->it_size))
@@ -1024,15 +1056,14 @@ int iommu_take_ownership(struct iommu_table *tbl)
 	for (i = 0; i < tbl->nr_pools; i++)
 		spin_lock(&tbl->pools[i].lock);
 
-	if (tbl->it_offset == 0)
-		clear_bit(0, tbl->it_map);
+	iommu_table_release_pages(tbl);
 
 	if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
 		pr_err("iommu_tce: it_map is not empty");
 		ret = -EBUSY;
-		/* Restore bit#0 set by iommu_init_table() */
-		if (tbl->it_offset == 0)
-			set_bit(0, tbl->it_map);
+		/* Undo iommu_table_release_pages, i.e. restore bit#0, etc */
+		iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
+				tbl->it_reserved_end);
 	} else {
 		memset(tbl->it_map, 0xff, sz);
 	}
@@ -1055,9 +1086,8 @@ void iommu_release_ownership(struct iommu_table *tbl)
 
 	memset(tbl->it_map, 0, sz);
 
-	/* Restore bit#0 set by iommu_init_table() */
-	if (tbl->it_offset == 0)
-		set_bit(0, tbl->it_map);
+	iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
+			tbl->it_reserved_end);
 
 	for (i = 0; i < tbl->nr_pools; i++)
 		spin_unlock(&tbl->pools[i].lock);
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 16dfee29aa41..ca9ffc1c8685 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -486,7 +486,7 @@ cell_iommu_setup_window(struct cbe_iommu *iommu, struct device_node *np,
 	window->table.it_size = size >> window->table.it_page_shift;
 	window->table.it_ops = &cell_iommu_ops;
 
-	iommu_init_table(&window->table, iommu->nid);
+	iommu_init_table(&window->table, iommu->nid, 0, 0);
 
 	pr_debug("\tioid      %d\n", window->ioid);
 	pr_debug("\tblocksize %ld\n", window->table.it_blocksize);
diff --git a/arch/powerpc/platforms/pasemi/iommu.c b/arch/powerpc/platforms/pasemi/iommu.c
index 77fee09104f8..b500a6e47e6b 100644
--- a/arch/powerpc/platforms/pasemi/iommu.c
+++ b/arch/powerpc/platforms/pasemi/iommu.c
@@ -146,7 +146,7 @@ static void iommu_table_iobmap_setup(void)
 	 */
 	iommu_table_iobmap.it_blocksize = 4;
 	iommu_table_iobmap.it_ops = &iommu_table_iobmap_ops;
-	iommu_init_table(&iommu_table_iobmap, 0);
+	iommu_init_table(&iommu_table_iobmap, 0, 0, 0);
 	pr_debug(" <- %s\n", __func__);
 }
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8080558d020..ec48ea25a674 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2303,7 +2303,7 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	tbl->it_ops = &pnv_ioda1_iommu_ops;
 	pe->table_group.tce32_start = tbl->it_offset << tbl->it_page_shift;
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
-	iommu_init_table(tbl, phb->hose->node);
+	iommu_init_table(tbl, phb->hose->node, 0, 0);
 
 	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
 		pnv_ioda_setup_bus_dma(pe, pe->pbus);
@@ -2420,6 +2420,7 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table *tbl = NULL;
 	long rc;
+	unsigned long res_start, res_end;
 
 	/*
 	 * crashkernel= specifies the kdump kernel's maximum memory at
@@ -2433,19 +2434,46 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	 * DMA window can be larger than available memory, which will
 	 * cause errors later.
 	 */
-	const u64 window_size = min((u64)pe->table_group.tce32_size, max_memory);
+	const u64 maxblock = 1UL << (PAGE_SHIFT + MAX_ORDER - 1);
 
-	rc = pnv_pci_ioda2_create_table(&pe->table_group, 0,
-			IOMMU_PAGE_SHIFT_4K,
-			window_size,
-			POWERNV_IOMMU_DEFAULT_LEVELS, false, &tbl);
+	/*
+	 * We create the default window as big as we can. The constraint is
+	 * the max order of allocation possible. The TCE table is likely to
+	 * end up being multilevel and with on-demand allocation in place,
+	 * the initial use is not going to be huge as the default window aims
+	 * to support crippled devices (i.e. not fully 64bit DMAble) only.
+	 */
+	/* iommu_table::it_map uses 1 bit per IOMMU page, hence 8 */
+	const u64 window_size = min((maxblock * 8) << PAGE_SHIFT, max_memory);
+	/* Each TCE level cannot exceed maxblock so go multilevel if needed */
+	unsigned long tces_order = ilog2(window_size >> PAGE_SHIFT);
+	unsigned long tcelevel_order = ilog2(maxblock >> 3);
+	unsigned int levels = tces_order / tcelevel_order;
+
+	if (tces_order % tcelevel_order)
+		levels += 1;
+	/*
+	 * We try to stick to default levels (which is >1 at the moment) in
+	 * order to save memory by relying on on-demain TCE level allocation.
+	 */
+	levels = max_t(unsigned int, levels, POWERNV_IOMMU_DEFAULT_LEVELS);
+
+	rc = pnv_pci_ioda2_create_table(&pe->table_group, 0, PAGE_SHIFT,
+			window_size, levels, false, &tbl);
 	if (rc) {
 		pe_err(pe, "Failed to create 32-bit TCE table, err %ld",
 				rc);
 		return rc;
 	}
 
-	iommu_init_table(tbl, pe->phb->hose->node);
+	/* We use top part of 32bit space for MMIO so exclude it from DMA */
+	res_start = 0;
+	res_end = 0;
+	if (window_size > pe->phb->ioda.m32_pci_base) {
+		res_start = pe->phb->ioda.m32_pci_base >> tbl->it_page_shift;
+		res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
+	}
+	iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end);
 
 	rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
 	if (rc) {
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 889dc2e44b89..42fb03253334 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -609,7 +609,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 
 	iommu_table_setparms(pci->phb, dn, tbl);
 	tbl->it_ops = &iommu_table_pseries_ops;
-	iommu_init_table(tbl, pci->phb->node);
+	iommu_init_table(tbl, pci->phb->node, 0, 0);
 
 	/* Divide the rest (1.75GB) among the children */
 	pci->phb->dma_window_size = 0x80000000ul;
@@ -690,7 +690,7 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
 		tbl->it_ops = &iommu_table_lpar_multi_ops;
-		iommu_init_table(tbl, ppci->phb->node);
+		iommu_init_table(tbl, ppci->phb->node, 0, 0);
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
 		pr_debug("  created table: %p\n", ppci->table_group);
@@ -719,7 +719,7 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
 		tbl->it_ops = &iommu_table_pseries_ops;
-		iommu_init_table(tbl, phb->node);
+		iommu_init_table(tbl, phb->node, 0, 0);
 		set_iommu_table_base(&dev->dev, tbl);
 		return;
 	}
@@ -1169,7 +1169,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
 				pci->table_group, dma_window);
 		tbl->it_ops = &iommu_table_lpar_multi_ops;
-		iommu_init_table(tbl, pci->phb->node);
+		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
 				pci_domain_nr(pci->phb->bus), 0);
 		pr_debug("  created table: %p\n", pci->table_group);
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 6601b9d404dc..115934f83935 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1191,7 +1191,7 @@ static struct iommu_table *vio_build_iommu_table(struct vio_dev *dev)
 	else
 		tbl->it_ops = &iommu_table_pseries_ops;
 
-	return iommu_init_table(tbl, -1);
+	return iommu_init_table(tbl, -1, 0, 0);
 }
 
 /**
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 21a1fae0714e..6b4a34b36d98 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -344,7 +344,7 @@ static void iommu_table_dart_setup(void)
 	iommu_table_dart.it_index = 0;
 	iommu_table_dart.it_blocksize = 1;
 	iommu_table_dart.it_ops = &iommu_dart_ops;
-	iommu_init_table(&iommu_table_dart, -1);
+	iommu_init_table(&iommu_table_dart, -1, 0, 0);
 
 	/* Reserve the last page of the DART to avoid possible prefetch
 	 * past the DART mapped area
-- 
2.17.1

