Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F57B6999
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 14:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k0Pv9mGN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Hrh5DGdz3vfW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 23:56:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k0Pv9mGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Hpz3Y0xz3vZQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:55:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696337708; x=1727873708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ryxdjm0ZCM7o3zV6z+GS2CN8GCrxx+hkrapCtQTAFYE=;
  b=k0Pv9mGNeHbXmxKtJX9VyoeiUryzPyER4IDUUiQ8DndtznHPSjVwOvy5
   YAK0Wj8RLc7lJvx5dU6rSWAERH5vuvG8ZpWNCqYicEL99HVDKkk6wNaIq
   XYHugWUoh1f0PgimIXAn3TX7QuQtpe+ZtWIzKCL7t3nGHBR+pHOdLyXtB
   ocsfFw6OQyNK8jiTjO+07eeNarFn0WIrwEiPu9e0PbaeNBMibbkrYjvUp
   3ILuDtgJS9EgQt7DWc+R7vsSRiVenA6grB2LceEogLsfXLXfvjvV5vN/k
   KjAZ+dCpFdAYkjK4YGyX++Tsf7oBXfc8fvQG0JglhlIi14zgpPTQ/JBQc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4432459"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="4432459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816665815"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816665815"
Received: from bmihaile-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.222.64])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jonathan.derrick@linux.dev,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	marek.vasut+renesas@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	m.karthikeyan@mobiveil.co.in,
	nirmal.patel@linux.intel.com,
	rjui@broadcom.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	sbranden@broadcom.com,
	yoshihiro.shimoda.uh@renesas.com,
	Zhiqiang.Hou@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] PCI: Use PCI_HEADER_TYPE_* instead of literals
Date: Tue,  3 Oct 2023 15:53:00 +0300
Message-Id: <20231003125300.5541-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
References: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace literals under drivers/pci/ with PCI_HEADER_TYPE_MASK,
PCI_HEADER_TYPE_NORMAL, and PCI_HEADER_TYPE_MFD.

While at it, replace !! boolean conversion with FIELD_GET().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
 .../controller/mobiveil/pcie-mobiveil-host.c  |  2 +-
 drivers/pci/controller/pcie-iproc.c           |  2 +-
 drivers/pci/controller/pcie-rcar-ep.c         |  2 +-
 drivers/pci/controller/pcie-rcar-host.c       |  2 +-
 drivers/pci/controller/vmd.c                  |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c             |  6 ++---
 drivers/pci/hotplug/cpqphp_pci.c              | 22 +++++++++----------
 drivers/pci/hotplug/ibmphp.h                  |  5 +++--
 drivers/pci/hotplug/ibmphp_pci.c              |  2 +-
 drivers/pci/pci.c                             |  2 +-
 drivers/pci/quirks.c                          |  6 ++---
 12 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index ed5fb492fe08..69a4aa5cfc20 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -41,7 +41,7 @@ static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
 	u32 header_type;
 
 	header_type = ioread8(pci->dbi_base + PCI_HEADER_TYPE);
-	header_type &= 0x7f;
+	header_type &= PCI_HEADER_TYPE_MASK;
 
 	return header_type == PCI_HEADER_TYPE_BRIDGE;
 }
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index 45b97a4b14db..32951f7d6d6d 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -539,7 +539,7 @@ static bool mobiveil_pcie_is_bridge(struct mobiveil_pcie *pcie)
 	u32 header_type;
 
 	header_type = mobiveil_csr_readb(pcie, PCI_HEADER_TYPE);
-	header_type &= 0x7f;
+	header_type &= PCI_HEADER_TYPE_MASK;
 
 	return header_type == PCI_HEADER_TYPE_BRIDGE;
 }
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index bd1c98b68851..97f739a2c9f8 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -783,7 +783,7 @@ static int iproc_pcie_check_link(struct iproc_pcie *pcie)
 
 	/* make sure we are not in EP mode */
 	iproc_pci_raw_config_read32(pcie, 0, PCI_HEADER_TYPE, 1, &hdr_type);
