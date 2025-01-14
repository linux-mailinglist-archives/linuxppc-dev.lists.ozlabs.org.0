Return-Path: <linuxppc-dev+bounces-5251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABFA10D1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:10:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbGk4PhMz3bXy;
	Wed, 15 Jan 2025 04:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874606;
	cv=none; b=eRuevypyK+jEZrxr+MmbIL132XaXkpDyo55L8L8lLRaXD+vXo1DdjfxSAtpYisnIMDNAne58jrXiBBsfCsHFM33xBoUzkwH4xBv7kzdJ2i0R4UUdO9t4ZYQorOQI/oLODwj795K9apUnE5ZlXH76diGb0MN9aXaWRvgU5orbqafPxWEwCJAaT49erH6ChmcYE8Co7F+MODp6UF1/c2W8SHmYu/0y6buNeICvGiEyjfc/1v8DTZHn4f5Jbh8Iuv8Cp/W6r40ZKKDAdJF+zB9ICTTJbSHCtOt1R7L1AlwNGZ97UPaXg0ZwXP6UpUE4R+OHdMGu2jaGWPP9VJ6yRqhXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874606; c=relaxed/relaxed;
	bh=B2LTTo0VlvzGKS9yRcACXsB6+uZFKbRTksAp1fF3ksE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itCcmyIDst1bxYTRO40a/emAKHjaFp2sMYcAjMPviLczt2GLmAo1uokpi5tBImboHiUQvIr18oSn00fgsT8GILOTzHhxA+Ty5rWqlEm7A5dLHAD0qGf5Vu2/PezVPaLRKWLcq0KNA3TzZxrSC0R6GNBKAJOhhEUMo1/A7RfjMFK/7YLQqXGObu5re3C2gDBn4Kuu/R41LHFbOYGH7KY4KpJI56yv66bqtz1agUCPFSzgytoBkfnd1xyCZOaNB6XrY48g7ebnTHC2kx1MPc8TfWpTodh4cj5JFqv6Q7hvythbA3ZMpi0R4kPWGtyd7ZaMKS3DHdYQHZEg0WXg7cj1hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=INt5KMse; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=INt5KMse;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbGj1mQgz3bY4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:10:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874606; x=1768410606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YN6jBfVsCwubCRxSCKu0MOqOD9GhIkzGuukStgxjENU=;
  b=INt5KMseGY7CMZv9XrzZu9qM5GiLZxG28PYQ3DePGzd4MOT/usIJOtJL
   TPYsSG1WRXY0hTXGI0gEchZRBzGyPVAaJFE9Ni7khH3UfbkXEUwVm6gpT
   LFnN+l/h7LIEtmWANArMMVgJoQUHPUT0MzzJaqWPhML5yTqSYBxkyfQXt
   16BKoV+Kk8hxqOYJsl9k16mkq1x9hEibYNxrT9DOuLnKmuiTZ1B4WdKfV
   NGhaurHmjwOYo8Gl7s70uTCHyOBySZnV/eQbnQeHEvRIgPx9+HOW/7p42
   4/rpdvX3ccJpIHmfTS2PfnX6tfq7+0pDuCfr1mdbH8SJEH+OeAvD+GutP
   w==;
X-CSE-ConnectionGUID: t38GNBWWSOStkdApl59KTg==
X-CSE-MsgGUID: NTW9XD/WRlOg3nrCgQD1TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37410143"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="37410143"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:10:03 -0800
X-CSE-ConnectionGUID: F71/uFm0R/+Gt9SGaboJ1w==
X-CSE-MsgGUID: 6ESYGjbCRHaZs4B472J1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104724521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 8/8] PCI: Create helper to print TLP Header and Prefix Log
Date: Tue, 14 Jan 2025 19:08:40 +0200
Message-Id: <20250114170840.1633-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
References: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
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

Add pcie_print_tlp_log() helper to print TLP Header and Prefix Log.
Print End-End Prefixes only if they are non-zero.

Consolidate the few places which currently print TLP using custom
formatting.

The first attempt used pr_cont() instead of building a string first but
it turns out pr_cont() is not compatible with pci_err() and prints on a
separate line. When I asked about this, Andy Shevchenko suggested
pr_cont() should not be used in the first place (to eventually get rid
of it) so pr_cont() is now replaced with building the string first.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/aer.c | 10 ++--------
 drivers/pci/pcie/dpc.c |  5 +----
 drivers/pci/pcie/tlp.c | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 7797b2544d00..797ad43a7683 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -553,6 +553,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *log, const char *pfx);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 656dbf1ac45b..ece8cb88d110 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -665,12 +665,6 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
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
@@ -725,7 +719,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	__aer_print_error(dev, info);
 
 	if (info->tlp_header_valid)
-		__print_tlp_header(dev, &info->tlp);
+		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -797,7 +791,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 			aer->uncor_severity);
 
 	if (tlp_header_valid)
-		__print_tlp_header(dev, &aer->header_log);
+		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
 
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 0aa20bc58697..242cabd5eeeb 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -220,10 +220,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
 			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
 			  dpc_tlp_log_len(pdev), &tlp_log);
-	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
-		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
-	for (i = 0; i < pdev->dpc_rp_log_size - PCIE_STD_NUM_TLP_HEADERLOG - 1; i++)
-		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.prefix[i]);
+	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
 
 	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
 		goto clear_status;
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 2f029deebc33..7eb88d1b37b7 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/aer.h>
+#include <linux/array_size.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
@@ -79,3 +80,36 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 
 	return 0;
 }
+
+#define EE_PREFIX_STR " E-E Prefixes:"
+
+/**
+ * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
+ * @dev: PCIe device
+ * @log: TLP Log structure
+ * @pfx: String prefix
+ *
+ * Prints TLP Header and Prefix Log information held by @log.
+ */
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *log, const char *pfx)
+{
+	char buf[11 * (PCIE_STD_NUM_TLP_HEADERLOG + ARRAY_SIZE(log->prefix)) +
+		 sizeof(EE_PREFIX_STR)];
+	unsigned int i;
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%#010x %#010x %#010x %#010x",
+			log->dw[0], log->dw[1], log->dw[2], log->dw[3]);
+
+	if (log->prefix[0])
+		len += scnprintf(buf + len, sizeof(buf) - len, EE_PREFIX_STR);
+	for (i = 0; i < ARRAY_SIZE(log->prefix); i++) {
+		if (!log->prefix[i])
+			break;
+		len += scnprintf(buf + len, sizeof(buf) - len,
+				 " %#010x", log->prefix[i]);
+	}
+
+	pci_err(dev, "%sTLP Header: %s\n", pfx, buf);
+}
-- 
2.39.5


