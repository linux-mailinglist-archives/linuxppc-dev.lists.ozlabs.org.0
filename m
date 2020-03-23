Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3E18F081
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:59:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m6GS0GDGzDr4h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 48m68t3GWgzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:54:22 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 81E12AE807EF;
 Mon, 23 Mar 2020 03:52:33 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 6/7] powerpc/powernv/phb4: Add 4GB IOMMU bypass mode
Date: Mon, 23 Mar 2020 18:53:53 +1100
Message-Id: <20200323075354.93825-7-aik@ozlabs.ru>
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

IODA2 systems (POWER8/9) allow DMA windows at 2 fixed locations - 0 and
0x800.0000.0000.0000==1<<59, stored in TVT as TVE0/1. PHB4 on POWER9 has
a "TVT Select 'GTE4GB' Option" which allows mapping both windows at 0 and
selecting one based on IOBA address - accesses below 4GB go via TVE0 and
above 4GB - via TVE1. Note that the TVE1's window still has to allocate
TCEs for below 4GB.

This changes iommu=iommy_bypass mode to move the second window at 4GB
if possible. When TVE1_4GB enabled, this creates a small (2GB typically)
32 bit window as there is no need to cover as much of lower DMA space -
the 4GB+ window does it better anyway.

As the physical TCE table from TVE1 maps PCI space from 0 and we want it
look like a 1:1 mapping with a fixed 4GB offset, this adds
a iommu_table::it_tceoff field which is a number of reserved TCEs covering
first 4GB of DMA space.

