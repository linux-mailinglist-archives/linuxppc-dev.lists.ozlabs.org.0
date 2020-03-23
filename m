Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA318F080
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:57:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m6DK46P7zDqWq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 48m68m22mYzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:54:16 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3B81EAE807E3;
 Mon, 23 Mar 2020 03:52:26 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 4/7] powerpc/powernv/phb4: Use IOMMU instead of
 bypassing
Date: Mon, 23 Mar 2020 18:53:51 +1100
Message-Id: <20200323075354.93825-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323075354.93825-1-aik@ozlabs.ru>
References: <20200323075354.93825-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Alistair Popple <alistair@popple.id.au>,
 kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment IODA2 systems do 64bit DMA by bypassing IOMMU which
allows mapping PCI space to system space at fixed offset (1<<59).
The bypass is controlled via the "iommu" kernel parameter.

This adds a "iommu_bypass" mode which maps PCI space to system space
using an actual TCE table with the biggest IOMMU page size available
(256MB or 1GB) and 2 levels so in a typical case about 4 to 6 system
pages per PHB are allocated.

This creates a single TCE table per PHB which is shared among devices
under the same PHB.

With this enabled, all DMA goes via IOMMU. Tests on 100GBit ethernet
did not show any regression.

The following patch allows using a special PHB4 4GB PCI hack which
moved 64bit DMA window at 4GB from 1<<59 to improve DMA support.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/powernv/pci.h      |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c | 128 ++++++++++++++++++----
 2 files changed, 107 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index a808dd396522..ce00278185b0 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -100,6 +100,7 @@ struct pnv_phb {
 	int			has_dbgfs;
 	struct dentry		*dbgfs;
 #endif
+	struct iommu_table	*bypass_tbl; /* PNV_IOMMU_TCE_BYPASS only */
 
 	unsigned int		msi_base;
 	unsigned int		msi32_support;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index f5f1b4e25530..9928a1618a8b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -51,6 +51,10 @@ static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
 					      "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
+static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
+static long pnv_pci_ioda2_create_table(int nid, int num, __u64 bus_offset,
+		__u32 page_shift, __u64 window_size, __u32 levels,
+		bool alloc_userspace_copy, struct iommu_table **ptbl);
 
 void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 			    const char *fmt, ...)
@@ -83,7 +87,14 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 	va_end(args);
 }
 
-static bool pnv_iommu_bypass_disabled __read_mostly;
+enum pnv_iommu_bypass_mode {
+	PNV_IOMMU_NO_TRANSLATE,
+	PNV_IOMMU_BYPASS_DISABLED,
+	PNV_IOMMU_TCE_BYPASS
+};
+
+static enum pnv_iommu_bypass_mode pnv_iommu_bypass_mode __read_mostly =
+		PNV_IOMMU_NO_TRANSLATE;
 static bool pci_reset_phbs __read_mostly;
 
 static int __init iommu_setup(char *str)
@@ -93,9 +104,13 @@ static int __init iommu_setup(char *str)
 
 	while (*str) {
 		if (!strncmp(str, "nobypass", 8)) {
-			pnv_iommu_bypass_disabled = true;
+			pnv_iommu_bypass_mode = PNV_IOMMU_BYPASS_DISABLED;
 			pr_info("PowerNV: IOMMU bypass window disabled.\n");
 			break;
+		} else if (!strncmp(str, "iommu_bypass", 12)) {
+			pnv_iommu_bypass_mode = PNV_IOMMU_TCE_BYPASS;
+			pr_info("PowerNV: IOMMU TCE bypass window selected.\n");
+			break;
 		}
 		str += strcspn(str, ",");
 		if (*str == ',')
@@ -2351,28 +2366,99 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
 	return 0;
 }
 
