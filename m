Return-Path: <linuxppc-dev+bounces-5947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE81EA2C869
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 17:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqK0x3TY0z30Ts;
	Sat,  8 Feb 2025 03:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738945153;
	cv=none; b=R7EVLz4fxol11QKqm9viUvzfSyOx8IqIjLrcJXKXVw3EaQOslDNod0AMuEbYx7a4r0bmVzCNyj39WWL26rcIlW67Vcc1cHN+EvAIoo5PIB4jPUiClc+nX0Hn62quAKblSogKFDNvp8JPFet2eE8tEknDpXSLxSsIlRYA1TEqylpmqyqVZFUUxWVuZnoNHtNTg1E+vSCAyYeMnyOiDpkm28Nm1sPJ69c2gOlVzgkpIDJbH3JT3oqLKCHnJw5wB3nlX8MuKDojXy1aTPN+xZuDB5XnHy7HMrdmb0nYOOpcjrPyqTartuYY96K2nve2hUiKg1ii9C20jqB1qzxRkR4H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738945153; c=relaxed/relaxed;
	bh=KepCD7RKPrBxHY9esTBIReqaB2OOFWd+mHmcX1FtrZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6E9/7ICKq0LNSS4dpoxWpW5eFpvXk8g6b+wckNAQT6etFGBIyejZq3BErWlPpEYa1EZ0C8FLzdURXTpK29MsRHNjpr7utNz8lpZg6HuBvL7TBPCL6vNk8Dsbl5gBTuAQ7PxtiqI0u88Fb4G0Fc6cyETsrILsbh1tCLJ9dBTMzDQP6banw9MRTNCCU0TXIP1ejXrBo3qd/B0vL0YudZSfQIP+nfJMQy3Vz2OzrrtOxUh3B6wo5u4aLM5gjINcLw3tnuZ7WyQ8rJmPDBu0vqgzYFUCZMW8jsfN9vMO8UVquwIcRnRNU/awfW5L326/zPkxasmoXX/LTHCcWno6ZcsmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWtIrcit; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LWtIrcit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqK0w3zlXz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 03:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738945153; x=1770481153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ARSjCqPD4d2t/Gj/0MRiC2OYh5VkRn2anE403NEiXdM=;
  b=LWtIrcitrKdz7+JnpNwaIPtv5BNwi4C4OWWUd1PsHlDjNf3VTLx8ZIFX
   5aadhhAniNKPg6m8Xx+WOgbcvLpor3CyCGG6jvGJAbnwlnYkEzte9WtJw
   EjCj8lJEJibnutuHT/7f3yv613U9yG4+kO+8nrg/77KhhEgjhsZjcoowu
   VGYKS+vS57UwGVhIg8UU1gZkIhaBT3FqmmsSfS8xQ9hsp7Un0BqjTNX07
   sybj5pNrT1Uqs9ZuMeU3zDSdIhaSgCaulXrBFuFHwt5sHRBECqczGvInh
   FKzKY5OwsPDkFSri+uJf4I+kiFOd6bN9KTADPt7wQowREDjrweCUCPGRJ
   g==;
X-CSE-ConnectionGUID: GSliNq1XTvOQnW/TUWXvfA==
X-CSE-MsgGUID: nAEfA4RqTcqLV8H3KbqkfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57006865"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57006865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:19:11 -0800
X-CSE-ConnectionGUID: kODiWntbRh2cIYXayBBsoQ==
X-CSE-MsgGUID: n6p+B96YTlWTh8m0fv7IJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116502414"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:19:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 1/2] PCI: Track Flit Mode Status & print it with link status
Date: Fri,  7 Feb 2025 18:18:35 +0200
Message-Id: <20250207161836.2755-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207161836.2755-1-ilpo.jarvinen@linux.intel.com>
References: <20250207161836.2755-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index bb5a8d9f03ad..10130ac9f979 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -292,7 +292,7 @@ int pciehp_check_link_status(struct controller *ctrl)
 {
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	bool found;
-	u16 lnk_status;
+	u16 lnk_status, linksta2;
 
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
index 869d204a70a3..313c66863752 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6190,21 +6190,25 @@ void __pcie_print_link_status(struct pci_dev *dev, bool verbose)
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
index 01e51db8d285..9c6a4a980678 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -406,9 +406,10 @@ const char *pci_speed_string(enum pci_bus_speed speed);
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
index b6536ed599c3..e6f11498a345 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -788,10 +788,11 @@ EXPORT_SYMBOL_GPL(pci_speed_string);
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
index 47b31ad724fa..9862f65d899d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -681,6 +681,7 @@ struct pci_bus {
 	struct bin_attribute	*legacy_mem;	/* Legacy mem */
 	unsigned int		is_added:1;
 	unsigned int		unsafe_warn:1;	/* warned about RW1C config write */
+	bool			flit_mode;	/* Link in Flit mode */
 };
 
 #define to_pci_bus(n)	container_of(n, struct pci_bus, dev)
-- 
2.39.5


