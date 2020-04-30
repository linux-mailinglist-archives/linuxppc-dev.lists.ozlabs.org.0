Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098C1BF978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 15:27:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CblB0Br4zDrG3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 23:27:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mellanox.com (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 49CbdT6tZ0zDrFb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 23:22:04 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE2 (envelope-from
 maxg@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 30 Apr 2020 16:15:21 +0300
Received: from mtr-vdi-031.wap.labs.mlnx. (mtr-vdi-031.wap.labs.mlnx
 [10.209.102.136])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 03UDFKRV027016;
 Thu, 30 Apr 2020 16:15:20 +0300
From: Max Gurtovoy <maxg@mellanox.com>
To: hch@lst.de, linux-pci@vger.kernel.org, oohall@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2 v2] powerpc/dma: Define map/unmap mmio resource callbacks
Date: Thu, 30 Apr 2020 16:15:19 +0300
Message-Id: <20200430131520.51211-1-maxg@mellanox.com>
X-Mailer: git-send-email 2.21.0
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

Define the map_resource/unmap_resource callbacks for the dma_iommu_ops
used by several powerpc platforms. The map_resource callback is called
when trying to map a mmio resource through the dma_map_resource()
driver API.

For now, the callback returns an invalid address for devices using
translations, but will "direct" map the resource when in bypass
mode. Previous behavior for dma_map_resource() was to always return an
invalid address.

We also call an optional platform-specific controller op in
case some setup is needed for the platform.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Max Gurtovoy <maxg@mellanox.com>
---

changes from v1:
 - rename pci_controller_ops callback to dma_direct_map_resource/dma_direct_unmap_resource
 - cosmetic changes to make the code more readable

---
 arch/powerpc/include/asm/pci-bridge.h |  7 +++++++
 arch/powerpc/kernel/dma-iommu.c       | 31 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 69f4cb3..aca3724 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -44,6 +44,13 @@ struct pci_controller_ops {
 #endif
 
 	void		(*shutdown)(struct pci_controller *hose);
+	int		(*dma_direct_map_resource)(struct pci_dev *pdev,
+						phys_addr_t phys_addr,
+						size_t size,
+						enum dma_data_direction dir);
+	void		(*dma_direct_unmap_resource)(struct pci_dev *pdev,
+						dma_addr_t addr, size_t size,
+						enum dma_data_direction dir);
 };
 
 /*
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index e486d1d..049d000 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -108,6 +108,35 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		dma_direct_unmap_sg(dev, sglist, nelems, direction, attrs);
 }
 
+static dma_addr_t dma_iommu_map_resource(struct device *dev,
+					 phys_addr_t phys_addr, size_t size,
+					 enum dma_data_direction dir,
+					 unsigned long attrs)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
+	struct pci_controller_ops *ops = &phb->controller_ops;
+
+	if (!dma_iommu_map_bypass(dev, attrs) ||
+	    !ops->dma_direct_map_resource ||
+	    ops->dma_direct_map_resource(pdev, phys_addr, size, dir))
+		return DMA_MAPPING_ERROR;
+
+	return dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
+}
+
+static void dma_iommu_unmap_resource(struct device *dev, dma_addr_t dma_handle,
+				     size_t size, enum dma_data_direction dir,
+				     unsigned long attrs)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
+	struct pci_controller_ops *ops = &phb->controller_ops;
+
+	if (dma_iommu_map_bypass(dev, attrs) && ops->dma_direct_unmap_resource)
+		ops->dma_direct_unmap_resource(pdev, dma_handle, size, dir);
+}
+
 static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -199,6 +228,8 @@ extern void dma_iommu_sync_sg_for_device(struct device *dev,
 	.free			= dma_iommu_free_coherent,
 	.map_sg			= dma_iommu_map_sg,
 	.unmap_sg		= dma_iommu_unmap_sg,
+	.map_resource		= dma_iommu_map_resource,
+	.unmap_resource		= dma_iommu_unmap_resource,
 	.dma_supported		= dma_iommu_dma_supported,
 	.map_page		= dma_iommu_map_page,
 	.unmap_page		= dma_iommu_unmap_page,
-- 
1.8.3.1

