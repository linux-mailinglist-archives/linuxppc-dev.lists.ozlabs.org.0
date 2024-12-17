Return-Path: <linuxppc-dev+bounces-4259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB0C9F4CD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:54:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJG875R2z30Qy;
	Wed, 18 Dec 2024 00:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443680;
	cv=none; b=B6oHm0caxRkOAKaUe/yI5o5yonOy5cAcrAK+7Es3CcZMRKjbq1vQzSyggDqTD3IOty+N7jbSNPAnMTcOaujG0aU559NT65E6XTGZHkK2IBLkW79LpWPCHBEQ3tz3cjcw92+P72hMUcQW1thNCHFmzhmsbpAaqv2rYKh20rVE+ONq49Xb/ZQ6o1hsFeQeXEpqPwbxWfP5bmAfZHqB+xF8n6c6l33AFQ2FJ8kwsHxMk9l2Fro0+ENL4AY7S8Uli/YEwpOIRvD6aNZzpoGPaaeMc/23I4c6WDvFgtWB3QfLJZyaJl0x9IJPB0600JYdZ4X3Sy3JfgfvI4xxf7FVAthO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443680; c=relaxed/relaxed;
	bh=tIZ8VbxClGmFB+oFhWhd0u0gbOZGrsDcFKfBbi9D/zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAGYLerqmREPY2Y+npRhaK2+GDZG+QkcbxSBlMFOv5CvJtNZisfaxYSxHWtYcQlplpJaAMjf5GjG3tIQrmy/Z41XUUYphYrL6n5Xck600HrTvuLCvXF/2j/M4Bkq+E+f/6DitmcT7ZmQVAaIq8n5qbGg5t/q5SL4YdqaFJX3xUVSVVx//SbcGLBjDFyNbmfiRzKiXjqRnsgs6WtJ6qtsIZKDIoxLnKVnZUDQDNNXRpmwz56XYFVt9SBNua6UNRA45ee7N8CIkCzuvEeCojePiAwYH++zzrxBDniHMakTkJLpRStDtx25mjWtZAJR+pPRYjeUtHN0rlrp8z4plw+b5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nmFTrdjK; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nmFTrdjK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJG74fSlz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:54:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443680; x=1765979680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7bZ2FJBpc7RVvA1MsLG49gztnRPse0AgN2X0bG3MLJ4=;
  b=nmFTrdjKpZXwLPDpoOH6p68BYVs83MDrVFHMqyz/3mSSBQNQwDF38HgK
   yf+3d/Lma+OAWroDGj51qchXHnyfGu1NAGSKOEJQLoFxKxm/MyaKGqJCT
   dQLP/H3VJtRqIcu5Qf2XxMJky7nnVatzaRDZYRPEeCi/zCBpDoHRjZ0R1
   uiZIdkjHEUy2OsPQTcB3LceCrL933+qSDnTixPWj75dDlyyNCt2YAEz33
   Bm9d4h5ZXiN5/R0vcAKK6F5IOsD15U2LwbiDA9OmT1eF0IRcoeY7BhGHk
   mh2HwYT7aOdp+VbTmbHQ/RF44NSLuGzbzcsdqLwdFfyRAxaJAENJQ3fiF
   w==;
X-CSE-ConnectionGUID: Uog0Py0VTo6V3aOy5L9mUg==
X-CSE-MsgGUID: t0/7HNsMSKSGqS1OOmZWSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34907100"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34907100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:37 -0800
X-CSE-ConnectionGUID: mqBKoJi+TZG+vJiRcLVunw==
X-CSE-MsgGUID: uDtYl/tjRyGti9zETZyD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97435419"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:32 -0800
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
Subject: [PATCH v7 2/8] PCI: Move TLP Log handling to own file
Date: Tue, 17 Dec 2024 15:53:52 +0200
Message-Id: <20241217135358.9345-3-ilpo.jarvinen@linux.intel.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

