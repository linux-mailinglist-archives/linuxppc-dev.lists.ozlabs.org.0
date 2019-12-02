Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10510E47F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 03:19:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R81y3sm3zDqSB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 13:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47R7qP1PLdzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 13:10:08 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 863EEAE807E3;
 Sun,  1 Dec 2019 20:59:00 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel RFC 3/4] powerpc/powernv/phb4: Add 4GB IOMMU bypass mode
Date: Mon,  2 Dec 2019 12:59:52 +1100
Message-Id: <20191202015953.127902-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202015953.127902-1-aik@ozlabs.ru>
References: <20191202015953.127902-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IODA2 systems (POWER8/9) allow DMA windows at 2 fixed locations - 0 and
0x800.0000.0000.0000==1<<59, stored in TVT as TVE0/1. PHB4 on POWER9 has
an additional PHB mode to allow mapping both windows at 0 and selecting
one based on IOBA address - accesses below 4GB go via TVE0 and above
4GB - via TVE1.

This adds a new value for the "iommu" kernel parameter - "iommu_bypass".
When enabled this programs PHB to enable the TVE1_4GB mode and uses TVE1
to map the entire host RAM using the largest available IOMMU pages
- 1GB for PHB and 256MB for NPU-PHB effectively.

This creates huge DMA windows at 4GB for VFIO; new iommu_table::it_dmaoff
flag tells the VFIO IOMMU driver about the bus offset it should be using.
Since the actual second table still covers the first 4GB of the bus space
iommu_table::it_offset is set to 0. The next patch will explicitly
advertise new offset to the userspace.

When TVE1_4GB enabled, this creates a small (2GB typically) 32 bit window
as there is no need to cover as much of lower DMA space - the 4GB+ window
does it better anyway.

This keeps the existing behavior by default as the TVE1_4GB flag is set
per PHB by device assignment is done on PE basis and managing both modes
dynamically might get nasty.

This relies on skiboot supporting the new OPAL_PHB_SET_OPTION OPAL call.

Suggested-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/iommu.h           |   1 +
 arch/powerpc/include/asm/opal-api.h        |  11 +-
 arch/powerpc/include/asm/opal.h            |   2 +
 arch/powerpc/platforms/powernv/pci.h       |   1 +
 arch/powerpc/platforms/powernv/opal-call.c |   2 +
 arch/powerpc/platforms/powernv/pci-ioda.c  | 191 +++++++++++++++++----
 6 files changed, 175 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 479439ef003e..e0ca82d31253 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -97,6 +97,7 @@ struct iommu_table {
 	unsigned long  it_level_size;
 	unsigned long  it_allocated_size;
 	unsigned long  it_offset;    /* Offset into global table */
+	unsigned long  it_dmaoff;
 	unsigned long  it_base;      /* mapped address of tce table */
 	unsigned long  it_index;     /* which iommu table this is */
 	unsigned long  it_type;      /* type: PCI or Virtual Bus */
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 378e3997845a..27730b894057 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -211,7 +211,12 @@
 #define OPAL_MPIPL_UPDATE			173
 #define OPAL_MPIPL_REGISTER_TAG			174
 #define OPAL_MPIPL_QUERY_TAG			175
-#define OPAL_LAST				175
+#define OPAL_SECVAR_GET				176
+#define OPAL_SECVAR_GET_NEXT			177
+#define OPAL_SECVAR_ENQUEUE_UPDATE		178
+#define OPAL_PHB_SET_OPTION			179
+#define OPAL_PHB_GET_OPTION			180
+#define OPAL_LAST				180
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -434,6 +439,10 @@ enum OpalSlotLedState {
 	OPAL_SLOT_LED_STATE_ON = 1	/* LED is ON */
 };
 
+enum OpalPhbOption {
+	OPAL_PCI_PHB_FLAG_TVE1_4GB = 0x1,
+};
+
 /*
  * Address cycle types for LPC accesses. These also correspond
  * to the content of the first cell of the "reg" property for
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index a0cf8fba4d12..fed92a93a3ba 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -142,6 +142,8 @@ int64_t opal_pci_map_pe_dma_window(uint64_t phb_id, uint16_t pe_number, uint16_t
 int64_t opal_pci_map_pe_dma_window_real(uint64_t phb_id, uint16_t pe_number,
 					uint16_t dma_window_number, uint64_t pci_start_addr,
 					uint64_t pci_mem_size);
+int64_t opal_phb_set_option(uint64_t phb_id, uint64_t opt, uint64_t setting);
+int64_t opal_phb_get_option(uint64_t phb_id, uint64_t opt, uint64_t *setting);
 int64_t opal_pci_reset(uint64_t id, uint8_t reset_scope, uint8_t assert_state);
 
 int64_t opal_pci_get_hub_diag_data(uint64_t hub_id, void *diag_buffer,
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index faf9d7e95a85..aa30b5122025 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -100,6 +100,7 @@ struct pnv_phb {
 	int			has_dbgfs;
 	struct dentry		*dbgfs;
 #endif
+	struct iommu_table	*bypass_tbl; /* PNV_IOMMU_TCE_BYPASS only */
 
 	unsigned int		msi_base;
 	unsigned int		msi32_support;
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index a2aa5e433ac8..6e1b7896e46c 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -290,3 +290,5 @@ OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
 OPAL_CALL(opal_mpipl_update,			OPAL_MPIPL_UPDATE);
 OPAL_CALL(opal_mpipl_register_tag,		OPAL_MPIPL_REGISTER_TAG);
 OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
+OPAL_CALL(opal_phb_set_option,			OPAL_PHB_SET_OPTION);
+OPAL_CALL(opal_phb_get_option,			OPAL_PHB_GET_OPTION);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 328fb27a966f..82ffc2614aa1 100644
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
@@ -2321,32 +2336,125 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
 	return 0;
 }
 
