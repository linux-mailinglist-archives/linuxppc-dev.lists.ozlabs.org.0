Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AB625CB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N810J5nwgz3fP5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:13:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u+KdizKI;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/gV9HPvt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u+KdizKI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/gV9HPvt;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hS27fkz3dvC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:08 +1100 (AEDT)
Message-ID: <20221111122014.524842979@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nX/kiLyWbr8sCZk981ReIZHgMoXYScRSLUvvPHFhr+I=;
	b=u+KdizKIt0qM9c1mNxNUainFe4cGSOxc3N7pjkIEmS03JsV/DWdst/DT7IplYSztLzsVzU
	UPERaAB4cQbJQN0rmoya/Mop8w5AUrc179VezSEsaHCbmr2wDiCy9wrleD1L5rUfGr0JPj
	n4CHbvKTkVKCfwHr7eGPRgT54TSzmsIAXAMYrs9K2Id69TQxBfRD6c0leeXX4bIDR8bOoJ
	NR1svsLag9E2s6kkeFuyi/FRh7yJeVXWUjGbLHzwm01HqZ4MCmDg3wkmFq0XxYP8ejzWhO
	ZXbyaI2SYu53F+1vf/U+PMA6gYfbS8P7uGDsYtnXhtiU3dQlg9LFaVUKSW8KsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nX/kiLyWbr8sCZk981ReIZHgMoXYScRSLUvvPHFhr+I=;
	b=/gV9HPvtDrFTGv71bnYr6Mkzio2kV8KLKv7kYe2p3/RNpbT1YL7VYB6F+i6XmG4yWYIND2
	57yVqfg7L8qDwiBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 16/39] genirq: Get rid of GENERIC_MSI_IRQ_DOMAIN
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:40 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust to reality and remove another layer of pointless Kconfig
indirection. CONFIG_GENERIC_MSI_IRQ is good enough to serve
all purposes.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/base/Makefile       |    2 +-
 drivers/bus/fsl-mc/Kconfig  |    2 +-
 drivers/dma/Kconfig         |    2 +-
 drivers/dma/qcom/hidma.c    |    8 ++++----
 drivers/iommu/Kconfig       |    2 +-
 drivers/irqchip/Kconfig     |    6 +++---
 drivers/mailbox/Kconfig     |    2 +-
 drivers/pci/Kconfig         |    1 -
 drivers/perf/Kconfig        |    2 +-
 drivers/soc/ti/Kconfig      |    2 +-
 include/asm-generic/msi.h   |    4 ++--
 include/linux/device.h      |    8 +++-----
 include/linux/gpio/driver.h |    2 +-
 include/linux/msi.h         |   10 ++--------
 kernel/irq/Kconfig          |    7 +------
 kernel/irq/msi.c            |    3 ---
 16 files changed, 23 insertions(+), 40 deletions(-)

--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_REGMAP)	+= regmap/
 obj-$(CONFIG_SOC_BUS) += soc.o
 obj-$(CONFIG_PINCTRL) += pinctrl.o
 obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
-obj-$(CONFIG_GENERIC_MSI_IRQ_DOMAIN) += platform-msi.o
+obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
 obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 obj-$(CONFIG_ACPI) += physical_location.o
