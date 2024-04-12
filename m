Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7968A2FAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 15:39:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wm4gFoRU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGHhy61mRz3vp8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 23:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wm4gFoRU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGHfs6qXQz3vZD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 23:37:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712929030; x=1744465030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VWKB4YBkBGiUFfx/DCMZTK1YmSwqd9/AxvqBDvCXap8=;
  b=Wm4gFoRUNDqdB4Qdq4VCokaB01tTBaZoaTvyMeAscW1d5of0n/QzAE3b
   LMbtOTV9cKfvdGl8K1+uJPE8GHs41cb2NnaTyufouKgIF3ONhAuaWkpci
   nSBKLtsupbBUJiPjdU3dPSZZDlerVkWVcY/yOLJTT7LTqiHWx0LcHJScT
   3XbwvQPAARU328YRk5nwF/6lkYl/ghpPcbaU4IhlOFnUZyepKixjKugvI
   xGwmYBMt1NnpgxASj6IHHoXU9J3aW2tInT+wqCg/7evnngXtbLbfDU/0q
   XE0TDAPZ70lFf4dhDslNlnMU4XHeHtln+91LcQCMfjfLL1r7nE3mmPMso
   g==;
X-CSE-ConnectionGUID: xb5kscCPQd6aEvB2yfpzgQ==
X-CSE-MsgGUID: tlx0YAJXQTes4LIa6zu+Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25897902"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25897902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:37:08 -0700
X-CSE-ConnectionGUID: B2Dqbe6xRFywg7xQBz1M/g==
X-CSE-MsgGUID: aZvyjeKHQ/mN71oHXEf4VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21211657"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:37:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] PCI: Create helper to print TLP Header and Prefix Log
Date: Fri, 12 Apr 2024 16:36:35 +0300
Message-Id: <20240412133635.3831-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412133635.3831-1-ilpo.jarvinen@linux.intel.com>
References: <20240412133635.3831-1-ilpo.jarvinen@linux.intel.com>
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

Add pcie_print_tlp_log() helper to print TLP Header and Prefix Log.
Print End-End Prefixes only if they are non-zero.

Consolidate the few places which currently print TLP using custom
formatting.

The first attempt used pr_cont() instead of building a string first but
it turns out pr_cont() is not compatible with pci_err() but prints on a
separate line. When I asked about this, Andy Shevchenko suggested
pr_cont() should not be used in the first place (to eventually get rid
of it) so pr_cont() is now replaced with building the string first.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.c      | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c | 10 ++--------
 drivers/pci/pcie/dpc.c |  5 +----
 include/linux/aer.h    |  2 ++
 4 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index af230e6e5557..54d4872d14b8 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -1116,6 +1117,37 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 }
 EXPORT_SYMBOL_GPL(pcie_read_tlp_log);
 
+/**
+ * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
+ * @dev:	PCIe device
+ * @tlp_log:	TLP Log structure
+ * @pfx:	Internal string prefix (for indentation)
+ *
+ * Prints TLP Header and Prefix Log information held by @tlp_log.
+ */
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *tlp_log, const char *pfx)
+{
+	char buf[(10 + 1) * (4 + ARRAY_SIZE(tlp_log->prefix)) + 14 + 1];
+	unsigned int i;
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%#010x %#010x %#010x %#010x",
+			tlp_log->dw[0], tlp_log->dw[1], tlp_log->dw[2],
+			tlp_log->dw[3]);
+
+	if (tlp_log->prefix[0])
+		len += scnprintf(buf + len, sizeof(buf) - len, " E-E Prefixes:");
+	for (i = 0; i < ARRAY_SIZE(tlp_log->prefix); i++) {
+		if (!tlp_log->prefix[i])
+			break;
+		len += scnprintf(buf + len, sizeof(buf) - len,
+				 " %#010x", tlp_log->prefix[i]);
+	}
+
+	pci_err(dev, "%sTLP Header: %s\n", pfx, buf);
+}
+
 /**
  * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
  * @dev: PCI device to have its BARs restored
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ecc1dea5a208..efb9e728fe94 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -664,12 +664,6 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 	}
 }
 
-static void __print_tlp_header(struct pci_dev *dev, struct pcie_tlp_log *t)
-{
-	pci_err(dev, "  TLP Header: %08x %08x %08x %08x\n",
-		t->dw[0], t->dw[1], t->dw[2], t->dw[3]);
-}
-
 static void __aer_print_error(struct pci_dev *dev,
 			      struct aer_err_info *info)
 {
@@ -724,7 +718,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	__aer_print_error(dev, info);
 
 	if (info->tlp_header_valid)
-		__print_tlp_header(dev, &info->tlp);
+		pcie_print_tlp_log(dev, &info->tlp, "  ");
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -796,7 +790,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 			aer->uncor_severity);
 
 	if (tlp_header_valid)
-		__print_tlp_header(dev, &aer->header_log);
+		pcie_print_tlp_log(dev, &aer->header_log, "  ");
 
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 80b1456f95fe..3f8e3b6c7948 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -229,10 +229,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
 			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
 			  dpc_tlp_log_len(pdev), &tlp_log);
-	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
-		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
-	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++)
-		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.prefix[i]);
+	pcie_print_tlp_log(pdev, &tlp_log, "");
 
 	if (pdev->dpc_rp_log_size < 5)
 		goto clear_status;
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 2484056feb8d..1e8c61deca65 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -41,6 +41,8 @@ struct aer_capability_regs {
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev);
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *tlp_log, const char *pfx);
 
 #if defined(CONFIG_PCIEAER)
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
-- 
2.39.2