-	if ((hdr_type & 0x7f) != PCI_HEADER_TYPE_BRIDGE) {
+	if ((hdr_type & PCI_HEADER_TYPE_MASK) != PCI_HEADER_TYPE_BRIDGE) {
 		dev_err(dev, "in EP mode, hdr=%#02x\n", hdr_type);
 		return -EFAULT;
 	}
diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index f9682df1da61..7034c0ff23d0 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -43,7 +43,7 @@ static void rcar_pcie_ep_hw_init(struct rcar_pcie *pcie)
 	rcar_rmw32(pcie, REXPCAP(0), 0xff, PCI_CAP_ID_EXP);
 	rcar_rmw32(pcie, REXPCAP(PCI_EXP_FLAGS),
 		   PCI_EXP_FLAGS_TYPE, PCI_EXP_TYPE_ENDPOINT << 4);
-	rcar_rmw32(pcie, RCONF(PCI_HEADER_TYPE), 0x7f,
+	rcar_rmw32(pcie, RCONF(PCI_HEADER_TYPE), PCI_HEADER_TYPE_MASK,
 		   PCI_HEADER_TYPE_NORMAL);
 
 	/* Write out the physical slot number = 0 */
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 88975e40ee2f..bf7cc0b6a695 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -460,7 +460,7 @@ static int rcar_pcie_hw_init(struct rcar_pcie *pcie)
 	rcar_rmw32(pcie, REXPCAP(0), 0xff, PCI_CAP_ID_EXP);
 	rcar_rmw32(pcie, REXPCAP(PCI_EXP_FLAGS),
 		PCI_EXP_FLAGS_TYPE, PCI_EXP_TYPE_ROOT_PORT << 4);
-	rcar_rmw32(pcie, RCONF(PCI_HEADER_TYPE), 0x7f,
+	rcar_rmw32(pcie, RCONF(PCI_HEADER_TYPE), PCI_HEADER_TYPE_MASK,
 		PCI_HEADER_TYPE_BRIDGE);
 
 	/* Enable data link layer active state reporting */
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index d5b97a6aae56..cc2422963a34 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -527,7 +527,7 @@ static void vmd_domain_reset(struct vmd_dev *vmd)
 
 			hdr_type = readb(base + PCI_HEADER_TYPE);
 
-			functions = (hdr_type & 0x80) ? 8 : 1;
+			functions = (hdr_type & PCI_HEADER_TYPE_MFD) ? 8 : 1;
 			for (fn = 0; fn < functions; fn++) {
 				base = vmd->cfgbar + PCIE_ECAM_OFFSET(bus,
 						PCI_DEVFN(dev, fn), 0);
diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
index e429ecddc8fe..c01968ef0bd7 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -2059,7 +2059,7 @@ int cpqhp_process_SS(struct controller *ctrl, struct pci_func *func)
 				return rc;
 
 			/* If it's a bridge, check the VGA Enable bit */
-			if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+			if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 				rc = pci_bus_read_config_byte(pci_bus, devfn, PCI_BRIDGE_CONTROL, &BCR);
 				if (rc)
 					return rc;
@@ -2342,7 +2342,7 @@ static int configure_new_function(struct controller *ctrl, struct pci_func *func
 	if (rc)
 		return rc;
 
-	if ((temp_byte & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+	if ((temp_byte & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 		/* set Primary bus */
 		dbg("set Primary bus = %d\n", func->bus);
 		rc = pci_bus_write_config_byte(pci_bus, devfn, PCI_PRIMARY_BUS, func->bus);
@@ -2739,7 +2739,7 @@ static int configure_new_function(struct controller *ctrl, struct pci_func *func
 					 *   PCI_BRIDGE_CTL_SERR |
 					 *   PCI_BRIDGE_CTL_NO_ISA */
 		rc = pci_bus_write_config_word(pci_bus, devfn, PCI_BRIDGE_CONTROL, command);
-	} else if ((temp_byte & 0x7F) == PCI_HEADER_TYPE_NORMAL) {
+	} else if ((temp_byte & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_NORMAL) {
 		/* Standard device */
 		rc = pci_bus_read_config_byte(pci_bus, devfn, 0x0B, &class_code);
 
diff --git a/drivers/pci/hotplug/cpqphp_pci.c b/drivers/pci/hotplug/cpqphp_pci.c
index 3b248426a9f4..e9f1fb333a71 100644
--- a/drivers/pci/hotplug/cpqphp_pci.c
+++ b/drivers/pci/hotplug/cpqphp_pci.c
@@ -363,7 +363,7 @@ int cpqhp_save_config(struct controller *ctrl, int busnumber, int is_hot_plug)
 			return rc;
 
 		/* If multi-function device, set max_functions to 8 */
-		if (header_type & 0x80)
+		if (header_type & PCI_HEADER_TYPE_MFD)
 			max_functions = 8;
 		else
 			max_functions = 1;
@@ -372,7 +372,7 @@ int cpqhp_save_config(struct controller *ctrl, int busnumber, int is_hot_plug)
 
 		do {
 			DevError = 0;
-			if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+			if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 				/* Recurse the subordinate bus
 				 * get the subordinate bus number
 				 */
@@ -487,13 +487,13 @@ int cpqhp_save_slot_config(struct controller *ctrl, struct pci_func *new_slot)
 	pci_bus_read_config_byte(ctrl->pci_bus, PCI_DEVFN(new_slot->device, 0), 0x0B, &class_code);
 	pci_bus_read_config_byte(ctrl->pci_bus, PCI_DEVFN(new_slot->device, 0), PCI_HEADER_TYPE, &header_type);
 
-	if (header_type & 0x80)	/* Multi-function device */
+	if (header_type & PCI_HEADER_TYPE_MFD)
 		max_functions = 8;
 	else
 		max_functions = 1;
 
 	while (function < max_functions) {
-		if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+		if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 			/*  Recurse the subordinate bus */
 			pci_bus_read_config_byte(ctrl->pci_bus, PCI_DEVFN(new_slot->device, function), PCI_SECONDARY_BUS, &secondary_bus);
 
@@ -571,7 +571,7 @@ int cpqhp_save_base_addr_length(struct controller *ctrl, struct pci_func *func)
 		/* Check for Bridge */
 		pci_bus_read_config_byte(pci_bus, devfn, PCI_HEADER_TYPE, &header_type);
 
-		if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+		if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 			pci_bus_read_config_byte(pci_bus, devfn, PCI_SECONDARY_BUS, &secondary_bus);
 
 			sub_bus = (int) secondary_bus;
@@ -625,7 +625,7 @@ int cpqhp_save_base_addr_length(struct controller *ctrl, struct pci_func *func)
 
 			}	/* End of base register loop */
 
-		} else if ((header_type & 0x7F) == 0x00) {
+		} else if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_NORMAL) {
 			/* Figure out IO and memory base lengths */
 			for (cloop = 0x10; cloop <= 0x24; cloop += 4) {
 				temp_register = 0xFFFFFFFF;
@@ -723,7 +723,7 @@ int cpqhp_save_used_resources(struct controller *ctrl, struct pci_func *func)
 		/* Check for Bridge */
 		pci_bus_read_config_byte(pci_bus, devfn, PCI_HEADER_TYPE, &header_type);
 
-		if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+		if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 			/* Clear Bridge Control Register */
 			command = 0x00;
 			pci_bus_write_config_word(pci_bus, devfn, PCI_BRIDGE_CONTROL, command);
@@ -858,7 +858,7 @@ int cpqhp_save_used_resources(struct controller *ctrl, struct pci_func *func)
 				}
 			}	/* End of base register loop */
 		/* Standard header */
-		} else if ((header_type & 0x7F) == 0x00) {
+		} else if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_NORMAL) {
 			/* Figure out IO and memory base lengths */
 			for (cloop = 0x10; cloop <= 0x24; cloop += 4) {
 				pci_bus_read_config_dword(pci_bus, devfn, cloop, &save_base);
@@ -975,7 +975,7 @@ int cpqhp_configure_board(struct controller *ctrl, struct pci_func *func)
 		pci_bus_read_config_byte(pci_bus, devfn, PCI_HEADER_TYPE, &header_type);
 
 		/* If this is a bridge device, restore subordinate devices */
-		if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+		if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 			pci_bus_read_config_byte(pci_bus, devfn, PCI_SECONDARY_BUS, &secondary_bus);
 
 			sub_bus = (int) secondary_bus;
@@ -1067,7 +1067,7 @@ int cpqhp_valid_replace(struct controller *ctrl, struct pci_func *func)
 		/* Check for Bridge */
 		pci_bus_read_config_byte(pci_bus, devfn, PCI_HEADER_TYPE, &header_type);
 
-		if ((header_type & 0x7F) == PCI_HEADER_TYPE_BRIDGE) {
+		if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 			/* In order to continue checking, we must program the
 			 * bus registers in the bridge to respond to accesses
 			 * for its subordinate bus(es)
@@ -1090,7 +1090,7 @@ int cpqhp_valid_replace(struct controller *ctrl, struct pci_func *func)
 
 		}
 		/* Check to see if it is a standard config header */
-		else if ((header_type & 0x7F) == PCI_HEADER_TYPE_NORMAL) {
+		else if ((header_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_NORMAL) {
 			/* Check subsystem vendor and ID */
 			pci_bus_read_config_dword(pci_bus, devfn, PCI_SUBSYSTEM_VENDOR_ID, &temp_register);
 
diff --git a/drivers/pci/hotplug/ibmphp.h b/drivers/pci/hotplug/ibmphp.h
index 0399c60d2ec1..5c43edd8831e 100644
--- a/drivers/pci/hotplug/ibmphp.h
+++ b/drivers/pci/hotplug/ibmphp.h
@@ -17,6 +17,7 @@
  */
 
 #include <linux/pci_hotplug.h>
+#include <linux/pci_regs.h>
 
 extern int ibmphp_debug;
 
@@ -288,8 +289,8 @@ int ibmphp_register_pci(void);
 
 /* pci specific defines */
 #define PCI_VENDOR_ID_NOTVALID		0xFFFF
-#define PCI_HEADER_TYPE_MULTIDEVICE	0x80
-#define PCI_HEADER_TYPE_MULTIBRIDGE	0x81
+#define PCI_HEADER_TYPE_MULTIDEVICE	(PCI_HEADER_TYPE_MFD|PCI_HEADER_TYPE_NORMAL)
+#define PCI_HEADER_TYPE_MULTIBRIDGE	(PCI_HEADER_TYPE_MFD|PCI_HEADER_TYPE_BRIDGE)
 
 #define LATENCY		0x64
 #define CACHE		64
diff --git a/drivers/pci/hotplug/ibmphp_pci.c b/drivers/pci/hotplug/ibmphp_pci.c
index 50038e5f9ca4..eeb412cbd9fe 100644
--- a/drivers/pci/hotplug/ibmphp_pci.c
+++ b/drivers/pci/hotplug/ibmphp_pci.c
@@ -1087,7 +1087,7 @@ static struct res_needed *scan_behind_bridge(struct pci_func *func, u8 busno)
 				pci_bus_read_config_dword(ibmphp_pci_bus, devfn, PCI_CLASS_REVISION, &class);
 
 				debug("hdr_type behind the bridge is %x\n", hdr_type);
-				if ((hdr_type & 0x7f) == PCI_HEADER_TYPE_BRIDGE) {
+				if ((hdr_type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
 					err("embedded bridges not supported for hot-plugging.\n");
 					amount->not_correct = 1;
 					return amount;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 60230da957e0..7f6fd5e62aab 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -534,7 +534,7 @@ u8 pci_bus_find_capability(struct pci_bus *bus, unsigned int devfn, int cap)
 
 	pci_bus_read_config_byte(bus, devfn, PCI_HEADER_TYPE, &hdr_type);
 
-	pos = __pci_bus_find_cap_start(bus, devfn, hdr_type & 0x7f);
+	pos = __pci_bus_find_cap_start(bus, devfn, hdr_type & PCI_HEADER_TYPE_MASK);
 	if (pos)
 		pos = __pci_find_next_cap(bus, devfn, pos, cap);
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index ef193661c3d1..3a0adfb90c34 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -1844,8 +1844,8 @@ static void quirk_jmicron_ata(struct pci_dev *pdev)
 
 	/* Update pdev accordingly */
 	pci_read_config_byte(pdev, PCI_HEADER_TYPE, &hdr);
-	pdev->hdr_type = hdr & 0x7f;
-	pdev->multifunction = !!(hdr & 0x80);
+	pdev->hdr_type = hdr & PCI_HEADER_TYPE_MASK;
+	pdev->multifunction = FIELD_GET(PCI_HEADER_TYPE_MFD, hdr);
 
 	pci_read_config_dword(pdev, PCI_CLASS_REVISION, &class);
 	pdev->class = class >> 8;
@@ -5666,7 +5666,7 @@ static void quirk_nvidia_hda(struct pci_dev *gpu)
 
 	/* The GPU becomes a multi-function device when the HDA is enabled */
 	pci_read_config_byte(gpu, PCI_HEADER_TYPE, &hdr_type);
-	gpu->multifunction = !!(hdr_type & 0x80);
+	gpu->multifunction = FIELD_GET(PCI_HEADER_TYPE_MFD, hdr_type);
 }
 DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID,
 			       PCI_BASE_CLASS_DISPLAY, 16, quirk_nvidia_hda);
-- 
2.30.2