+static long pnv_pci_ioda2_set_bypass_iommu(struct pnv_ioda_pe *pe,
+		unsigned long bus_offset)
+{
+	struct pnv_phb *phb = pe->phb;
+	long rc;
+	struct memblock_region *r;
+	unsigned long pgsizes;
+
+
+	pgsizes = pnv_ioda_parse_tce_sizes(phb);
+	if (!pgsizes)
+		return -1;
+
+	if (!phb->bypass_tbl) {
+		struct iommu_table *tbl = NULL;
+
+		rc = pnv_pci_ioda2_create_table(phb->hose->node,
+				1 /* window number */,
+				bus_offset,
+				__fls(pgsizes),
+				roundup_pow_of_two(memory_hotplug_max()),
+				2 /* levels */,
+				false /* userspace cache */,
+				&tbl);
+		if (rc)
+			return -1;
+
+		for_each_memblock(memory, r)
+			pnv_ioda2_tce_build(tbl,
+					    (r->base >> tbl->it_page_shift) +
+					    tbl->it_offset,
+					    r->size >> tbl->it_page_shift,
+					    (unsigned long) __va(r->base),
+					    DMA_BIDIRECTIONAL,
+					    0);
+		phb->bypass_tbl = tbl;
+		pe_info(pe, "Created 64-bit bypass TCE table\n");
+	} else {
+		iommu_tce_table_get(phb->bypass_tbl);
+	}
+
+	rc = pnv_pci_ioda2_set_window(&pe->table_group, 1, phb->bypass_tbl);
+	if (rc) {
+		iommu_tce_table_put(phb->bypass_tbl);
+		return -1;
+	}
+
+	pe->tce_bypass_enabled = true;
+
+	return 0;
+}
+
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
 {
+	struct pnv_phb *phb = pe->phb;
 	uint16_t window_id = (pe->pe_number << 1 ) + 1;
 	int64_t rc;
+	phys_addr_t top;
 
-	pe_info(pe, "%sabling 64-bit DMA bypass\n", enable ? "En" : "Dis");
-	if (enable) {
-		phys_addr_t top = memblock_end_of_DRAM();
+	if (!enable) {
+		pe_info(pe, "Disabling 64-bit bypass\n");
+		rc = opal_pci_map_pe_dma_window_real(phb->opal_id,
+				pe->pe_number, window_id, 0, 0);
+		if (rc)
+			pe_err(pe, "OPAL error %lld configuring bypass window\n",
+				rc);
 
-		top = roundup_pow_of_two(top);
-		rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id,
-				pe->pe_number, window_id,
-				pe->table_group.tce64_start, top);
-	} else {
-		rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id,
-				pe->pe_number, window_id,
-				pe->table_group.tce64_start, 0);
+		pe->tce_bypass_enabled = false;
+		return;
+	}
+
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_TCE_BYPASS) {
+		if (!pnv_pci_ioda2_set_bypass_iommu(pe,
+				pe->table_group.tce64_start)) {
+			pe->tce_bypass_enabled = true;
+			pe_info(pe, "Enabled 64-bit IOMMU bypass at %llx\n",
+				pe->table_group.tce64_start);
+			return;
+		}
+		/* IOMMU bypass failed, fallback to direct bypass */
+		pnv_iommu_bypass_mode = PNV_IOMMU_NO_TRANSLATE;
+	}
+
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_NO_TRANSLATE) {
+		top = roundup_pow_of_two(memblock_end_of_DRAM());
+		if (!opal_pci_map_pe_dma_window_real(phb->opal_id,
+					pe->pe_number, window_id,
+					pe->table_group.tce64_start, top)) {
+			pe->tce_bypass_enabled = true;
+			pe_info(pe, "Enabled 64-bit direct bypass at %llx\n",
+					pe->table_group.tce64_start);
+		}
 	}
-	if (rc)
-		pe_err(pe, "OPAL error %lld configuring bypass window\n", rc);
-	else
-		pe->tce_bypass_enabled = enable;
 }
 
 static long pnv_pci_ioda2_create_table(int nid, int num, __u64 bus_offset,
@@ -2409,6 +2495,9 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	const unsigned int tceshift = PAGE_SHIFT;
 	unsigned long res_start, res_end, tces_order, tcelevel_order, levels;
 
+	if (pnv_iommu_bypass_mode != PNV_IOMMU_BYPASS_DISABLED)
+		pnv_pci_ioda2_set_bypass(pe, true);
+
 	/*
 	 * crashkernel= specifies the kdump kernel's maximum memory at
 	 * some offset and there is no guaranteed the result is a power
@@ -2470,9 +2559,6 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 		return rc;
 	}
 
-	if (!pnv_iommu_bypass_disabled)
-		pnv_pci_ioda2_set_bypass(pe, true);
-
 	/*
 	 * Set table base for the case of IOMMU DMA use. Usually this is done
 	 * from dma_dev_setup() which is not called when a device is returned
@@ -2624,8 +2710,6 @@ static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
 				bus);
 }
 
-static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
-
 static void pnv_pci_ioda_setup_iommu_api(void)
 {
 	struct pci_controller *hose;
-- 
2.17.1