This keeps the existing behavior by default as the TVE1_4GB flag is set
per PHB by device assignment is done on PE basis and managing both modes
dynamically might get nasty.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/iommu.h           |  1 +
 arch/powerpc/include/asm/opal-api.h        |  9 ++-
 arch/powerpc/include/asm/opal.h            |  2 +
 arch/powerpc/platforms/powernv/opal-call.c |  2 +
 arch/powerpc/platforms/powernv/pci-ioda.c  | 66 +++++++++++++++++++---
 5 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index acf64a73ead1..b9c4af9f129c 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -97,6 +97,7 @@ struct iommu_table {
 	unsigned long  it_level_size;
 	unsigned long  it_allocated_size;
 	unsigned long  it_offset;    /* Offset into global table */
+	unsigned long  it_tceoff;
 	unsigned long  it_base;      /* mapped address of tce table */
 	unsigned long  it_index;     /* which iommu table this is */
 	unsigned long  it_type;      /* type: PCI or Virtual Bus */
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index c1f25a760eb1..7873754f5ea6 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -214,7 +214,9 @@
 #define OPAL_SECVAR_GET				176
 #define OPAL_SECVAR_GET_NEXT			177
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
-#define OPAL_LAST				178
+#define OPAL_PHB_SET_OPTION			179
+#define OPAL_PHB_GET_OPTION			180
+#define OPAL_LAST				180
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -437,6 +439,11 @@ enum OpalSlotLedState {
 	OPAL_SLOT_LED_STATE_ON = 1	/* LED is ON */
 };
 
+enum OpalPhbOption {
+	OPAL_PHB_OPTION_TVE1_4GB = 0x1,
+	OPAL_PHB_OPTION_MMIO_EEH_DISABLE = 0x2,
+};
+
 /*
  * Address cycle types for LPC accesses. These also correspond
  * to the content of the first cell of the "reg" property for
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..89b712288cdd 100644
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
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..3130d5a41570 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -293,3 +293,5 @@ OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
 OPAL_CALL(opal_secvar_get,			OPAL_SECVAR_GET);
 OPAL_CALL(opal_secvar_get_next,			OPAL_SECVAR_GET_NEXT);
 OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
+OPAL_CALL(opal_phb_set_option,			OPAL_PHB_SET_OPTION);
+OPAL_CALL(opal_phb_get_option,			OPAL_PHB_GET_OPTION);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 27a505a5edb4..cba2cb2e1119 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2367,7 +2367,7 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
 }
 
 static long pnv_pci_ioda2_set_bypass_iommu(struct pnv_ioda_pe *pe,
-		unsigned long bus_offset)
+		unsigned long bus_offset, unsigned long tbl_offset)
 {
 	struct pnv_phb *phb = pe->phb;
 	long rc;
@@ -2376,6 +2376,8 @@ static long pnv_pci_ioda2_set_bypass_iommu(struct pnv_ioda_pe *pe,
 
 
 	pgsizes = pnv_ioda_parse_tce_sizes(phb);
+	/* Filter sizes to have round number of TCEs to cover 0..tbl_offset */
+	pgsizes &= tbl_offset | (tbl_offset - 1);
 	if (!pgsizes)
 		return -1;
 
@@ -2386,17 +2388,19 @@ static long pnv_pci_ioda2_set_bypass_iommu(struct pnv_ioda_pe *pe,
 				1 /* window number */,
 				bus_offset,
 				__fls(pgsizes),
-				roundup_pow_of_two(memory_hotplug_max()),
+				roundup_pow_of_two(memory_hotplug_max() +
+						   tbl_offset),
 				2 /* levels */,
 				false /* userspace cache */,
 				&tbl);
 		if (rc)
 			return -1;
 
+		tbl->it_tceoff = tbl_offset >> tbl->it_page_shift;
 		for_each_memblock(memory, r)
 			pnv_ioda2_tce_build(tbl,
 					    (r->base >> tbl->it_page_shift) +
-					    tbl->it_offset,
+					    tbl->it_offset + tbl->it_tceoff,
 					    r->size >> tbl->it_page_shift,
 					    (unsigned long) __va(r->base),
 					    DMA_BIDIRECTIONAL,
@@ -2438,8 +2442,22 @@ static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
 	}
 
 	if (pnv_iommu_bypass_mode == PNV_IOMMU_TCE_BYPASS) {
+		if (!opal_phb_set_option(phb->opal_id,
+					OPAL_PHB_OPTION_TVE1_4GB, 1)) {
+			pe->table_group.tce64_start = SZ_4G;
+			if (!pnv_pci_ioda2_set_bypass_iommu(pe,
+					pe->table_group.tce64_start, SZ_4G)) {
+				pe->tce_bypass_enabled = true;
+				pe_info(pe, "Enabled 64-bit IOMMU bypass at %llx\n",
+						pe->table_group.tce64_start);
+				return;
+			}
+			pe_err(pe, "Enabled TVE1_4GB but failed to configure TCE table");
+			opal_phb_set_option(phb->opal_id,
+					    OPAL_PHB_OPTION_TVE1_4GB, 0);
+		}
 		if (!pnv_pci_ioda2_set_bypass_iommu(pe,
-				pe->table_group.tce64_start)) {
+				pe->table_group.tce64_start, 0)) {
 			pe->tce_bypass_enabled = true;
 			pe_info(pe, "Enabled 64-bit IOMMU bypass at %llx\n",
 				pe->table_group.tce64_start);
@@ -2450,6 +2468,10 @@ static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
 	}
 
 	if (pnv_iommu_bypass_mode == PNV_IOMMU_NO_TRANSLATE) {
+		/*
+		 * FIXME: if we enable dynamic switch, here we need to disable
+		 * OPAL_PCI_PHB_FLAG_TVE1_4GB
+		 */
 		top = roundup_pow_of_two(memblock_end_of_DRAM());
 		if (!opal_pci_map_pe_dma_window_real(phb->opal_id,
 					pe->pe_number, window_id,
@@ -2521,6 +2543,15 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
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
@@ -2611,6 +2642,9 @@ unsigned long pnv_pci_ioda2_get_table_size(int num, __u32 page_shift,
 			!is_power_of_2(window_size))
 		return 0;
 
+	if (pnv_iommu_bypass_mode == PNV_IOMMU_TCE_BYPASS && num == 1)
+		window_size = roundup_pow_of_two(window_size + SZ_4G);
+
 	/* Calculate a direct table size from window_size and levels */
 	entries_shift = (entries_shift + levels - 1) / levels;
 	table_shift = entries_shift + 3;
@@ -2636,15 +2670,29 @@ static long pnv_pci_ioda2_create_table_userspace(
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 			table_group);
-	__u64 bus_offset = num ?
-		pe->table_group.tce64_start : table_group->tce32_start;
-	long ret = pnv_pci_ioda2_create_table(pe->phb->hose->node,
-			num, bus_offset, page_shift, window_size, levels, true,
+	__u64 bus_offset, tce_offset = 0, win_size = window_size;
+	long ret;
+
+	if (num == 0) {
+		bus_offset = table_group->tce32_start;
+	} else if (table_group->tce64_start == SZ_4G) {
+		bus_offset = table_group->tce32_start;
+		tce_offset = SZ_4G;
+		win_size = roundup_pow_of_two(window_size + tce_offset);
+	} else {
+		bus_offset = table_group->tce64_start;
+	}
+
+	ret = pnv_pci_ioda2_create_table(pe->phb->hose->node,
+			num, bus_offset, page_shift, win_size, levels, true,
 			ptbl);
 
-	if (!ret)
+	if (!ret) {
 		(*ptbl)->it_allocated_size = pnv_pci_ioda2_get_table_size(
 				num, page_shift, window_size, levels);
+		(*ptbl)->it_tceoff = tce_offset >> page_shift;
+	}
+
 	return ret;
 }
 
-- 
2.17.1

