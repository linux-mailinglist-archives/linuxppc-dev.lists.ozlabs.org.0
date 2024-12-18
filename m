Return-Path: <linuxppc-dev+bounces-4329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BF9F68B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxBb3X6Yz30Vm;
	Thu, 19 Dec 2024 01:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532727;
	cv=none; b=SH+lH2zZd4Q/83JbBPqfLmsxQhQZ+n1EPnVjgwRZcbDimUOc89rQU7Esi64trdXxTnAhorQCc3DV1e9B8m1cmMWUfLcfnEwLVYqMunTCJHWVVUIl2+X5BbxpVF2K/yedAzMipzlGl7q5BGO93nTNrXgacaOoAGWIplJYbPSVA5MsN39A+HWJ3VWiblRy/zm4gcVdJfDIYjMIc7wbQSelXNOExhgWYusUD++FIAsM6QhHO1RaQWTep8JvZMYAfkAC7G8kqrZY3CtWdadXKnD8CQYjXBrLHLFPIgj8DYGrd8o7X0vn2IJcVh1jMZA6Qzulq86mnRNpqni7Ur3WMJ7WIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532727; c=relaxed/relaxed;
	bh=IBV9BKdablrrtt5o8ITD+CZKrBQsKP+mm0FRAoCXg/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNDesifo34P/6JkFFHJvQOM2p+6fGrMBS7GJ1/OAfxWQ5xfvmoCscypaYy+hj+6ndlQco4buzfvOGu/XHUmDZUDG6DFQVHsM1paxW++gtFx2MVozen2ulbWMiriQXNX4P5iIITYd8eTcg8kXcIbKGqiMAGKjyYcfyOQLCGBh/Vrk89I7msH4KbLzp1LysFtHBzN21TEtc7l4Hr0pkC2tHD5tSURsPUbrbtOavA8ICuqDGHS0N6ymBfwnG/9dJvYU24ObiwQ8YucYom+GmTqNi4fUO844SveF1j7pTubUh3hkHWIlrRVHIjPIcZZkAP9B47j6lkvnwL1wanbdRwU0Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e117jjyl; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e117jjyl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxBZ1wjGz30VP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532726; x=1766068726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaE2Yr48QEHaeZCO4gx7LRApDGppHv/EyCzxPoU+67A=;
  b=e117jjylvgZery8u8vPcbk+wO2l3YBhJb29rqpd/Au6pMFpBBlKqe35B
   SY2GNSFukPsmHfS5cBu4Pn2TFSX5T98GbgdthNNpM5cr4uemwEyvK6TCl
   m7uXHS0S5fhp/7eqDeSdcXFI48mXJZrWKMKqA97uG9alwcQoidv5jTbK8
   WyGMb++631XdPSwfjuhE2xrMUCmncSUY1Vh6Xkpj2zBqIu3RvfDWHbch+
   FSFYmc/QCx9fWQTB58eBGib6rabWE3r3gz1jcESPBdtLG/4i+rf659udn
   3GtgCuow+kQHdIKpf29qWDj5ifaHolF3O3f7G9OWoc+3l2NmJ2Ptm6M3y
   w==;
X-CSE-ConnectionGUID: Bb/effj/R2qqPQXqW6oTDQ==
X-CSE-MsgGUID: 77IBnpbWTWGRKKPljnSdlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597468"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597468"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:44 -0800
X-CSE-ConnectionGUID: FKDzZ4VARouC8OZeEwEKoQ==
X-CSE-MsgGUID: WS7e5Ed8QieGglZw7i5alw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974673"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 5/7] PCI: Store # of supported End-End TLP Prefixes
Date: Wed, 18 Dec 2024 16:37:45 +0200
Message-Id: <20241218143747.3159-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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


