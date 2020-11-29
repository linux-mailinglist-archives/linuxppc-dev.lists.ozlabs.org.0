Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3602C7BEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 00:09:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkkZj6pzbzDrNL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:09:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkkY26svdzDrBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:07:50 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id s8so13044104wrw.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 15:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdEq2gl8a+PAeDGUba3SmwX1K8uJGnFaaAqpMDssDWo=;
 b=VnM9gLxWgOm0d7xZ5grXBfvTO7F6Vwe1BqYp3h1LCtAgEyp5BkY34BL5mq065s3hLK
 HZQm8ySgVVhJzPIkC/c6rOkNbEHO4DVWpQcG6cqIZiI1hyfvecO6T4sROgvENxalBixv
 PfFB35yfMJ5RQjLEo7qEYr3GnzpfB0HDuHPg8ToyoM/IYiqb0fb8mrvrq6ZlqOBIvMYm
 6KTXDyxhEgY2eSA5wdHu9IVDFKmWIuhh1z2E8clpm+RFDcNehSthzW9P1G6LnPsWkFHR
 AuJPRjSI5Acxe8Rn80RGXzIScsKKpt7wFOj7oiznM6+nNQfCniCtYz0lNVC2S9jp3pTQ
 3jag==
X-Gm-Message-State: AOAM5327iqvzjxTosVWEbWMAMAmHHucsZFwK3Kco2nHwDx6nYpnncfqH
 UMKa6W3En0dxyls74p2zL0I=
X-Google-Smtp-Source: ABdhPJzemcgSIWckEmLG/WoWTheRZkQseBG6J/lGXVepGvFFOylFGIo2a+IOWOYyZ2ycSEeUpAhqng==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr25556413wrn.396.1606691267941; 
 Sun, 29 Nov 2020 15:07:47 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d2sm24831005wrn.43.2020.11.29.15.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 15:07:47 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 1/5] PCI: Unify ECAM constants in native PCI Express drivers
Date: Sun, 29 Nov 2020 23:07:39 +0000
Message-Id: <20201129230743.3006978-2-kw@linux.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129230743.3006978-1-kw@linux.com>
References: <20201129230743.3006978-1-kw@linux.com>
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

Add ECAM-related constants to provide a set of standard constants
defining memory address shift values to the byte-level address that can
be used to access the PCI Express Configuration Space, and then move
native PCI Express controller drivers to use the newly introduced
definitions retiring driver-specific ones.

