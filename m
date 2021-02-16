Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74931C5D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 04:34:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfmmV1rTpz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 14:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dfmlz6pVjz30R0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 14:33:51 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 77AE6AE8022A;
 Mon, 15 Feb 2021 22:33:17 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 2/2] powerpc/iommu: Do not immediately panic when
 failed IOMMU table allocation
Date: Tue, 16 Feb 2021 14:33:07 +1100
Message-Id: <20210216033307.69863-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216033307.69863-1-aik@ozlabs.ru>
References: <20210216033307.69863-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most platforms allocate IOMMU table structures (specifically it_map)
at the boot time and when this fails - it is a valid reason for panic().

However the powernv platform allocates it_map after a device is returned
to the host OS after being passed through and this happens long after
the host OS booted. It is quite possible to trigger the it_map allocation
panic() and kill the host even though it is not necessary - the host OS
can still use the DMA bypass mode (requires a tiny fraction of it_map's
memory) and even if that fails, the host OS is runnnable as it was without
the device for which allocating it_map causes the panic.

Instead of immediately crashing in a powernv/ioda2 system, this prints
an error and continues. All other platforms still call panic().

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/iommu.c               |  6 ++++--
 arch/powerpc/platforms/cell/iommu.c       |  3 ++-
 arch/powerpc/platforms/pasemi/iommu.c     |  4 +++-
 arch/powerpc/platforms/powernv/pci-ioda.c | 15 ++++++++-------
 arch/powerpc/platforms/pseries/iommu.c    | 10 +++++++---
 arch/powerpc/sysdev/dart_iommu.c          |  3 ++-
 6 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 8eb6eb0afa97..c1a5c366a664 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -728,8 +728,10 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
 
 	tbl->it_map = vzalloc_node(sz, nid);
-	if (!tbl->it_map)
-		panic("iommu_init_table: Can't allocate %ld bytes\n", sz);
+	if (!tbl->it_map) {
+		pr_err("%s: Can't allocate %ld bytes\n", __func__, sz);
+		return NULL;
+	}
 
 	iommu_table_reserve_pages(tbl, res_start, res_end);
 
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 2124831cf57c..fa08699aedeb 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -486,7 +486,8 @@ cell_iommu_setup_window(struct cbe_iommu *iommu, struct device_node *np,
 	window->table.it_size = size >> window->table.it_page_shift;
 	window->table.it_ops = &cell_iommu_ops;
 
-	iommu_init_table(&window->table, iommu->nid, 0, 0);
+	if (!iommu_init_table(&window->table, iommu->nid, 0, 0))
+		panic("Failed to initialize iommu table");
 
 	pr_debug("\tioid      %d\n", window->ioid);
 	pr_debug("\tblocksize %ld\n", window->table.it_blocksize);
diff --git a/arch/powerpc/platforms/pasemi/iommu.c b/arch/powerpc/platforms/pasemi/iommu.c
index b500a6e47e6b..5be7242fbd86 100644
--- a/arch/powerpc/platforms/pasemi/iommu.c
+++ b/arch/powerpc/platforms/pasemi/iommu.c
@@ -146,7 +146,9 @@ static void iommu_table_iobmap_setup(void)
 	 */
 	iommu_table_iobmap.it_blocksize = 4;
 	iommu_table_iobmap.it_ops = &iommu_table_iobmap_ops;
-	iommu_init_table(&iommu_table_iobmap, 0, 0, 0);
+	if (!iommu_init_table(&iommu_table_iobmap, 0, 0, 0))
+		panic("Failed to initialize iommu table");
+
 	pr_debug(" <- %s\n", __func__);
 }
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f0f901683a2f..66c3c3337334 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1762,7 +1762,8 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	tbl->it_ops = &pnv_ioda1_iommu_ops;
 	pe->table_group.tce32_start = tbl->it_offset << tbl->it_page_shift;
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
-	iommu_init_table(tbl, phb->hose->node, 0, 0);
+	if (!iommu_init_table(tbl, phb->hose->node, 0, 0))
+		panic("Failed to initialize iommu table");
 
 	pe->dma_setup_done = true;
 	return;
@@ -1930,16 +1931,16 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 		res_start = pe->phb->ioda.m32_pci_base >> tbl->it_page_shift;
 		res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
 	}
-	iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end);
 
-	rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
+	if (iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end))
+		rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
+	else
+		rc = -ENOMEM;
 	if (rc) {
-		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n",
-				rc);
+		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n", rc);
 		iommu_tce_table_put(tbl);
-		return rc;
+		tbl = NULL; /* This clears iommu_table_base below */
 	}
-
 	if (!pnv_iommu_bypass_disabled)
 		pnv_pci_ioda2_set_bypass(pe, true);
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9fc5217f0c8e..4d9ac1f181c2 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -638,7 +638,8 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 
 	iommu_table_setparms(pci->phb, dn, tbl);
 	tbl->it_ops = &iommu_table_pseries_ops;
-	iommu_init_table(tbl, pci->phb->node, 0, 0);
+	if (!iommu_init_table(tbl, pci->phb->node, 0, 0))
+		panic("Failed to initialize iommu table");
 
 	/* Divide the rest (1.75GB) among the children */
 	pci->phb->dma_window_size = 0x80000000ul;
@@ -720,7 +721,8 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
 				ppci->table_group, dma_window);
 		tbl->it_ops = &iommu_table_lpar_multi_ops;
-		iommu_init_table(tbl, ppci->phb->node, 0, 0);
+		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
+			panic("Failed to initialize iommu table");
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
 		pr_debug("  created table: %p\n", ppci->table_group);
@@ -749,7 +751,9 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		tbl = PCI_DN(dn)->table_group->tables[0];
 		iommu_table_setparms(phb, dn, tbl);
 		tbl->it_ops = &iommu_table_pseries_ops;
-		iommu_init_table(tbl, phb->node, 0, 0);
+		if (!iommu_init_table(tbl, phb->node, 0, 0))
+			panic("Failed to initialize iommu table");
+
 		set_iommu_table_base(&dev->dev, tbl);
 		return;
 	}
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 6b4a34b36d98..1d33b7a5ea83 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -344,7 +344,8 @@ static void iommu_table_dart_setup(void)
 	iommu_table_dart.it_index = 0;
 	iommu_table_dart.it_blocksize = 1;
 	iommu_table_dart.it_ops = &iommu_dart_ops;
-	iommu_init_table(&iommu_table_dart, -1, 0, 0);
+	if (!iommu_init_table(&iommu_table_dart, -1, 0, 0))
+		panic("Failed to initialize iommu table");
 
 	/* Reserve the last page of the DART to avoid possible prefetch
 	 * past the DART mapped area
-- 
2.17.1

