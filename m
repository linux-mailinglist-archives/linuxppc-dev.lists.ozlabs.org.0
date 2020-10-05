Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFB282E8F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 02:40:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4MFM4qdwzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 11:40:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.196;
 helo=mail-lj1-f196.google.com; envelope-from=kswilczynski@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4MCD4HdNzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 11:38:13 +1100 (AEDT)
Received: by mail-lj1-f196.google.com with SMTP id a15so5857191ljk.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Oct 2020 17:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TucAW0LslrNZ0DgpwEqgTEM0BHl37+kAT9QUL8UHtn8=;
 b=PXTkd1Dip+beymoiDAkpgRcryUR4445ZDRFci9PWhc+KD5hIw+TIeRFf/WL8le2RTa
 zrvuZVuHanZxFxywd5z/05SDVdEY8pNIOwStUdfBJoHfYm4mR7PWvhFkNdRAoWEQqRmT
 9eMlJvxUWfXhvYegy0FF1GMGrefqaf0Y+w6zo9sdVgM83EEQBkXcdGJb4HPUteBhOLxj
 EAghs+oVooGu8qh84D+AS5r7nr/t2BoAQtcEjg1h5KjYrO+7TBcFmKHXNAM2eIMJDkC3
 IB563yEaP8VGoEBbxYhn3bZj+hGTZ4hK8S7zSSNbw7kPSsC73+l/DBZAJCgnOzoGUiSA
 MYKg==
X-Gm-Message-State: AOAM533Dl++nKU+v0EjVu3yXyfEch/ppXMc6wCG75Gp81+2Qzej5zCr5
 2EEFX6KhsuvwA4n4nT++a20=
X-Google-Smtp-Source: ABdhPJw5h5DtyJszYrXSOakdHp55AacOU7bCMmnEzaRSqOmk5TOVAaHoWiQnRcypM9YqMe/SMjAILQ==
X-Received: by 2002:a2e:9cd5:: with SMTP id g21mr3727557ljj.27.1601858288905; 
 Sun, 04 Oct 2020 17:38:08 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id l4sm2344221ljg.42.2020.10.04.17.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 17:38:07 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v4] PCI: Unify ECAM constants in native PCI Express drivers
Date: Mon,  5 Oct 2020 00:38:05 +0000
Message-Id: <20201005003805.465057-1-kw@linux.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unify ECAM-related constants into a single set of standard constants
defining memory address shift values for the byte-level address that can
be used when accessing the PCI Express Configuration Space, and then
move native PCI Express controller drivers to use newly introduced
definitions retiring any driver-specific ones.

