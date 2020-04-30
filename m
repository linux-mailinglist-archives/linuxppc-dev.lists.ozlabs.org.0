Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68D1BF971
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 15:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cbhc6rV7zDqNg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 23:24:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mellanox.com (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
X-Greylist: delayed 397 seconds by postgrey-1.36 at bilbo;
 Thu, 30 Apr 2020 23:22:05 AEST
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 49CbdT6L16zDrD1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 23:22:04 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 maxg@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 30 Apr 2020 16:15:21 +0300
Received: from mtr-vdi-031.wap.labs.mlnx. (mtr-vdi-031.wap.labs.mlnx
 [10.209.102.136])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 03UDFKRW027016;
 Thu, 30 Apr 2020 16:15:20 +0300
From: Max Gurtovoy <maxg@mellanox.com>
To: hch@lst.de, linux-pci@vger.kernel.org, oohall@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2 v2] powerpc/powernv: Enable and setup PCI P2P
Date: Thu, 30 Apr 2020 16:15:20 +0300
Message-Id: <20200430131520.51211-2-maxg@mellanox.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200430131520.51211-1-maxg@mellanox.com>
References: <20200430131520.51211-1-maxg@mellanox.com>
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
Cc: vladimirk@mellanox.com, clsoto@us.ibm.com, israelr@mellanox.com,
 shlomin@mellanox.com, fbarrat@linux.ibm.com, Max Gurtovoy <maxg@mellanox.com>,
 idanw@mellanox.com, aneela@mellanox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement the generic dma_map_resource callback on the PCI controller
for powernv. This will enable PCI P2P on POWER9 architecture. It will
allow catching a cross-PHB mmio mapping, which needs to be setup in
hardware by calling opal. Both the initiator and target PHBs need to be
configured, so we look for which PHB owns the mmio address being mapped.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
[maxg: added CONFIG_PCI_P2PDMA wrappers]
Signed-off-by: Max Gurtovoy <maxg@mellanox.com>
---

changes from v1:
 - remove CONFIG_PCI_P2PDMA around opal_pci_set_p2p decleration
 - divide pnv_pci_ioda_set_p2p to pnv_pci_ioda_enable_p2p/pnv_pci_ioda_disable_p2p
 - added pnv_pci_dma_dir_to_opal_p2p static helper

---
 arch/powerpc/include/asm/opal.h            |   3 +-
 arch/powerpc/platforms/powernv/opal-call.c |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c  | 212 +++++++++++++++++++++++++++--
 arch/powerpc/platforms/powernv/pci.h       |   9 ++
 4 files changed, 213 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac3..362f54b 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -284,7 +284,8 @@ int64_t opal_xive_set_queue_state(uint64_t vp, uint32_t prio,
 				  uint32_t qtoggle,
 				  uint32_t qindex);
 int64_t opal_xive_get_vp_state(uint64_t vp, __be64 *out_w01);
-
+int64_t opal_pci_set_p2p(uint64_t phb_init, uint64_t phb_target,
+			 uint64_t desc, uint16_t pe_number);
 int64_t opal_imc_counters_init(uint32_t type, uint64_t address,
 							uint64_t cpu_pir);
 int64_t opal_imc_counters_start(uint32_t type, uint64_t cpu_pir);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52..442d5445c 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -273,6 +273,7 @@ int64_t name(int64_t a0, int64_t a1, int64_t a2, int64_t a3,	\
 OPAL_CALL(opal_imc_counters_init,		OPAL_IMC_COUNTERS_INIT);
 OPAL_CALL(opal_imc_counters_start,		OPAL_IMC_COUNTERS_START);
 OPAL_CALL(opal_imc_counters_stop,		OPAL_IMC_COUNTERS_STOP);
+OPAL_CALL(opal_pci_set_p2p,			OPAL_PCI_SET_P2P);
 OPAL_CALL(opal_get_powercap,			OPAL_GET_POWERCAP);
 OPAL_CALL(opal_set_powercap,			OPAL_SET_POWERCAP);
 OPAL_CALL(opal_get_power_shift_ratio,		OPAL_GET_POWER_SHIFT_RATIO);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 57d3a6a..9ecc576 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3706,18 +3706,208 @@ static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
 	}
 }
 
