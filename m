Return-Path: <linuxppc-dev+bounces-1334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA99782AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xjT4Y7Yz2yq4;
	Sat, 14 Sep 2024 00:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238253;
	cv=none; b=JxzimqwpcLMWWUG5qo6eGf1r81/E6mRTGaEUBvR9SkSJufcP6eYBeXB4PbExoxriA+T4Q5fE8H88N7aVK3cZBsKuFXk6SiXjpe7e5zIjO/aqdAhcSITXsg7saQe6Q7h1wnCkYlD6w/kBgZ3AlkxgMFl49m/XoNrmwdKl8iWYTbx2MV+FHbSKh2+CaLp9UtRzvkHZ9eJha1waQdSmo89PiYR6h3jJNjkbtHm5YBMGzjC4E/EyN4554ZafjToDYyYVw/Zxy61wrrwiSb06zrh7OgA1rEm95avli03WFFUJatonQd3/DvU35NGs+n5tKAA1mYs5AvgYaXfc539m/V8vew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238253; c=relaxed/relaxed;
	bh=dD205XaKb23ZKVtxb4CDUL1i2r+B3zQNAsQpTAWc9O0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jId73WsckomTNmTF1OHCty/0X0LiDH5wm6WrepN34NAYLi85QK6sQ/gn1nmD9ETgFVbEJadF5yrB2P1PjdXJ6WvAt02nM0Lxsi3ur45QOujPp0f+Epip5eSrcN1QzxEu8qMWj4X1ifJ7+kOzYdKc5QwcOsRQ3RWh38F35gFRbXu749JeRgF9kockdy4AOHCFhKOtrKAjYyX4FO6g5QsoU+4PeWUeVNBSjpEx3b4xfmUyoYvfF1G3tXxKt7cfpWqb7MlwOBWAChIYLL80apYHXDWUUCEVOsL335r1G+F43dOikXeLmtd7+i2EePdbJonXRENHLejg8eNipJaWeWooRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ITQNqwBP; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ITQNqwBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xjT0KLSz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:37:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238253; x=1757774253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CObroKMsuCCxZkpibBqwhoNhRrODaIbk4K5GP0O+fy4=;
  b=ITQNqwBPztMu1gw2F8mpmLeu7wAcX8mM73jyWFT+z+XO7IX1FdOACOmk
   H+h5R+do8tIZnltn4WZYRXJF9+/LhwTw5miR864+CYZ5LJVW3ylNcSniq
   iCawmX/qrlk76AAWH4JklBfGAWoAL+h9JUAHbZ8mPTP0clGoOI5J0p7r0
   kU2gRYLGQybTDQbfCPrEtSJrcxNlVfNduqTDstwbcDJ5toB5FzePNMYPl
   eXKC3E0nwehiG75xBhnK32fXV4Ua9MUdhjBToOSCsCFEi1XXTZdnxB7fU
   F1xdHLcAhsaUvBOjN5/i1e4H1gTF1hQL1LJ5fufEcEEPIkI1y/HBSKx9G
   w==;
X-CSE-ConnectionGUID: ewTZkBpCQjyQnWT7ezFzCw==
X-CSE-MsgGUID: U9lz76khTpyDxgkTlpRldQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28886539"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28886539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:30 -0700
X-CSE-ConnectionGUID: 5/PqCEjtS3ScAD/FUFVx/w==
X-CSE-MsgGUID: mz4Wy4HyTAqNBAK/v+hXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68400293"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 5/8] PCI: Store # of supported End-End TLP Prefixes
Date: Fri, 13 Sep 2024 17:36:29 +0300
Message-Id: <20240913143632.5277-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
are supported by the path or not, the value is only calculated if
CONFIG_PCI_PASID is set.

The Max End-End TLP Prefixes field in the Device Capabilities Register
2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe r6
sec 7.5.3.15). The number of supported End-End Prefixes is useful for
reading correct number of DWORDs from TLP Prefix Log register in AER
capability (PCIe r6 sec 7.8.4.12).

Replace eetlp_prefix_path with eetlp_prefix_max and determine the
number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
that an upcoming commit generalizing TLP Prefix Log register reading
does not have to read extra DWORDs for End-End Prefixes that never will
be there.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/ats.c             |  2 +-
 drivers/pci/probe.c           | 14 +++++++++-----
 include/linux/pci.h           |  2 +-
 include/uapi/linux/pci_regs.h |  1 +
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index c570892b2090..e13433dcfc82 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -377,7 +377,7 @@ int pci_enable_pasid(struct pci_dev *pdev, int features)
 	if (WARN_ON(pdev->pasid_enabled))
 		return -EBUSY;
 
-	if (!pdev->eetlp_prefix_path && !pdev->pasid_no_tlp)
+	if (!pdev->eetlp_prefix_max && !pdev->pasid_no_tlp)
 		return -EINVAL;
 
 	if (!pasid)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b14b9876c030..0ab70ea6840c 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2228,8 +2228,8 @@ static void pci_configure_relaxed_ordering(struct pci_dev *dev)
 
 static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 {
-#ifdef CONFIG_PCI_PASID
 	struct pci_dev *bridge;
+	unsigned int eetlp_max;
 	int pcie_type;
 	u32 cap;
 
@@ -2241,15 +2241,19 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 		return;
 
 	pcie_type = pci_pcie_type(dev);
+
+	eetlp_max = FIELD_GET(PCI_EXP_DEVCAP2_EE_PREFIX_MAX, cap);
+	/* 00b means 4 */
+	eetlp_max = eetlp_max ?: 4;
+
 	if (pcie_type == PCI_EXP_TYPE_ROOT_PORT ||
 	    pcie_type == PCI_EXP_TYPE_RC_END)
-		dev->eetlp_prefix_path = 1;
+		dev->eetlp_prefix_max = eetlp_max;
 	else {
 		bridge = pci_upstream_bridge(dev);
-		if (bridge && bridge->eetlp_prefix_path)
-			dev->eetlp_prefix_path = 1;
+		if (bridge && bridge->eetlp_prefix_max)
+			dev->eetlp_prefix_max = eetlp_max;
 	}
-#endif
 }
 
 static void pci_configure_serr(struct pci_dev *dev)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbc..29b754d32f79 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -398,7 +398,7 @@ struct pci_dev {
 					   supported from root to here */
 #endif
 	unsigned int	pasid_no_tlp:1;		/* PASID works without TLP Prefix */
-	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
+	unsigned int	eetlp_prefix_max:3;	/* Max # of End-End TLP Prefixes, 0=not supported */
 
 	pci_channel_state_t error_state;	/* Current connectivity state */
 	struct device	dev;			/* Generic device interface */
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 94c00996e633..b297bc30ddcb 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -661,6 +661,7 @@
 #define  PCI_EXP_DEVCAP2_OBFF_MSG	0x00040000 /* New message signaling */
 #define  PCI_EXP_DEVCAP2_OBFF_WAKE	0x00080000 /* Re-use WAKE# for OBFF */
 #define  PCI_EXP_DEVCAP2_EE_PREFIX	0x00200000 /* End-End TLP Prefix */
+#define  PCI_EXP_DEVCAP2_EE_PREFIX_MAX	0x00c00000 /* Max End-End TLP Prefixes */
 #define PCI_EXP_DEVCTL2		0x28	/* Device Control 2 */
 #define  PCI_EXP_DEVCTL2_COMP_TIMEOUT	0x000f	/* Completion Timeout Value */
 #define  PCI_EXP_DEVCTL2_COMP_TMOUT_DIS	0x0010	/* Completion Timeout Disable */
-- 
2.39.2