+static long pnv_pci_ioda2_set_bypass_iommu(struct pnv_ioda_pe *pe,
+		unsigned long offset)
+{
+	struct pnv_phb *phb = pe->phb;
+	long rc;
+	struct memblock_region *r;
+	unsigned long i, pgsizes, tceoff;
+
+
+	pgsizes = pnv_ioda_parse_tce_sizes(phb);
+	/* Filter sizes to have round number of TCEs to cover 0..offset */
+	pgsizes &= offset | (offset - 1);
+	if (!pgsizes)
+		return -1;
+
+	if (!phb->bypass_tbl) {
+		struct iommu_table *tbl = NULL;
+
+		rc = pnv_pci_ioda2_create_table(phb->hose->node,
+				1 /* window number */,
+				0 /* bus offset */,
+				__fls(pgsizes),
+				roundup_pow_of_two(memory_hotplug_max() +
+					offset),
+				2 /* levels */,
+				false /* userspace cache */,
+				&tbl);
+		if (rc)
+			return -1;
+
+		tceoff = offset >> tbl->it_page_shift;
+
+		for_each_memblock(memory, r) {
+			phys_addr_t start, end;
+
+			start = r->base >> tbl->it_page_shift;
+			end = start + (r->size >> tbl->it_page_shift);
+
+			for (i = start; i < end; ++i)
+				tbl->it_ops->set(tbl, i + tceoff, 1,
+						i << tbl->it_page_shift,
+						DMA_BIDIRECTIONAL, 0);
+		}
+		phb->bypass_tbl = tbl;
+		pe_err(pe, "Created 64-bit bypass TCE table at 0x%lx\n",
+			phb->bypass_tbl->it_base);
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
+		/*
+		 * Whether it was bypass or iommu bypass, this will write
+		 * a zero to TVE and disable the window;
+		 * opal_pci_map_pe_dma_window() does the same thing when
+		 * tce_table_size==0.
+		 */
+		rc = opal_pci_map_pe_dma_window_real(phb->opal_id,
+				pe->pe_number, window_id, 0, 0);
+		if (rc)
+			pe_err(pe, "OPAL error %lld configuring bypass window\n",
+				rc);
 
-		top = roundup_pow_of_two(top);
-		rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id,
-						     pe->pe_number,
-						     window_id,
-						     pe->table_group.tce64_start,
-						     top);
-	} else {
-		rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id,
-						     pe->pe_number,
-						     window_id,
-						     pe->table_group.tce64_start,
-						     0);
+		pe->tce_bypass_enabled = false;
+		return;
+	}
+
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_TCE_BYPASS) {
+		if (!opal_phb_set_option(phb->opal_id,
+					OPAL_PCI_PHB_FLAG_TVE1_4GB, 1)) {
+			pe->table_group.tce64_start = SZ_4G;
+			if (!pnv_pci_ioda2_set_bypass_iommu(pe,
+						pe->table_group.tce64_start)) {
+				pe->tce_bypass_enabled = true;
+				pe_info(pe, "Enabled 64-bit IOMMU bypass at %llx\n",
+						pe->table_group.tce64_start);
+				return;
+			}
+			pe_err(pe, "Enabled TVE1_4GB but failed to configure TCE table");
+		} else {
+			/* IOMMU bypass failed, fallback to direct bypass */
+			pnv_iommu_bypass_mode = PNV_IOMMU_NO_TRANSLATE;
+		}
+	}
+
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_NO_TRANSLATE) {
+		/*
+		 * FIXME: if we enable dynamic switch, here we need to disable
+		 * OPAL_PCI_PHB_FLAG_TVE1_4GB
+		 */
+		top = roundup_pow_of_two(memblock_end_of_DRAM());
+		if (!opal_pci_map_pe_dma_window_real(phb->opal_id,
+					pe->pe_number, window_id,
+					pe->table_group.tce64_start, top)) {
+			pe->tce_bypass_enabled = true;
+			pe_info(pe, "Enabled 64-bit direct bypass at %llx\n",
+					pe->table_group.tce64_start);
+			return;
+		}
 	}