+#ifdef CONFIG_PCI_P2PDMA
+static DEFINE_MUTEX(p2p_mutex);
+
+static bool pnv_pci_controller_owns_addr(struct pci_controller *hose,
+					 phys_addr_t addr, size_t size)
+{
+	int i;
+
+	/*
+	 * It seems safe to assume the full range is under the same PHB, so we
+	 * can ignore the size.
+	 */
+	for (i = 0; i < ARRAY_SIZE(hose->mem_resources); i++) {
+		struct resource *res = &hose->mem_resources[i];
+
+		if (res->flags && addr >= res->start && addr < res->end)
+			return true;
+	}
+	return false;
+}
+
+/*
+ * find the phb owning a mmio address if not owned locally
+ */
+static struct pnv_phb *pnv_pci_find_owning_phb(struct pci_dev *pdev,
+					       phys_addr_t addr, size_t size)
+{
+	struct pci_controller *hose;
+
+	/* fast path */
+	if (pnv_pci_controller_owns_addr(pdev->bus->sysdata, addr, size))
+		return NULL;
+
+	list_for_each_entry(hose, &hose_list, list_node) {
+		struct pnv_phb *phb = hose->private_data;
+
+		if (phb->type != PNV_PHB_NPU_NVLINK &&
+		    phb->type != PNV_PHB_NPU_OCAPI) {
+			if (pnv_pci_controller_owns_addr(hose, addr, size))
+				return phb;
+		}
+	}
+	return NULL;
+}
+
+static u64 pnv_pci_dma_dir_to_opal_p2p(enum dma_data_direction dir)
+{
+	if (dir == DMA_TO_DEVICE)
+		return OPAL_PCI_P2P_STORE;
+	else if (dir == DMA_FROM_DEVICE)
+		return OPAL_PCI_P2P_LOAD;
+	else if (dir == DMA_BIDIRECTIONAL)
+		return OPAL_PCI_P2P_LOAD | OPAL_PCI_P2P_STORE;
+	else
+		return 0;
+}
+
+static int pnv_pci_ioda_enable_p2p(struct pci_dev *initiator,
+				   struct pnv_phb *phb_target,
+				   enum dma_data_direction dir)
+{
+	struct pci_controller *hose;
+	struct pnv_phb *phb_init;
+	struct pnv_ioda_pe *pe_init;
+	u64 desc;
+	int rc;
+
+	if (!opal_check_token(OPAL_PCI_SET_P2P))
+		return -ENXIO;
+
+	hose = pci_bus_to_host(initiator->bus);
+	phb_init = hose->private_data;
+
+	pe_init = pnv_ioda_get_pe(initiator);
+	if (!pe_init)
+		return -ENODEV;
+
+	if (!pe_init->tce_bypass_enabled)
+		return -EINVAL;
+
+	/*
+	 * Configuring the initiator's PHB requires to adjust its TVE#1
+	 * setting. Since the same device can be an initiator several times for
+	 * different target devices, we need to keep a reference count to know
+	 * when we can restore the default bypass setting on its TVE#1 when
+	 * disabling. Opal is not tracking PE states, so we add a reference
+	 * count on the PE in linux.
+	 *
+	 * For the target, the configuration is per PHB, so we keep a
+	 * target reference count on the PHB.
+	 */
+	mutex_lock(&p2p_mutex);
+
+	desc = OPAL_PCI_P2P_ENABLE | pnv_pci_dma_dir_to_opal_p2p(dir);
+	/* always go to opal to validate the configuration */
+	rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id, desc,
+			      pe_init->pe_number);
+	if (rc != OPAL_SUCCESS) {
+		rc = -EIO;
+		goto out;
+	}
+
+	pe_init->p2p_initiator_count++;
+	phb_target->p2p_target_count++;
+
+
+	rc = 0;
+out:
+	mutex_unlock(&p2p_mutex);
+	return rc;
+}
+
+static int pnv_pci_dma_map_resource(struct pci_dev *pdev,
+				    phys_addr_t phys_addr, size_t size,
+				    enum dma_data_direction dir)
+{
+	struct pnv_phb *target_phb;
+
+	target_phb = pnv_pci_find_owning_phb(pdev, phys_addr, size);
+	if (!target_phb)
+		return 0;
+
+	return pnv_pci_ioda_enable_p2p(pdev, target_phb, dir);
+}
+
+static int pnv_pci_ioda_disable_p2p(struct pci_dev *initiator,
+		struct pnv_phb *phb_target)
+{
+	struct pci_controller *hose;
+	struct pnv_phb *phb_init;
+	struct pnv_ioda_pe *pe_init;
+	int rc;
+
+	if (!opal_check_token(OPAL_PCI_SET_P2P))
+		return -ENXIO;
+
+	hose = pci_bus_to_host(initiator->bus);
+	phb_init = hose->private_data;
+
+	pe_init = pnv_ioda_get_pe(initiator);
+	if (!pe_init)
+		return -ENODEV;
+
+	mutex_lock(&p2p_mutex);
+
+	if (!pe_init->p2p_initiator_count || !phb_target->p2p_target_count) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (--pe_init->p2p_initiator_count == 0)
+		pnv_pci_ioda2_set_bypass(pe_init, true);
+
+	if (--phb_target->p2p_target_count == 0) {
+		rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id,
+				      0, pe_init->pe_number);
+		if (rc != OPAL_SUCCESS) {
+			rc = -EIO;
+			goto out;
+		}
+	}
+
+	rc = 0;
+out:
+	mutex_unlock(&p2p_mutex);
+	return rc;
+}
+
+static void pnv_pci_dma_unmap_resource(struct pci_dev *pdev,
+				       dma_addr_t addr, size_t size,
+				       enum dma_data_direction dir)
+{
+	struct pnv_phb *target_phb;
+	int rc;
+
+	target_phb = pnv_pci_find_owning_phb(pdev, addr, size);
+	if (!target_phb)
+		return;
+
+	rc = pnv_pci_ioda_disable_p2p(pdev, target_phb);
+	if (rc)
+		dev_err(&pdev->dev, "Failed to undo PCI peer-to-peer setup for address %llx: %d\n",
+			addr, rc);
+}
+#endif
+
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
-	.dma_dev_setup		= pnv_pci_ioda_dma_dev_setup,
-	.dma_bus_setup		= pnv_pci_ioda_dma_bus_setup,
-	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
-	.setup_msi_irqs		= pnv_setup_msi_irqs,
-	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
-	.enable_device_hook	= pnv_pci_enable_device_hook,
-	.release_device		= pnv_pci_release_device,
-	.window_alignment	= pnv_pci_window_alignment,
-	.setup_bridge		= pnv_pci_setup_bridge,
-	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
-	.shutdown		= pnv_pci_ioda_shutdown,
+	.dma_dev_setup			= pnv_pci_ioda_dma_dev_setup,
+	.dma_bus_setup			= pnv_pci_ioda_dma_bus_setup,
+	.iommu_bypass_supported		= pnv_pci_ioda_iommu_bypass_supported,
+	.setup_msi_irqs			= pnv_setup_msi_irqs,
+	.teardown_msi_irqs		= pnv_teardown_msi_irqs,
+	.enable_device_hook		= pnv_pci_enable_device_hook,
+	.release_device			= pnv_pci_release_device,
+	.window_alignment		= pnv_pci_window_alignment,
+	.setup_bridge			= pnv_pci_setup_bridge,
+	.reset_secondary_bus		= pnv_pci_reset_secondary_bus,
+	.shutdown			= pnv_pci_ioda_shutdown,
+#ifdef CONFIG_PCI_P2PDMA
+	.dma_direct_map_resource	= pnv_pci_dma_map_resource,
+	.dma_direct_unmap_resource	= pnv_pci_dma_unmap_resource,
+#endif
 };
 
 static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index d3bbdea..5f85d9c 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -79,6 +79,10 @@ struct pnv_ioda_pe {
 	struct pnv_ioda_pe	*master;
 	struct list_head	slaves;
 
+#ifdef CONFIG_PCI_P2PDMA
+	/* PCI peer-to-peer*/
+	int			p2p_initiator_count;
+#endif
 	/* Link in list of PE#s */
 	struct list_head	list;
 };
@@ -168,6 +172,11 @@ struct pnv_phb {
 	/* PHB and hub diagnostics */
 	unsigned int		diag_data_size;
 	u8			*diag_data;
+
+#ifdef CONFIG_PCI_P2PDMA
+	/* PCI peer-to-peer*/
+	int			p2p_target_count;
+#endif
 };
 
 extern struct pci_ops pnv_pci_ops;
-- 
1.8.3.1