--- a/drivers/bus/fsl-mc/Kconfig
+++ b/drivers/bus/fsl-mc/Kconfig
@@ -8,7 +8,7 @@
 config FSL_MC_BUS
 	bool "QorIQ DPAA2 fsl-mc bus driver"
 	depends on OF && (ARCH_LAYERSCAPE || (COMPILE_TEST && (ARM || ARM64 || X86_LOCAL_APIC || PPC)))
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	help
 	  Driver to enable the bus infrastructure for the QorIQ DPAA2
 	  architecture.  The fsl-mc bus driver handles discovery of
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -462,7 +462,7 @@ config MV_XOR_V2
 	select DMA_ENGINE
 	select DMA_ENGINE_RAID
 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	help
 	  Enable support for the Marvell version 2 XOR engine.
 
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -610,7 +610,7 @@ static irqreturn_t hidma_chirq_handler(i
 	return hidma_ll_inthandler(chirq, lldev);
 }
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 static irqreturn_t hidma_chirq_handler_msi(int chirq, void *arg)
 {
 	struct hidma_lldev **lldevp = arg;
@@ -671,7 +671,7 @@ static int hidma_sysfs_init(struct hidma
 	return device_create_file(dev->ddev.dev, dev->chid_attrs);
 }
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 static void hidma_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 {
 	struct device *dev = msi_desc_to_dev(desc);
@@ -687,7 +687,7 @@ static void hidma_write_msi_msg(struct m
 
 static void hidma_free_msis(struct hidma_dev *dmadev)
 {
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 	struct device *dev = dmadev->ddev.dev;
 	int i, virq;
 
@@ -704,7 +704,7 @@ static void hidma_free_msis(struct hidma
 static int hidma_request_msi(struct hidma_dev *dmadev,
 			     struct platform_device *pdev)
 {
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 	int rc, i, virq;
 
 	rc = platform_msi_domain_alloc_irqs(&pdev->dev, HIDMA_MSI_INTS,
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -389,7 +389,7 @@ config ARM_SMMU_V3
 	depends on ARM64
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	help
 	  Support for implementations of the ARM System MMU architecture
 	  version 3 providing translation support to a PCIe root complex.
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -38,7 +38,7 @@ config ARM_GIC_V3
 
 config ARM_GIC_V3_ITS
 	bool
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	default ARM_GIC_V3
 
 config ARM_GIC_V3_ITS_PCI
@@ -375,7 +375,7 @@ config MVEBU_ICU
 
 config MVEBU_ODMI
 	bool
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 
 config MVEBU_PIC
 	bool
@@ -488,7 +488,7 @@ config IMX_MU_MSI
 	default m if ARCH_MXC
 	select IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	help
 	  Provide a driver for the i.MX Messaging Unit block used as a
 	  CPU-to-CPU MSI controller. This requires a specially crafted DT
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -223,7 +223,7 @@ config BCM_FLEXRM_MBOX
 	tristate "Broadcom FlexRM Mailbox"
 	depends on ARM64
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	default m if ARCH_BCM_IPROC
 	help
 	  Mailbox implementation of the Broadcom FlexRM ring manager,
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -38,7 +38,6 @@ source "drivers/pci/pcie/Kconfig"
 
 config PCI_MSI
 	bool "Message Signaled Interrupts (MSI and MSI-X)"
-	select GENERIC_MSI_IRQ_DOMAIN
 	select GENERIC_MSI_IRQ
 	help
 	   This allows device drivers to enable MSI (Message Signaled
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -93,7 +93,7 @@ config ARM_PMU_ACPI
 config ARM_SMMU_V3_PMU
 	 tristate "ARM SMMUv3 Performance Monitors Extension"
 	 depends on (ARM64 && ACPI) || (COMPILE_TEST && 64BIT)
-	 depends on GENERIC_MSI_IRQ_DOMAIN
+	 depends on GENERIC_MSI_IRQ
 	   help
 	   Provides support for the ARM SMMUv3 Performance Monitor Counter
 	   Groups (PMCG), which provide monitoring of transactions passing
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -98,6 +98,6 @@ endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
 	bool
-	select GENERIC_MSI_IRQ_DOMAIN
+	select GENERIC_MSI_IRQ
 	help
 	  Driver to enable Interrupt Aggregator specific MSI Domain.
--- a/include/asm-generic/msi.h
+++ b/include/asm-generic/msi.h
@@ -4,7 +4,7 @@
 
 #include <linux/types.h>
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 
 #ifndef NUM_MSI_ALLOC_SCRATCHPAD_REGS
 # define NUM_MSI_ALLOC_SCRATCHPAD_REGS	2
@@ -36,6 +36,6 @@ typedef struct msi_alloc_info {
 
 #define GENERIC_MSI_DOMAIN_OPS		1
 
-#endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
+#endif /* CONFIG_GENERIC_MSI_IRQ */
 
 #endif
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -378,10 +378,8 @@ struct dev_links_info {
  * @data:	Pointer to MSI device data
  */
 struct dev_msi_info {
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	struct irq_domain	*domain;
-#endif
 #ifdef CONFIG_GENERIC_MSI_IRQ
+	struct irq_domain	*domain;
 	struct msi_device_data	*data;
 #endif
 };
@@ -742,7 +740,7 @@ static inline void set_dev_node(struct d
 
 static inline struct irq_domain *dev_get_msi_domain(const struct device *dev)
 {
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 	return dev->msi.domain;
 #else
 	return NULL;
@@ -751,7 +749,7 @@ static inline struct irq_domain *dev_get
 
 static inline void dev_set_msi_domain(struct device *dev, struct irq_domain *d)
 {
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 	dev->msi.domain = d;
 #endif
 }
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -27,7 +27,7 @@ struct gpio_chip;
 
 union gpio_irq_fwspec {
 	struct irq_fwspec	fwspec;
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 	msi_alloc_info_t	msiinfo;
 #endif
 };
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -76,13 +76,7 @@ struct platform_msi_priv_data;
 struct device_attribute;
 
 void __get_cached_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
-#ifdef CONFIG_GENERIC_MSI_IRQ
 void get_cached_msi_msg(unsigned int irq, struct msi_msg *msg);
-#else
-static inline void get_cached_msi_msg(unsigned int irq, struct msi_msg *msg)
-{
-}
-#endif
 
 typedef void (*irq_write_msi_msg_t)(struct msi_desc *desc,
 				    struct msi_msg *msg);
@@ -278,7 +272,7 @@ static inline void msi_device_destroy_sy
  */
 bool arch_restore_msi_irqs(struct pci_dev *dev);
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+#ifdef CONFIG_GENERIC_MSI_IRQ
 
 #include <linux/irqhandler.h>
 
@@ -466,6 +460,6 @@ u32 pci_msi_domain_get_msi_rid(struct ir
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
 
-#endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
+#endif /* CONFIG_GENERIC_MSI_IRQ */
 
 #endif /* LINUX_MSI_H */
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -86,15 +86,10 @@ config GENERIC_IRQ_IPI
 	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 
-# Generic MSI interrupt support
-config GENERIC_MSI_IRQ
-	bool
-
 # Generic MSI hierarchical interrupt domain support
-config GENERIC_MSI_IRQ_DOMAIN
+config GENERIC_MSI_IRQ
 	bool
 	select IRQ_DOMAIN_HIERARCHY
-	select GENERIC_MSI_IRQ
 
 config IRQ_MSI_IOMMU
 	bool
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -461,7 +461,6 @@ static inline int msi_sysfs_populate_des
 static inline void msi_sysfs_remove_desc(struct device *dev, struct msi_desc *desc) { }
 #endif /* !CONFIG_SYSFS */
 
-#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 static int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec);
 static void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
 
@@ -1058,5 +1057,3 @@ struct msi_domain_info *msi_get_domain_i
 {
 	return (struct msi_domain_info *)domain->host_data;
 }
-
-#endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */

