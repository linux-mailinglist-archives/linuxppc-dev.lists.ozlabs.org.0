Return-Path: <linuxppc-dev+bounces-1332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1269782AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xjC5nMkz2ypP;
	Sat, 14 Sep 2024 00:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238239;
	cv=none; b=GG6I5IOwwKDH/wea1+MeejsSQEhbzwBipTWI5dPXLwnBM9WFHmpgmyR28Be7nIyjWIxQ9lkKNnEHrAiQKnOTf2nlAJGXkX+VhKD2CuPaJ/sEPN8iHKP6gicq8CX+hiHLGGzngqBzqrr9dqTnFCWRJkXmtFz6BVhG6+c2Ngg/sxQvCVZXo+2+p2q5IhP8+afSWB6JKklRDvBYFsbyXSNNNtd98MLmIlAnaXc2ajYfooMSQKBosaLt3iFHfx31aczjsUKKPLlhaHrFnnBQolRVTXox6pFKCkDi5FB1zqFeSRcgQwW1sVstr3DwOSNXWpvYkTyiX8X8C9dmwpVvU1cD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238239; c=relaxed/relaxed;
	bh=s5FffyG1S7445s7mSZ1tui3dsuhPZhAZkqpoo4Bxx6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eja9axPe+MxKZpt/IThe0tpJn1j+XQZD39UdTgMvcKQ5axATdEr1BHuaMGzxZ2Tj2mxF/lOWlIqnhuYL3HpZad3zt5KG8QquFDKyOps5H2wcbtXJ3NwrTCSukfy/0tEHfKYILOm2yXSfR4x4dg5tut2XCOPZwGfvZC8jwboiIaJ2FbPWatUkEkVkE71AOgly72ZWqFljre12hFHpi9rEgC1jjUBmZ/W+CXPbFGOVE37Mb+4aqNL//8KslpwqQtPapRwP5xfiAYe90t4Kq1a6aT4j/agQEhxHT/gIAbeUWNzmnLOcWynd7CwK6M4AWF29zxSwusveom9kPhvtQhS05g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JF4TukYP; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JF4TukYP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xjC1hS6z2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:37:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238239; x=1757774239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmowYVP90W5PjAggGv14Nfgu8Yajmz7PSCOXKoFwGlM=;
  b=JF4TukYPEDj1nq/KYlMJK8eA/GxfRrsziDx9no0VEl+qGCuVeZOkA9YI
   TcF8XICoxUkLVkuIDbAsuPdmFdbFOSr5QbA08hk4qGNncopVmMk80mLPx
   FpfHLtgzHqJVKWUraHkTfPGXPwP56pKl2cSFX9rjYXLRY5eir+1rfYBiU
   mFFYGfUojkm0wEGKep/3yqochFddKOZ53ivX9n6Yp4gnP6E+TRnW3W3JY
   hbVGLuopkloRWeA0/rXLdEpzNeGnxH567eoe8b+4oqNl8IdrCVU5rP6Ly
   kcvnBrROoTNUnOgOgXS/z5xk0KY7yZMoxDBZfoxFOdJ62dEflI8fI4PzT
   g==;
X-CSE-ConnectionGUID: dP9ksjWZTLKpMSK5AGIk0w==
X-CSE-MsgGUID: 43+lGgrvTEaz/k2rIqlH/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25075316"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25075316"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:04 -0700
X-CSE-ConnectionGUID: gsjwvdyzTwiA/NaJx00Dmg==
X-CSE-MsgGUID: wr/+I2lLRU+97M1XthA42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="67934691"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:00 -0700
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
Subject: [PATCH v6 2/8] PCI: Move TLP Log handling to own file
Date: Fri, 13 Sep 2024 17:36:26 +0300
Message-Id: <20240913143632.5277-3-ilpo.jarvinen@linux.intel.com>
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
index 378fc645424f..47969712afe1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1095,33 +1095,6 @@ static void pci_enable_acs(struct pci_dev *dev)
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
index b4fc6726eab3..532bb05a0411 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -482,9 +482,9 @@ struct aer_err_info {
 
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


