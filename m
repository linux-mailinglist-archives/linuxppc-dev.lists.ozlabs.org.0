Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A381E2C635F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 11:48:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjBDb5n1LzDrfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 21:48:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.195;
 helo=mail-pl1-f195.google.com; envelope-from=kswilczynski@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjBBw20w4zDrdH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 21:46:47 +1100 (AEDT)
Received: by mail-pl1-f195.google.com with SMTP id v21so2490303plo.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 02:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ofhNQSHG3WAD/AojJeiQwmlt67hb9Caduex5mipx9k=;
 b=trhK8Qh5GpNnMADdiSjAaeGkZv56ExgysDopMKGP/MlHNh/OIH8+pHy1BsMNorihNF
 CFykebaeA39fxw0GFwYJXAkcaAgxxIxKf1yNHb10DbkloW8cir2/XB+bKJivnSwIzvkU
 JM/BRAOrYprmV85dzsPugd0ftEreoCINYze+tqgWcYLA8ZdU7IfSMvChFKvq1SP0hgGl
 vUuJ4cVimw9P9Q+jQwpv3YfeJ/3g44cuzM+cR3EPGzGtjL0SwVnz9l3SDers30UwjEZ8
 j8u2yi1iAwQ3iPpDvUQ27LgOq7cdt6WWI4r8aLtr8MZpJhY/nNs/iSoYatgK3SYZcuaE
 jhXA==
X-Gm-Message-State: AOAM531JSlvDwO5w0Y2wygN6cdT9DWlmTvWyHe2YkVfr6CqtcKdEqaBr
 vikgQcCpiHYwmnflzRO6+uc=
X-Google-Smtp-Source: ABdhPJxHqGQQEytKXoVDsUeGv6IYcQ2xpnElpAMxdcC+3X4fRm/f7wqyqiJBwbLDhUDt3fZBfILO6w==
X-Received: by 2002:a17:902:820e:b029:d6:e802:75aa with SMTP id
 x14-20020a170902820eb02900d6e80275aamr6214785pln.51.1606474004147; 
 Fri, 27 Nov 2020 02:46:44 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id v22sm7161494pff.48.2020.11.27.02.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 02:46:43 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v5] PCI: Unify ECAM constants in native PCI Express drivers
Date: Fri, 27 Nov 2020 10:46:26 +0000
Message-Id: <20201127104626.3979165-1-kw@linux.com>
X-Mailer: git-send-email 2.29.2
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
Changed in v5:
  Removed unused constant "PCIE_ECAM_DEV_SHIFT".
  Refactored ppc4xx_pciex_get_config_base() so that the "offset"
  parameter can be passed to so that the PCIE_ECAM_OFFSET() macro
  can be used.
  Used the ALIGN_DOWN() macro where 32 bit alignment is required
  instead using the 0xffc mask.
  Added CFG_ADDR_CFG_TYPE_1 macro to pci/controller/pcie-iproc.c to
  denote that this is a configuration type 1 address and access type.
  Refactored boundary check in pci/controller/vmd.c as used by the
  vmd_cfg_addr() function following addition of the PCIE_ECAM_OFFSET()
  macro.
  Changed the "bus->number" to simply pass the "bus" argument in the
  PCIE_ECAM_OFFSET() macro.

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

 arch/powerpc/platforms/4xx/pci.c            | 30 ++++++++++----------
 drivers/pci/controller/dwc/pcie-al.c        | 13 ++-------
 drivers/pci/controller/dwc/pcie-hisi.c      |  4 +--
 drivers/pci/controller/pci-aardvark.c       | 13 ++-------
 drivers/pci/controller/pci-host-generic.c   |  2 +-
 drivers/pci/controller/pci-thunder-ecam.c   |  2 +-
 drivers/pci/controller/pci-thunder-pem.c    | 13 +++++++--
 drivers/pci/controller/pci-xgene.c          |  2 --
 drivers/pci/controller/pcie-brcmstb.c       | 16 ++---------
 drivers/pci/controller/pcie-iproc.c         | 31 ++++++---------------
 drivers/pci/controller/pcie-rockchip-host.c | 27 +++++++++---------
 drivers/pci/controller/pcie-rockchip.h      |  8 +-----
 drivers/pci/controller/pcie-tango.c         |  2 +-
 drivers/pci/controller/pcie-xilinx-nwl.c    |  9 ++----
 drivers/pci/controller/pcie-xilinx.c        | 11 ++------
 drivers/pci/controller/vmd.c                | 19 ++++++-------
 drivers/pci/ecam.c                          |  4 +--
 include/linux/pci-ecam.h                    | 23 +++++++++++++++
 18 files changed, 99 insertions(+), 130 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index c13d64c3b019..4f3c529ef3b9 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -20,6 +20,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/delay.h>
