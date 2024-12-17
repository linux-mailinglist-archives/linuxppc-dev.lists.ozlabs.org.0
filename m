Return-Path: <linuxppc-dev+bounces-4262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7849F4CDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJGg3XNjz30Vr;
	Wed, 18 Dec 2024 00:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443707;
	cv=none; b=KHhL38jD9ei89liP7Igs6czmKGmsC/g/XBpWDTMM482qYwpeQVCgIlv5TzPx9cnB6Nrd/eu03e2ksUBHjXSwASxloi6vBJbboFcXHBsdWnMBlNVZg4hH4sXkFNDZamr5BPlCGIjBEkn0XIprGEWom4iiF3/Ab8bOdwU3gDXHbC0wi8MAM344MzHBKYrNEGZ6cwaA+H6SnNpUQWuKEv69MbpBB6Z224DfuU9cK350u5gWIXv+gV188V6dvuBa0u9SJE5LHLD/WF+mwLdQOh7VwbwYjOpfIkQ2u9FVXVonyUjsBnm1Nxfuuwub7SjYh3SO9Z5cAf8g2l0ZyrH7z2IWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443707; c=relaxed/relaxed;
	bh=IBV9BKdablrrtt5o8ITD+CZKrBQsKP+mm0FRAoCXg/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCEM+/okgHSFHwP5WMYbz3Nt1Qp5GUDB2z28eCuilJDFNLAPYJ+UGpDRamn9ChaFyHapuntK4obt4E/CuY+4+1KS6tVob3EZtC/jd4u1jURQSCf8UI0axfiMUdVaMZW8daLwBlpSYgbXZamcMGWTn5ypTuv8+awSO/tU8QXUuivS/WGfsiCjxC5Rk0XdagHD505ZdceHqkFuyIrue9xTooI9lWbn3N1AVAdP2R8OpSJxeqa5Lq8BU4Mdk6RHAoJg/5NkVJay55L9XYaRwL6MA8TUDlS3MxpSzFZHohOd3yE+MFFJwJjAYp55RgspXPusHpdpw8UcAeeMqPDuSCk9Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FdFY5o7j; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FdFY5o7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJGf2BhXz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:55:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443707; x=1765979707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaE2Yr48QEHaeZCO4gx7LRApDGppHv/EyCzxPoU+67A=;
  b=FdFY5o7j/Q9qzqXWz7UWSnJv2d0Ks9vm17jaCgrnmQ9TV5RR3qZdNS+o
   pYWQ+pDuLR27TVhHJdkUBO29ukspo2FgWpyhA7JRSxz+telx6rQMJ0y6Z
   8dUfNH+GIjnN7feIshvLbe8VM4qdC564893T2rBRrcomjdQfXWt2u4Dsa
   VBryhYPdcSb5/7Rrtd8g0egs6Gv+yQB1gDA5A26uzKs2i0xmFvsGkCpui
   NFAe3IUktKmWsqw28tyWyDZ77HKS5UPbHWdT4b7iXjN85hYTskfzfbCho
   KI5F5j3L1hVyuOOK0l2umuig8bX5N5cwN5Gr1T0uH7p9YxkTlx0GnqN9G
   w==;
X-CSE-ConnectionGUID: hGD2AvMDR5yTPnBELgIoSA==
X-CSE-MsgGUID: Ug5wLnpsRs2HoBGkdj7t/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34748330"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34748330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:55:04 -0800
X-CSE-ConnectionGUID: 6PuzIBLBRVOOWhTLcPnCDg==
X-CSE-MsgGUID: doA+l4w4Qj6hz7PwQEylKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98109407"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:55:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 5/8] PCI: Store # of supported End-End TLP Prefixes
Date: Tue, 17 Dec 2024 15:53:55 +0200
Message-Id: <20241217135358.9345-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
are supported by the path or not, the value is only calculated if
CONFIG_PCI_PASID is set.