The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
PCI Express specification (see PCI Express Base Specification, Revision
5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
implement it the same way.  Most of the native PCI Express controller
drivers define their ECAM-related constants, many of these could be
shared, or use open-coded values when setting the .bus_shift field of
the struct pci_ecam_ops.

All of the newly added constants should remove ambiguity and reduce the
number of open-coded values, and also correlate more strongly with the
descriptions in the aforementioned specification (see Table 7-1
"Enhanced Configuration Address Mapping", p. 677).

There is no change to functionality.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
Changed in v4:
  Removed constants related to "CAM".
  Added more platforms and devices that can use new ECAM macros and
  constants.
  Removed unused ".bus_shift" initialisers from pci-xgene.c as
  xgene_pcie_map_bus() did not use these.

Changes in v3:
  Updated commit message wording.
  Updated regarding custom ECAM bus shift values and concerning PCI base
  configuration space access for Type 1 access.
  Refactored rockchip_pcie_rd_other_conf() and rockchip_pcie_wr_other_conf()
  and removed the "busdev" variable.
  Removed surplus "relbus" variable from nwl_pcie_map_bus() and
  xilinx_pcie_map_bus().
  Renamed the PCIE_ECAM_ADDR() macro to PCIE_ECAM_OFFSET().

Changes in v2:
  Use PCIE_ECAM_ADDR macro when computing ECAM address offset, but drop
  PCI_SLOT and PCI_FUNC macros from the PCIE_ECAM_ADDR macro in favour
  of using a single value for the device/function.

 arch/powerpc/platforms/4xx/pci.c            |  7 +++--
 drivers/pci/controller/dwc/pcie-al.c        |  8 +++---
 drivers/pci/controller/dwc/pcie-hisi.c      |  4 +--
 drivers/pci/controller/pci-aardvark.c       | 13 +++------
 drivers/pci/controller/pci-host-generic.c   |  2 +-
 drivers/pci/controller/pci-thunder-ecam.c   |  2 +-
 drivers/pci/controller/pci-thunder-pem.c    | 13 +++++++--
 drivers/pci/controller/pci-xgene.c          |  2 --
 drivers/pci/controller/pcie-brcmstb.c       | 16 ++----------
 drivers/pci/controller/pcie-iproc.c         | 29 ++++++---------------
 drivers/pci/controller/pcie-rockchip-host.c | 27 +++++++++----------
 drivers/pci/controller/pcie-rockchip.h      |  8 +-----
 drivers/pci/controller/pcie-tango.c         |  2 +-
 drivers/pci/controller/pcie-xilinx-nwl.c    |  9 ++-----
 drivers/pci/controller/pcie-xilinx.c        | 11 ++------
 drivers/pci/controller/vmd.c                |  5 ++--
 drivers/pci/ecam.c                          |  4 +--
 include/linux/pci-ecam.h                    | 24 +++++++++++++++++
 18 files changed, 82 insertions(+), 104 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index c13d64c3b019..cee40e0b061c 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -20,6 +20,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/delay.h>
@@ -1585,17 +1586,15 @@ static void __iomem *ppc4xx_pciex_get_config_base(struct ppc4xx_pciex_port *port
 						  struct pci_bus *bus,
 						  unsigned int devfn)
 {
-	int relbus;
-
 	/* Remove the casts when we finally remove the stupid volatile
 	 * in struct pci_controller
 	 */
 	if (bus->number == port->hose->first_busno)
 		return (void __iomem *)port->hose->cfg_addr;
 
-	relbus = bus->number - (port->hose->first_busno + 1);
 	return (void __iomem *)port->hose->cfg_data +
-		((relbus  << 20) | (devfn << 12));
+		PCIE_ECAM_BUS(bus->number - (port->hose->first_busno + 1)) |
+		PCIE_ECAM_DEVFN(devfn);
 }
 
 static int ppc4xx_pciex_read_config(struct pci_bus *bus, unsigned int devfn,
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index d57d4ee15848..7c2aa049113c 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -76,7 +76,7 @@ static int al_pcie_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops al_pcie_ops = {
-	.bus_shift    = 20,
+	.bus_shift    = PCIE_ECAM_BUS_SHIFT,
 	.init         =  al_pcie_init,
 	.pci_ops      = {
 		.map_bus    = al_pcie_map_bus,
@@ -138,8 +138,6 @@ struct al_pcie {
 	struct al_pcie_target_bus_cfg target_bus_cfg;
 };
 
-#define PCIE_ECAM_DEVFN(x)		(((x) & 0xff) << 12)
-
 #define to_al_pcie(x)		dev_get_drvdata((x)->dev)
 
 static inline u32 al_pcie_controller_readl(struct al_pcie *pcie, u32 offset)
@@ -228,7 +226,7 @@ static void __iomem *al_pcie_conf_addr_map(struct al_pcie *pcie,
 	void __iomem *pci_base_addr;
 
 	pci_base_addr = (void __iomem *)((uintptr_t)pp->va_cfg0_base +
-					 (busnr_ecam << 20) +
+					 PCIE_ECAM_BUS(busnr_ecam) +
 					 PCIE_ECAM_DEVFN(devfn));
 
 	if (busnr_reg != target_bus_cfg->reg_val) {
@@ -300,7 +298,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 
 	target_bus_cfg = &pcie->target_bus_cfg;
 
-	ecam_bus_mask = (pcie->ecam_size >> 20) - 1;
+	ecam_bus_mask = (pcie->ecam_size >> PCIE_ECAM_BUS_SHIFT) - 1;
 	if (ecam_bus_mask > 255) {
 		dev_warn(pcie->dev, "ECAM window size is larger than 256MB. Cutting off at 256\n");
 		ecam_bus_mask = 255;
diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 5ca86796d43a..b7afbf1d4bd9 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -100,7 +100,7 @@ static int hisi_pcie_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops hisi_pcie_ops = {
-	.bus_shift    = 20,
+	.bus_shift    = PCIE_ECAM_BUS_SHIFT,
 	.init         =  hisi_pcie_init,
 	.pci_ops      = {
 		.map_bus    = hisi_pcie_map_bus,
@@ -135,7 +135,7 @@ static int hisi_pcie_platform_init(struct pci_config_window *cfg)
 }
 
 static const struct pci_ecam_ops hisi_pcie_platform_ops = {
-	.bus_shift    = 20,
+	.bus_shift    = PCIE_ECAM_BUS_SHIFT,
 	.init         =  hisi_pcie_platform_init,
 	.pci_ops      = {
 		.map_bus    = hisi_pcie_map_bus,
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 1559f79e63b6..200ad07e4747 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -15,6 +15,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/init.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -163,14 +164,6 @@
 #define PCIE_CONFIG_WR_TYPE0			0xa
 #define PCIE_CONFIG_WR_TYPE1			0xb
 
-#define PCIE_CONF_BUS(bus)			(((bus) & 0xff) << 20)
-#define PCIE_CONF_DEV(dev)			(((dev) & 0x1f) << 15)
-#define PCIE_CONF_FUNC(fun)			(((fun) & 0x7)	<< 12)
-#define PCIE_CONF_REG(reg)			((reg) & 0xffc)
-#define PCIE_CONF_ADDR(bus, devfn, where)	\
-	(PCIE_CONF_BUS(bus) | PCIE_CONF_DEV(PCI_SLOT(devfn))	| \
-	 PCIE_CONF_FUNC(PCI_FUNC(devfn)) | PCIE_CONF_REG(where))
-
 #define PIO_RETRY_CNT			500
 #define PIO_RETRY_DELAY			2 /* 2 us*/
 
@@ -683,7 +676,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 	advk_writel(pcie, reg, PIO_CTRL);
 
 	/* Program the address registers */
-	reg = PCIE_CONF_ADDR(bus->number, devfn, where);
+	reg = PCIE_ECAM_OFFSET(bus, devfn, (where & 0xffc));
 	advk_writel(pcie, reg, PIO_ADDR_LS);
 	advk_writel(pcie, 0, PIO_ADDR_MS);
 
@@ -744,7 +737,7 @@ static int advk_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	advk_writel(pcie, reg, PIO_CTRL);
 
 	/* Program the address registers */
-	reg = PCIE_CONF_ADDR(bus->number, devfn, where);
+	reg = PCIE_ECAM_OFFSET(bus, devfn, (where & 0xffc));
 	advk_writel(pcie, reg, PIO_ADDR_LS);
 	advk_writel(pcie, 0, PIO_ADDR_MS);
 
diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index b51977abfdf1..c1c69b11615f 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -49,7 +49,7 @@ static void __iomem *pci_dw_ecam_map_bus(struct pci_bus *bus,
 }
 
 static const struct pci_ecam_ops pci_dw_ecam_bus_ops = {
-	.bus_shift	= 20,
+	.bus_shift	= PCIE_ECAM_BUS_SHIFT,
 	.pci_ops	= {
 		.map_bus	= pci_dw_ecam_map_bus,
 		.read		= pci_generic_config_read,
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index 7e8835fee5f7..22ed7e995b39 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -346,7 +346,7 @@ static int thunder_ecam_config_write(struct pci_bus *bus, unsigned int devfn,
 }
 
 const struct pci_ecam_ops pci_thunder_ecam_ops = {
-	.bus_shift	= 20,
+	.bus_shift	= PCIE_ECAM_BUS_SHIFT,
 	.pci_ops	= {
 		.map_bus        = pci_ecam_map_bus,
 		.read           = thunder_ecam_config_read,
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 3f847969143e..1a3f70ac61fc 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -19,6 +19,15 @@
 #define PEM_CFG_WR 0x28
 #define PEM_CFG_RD 0x30
 
+/*
+ * Enhanced Configuration Access Mechanism (ECAM)
+ *
+ * N.B. This is a non-standard platform-specific ECAM bus shift value.  For
+ * standard values defined in the PCI Express Base Specification see
+ * include/linux/pci-ecam.h.
+ */
+#define THUNDER_PCIE_ECAM_BUS_SHIFT	24
+
 struct thunder_pem_pci {
 	u32		ea_entry[3];
 	void __iomem	*pem_reg_base;
@@ -404,7 +413,7 @@ static int thunder_pem_acpi_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops thunder_pem_ecam_ops = {
-	.bus_shift	= 24,
+	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
 	.init		= thunder_pem_acpi_init,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
@@ -441,7 +450,7 @@ static int thunder_pem_platform_init(struct pci_config_window *cfg)
 }
 
 static const struct pci_ecam_ops pci_thunder_pem_ops = {
-	.bus_shift	= 24,
+	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
 	.init		= thunder_pem_platform_init,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 8e0db84f089d..85e7c98265e8 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -257,7 +257,6 @@ static int xgene_v1_pcie_ecam_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops xgene_v1_pcie_ecam_ops = {
-	.bus_shift	= 16,
 	.init		= xgene_v1_pcie_ecam_init,
 	.pci_ops	= {
 		.map_bus	= xgene_pcie_map_bus,
@@ -272,7 +271,6 @@ static int xgene_v2_pcie_ecam_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
-	.bus_shift	= 16,
 	.init		= xgene_v2_pcie_ecam_init,
 	.pci_ops	= {
 		.map_bus	= xgene_pcie_map_bus,
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 85fa7d54f11f..5d1e64550bba 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -22,6 +22,7 @@
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/printk.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -116,11 +117,7 @@
 #define PCIE_MSI_INTR2_MASK_CLR				0x4514
 
 #define PCIE_EXT_CFG_DATA				0x8000
-
 #define PCIE_EXT_CFG_INDEX				0x9000
-#define  PCIE_EXT_BUSNUM_SHIFT				20
-#define  PCIE_EXT_SLOT_SHIFT				15
-#define  PCIE_EXT_FUNC_SHIFT				12
 
 #define PCIE_RGR1_SW_INIT_1				0x9210
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
@@ -569,15 +566,6 @@ static bool brcm_pcie_link_up(struct brcm_pcie *pcie)
 	return dla && plu;
 }
 
-/* Configuration space read/write support */
-static inline int brcm_pcie_cfg_index(int busnr, int devfn, int reg)
-{
-	return ((PCI_SLOT(devfn) & 0x1f) << PCIE_EXT_SLOT_SHIFT)
-		| ((PCI_FUNC(devfn) & 0x07) << PCIE_EXT_FUNC_SHIFT)
-		| (busnr << PCIE_EXT_BUSNUM_SHIFT)
-		| (reg & ~3);
-}
-
 static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
 					int where)
 {
@@ -590,7 +578,7 @@ static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
 		return PCI_SLOT(devfn) ? NULL : base + where;
 
 	/* For devices, write to the config space index register */
-	idx = brcm_pcie_cfg_index(bus->number, devfn, 0);
+	idx = PCIE_ECAM_BUS(bus->number) | PCIE_ECAM_DEVFN(devfn);
 	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
 	return base + PCIE_EXT_CFG_DATA + where;
 }
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 905e93808243..30abe4b7be70 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/msi.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -39,15 +40,7 @@
 
 #define CFG_IND_ADDR_MASK		0x00001ffc
 
-#define CFG_ADDR_BUS_NUM_SHIFT		20
-#define CFG_ADDR_BUS_NUM_MASK		0x0ff00000
-#define CFG_ADDR_DEV_NUM_SHIFT		15
-#define CFG_ADDR_DEV_NUM_MASK		0x000f8000
-#define CFG_ADDR_FUNC_NUM_SHIFT		12
-#define CFG_ADDR_FUNC_NUM_MASK		0x00007000
-#define CFG_ADDR_REG_NUM_SHIFT		2
 #define CFG_ADDR_REG_NUM_MASK		0x00000ffc
-#define CFG_ADDR_CFG_TYPE_SHIFT		0
 #define CFG_ADDR_CFG_TYPE_MASK		0x00000003
 
 #define SYS_RC_INTX_MASK		0xf
@@ -459,18 +452,16 @@ static inline void iproc_pcie_apb_err_disable(struct pci_bus *bus,
 
 static void __iomem *iproc_pcie_map_ep_cfg_reg(struct iproc_pcie *pcie,
 					       unsigned int busno,
-					       unsigned int slot,
-					       unsigned int fn,
+					       unsigned int devfn,
 					       int where)
 {
 	u16 offset;
 	u32 val;
 
 	/* EP device access */
-	val = (busno << CFG_ADDR_BUS_NUM_SHIFT) |
-		(slot << CFG_ADDR_DEV_NUM_SHIFT) |
-		(fn << CFG_ADDR_FUNC_NUM_SHIFT) |
-		(where & CFG_ADDR_REG_NUM_MASK) |
+	val = PCIE_ECAM_BUS(busno) |
+		PCIE_ECAM_DEVFN(devfn) |
+		PCIE_ECAM_REG(where & CFG_ADDR_REG_NUM_MASK) |
 		(1 & CFG_ADDR_CFG_TYPE_MASK);
 
 	iproc_pcie_write_reg(pcie, IPROC_PCIE_CFG_ADDR, val);
@@ -574,8 +565,6 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
 	struct iproc_pcie *pcie = iproc_data(bus);
-	unsigned int slot = PCI_SLOT(devfn);
-	unsigned int fn = PCI_FUNC(devfn);
 	unsigned int busno = bus->number;
 	void __iomem *cfg_data_p;
 	unsigned int data;
@@ -590,7 +579,7 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 		return ret;
 	}
 
-	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 
 	if (!cfg_data_p)
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -631,13 +620,11 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
 					    int busno, unsigned int devfn,
 					    int where)
 {
-	unsigned slot = PCI_SLOT(devfn);
-	unsigned fn = PCI_FUNC(devfn);
 	u16 offset;
 
 	/* root complex access */
 	if (busno == 0) {
-		if (slot > 0 || fn > 0)
+		if (PCIE_ECAM_DEVFN(devfn) > 0)
 			return NULL;
 
 		iproc_pcie_write_reg(pcie, IPROC_PCIE_CFG_IND_ADDR,
@@ -649,7 +636,7 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
 			return (pcie->base + offset);
 	}
 
-	return iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	return iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 }
 
 static void __iomem *iproc_pcie_bus_map_cfg_bus(struct pci_bus *bus,
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 0bb2fb3e8a0b..4c069f8fa420 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -160,12 +160,11 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 *val)
 {
-	u32 busdev;
+	void __iomem *addr;
 
-	busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
-				PCI_FUNC(devfn), where);
+	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus, devfn, where);
 
-	if (!IS_ALIGNED(busdev, size)) {
+	if (!IS_ALIGNED((uintptr_t)addr, size)) {
 		*val = 0;
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 	}
@@ -178,11 +177,11 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 						AXI_WRAPPER_TYPE1_CFG);
 
 	if (size == 4) {
-		*val = readl(rockchip->reg_base + busdev);
+		*val = readl(addr);
 	} else if (size == 2) {
-		*val = readw(rockchip->reg_base + busdev);
+		*val = readw(addr);
 	} else if (size == 1) {
-		*val = readb(rockchip->reg_base + busdev);
+		*val = readb(addr);
 	} else {
 		*val = 0;
 		return PCIBIOS_BAD_REGISTER_NUMBER;
@@ -194,11 +193,11 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 val)
 {
-	u32 busdev;
+	void __iomem *addr;
 
-	busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
-				PCI_FUNC(devfn), where);
-	if (!IS_ALIGNED(busdev, size))
+	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus, devfn, where);
+
+	if (!IS_ALIGNED((uintptr_t)addr, size))
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (pci_is_root_bus(bus->parent))
@@ -209,11 +208,11 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 						AXI_WRAPPER_TYPE1_CFG);
 
 	if (size == 4)
-		writel(val, rockchip->reg_base + busdev);
+		writel(val, addr);
 	else if (size == 2)
-		writew(val, rockchip->reg_base + busdev);
+		writew(val, addr);
 	else if (size == 1)
-		writeb(val, rockchip->reg_base + busdev);
+		writeb(val, addr);
 	else
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index c7d0178fc8c2..1650a5087450 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -13,6 +13,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 
 /*
  * The upper 16 bits of PCIE_CLIENT_CONFIG are a write mask for the lower 16
@@ -178,13 +179,6 @@
 #define MIN_AXI_ADDR_BITS_PASSED		8
 #define PCIE_RC_SEND_PME_OFF			0x11960
 #define ROCKCHIP_VENDOR_ID			0x1d87
-#define PCIE_ECAM_BUS(x)			(((x) & 0xff) << 20)
-#define PCIE_ECAM_DEV(x)			(((x) & 0x1f) << 15)
-#define PCIE_ECAM_FUNC(x)			(((x) & 0x7) << 12)
-#define PCIE_ECAM_REG(x)			(((x) & 0xfff) << 0)
-#define PCIE_ECAM_ADDR(bus, dev, func, reg) \
-	  (PCIE_ECAM_BUS(bus) | PCIE_ECAM_DEV(dev) | \
-	   PCIE_ECAM_FUNC(func) | PCIE_ECAM_REG(reg))
 #define PCIE_LINK_IS_L2(x) \
 	(((x) & PCIE_CLIENT_DEBUG_LTSSM_MASK) == PCIE_CLIENT_DEBUG_LTSSM_L2)
 #define PCIE_LINK_UP(x) \
diff --git a/drivers/pci/controller/pcie-tango.c b/drivers/pci/controller/pcie-tango.c
index d093a8ce4bb1..8f0d695afbde 100644
--- a/drivers/pci/controller/pcie-tango.c
+++ b/drivers/pci/controller/pcie-tango.c
@@ -208,7 +208,7 @@ static int smp8759_config_write(struct pci_bus *bus, unsigned int devfn,
 }
 
 static const struct pci_ecam_ops smp8759_ecam_ops = {
-	.bus_shift	= 20,
+	.bus_shift	= PCIE_ECAM_BUS_SHIFT,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= smp8759_config_read,
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index f3cf7d61924f..cfd12b75bacb 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -18,6 +18,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_irq.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 #include <linux/irqchip/chained_irq.h>
 
@@ -124,8 +125,6 @@
 #define E_ECAM_CR_ENABLE		BIT(0)
 #define E_ECAM_SIZE_LOC			GENMASK(20, 16)
 #define E_ECAM_SIZE_SHIFT		16
-#define ECAM_BUS_LOC_SHIFT		20
-#define ECAM_DEV_LOC_SHIFT		12
 #define NWL_ECAM_VALUE_DEFAULT		12
 
 #define CFG_DMA_REG_BAR			GENMASK(2, 0)
@@ -240,15 +239,11 @@ static void __iomem *nwl_pcie_map_bus(struct pci_bus *bus, unsigned int devfn,
 				      int where)
 {
 	struct nwl_pcie *pcie = bus->sysdata;
-	int relbus;
 
 	if (!nwl_pcie_valid_device(bus, devfn))
 		return NULL;
 
-	relbus = (bus->number << ECAM_BUS_LOC_SHIFT) |
-			(devfn << ECAM_DEV_LOC_SHIFT);
-
-	return pcie->ecam_base + relbus + where;
+	return pcie->ecam_base + PCIE_ECAM_OFFSET(bus, devfn, where);
 }
 
 /* PCIe operations */
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 8523be61bba5..49bde5266aa2 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -21,6 +21,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_irq.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
 #include "../pci.h"
@@ -86,10 +87,6 @@
 /* Phy Status/Control Register definitions */
 #define XILINX_PCIE_REG_PSCR_LNKUP	BIT(11)
 
-/* ECAM definitions */
-#define ECAM_BUS_NUM_SHIFT		20
-#define ECAM_DEV_NUM_SHIFT		12
-
 /* Number of MSI IRQs */
 #define XILINX_NUM_MSI_IRQS		128
 
@@ -183,15 +180,11 @@ static void __iomem *xilinx_pcie_map_bus(struct pci_bus *bus,
 					 unsigned int devfn, int where)
 {
 	struct xilinx_pcie_port *port = bus->sysdata;
-	int relbus;
 
 	if (!xilinx_pcie_valid_device(bus, devfn))
 		return NULL;
 
-	relbus = (bus->number << ECAM_BUS_NUM_SHIFT) |
-		 (devfn << ECAM_DEV_NUM_SHIFT);
-
-	return port->reg_base + relbus + where;
+	return port->reg_base + PCIE_ECAM_OFFSET(bus, devfn, where);
 }
 
 /* PCIe operations */
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index f69ef8c89f72..b14751845263 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/srcu.h>
 #include <linux/rculist.h>
 #include <linux/rcupdate.h>
@@ -302,8 +303,8 @@ static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bus,
 				  unsigned int devfn, int reg, int len)
 {
 	char __iomem *addr = vmd->cfgbar +
-			     ((bus->number - vmd->busn_start) << 20) +
-			     (devfn << 12) + reg;
+			     PCIE_ECAM_BUS(bus->number - vmd->busn_start) +
+			     PCIE_ECAM_DEVFN(devfn) + PCIE_ECAM_REG(reg);
 
 	if ((addr - vmd->cfgbar) + len >=
 	    resource_size(&vmd->dev->resource[VMD_CFGBAR]))
diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 8f065a42fc1a..ffd010290084 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -149,7 +149,7 @@ EXPORT_SYMBOL_GPL(pci_ecam_map_bus);
 
 /* ECAM ops */
 const struct pci_ecam_ops pci_generic_ecam_ops = {
-	.bus_shift	= 20,
+	.bus_shift	= PCIE_ECAM_BUS_SHIFT,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= pci_generic_config_read,
@@ -161,7 +161,7 @@ EXPORT_SYMBOL_GPL(pci_generic_ecam_ops);
 #if defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS)
 /* ECAM ops for 32-bit access only (non-compliant) */
 const struct pci_ecam_ops pci_32b_ops = {
-	.bus_shift	= 20,
+	.bus_shift	= PCIE_ECAM_BUS_SHIFT,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= pci_generic_config_read32,
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 1af5cb02ef7f..3ca5674fdf5e 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -9,6 +9,30 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 
+/*
+ * Memory address shift values for the byte-level address that
+ * can be used when accessing the PCI Express Configuration Space.
+ */
+
+/*
+ * Enhanced Configuration Access Mechanism (ECAM)
+ *
+ * See PCI Express Base Specification, Revision 5.0, Version 1.0,
+ * Section 7.2.2, Table 7-1, p. 677.
+ */
+#define PCIE_ECAM_BUS_SHIFT	20 /* Bus Number */
+#define PCIE_ECAM_DEV_SHIFT	15 /* Device Number */
+#define PCIE_ECAM_FUN_SHIFT	12 /* Function Number */
+
+#define PCIE_ECAM_BUS(x)	(((x) & 0xff) << PCIE_ECAM_BUS_SHIFT)
+#define PCIE_ECAM_DEVFN(x)	(((x) & 0xff) << PCIE_ECAM_FUN_SHIFT)
+#define PCIE_ECAM_REG(x)	((x) & 0xfff)
+
+#define PCIE_ECAM_OFFSET(bus, devfn, where) \
+    (PCIE_ECAM_BUS(bus->number) | \
+     PCIE_ECAM_DEVFN(devfn) | \
+     PCIE_ECAM_REG(where))
+
 /*
  * struct to hold pci ops and bus shift of the config window
  * for a PCI controller.
-- 
2.28.0