@@ -1583,9 +1584,10 @@ static int ppc4xx_pciex_validate_bdf(struct ppc4xx_pciex_port *port,
 
 static void __iomem *ppc4xx_pciex_get_config_base(struct ppc4xx_pciex_port *port,
 						  struct pci_bus *bus,
-						  unsigned int devfn)
+						  unsigned int devfn,
+						  int offset)
 {
-	int relbus;
+	unsigned int busnr_ecam = bus->number - (port->hose->first_busno + 1);
 
 	/* Remove the casts when we finally remove the stupid volatile
 	 * in struct pci_controller
@@ -1593,9 +1595,7 @@ static void __iomem *ppc4xx_pciex_get_config_base(struct ppc4xx_pciex_port *port
 	if (bus->number == port->hose->first_busno)
 		return (void __iomem *)port->hose->cfg_addr;
 
-	relbus = bus->number - (port->hose->first_busno + 1);
-	return (void __iomem *)port->hose->cfg_data +
-		((relbus  << 20) | (devfn << 12));
+	return port->hose->cfg_data + PCIE_ECAM_OFFSET(busnr_ecam, devfn, offset);
 }
 
 static int ppc4xx_pciex_read_config(struct pci_bus *bus, unsigned int devfn,
@@ -1612,7 +1612,7 @@ static int ppc4xx_pciex_read_config(struct pci_bus *bus, unsigned int devfn,
 	if (ppc4xx_pciex_validate_bdf(port, bus, devfn) != 0)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	addr = ppc4xx_pciex_get_config_base(port, bus, devfn);
+	addr = ppc4xx_pciex_get_config_base(port, bus, devfn, offset);
 
 	/*
 	 * Reading from configuration space of non-existing device can
@@ -1627,20 +1627,20 @@ static int ppc4xx_pciex_read_config(struct pci_bus *bus, unsigned int devfn,
 
 	switch (len) {
 	case 1:
-		*val = in_8((u8 *)(addr + offset));
+		*val = in_8((u8 *)addr);
 		break;
 	case 2:
-		*val = in_le16((u16 *)(addr + offset));
+		*val = in_le16((u16 *)addr);
 		break;
 	default:
-		*val = in_le32((u32 *)(addr + offset));
+		*val = in_le32((u32 *)addr);
 		break;
 	}
 
 	pr_debug("pcie-config-read: bus=%3d [%3d..%3d] devfn=0x%04x"
 		 " offset=0x%04x len=%d, addr=0x%p val=0x%08x\n",
 		 bus->number, hose->first_busno, hose->last_busno,
-		 devfn, offset, len, addr + offset, *val);
+		 devfn, offset, len, addr, *val);
 
 	/* Check for CRS (440SPe rev B does that for us but heh ..) */
 	if (in_be32(port->utl_base + PEUTL_RCSTA) & 0x00040000) {
@@ -1667,7 +1667,7 @@ static int ppc4xx_pciex_write_config(struct pci_bus *bus, unsigned int devfn,
 	if (ppc4xx_pciex_validate_bdf(port, bus, devfn) != 0)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	addr = ppc4xx_pciex_get_config_base(port, bus, devfn);
+	addr = ppc4xx_pciex_get_config_base(port, bus, devfn, offset);
 
 	/*
 	 * Reading from configuration space of non-existing device can
@@ -1680,17 +1680,17 @@ static int ppc4xx_pciex_write_config(struct pci_bus *bus, unsigned int devfn,
 	pr_debug("pcie-config-write: bus=%3d [%3d..%3d] devfn=0x%04x"
 		 " offset=0x%04x len=%d, addr=0x%p val=0x%08x\n",
 		 bus->number, hose->first_busno, hose->last_busno,
-		 devfn, offset, len, addr + offset, val);
+		 devfn, offset, len, addr, val);
 
 	switch (len) {
 	case 1:
-		out_8((u8 *)(addr + offset), val);
+		out_8((u8 *)addr, val);
 		break;
 	case 2:
-		out_le16((u16 *)(addr + offset), val);
+		out_le16((u16 *)addr, val);
 		break;
 	default:
-		out_le32((u32 *)(addr + offset), val);
+		out_le32((u32 *)addr, val);
 		break;
 	}
 
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index f973fbca90cf..979d93b82df2 100644
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
@@ -226,11 +224,6 @@ static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
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
@@ -241,7 +234,7 @@ static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
 				       target_bus_cfg->reg_mask);
 	}
 
-	return pci_base_addr + where;
+	return pp->va_cfg0_base + PCIE_ECAM_OFFSET(busnr_ecam, devfn, where);
 }
 
 static struct pci_ops al_child_pci_ops = {
@@ -264,7 +257,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 
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
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 905e93808243..503662380ff8 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/msi.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -39,16 +40,8 @@
 
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
-#define CFG_ADDR_CFG_TYPE_MASK		0x00000003
+#define CFG_ADDR_CFG_TYPE_1		1
 
 #define SYS_RC_INTX_MASK		0xf
 
@@ -459,19 +452,15 @@ static inline void iproc_pcie_apb_err_disable(struct pci_bus *bus,
 
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
-		(1 & CFG_ADDR_CFG_TYPE_MASK);
+	val = ALIGN_DOWN(PCIE_ECAM_OFFSET(busno, devfn, where), 4) |
+		CFG_ADDR_CFG_TYPE_1;
 
 	iproc_pcie_write_reg(pcie, IPROC_PCIE_CFG_ADDR, val);
 	offset = iproc_pcie_reg_offset(pcie, IPROC_PCIE_CFG_DATA);
@@ -574,8 +563,6 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
 	struct iproc_pcie *pcie = iproc_data(bus);
-	unsigned int slot = PCI_SLOT(devfn);
-	unsigned int fn = PCI_FUNC(devfn);
 	unsigned int busno = bus->number;
 	void __iomem *cfg_data_p;
 	unsigned int data;
@@ -590,7 +577,7 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 		return ret;
 	}
 
-	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 
 	if (!cfg_data_p)
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -631,13 +618,11 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
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
@@ -649,7 +634,7 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
 			return (pcie->base + offset);
 	}
 
-	return iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	return iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 }
 
 static void __iomem *iproc_pcie_bus_map_cfg_bus(struct pci_bus *bus,
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
index f375c21ceeb1..59fa9a94860f 100644
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
@@ -94,7 +95,7 @@ struct vmd_dev {
 	struct pci_dev		*dev;
 
 	spinlock_t		cfg_lock;
-	char __iomem		*cfgbar;
+	void __iomem		*cfgbar;
 
 	int msix_count;
 	struct vmd_irq_list	*irqs;
@@ -325,18 +326,16 @@ static void vmd_remove_irq_domain(struct vmd_dev *vmd)
 	}
 }
 
-static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bus,
+static void __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bus,
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
@@ -347,7 +346,7 @@ static int vmd_pci_read(struct pci_bus *bus, unsigned int devfn, int reg,
 			int len, u32 *value)
 {
 	struct vmd_dev *vmd = vmd_from_bus(bus);
-	char __iomem *addr = vmd_cfg_addr(vmd, bus, devfn, reg, len);
+	void __iomem *addr = vmd_cfg_addr(vmd, bus, devfn, reg, len);
 	unsigned long flags;
 	int ret = 0;
 
@@ -382,7 +381,7 @@ static int vmd_pci_write(struct pci_bus *bus, unsigned int devfn, int reg,
 			 int len, u32 value)
 {
 	struct vmd_dev *vmd = vmd_from_bus(bus);
-	char __iomem *addr = vmd_cfg_addr(vmd, bus, devfn, reg, len);
+	void __iomem *addr = vmd_cfg_addr(vmd, bus, devfn, reg, len);
 	unsigned long flags;
 	int ret = 0;
 
diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index b54d32a31669..1e0229765349 100644
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
index 033ce74f02e8..9767922461ca 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -9,6 +9,29 @@
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
+#define PCIE_ECAM_DEVFN_SHIFT	12 /* Device and Function Number */
+
+#define PCIE_ECAM_BUS(x)	(((x) & 0xff) << PCIE_ECAM_BUS_SHIFT)
+#define PCIE_ECAM_DEVFN(x)	(((x) & 0xff) << PCIE_ECAM_DEVFN_SHIFT)
+#define PCIE_ECAM_REG(x)	((x) & 0xfff)
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

