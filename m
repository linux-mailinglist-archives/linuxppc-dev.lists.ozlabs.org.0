Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A738C51F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:33:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVznN2p4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdvPN1gblz3cX0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 21:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVznN2p4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdvMD30T2z2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 21:31:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715686297; x=1747222297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8lcN3GvS4xT+weTctxWkQ4vlzKc0rZNrscZi4UP5ads=;
  b=CVznN2p4XRCT86I/jpP+Hj6+WxceyBCMYLl2UN4fxJm7aaj0aeyK6aiU
   LlE5jflPKcyAWTAR3oEj7FXBA5hglFPCQTzAhkzelL5tDZ977cHalhJEO
   wnIk2VCs6TzgFewVDHSDivPd7+T1eDYVKWb/mC3Wakw4Su3osJoUxWgfR
   vbRQikmWlDRfFwT04xXje8YaoyUIUjP4wwwE26sCW7deQ0tCLHqM9jOyi
   jgHmvJJiGkS5spLNGMqeX58/fNKv0dFP8xuHCcnTDi4apHIoQIqD0BEkl
   EQJk8TOwloBi9J3QsEw9bPLU6UvR7L0jtzSFfrZ2D+dl8KOueikyvEXhM
   g==;
X-CSE-ConnectionGUID: W9prVxSLRKy2uFHGIaZLzQ==
X-CSE-MsgGUID: e4Gm5JJ7TLKNWkToytGX0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11532835"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11532835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:31:34 -0700
X-CSE-ConnectionGUID: JiaICyhjSFeSR+iLgSEnBQ==
X-CSE-MsgGUID: CMV6tNX1TLm1mOr8TkQNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35179635"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.94])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:31:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] PCI: Move TLP Log handling to own file
Date: Tue, 14 May 2024 14:31:04 +0300
Message-Id: <20240514113109.6690-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
References: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TLP Log is PCIe feature and is processed only by AER and DPC.
Configwise, DPC depends AER being enabled. In lack of better place, the
TLP Log handling code was initially placed into pci.c but it can be
easily placed in a separate file.

Move TLP Log handling code to own file under pcie/ subdirectory and
include it only when AER is enabled.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.c         | 27 ---------------------------
 drivers/pci/pci.h         |  2 +-
 drivers/pci/pcie/Makefile |  2 +-
 drivers/pci/pcie/tlp.c    | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 29 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 54ab1d6b8e53..2cc875f60fef 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1066,33 +1066,6 @@ static void pci_enable_acs(struct pci_dev *dev)
 	pci_disable_acs_redir(dev);
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
index 9c968df86a92..0e9917f8bf3f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -419,9 +419,9 @@ struct aer_err_info {
 
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
-#endif	/* CONFIG_PCIEAER */
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
+#endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
 /* Cached RCEC Endpoint Association */
diff --git a/drivers/pci/pcie/Makefile b/drivers/pci/pcie/Makefile
index 6461aa93fe76..591ef3177777 100644
--- a/drivers/pci/pcie/Makefile
+++ b/drivers/pci/pcie/Makefile
@@ -7,7 +7,7 @@ pcieportdrv-y			:= portdrv.o rcec.o
 obj-$(CONFIG_PCIEPORTBUS)	+= pcieportdrv.o
 
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
2.39.2