The Max End-End TLP Prefixes field in the Device Capabilities Register
2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe
r6.2 sec 7.5.3.15). The number of supported End-End Prefixes is useful
for reading correct number of DWORDs from TLP Prefix Log register in AER
capability (PCIe r6.2 sec 7.8.4.12).

Replace eetlp_prefix_path with eetlp_prefix_max and determine the
number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
that an upcoming commit generalizing TLP Prefix Log register reading
does not have to read extra DWORDs for End-End Prefixes that never will
be there.

The value stored into eetlp_prefix_max is directly derived from
device's Max End-End TLP Prefixes and does not consider limitations
imposed by bridges or the Root Port beyond supported/not supported
flags. This is intentional for two reasons:

  1) PCIe r6.2 spec sections r6.1 2.2.10.4 & 6.2.4.4 indicate that TLP
  is handled malformed only if the number of prefixes exceed the number
  of Max End-End TLP Prefixes, which seems to be the case even if the
  device could never receive that many prefixes due to smaller maximum
  imposed by a bridge or the Root Port. If TLP parsing is later added,
  this distinction is significant in interpreting what is logged by the
  TLP Prefix Log registers and the value matching to the Malformed TLP
  threshold is going to be more useful.

  2) TLP Prefix handling happens autonomously on a low layer and the
  value in eetlp_prefix_max is not programmed anywhere by the kernel
  (i.e., there is no limiter OS can control to prevent sending more
  than n TLP Prefixes).

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/ats.c             |  2 +-
 drivers/pci/probe.c           | 14 +++++++++-----
 include/linux/pci.h           |  2 +-
 include/uapi/linux/pci_regs.h |  1 +
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 6afff1f1b143..c6b266c772c8 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -410,7 +410,7 @@ int pci_enable_pasid(struct pci_dev *pdev, int features)
 	if (WARN_ON(pdev->pasid_enabled))
 		return -EBUSY;
 
-	if (!pdev->eetlp_prefix_path && !pdev->pasid_no_tlp)
+	if (!pdev->eetlp_prefix_max && !pdev->pasid_no_tlp)
 		return -EINVAL;
 
 	if (!pasid)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2e81ab0f5a25..381c22e3ccdb 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2251,8 +2251,8 @@ static void pci_configure_relaxed_ordering(struct pci_dev *dev)
 
 static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 {
-#ifdef CONFIG_PCI_PASID
 	struct pci_dev *bridge;
+	unsigned int eetlp_max;
 	int pcie_type;
 	u32 cap;
 
@@ -2264,15 +2264,19 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
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
index db9b47ce3eef..21be5a1edf1a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -407,7 +407,7 @@ struct pci_dev {
 					   supported from root to here */
 #endif
 	unsigned int	pasid_no_tlp:1;		/* PASID works without TLP Prefix */
-	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
+	unsigned int	eetlp_prefix_max:3;	/* Max # of End-End TLP Prefixes, 0=not supported */
 
 	pci_channel_state_t error_state;	/* Current connectivity state */
 	struct device	dev;			/* Generic device interface */
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 1601c7ed5fab..14a6306c4ce1 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -665,6 +665,7 @@
 #define  PCI_EXP_DEVCAP2_OBFF_MSG	0x00040000 /* New message signaling */
 #define  PCI_EXP_DEVCAP2_OBFF_WAKE	0x00080000 /* Re-use WAKE# for OBFF */
 #define  PCI_EXP_DEVCAP2_EE_PREFIX	0x00200000 /* End-End TLP Prefix */
+#define  PCI_EXP_DEVCAP2_EE_PREFIX_MAX	0x00c00000 /* Max End-End TLP Prefixes */
 #define PCI_EXP_DEVCTL2		0x28	/* Device Control 2 */
 #define  PCI_EXP_DEVCTL2_COMP_TIMEOUT	0x000f	/* Completion Timeout Value */
 #define  PCI_EXP_DEVCTL2_COMP_TMOUT_DIS	0x0010	/* Completion Timeout Disable */
-- 
2.39.5


