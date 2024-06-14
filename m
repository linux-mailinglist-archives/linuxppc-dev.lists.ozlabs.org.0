Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A2908E4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 17:12:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q771uGsA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W12nJ6CYzz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 01:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q771uGsA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W12lJ1j1sz3cYt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 01:10:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377821; x=1749913821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2BhGPo1WCFqZFCU81zY9ZpAs/37Sjw+rNqSOq5xzdv0=;
  b=Q771uGsAZiJpB4fLZcWxM436FLDWqRvCS9sC2anN+6zHQDrbnvl23zPR
   OgXDgg4tDbvUHoCthf2qqjVK6kCEt+JkA3XtiPdaX2BOnTQGv9b2mtnNx
   o0khwYiTTjGP5cdJ5pJaVnv9ivNWseRuKnCUxqCnEUdTlDBmXH+d3GzPi
   Ewqd9OyuG0F4eykiL82iGxGOpjKk4plVJQAbvvHtIp/1jK3rUnrnPVZRw
   DeroZjfbk0qZan8KTXEY7L0YY4HnTxHvdJajPFq9qvwhzebEb02ZI2ujh
   11ZvroEqJzdg6wARq83gZCBUMeMhtiCz78axeSOtVQj+3YgQlsOILk1lk
   Q==;
X-CSE-ConnectionGUID: +5yvIVzoR0uZcjbCNaB5Lg==
X-CSE-MsgGUID: 4+DCtbirQpy6MlBl6IQVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19089329"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="19089329"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:10:19 -0700
X-CSE-ConnectionGUID: 8avQhssiREyKq7bvDUdCYg==
X-CSE-MsgGUID: LeVgUj+IRxC25+Im9tu9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40629356"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.222])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:10:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] PCI: Track Flit Mode Status & print it with link status
Date: Fri, 14 Jun 2024 18:09:20 +0300
Message-Id: <20240614150921.29724-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com>
References: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com>
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
Cc: Tony Luck <tony.luck@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCIe r6.0 added Flit mode that mainly alters HW behavior but some OS
visible changes are also because of it. The OS visible changes include
differences in the layout of some capabilities and interpretation of
the TLP headers (in diagnostics situations).

To be able to determine which mode the PCIe link is using, store the
Flit Mode Status (PCIe r6.1 sec 7.5.3.20) information in addition to
the link speed into struct pci_bus in pcie_update_link_speed().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/hotplug/pciehp_hpc.c |  5 +++--
 drivers/pci/pci.c                | 12 ++++++++----
 drivers/pci/pci.h                |  3 ++-
 drivers/pci/probe.c              |  5 +++--
 include/linux/pci.h              |  1 +
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 0d818110af6d..893c022a74cb 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -291,8 +291,8 @@ static void pcie_wait_for_presence(struct pci_dev *pdev)
 int pciehp_check_link_status(struct controller *ctrl)
 {
 	struct pci_dev *pdev = ctrl_dev(ctrl);
+	u16 lnk_status, linksta2;
 	bool found;
-	u16 lnk_status;
 
 	if (!pcie_wait_for_link(pdev, true)) {
 		ctrl_info(ctrl, "Slot(%s): No link\n", slot_name(ctrl));
@@ -319,7 +319,8 @@ int pciehp_check_link_status(struct controller *ctrl)
 		return -1;
 	}
 
-	__pcie_update_link_speed(ctrl->pcie->port->subordinate, lnk_status);
+	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA2, &linksta2);
+	__pcie_update_link_speed(ctrl->pcie->port->subordinate, lnk_status, linksta2);
 
 	if (!found) {
 		ctrl_info(ctrl, "Slot(%s): No device found\n",
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index db2e8f21f95c..ff47f6fdcb5a 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6164,21 +6164,25 @@ void __pcie_print_link_status(struct pci_dev *dev, bool verbose)
 	enum pci_bus_speed speed, speed_cap;
 	struct pci_dev *limiting_dev = NULL;
 	u32 bw_avail, bw_cap;
+	char *flit_mode = "";
 
 	bw_cap = pcie_bandwidth_capable(dev, &speed_cap, &width_cap);
 	bw_avail = pcie_bandwidth_available(dev, &limiting_dev, &speed, &width);
 
+	if (dev->bus && dev->bus->flit_mode)
+		flit_mode = ", in Flit mode";
+
 	if (bw_avail >= bw_cap && verbose)
-		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth (%s x%d link)\n",
+		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth (%s x%d link)%s\n",
 			 bw_cap / 1000, bw_cap % 1000,
-			 pci_speed_string(speed_cap), width_cap);
+			 pci_speed_string(speed_cap), width_cap, flit_mode);
 	else if (bw_avail < bw_cap)
-		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth, limited by %s x%d link at %s (capable of %u.%03u Gb/s with %s x%d link)\n",
+		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth, limited by %s x%d link at %s (capable of %u.%03u Gb/s with %s x%d link)%s\n",
 			 bw_avail / 1000, bw_avail % 1000,
 			 pci_speed_string(speed), width,
 			 limiting_dev ? pci_name(limiting_dev) : "<unknown>",
 			 bw_cap / 1000, bw_cap % 1000,
-			 pci_speed_string(speed_cap), width_cap);
+			 pci_speed_string(speed_cap), width_cap, flit_mode);
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 47d8ccf6230c..54f5a1584ed8 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -298,9 +298,10 @@ enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
 void __pcie_print_link_status(struct pci_dev *dev, bool verbose);
 void pcie_report_downtraining(struct pci_dev *dev);
 
-static inline void __pcie_update_link_speed(struct pci_bus *bus, u16 linksta)
+static inline void __pcie_update_link_speed(struct pci_bus *bus, u16 linksta, u16 linksta2)
 {
 	bus->cur_bus_speed = pcie_link_speed[linksta & PCI_EXP_LNKSTA_CLS];
+	bus->flit_mode = linksta2 & PCI_EXP_LNKSTA2_FLIT;
 }
 void pcie_update_link_speed(struct pci_bus *bus);
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 42dbcc401443..781b8ed892cf 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -745,10 +745,11 @@ EXPORT_SYMBOL_GPL(pci_speed_string);
 void pcie_update_link_speed(struct pci_bus *bus)
 {
 	struct pci_dev *bridge = bus->self;
-	u16 linksta;
+	u16 linksta, linksta2;
 
 	pcie_capability_read_word(bridge, PCI_EXP_LNKSTA, &linksta);
-	__pcie_update_link_speed(bus, linksta);
+	pcie_capability_read_word(bridge, PCI_EXP_LNKSTA2, &linksta2);
+	__pcie_update_link_speed(bus, linksta, linksta2);
 }
 EXPORT_SYMBOL_GPL(pcie_update_link_speed);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d21c704aaffa..a67294042bc5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -680,6 +680,7 @@ struct pci_bus {
 	struct bin_attribute	*legacy_mem;	/* Legacy mem */
 	unsigned int		is_added:1;
 	unsigned int		unsafe_warn:1;	/* warned about RW1C config write */
+	bool			flit_mode;	/* Link in Flit mode */
 };
 
 #define to_pci_bus(n)	container_of(n, struct pci_bus, dev)
-- 
2.39.2