Refactor pci_ecam_map_bus() function to use newly added constants so
that limits to the bus, device function and offset (now limited to 4K as
per the specification) are in place to prevent the defective or
malicious caller from supplying incorrect configuration offset and thus
targeting the wrong device when accessing extended configuration space.
This refactor also allows for the ".bus_shit" initialisers to be dropped
when the user is not using a custom value as a default value will be
used as per the PCI Express Specification.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/controller/dwc/pcie-al.c        | 12 ++-------
 drivers/pci/controller/dwc/pcie-hisi.c      |  2 --
 drivers/pci/controller/pci-aardvark.c       | 13 +++-------
 drivers/pci/controller/pci-host-generic.c   |  1 -
 drivers/pci/controller/pci-thunder-ecam.c   |  1 -
 drivers/pci/controller/pcie-brcmstb.c       | 16 ++----------
 drivers/pci/controller/pcie-rockchip-host.c | 27 ++++++++++-----------
 drivers/pci/controller/pcie-rockchip.h      |  8 +-----
 drivers/pci/controller/pcie-tango.c         |  1 -
 drivers/pci/controller/pcie-xilinx-nwl.c    |  9 ++-----
 drivers/pci/controller/pcie-xilinx.c        | 11 ++-------
 drivers/pci/controller/vmd.c                | 11 ++++-----
 drivers/pci/ecam.c                          | 23 ++++++++++++------
 include/linux/pci-ecam.h                    | 27 +++++++++++++++++++++
 14 files changed, 73 insertions(+), 89 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index f973fbca90cf..af9e51ab1af8 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -76,7 +76,6 @@ static int al_pcie_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops al_pcie_ops = {
-	.bus_shift    = 20,
 	.init         =  al_pcie_init,
 	.pci_ops      = {
 		.map_bus    = al_pcie_map_bus,
@@ -138,8 +137,6 @@ struct al_pcie {
 	struct al_pcie_target_bus_cfg target_bus_cfg;
 };
 
-#define PCIE_ECAM_DEVFN(x)		(((x) & 0xff) << 12)
-
 #define to_al_pcie(x)		dev_get_drvdata((x)->dev)
 
 static inline u32 al_pcie_controller_readl(struct al_pcie *pcie, u32 offset)
@@ -226,11 +223,6 @@ static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
 	struct al_pcie_target_bus_cfg *target_bus_cfg = &pcie->target_bus_cfg;
 	unsigned int busnr_ecam = busnr & target_bus_cfg->ecam_mask;
 	unsigned int busnr_reg = busnr & target_bus_cfg->reg_mask;
-	void __iomem *pci_base_addr;
-
-	pci_base_addr = (void __iomem *)((uintptr_t)pp->va_cfg0_base +
-					 (busnr_ecam << 20) +
-					 PCIE_ECAM_DEVFN(devfn));
 
 	if (busnr_reg != target_bus_cfg->reg_val) {
 		dev_dbg(pcie->pci->dev, "Changing target bus busnum val from 0x%x to 0x%x\n",
@@ -241,7 +233,7 @@ static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
 				       target_bus_cfg->reg_mask);
 	}
 
-	return pci_base_addr + where;
+	return pp->va_cfg0_base + PCIE_ECAM_OFFSET(busnr_ecam, devfn, where);
 }
 
 static struct pci_ops al_child_pci_ops = {
@@ -264,7 +256,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 
 	target_bus_cfg = &pcie->target_bus_cfg;
 
-	ecam_bus_mask = (pcie->ecam_size >> 20) - 1;
+	ecam_bus_mask = (pcie->ecam_size >> PCIE_ECAM_BUS_SHIFT) - 1;
 	if (ecam_bus_mask > 255) {
 		dev_warn(pcie->dev, "ECAM window size is larger than 256MB. Cutting off at 256\n");
 		ecam_bus_mask = 255;
diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 5ca86796d43a..8fc5960faf28 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -100,7 +100,6 @@ static int hisi_pcie_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops hisi_pcie_ops = {
-	.bus_shift    = 20,
 	.init         =  hisi_pcie_init,
 	.pci_ops      = {
 		.map_bus    = hisi_pcie_map_bus,
@@ -135,7 +134,6 @@ static int hisi_pcie_platform_init(struct pci_config_window *cfg)
 }
 
 static const struct pci_ecam_ops hisi_pcie_platform_ops = {
-	.bus_shift    = 20,
 	.init         =  hisi_pcie_platform_init,
 	.pci_ops      = {
 		.map_bus    = hisi_pcie_map_bus,
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 0be485a25327..1043e54c73bd 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/init.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -164,14 +165,6 @@
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
 
@@ -687,7 +680,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 	advk_writel(pcie, reg, PIO_CTRL);
 
 	/* Program the address registers */
-	reg = PCIE_CONF_ADDR(bus->number, devfn, where);
+	reg = ALIGN_DOWN(PCIE_ECAM_OFFSET(bus->number, devfn, where), 4);
 	advk_writel(pcie, reg, PIO_ADDR_LS);
 	advk_writel(pcie, 0, PIO_ADDR_MS);
 
@@ -748,7 +741,7 @@ static int advk_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	advk_writel(pcie, reg, PIO_CTRL);
 
 	/* Program the address registers */
-	reg = PCIE_CONF_ADDR(bus->number, devfn, where);
+	reg = ALIGN_DOWN(PCIE_ECAM_OFFSET(bus->number, devfn, where), 4);
 	advk_writel(pcie, reg, PIO_ADDR_LS);
 	advk_writel(pcie, 0, PIO_ADDR_MS);
 
diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index b51977abfdf1..63865aeb636b 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -49,7 +49,6 @@ static void __iomem *pci_dw_ecam_map_bus(struct pci_bus *bus,
 }
 
 static const struct pci_ecam_ops pci_dw_ecam_bus_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus	= pci_dw_ecam_map_bus,
 		.read		= pci_generic_config_read,
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index 7e8835fee5f7..f964fd26f7e0 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -346,7 +346,6 @@ static int thunder_ecam_config_write(struct pci_bus *bus, unsigned int devfn,
 }
 
 const struct pci_ecam_ops pci_thunder_ecam_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus        = pci_ecam_map_bus,
 		.read           = thunder_ecam_config_read,
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index bea86899bd5d..7fc80fd6f13f 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -22,6 +22,7 @@
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/printk.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
@@ -127,11 +128,7 @@
 #define  MSI_INT_MASK_CLR		0x14
 
 #define PCIE_EXT_CFG_DATA				0x8000
-
 #define PCIE_EXT_CFG_INDEX				0x9000
-#define  PCIE_EXT_BUSNUM_SHIFT				20
-#define  PCIE_EXT_SLOT_SHIFT				15
-#define  PCIE_EXT_FUNC_SHIFT				12
 
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
 #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
@@ -695,15 +692,6 @@ static bool brcm_pcie_link_up(struct brcm_pcie *pcie)
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
@@ -716,7 +704,7 @@ static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
 		return PCI_SLOT(devfn) ? NULL : base + where;
 
 	/* For devices, write to the config space index register */
-	idx = brcm_pcie_cfg_index(bus->number, devfn, 0);
+	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
 	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
 	return base + PCIE_EXT_CFG_DATA + where;
 }
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 9705059523a6..f1d08a1b1591 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -157,12 +157,11 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 *val)
 {
-	u32 busdev;
+	void __iomem *addr;
 
-	busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
-				PCI_FUNC(devfn), where);
+	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 
-	if (!IS_ALIGNED(busdev, size)) {
+	if (!IS_ALIGNED((uintptr_t)addr, size)) {
 		*val = 0;
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 	}
@@ -175,11 +174,11 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
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
@@ -191,11 +190,11 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 val)
 {
-	u32 busdev;
+	void __iomem *addr;
 
-	busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
-				PCI_FUNC(devfn), where);
-	if (!IS_ALIGNED(busdev, size))
+	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
+
+	if (!IS_ALIGNED((uintptr_t)addr, size))
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (pci_is_root_bus(bus->parent))
@@ -206,11 +205,11 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
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
index d093a8ce4bb1..62a061f1d62e 100644
--- a/drivers/pci/controller/pcie-tango.c
+++ b/drivers/pci/controller/pcie-tango.c
@@ -208,7 +208,6 @@ static int smp8759_config_write(struct pci_bus *bus, unsigned int devfn,
 }
 
 static const struct pci_ecam_ops smp8759_ecam_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= smp8759_config_read,
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index f3cf7d61924f..7f29c2fdcd51 100644
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
+	return pcie->ecam_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 }
 
 /* PCIe operations */
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 8523be61bba5..fa5baeb82653 100644
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
+	return port->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 }
 
 /* PCIe operations */
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index f375c21ceeb1..1361a79bd1e7 100644
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
@@ -328,15 +329,13 @@ static void vmd_remove_irq_domain(struct vmd_dev *vmd)
 static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bus,
 				  unsigned int devfn, int reg, int len)
 {
-	char __iomem *addr = vmd->cfgbar +
-			     ((bus->number - vmd->busn_start) << 20) +
-			     (devfn << 12) + reg;
+	unsigned int busnr_ecam = bus->number - vmd->busn_start;
+	u32 offset = PCIE_ECAM_OFFSET(busnr_ecam, devfn, reg);
 
-	if ((addr - vmd->cfgbar) + len >=
-	    resource_size(&vmd->dev->resource[VMD_CFGBAR]))
+	if (offset + len >= resource_size(&vmd->dev->resource[VMD_CFGBAR]))
 		return NULL;
 
-	return addr;
+	return vmd->cfgbar + offset;
 }
 
 /*
diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index b54d32a31669..59f91d434859 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -131,25 +131,36 @@ void __iomem *pci_ecam_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where)
 {
 	struct pci_config_window *cfg = bus->sysdata;
+	unsigned int bus_shift = cfg->ops->bus_shift;
 	unsigned int devfn_shift = cfg->ops->bus_shift - 8;
 	unsigned int busn = bus->number;
 	void __iomem *base;
+	u32 bus_offset, devfn_offset;
 
 	if (busn < cfg->busr.start || busn > cfg->busr.end)
 		return NULL;
 
 	busn -= cfg->busr.start;
-	if (per_bus_mapping)
+	if (per_bus_mapping) {
 		base = cfg->winp[busn];
-	else
-		base = cfg->win + (busn << cfg->ops->bus_shift);
-	return base + (devfn << devfn_shift) + where;
+		busn = 0;
+	} else
+		base = cfg->win;
+
+	if (cfg->ops->bus_shift) {
+		bus_offset = (busn & PCIE_ECAM_BUS_MASK) << bus_shift;
+		devfn_offset = (devfn & PCIE_ECAM_DEVFN_MASK) << devfn_shift;
+		where &= PCIE_ECAM_REG_MASK;
+
+		return base + (bus_offset | devfn_offset | where);
+	}
+
+	return base + PCIE_ECAM_OFFSET(busn, devfn, where);
 }
 EXPORT_SYMBOL_GPL(pci_ecam_map_bus);
 
 /* ECAM ops */
 const struct pci_ecam_ops pci_generic_ecam_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= pci_generic_config_read,
@@ -161,7 +172,6 @@ EXPORT_SYMBOL_GPL(pci_generic_ecam_ops);
 #if defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS)
 /* ECAM ops for 32-bit access only (non-compliant) */
 const struct pci_ecam_ops pci_32b_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= pci_generic_config_read32,
@@ -171,7 +181,6 @@ const struct pci_ecam_ops pci_32b_ops = {
 
 /* ECAM ops for 32-bit read only (non-compliant) */
 const struct pci_ecam_ops pci_32b_read_ops = {
-	.bus_shift	= 20,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
 		.read		= pci_generic_config_read32,
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 033ce74f02e8..65d3d83015c3 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -9,6 +9,33 @@
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
+#define PCIE_ECAM_BUS_SHIFT	20 /* Bus number */
+#define PCIE_ECAM_DEVFN_SHIFT	12 /* Device and Function number */
+
+#define PCIE_ECAM_BUS_MASK	0xff
+#define PCIE_ECAM_DEVFN_MASK	0xff
+#define PCIE_ECAM_REG_MASK	0xfff /* Limit offset to a maximum of 4K */
+
+#define PCIE_ECAM_BUS(x)	(((x) & PCIE_ECAM_BUS_MASK) << PCIE_ECAM_BUS_SHIFT)
+#define PCIE_ECAM_DEVFN(x)	(((x) & PCIE_ECAM_DEVFN_MASK) << PCIE_ECAM_DEVFN_SHIFT)
+#define PCIE_ECAM_REG(x)	((x) & PCIE_ECAM_REG_MASK)
+
+#define PCIE_ECAM_OFFSET(bus, devfn, where) \
+	(PCIE_ECAM_BUS(bus) | \
+	 PCIE_ECAM_DEVFN(devfn) | \
+	 PCIE_ECAM_REG(where))
+
 /*
  * struct to hold pci ops and bus shift of the config window
  * for a PCI controller.
-- 
2.29.2