TLP Log is PCIe feature and is processed only by AER and DPC.
Configwise, DPC depends AER being enabled. In lack of better place, the
TLP Log handling code was initially placed into pci.c but it can be
easily placed in a separate file.

Move TLP Log handling code to own file under pcie/ subdirectory and
include it only when AER is enabled.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pci.c         | 27 ---------------------------
 drivers/pci/pci.h         |  2 +-
 drivers/pci/pcie/Makefile |  2 +-
 drivers/pci/pcie/tlp.c    | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 29 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e0fdc9d10f91..02cd4c7eb80b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1099,33 +1099,6 @@ static void pci_enable_acs(struct pci_dev *dev)
 	pci_write_config_word(dev, pos + PCI_ACS_CTRL, caps.ctrl);
 }
 
-/**
- * pcie_read_tlp_log - read TLP Header Log
- * @dev: PCIe device
- * @where: PCI Config offset of TLP Header Log
- * @tlp_log: TLP Log structure to fill
- *
- * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
- *
- * Return: 0 on success and filled TLP Log structure, <0 on error.
- */
-int pcie_read_tlp_log(struct pci_dev *dev, int where,
-		      struct pcie_tlp_log *tlp_log)
-{
-	int i, ret;
-
-	memset(tlp_log, 0, sizeof(*tlp_log));
-
-	for (i = 0; i < 4; i++) {
-		ret = pci_read_config_dword(dev, where + i * 4,
-					    &tlp_log->dw[i]);
-		if (ret)
-			return pcibios_err_to_errno(ret);
-	}
-
-	return 0;
-}
-
 /**
  * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
  * @dev: PCI device to have its BARs restored
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 8a60fc9e7786..55fcf3bac4f7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -549,9 +549,9 @@ struct aer_err_info {
 
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
-#endif	/* CONFIG_PCIEAER */
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
+#endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
 /* Cached RCEC Endpoint Association */
diff --git a/drivers/pci/pcie/Makefile b/drivers/pci/pcie/Makefile
index 53ccab62314d..173829aa02e6 100644
--- a/drivers/pci/pcie/Makefile
+++ b/drivers/pci/pcie/Makefile
@@ -7,7 +7,7 @@ pcieportdrv-y			:= portdrv.o rcec.o
 obj-$(CONFIG_PCIEPORTBUS)	+= pcieportdrv.o bwctrl.o
 
 obj-y				+= aspm.o
-obj-$(CONFIG_PCIEAER)		+= aer.o err.o
+obj-$(CONFIG_PCIEAER)		+= aer.o err.o tlp.o
 obj-$(CONFIG_PCIEAER_INJECT)	+= aer_inject.o
 obj-$(CONFIG_PCIE_PME)		+= pme.o
 obj-$(CONFIG_PCIE_DPC)		+= dpc.o
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
new file mode 100644
index 000000000000..3f053cc62290
--- /dev/null
+++ b/drivers/pci/pcie/tlp.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCIe TLP Log handling
+ *
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#include <linux/aer.h>
+#include <linux/pci.h>
+#include <linux/string.h>
+
+#include "../pci.h"
+
+/**
+ * pcie_read_tlp_log - read TLP Header Log
+ * @dev: PCIe device
+ * @where: PCI Config offset of TLP Header Log
+ * @tlp_log: TLP Log structure to fill
+ *
+ * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
+ *
+ * Return: 0 on success and filled TLP Log structure, <0 on error.
+ */
+int pcie_read_tlp_log(struct pci_dev *dev, int where,
+		      struct pcie_tlp_log *tlp_log)
+{
+	int i, ret;
+
+	memset(tlp_log, 0, sizeof(*tlp_log));
+
+	for (i = 0; i < 4; i++) {
+		ret = pci_read_config_dword(dev, where + i * 4,
+					    &tlp_log->dw[i]);
+		if (ret)
+			return pcibios_err_to_errno(ret);
+	}
+
+	return 0;
+}
-- 
2.39.5