-	if (rc)
-		pe_err(pe, "OPAL error %lld configuring bypass window\n", rc);
-	else
-		pe->tce_bypass_enabled = enable;
 }
 
 static long pnv_pci_ioda2_create_table(int nid, int num, __u64 bus_offset,
@@ -2383,6 +2491,9 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	const unsigned int tceshift = PAGE_SHIFT;
 	unsigned long res_start, res_end, tces_order, tcelevel_order, levels;
 
+	if (pnv_iommu_bypass_mode != PNV_IOMMU_BYPASS_DISABLED)
+		pnv_pci_ioda2_set_bypass(pe, true);
+
 	/*
 	 * crashkernel= specifies the kdump kernel's maximum memory at
 	 * some offset and there is no guaranteed the result is a power
@@ -2406,6 +2517,15 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	 */
 	/* iommu_table::it_map uses 1 bit per IOMMU page, hence 8 */
 	window_size = min((maxblock * 8) << tceshift, max_memory);
+
+	/*
+	 * If we get TVE#1_4GB on, there is no point in having a huge default
+	 * DMA window.
+	 */
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_TCE_BYPASS)
+		window_size = min_t(u64, pe->table_group.tce32_size,
+				window_size);
+
 	/* Each TCE level cannot exceed maxblock so go multilevel if needed */
 	tces_order = ilog2(window_size >> tceshift);
 	tcelevel_order = ilog2(maxblock >> 3);
@@ -2444,9 +2564,6 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 		return rc;
 	}
 
-	if (!pnv_iommu_bypass_disabled)
-		pnv_pci_ioda2_set_bypass(pe, true);
-
 	/*
 	 * Set table base for the case of IOMMU DMA use. Usually this is done
 	 * from dma_dev_setup() which is not called when a device is returned
@@ -2524,15 +2641,27 @@ static long pnv_pci_ioda2_create_table_userspace(
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 			table_group);
-	__u64 bus_offset = num ?
-		pe->table_group.tce64_start : table_group->tce32_start;
-	long ret = pnv_pci_ioda2_create_table(pe->phb->hose->node,
-			num, bus_offset, page_shift, window_size, levels, true,
-			ptbl);
+	__u64 bus_offset = num ? table_group->tce64_start :
+				 table_group->tce32_start;
+	long ret;
 
-	if (!ret)
+	if (bus_offset == SZ_4G)
+		ret = pnv_pci_ioda2_create_table(pe->phb->hose->node,
+				num, 0, page_shift,
+				roundup_pow_of_two(window_size + bus_offset),
+				levels, true, ptbl);
+	else
+		ret = pnv_pci_ioda2_create_table(pe->phb->hose->node,
+				num, bus_offset, page_shift,
+				window_size,
+				levels, true, ptbl);
+
+	if (!ret) {
 		(*ptbl)->it_allocated_size = pnv_pci_ioda2_get_table_size(
 				page_shift, window_size, levels);
+		(*ptbl)->it_dmaoff = bus_offset >> page_shift;
+	}
+
 	return ret;
 }
 
@@ -2598,8 +2727,6 @@ static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
 				bus);
 }
 
-static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
-
 static void pnv_pci_ioda_setup_iommu_api(void)
 {
 	struct pci_controller *hose;
-- 
2.17.1

