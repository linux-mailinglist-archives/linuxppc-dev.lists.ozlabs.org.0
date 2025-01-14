Return-Path: <linuxppc-dev+bounces-5246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB4A10D13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbFr73prz3bV2;
	Wed, 15 Jan 2025 04:09:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874560;
	cv=none; b=Z+Sjvh2no84fePor14aMx9YVYgHY0Uh93JaUBtSfYNdhkP/Pgau0+SzS2IYXg7CJlg7gDfIbv/84W1SOy/c62zzSGSCFC1g0fEH4UIlgUzZ35uQUt/Tm6RhCsdxPXtgArMNgOVQTx5q00ci46TpPSJv0rIaLRi/8bBQgSy4wPqnGFmPsORUooW+kUb+RP2dX+Qa0Z1ILmJvA7xotFYu2IpbN0aW12ovONfX5wlD0/QJXAn/D828Y+lM6eVxgHI80jeBuXhBRSpCGR2NhtuTJIHZzp1xrFuNVgBaTAtHEArRfelcG53t7BTKSbYieBQK5tMNMGzqhXwz5yD3tL2mF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874560; c=relaxed/relaxed;
	bh=24YRmAwxRBz24T9SMKxRBWtfqpXV6QkhRozeaYnu7H4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1hYobd087fBtsgVv3qz0etXiIkcYxkLfBcelgLdTaECYGpAv7E+o1nRC5X8QFi5QO0Lmnrf/wQji0lA5uIXA7150s2p3XdJoXP/oHxtePuyvbCtovgD9ZXbau6qpPQMn2MCENtoMyTksifjKOEh59fVTocLdocqR1UDTHzxSEmN1fLMK/Y3X6YhvQVt7chKPFC6syiduj026dQoLM7aBn/Jw7TVzBXUtkGnWxkcL9/En8Dmx3rSHAW+7q81MX/hcEr93nVSjG5lBaVeGcLjN4oNz/30uILKv4oHJ4vud+REQwxt2Wtru+QHGJZueoc4ARITgkkN0V7SMO+stGuTmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZY3OSnb1; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZY3OSnb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbFq5bRkz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:09:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874560; x=1768410560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ggZFsm9wBAcbdZnkGIV7EGJ0wyT9a+GuGk67HWpEVpY=;
  b=ZY3OSnb1go7tekfaXhpJPTAmy9FZBp1tAbeZ9ijy+4BM42mvXxZX5D7O
   qgBMzoz1IzReh56WyAm+usC/kSN3qsHqaQ0b6pYBX4rQ8lMmjunuHycuZ
   dI/RLKSCckY5p+YuHCcR7484ENfBKXfjM9HD9gW9y25egQTLyJJBpXqHV
   FsFhePTHaZN21TLIQWrHglno7LngLKSeveREPxFJVkcE0ve8x3h0rJPq7
   Ndus5F/5PFjXFY3TddlavVwACabhSbt0hISvocPK/5B7xBvWz4eI+acIf
   1UBjgWWD3nDkahd1jDwtvdCPOj0zIU7efOXG3rSFSP1sWbx3nidzHhxX/
   w==;
X-CSE-ConnectionGUID: IxvWEcfJSHmPIYoAH7b2Ww==
X-CSE-MsgGUID: /RlIHWkmT5+k2T77f/kF3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36465793"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="36465793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:17 -0800
X-CSE-ConnectionGUID: R8xOEQe/ScGx571nK2q+ew==
X-CSE-MsgGUID: qz15C2F5SReIC4nxqZeJRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105452762"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:09:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 3/8] PCI: Add defines for TLP Header/Prefix log sizes
Date: Tue, 14 Jan 2025 19:08:35 +0200
Message-Id: <20250114170840.1633-4-ilpo.jarvinen@linux.intel.com>
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

Add defines for AER and DPC capabilities TLP Header Logging register
sizes (PCIe r6.2, sec 7.8.4 / 7.9.14) and replace literals with them.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/dpc.c | 10 ++++++----
 drivers/pci/pcie/tlp.c |  2 +-
 drivers/pci/quirks.c   |  6 ++++--
 include/linux/aer.h    |  9 ++++++++-
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b6ef7efa3c1..0674d8c89bfa 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -215,18 +215,18 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 				first_error == i ? " (First)" : "");
 	}
 
-	if (pdev->dpc_rp_log_size < 4)
+	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG)
 		goto clear_status;
 	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG, &tlp_log);
 	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
 		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
 
-	if (pdev->dpc_rp_log_size < 5)
+	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
 		goto clear_status;
 	pci_read_config_dword(pdev, cap + PCI_EXP_DPC_RP_PIO_IMPSPEC_LOG, &log);
 	pci_err(pdev, "RP PIO ImpSpec Log %#010x\n", log);
 
-	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++) {
+	for (i = 0; i < pdev->dpc_rp_log_size - PCIE_STD_NUM_TLP_HEADERLOG - 1; i++) {
 		pci_read_config_dword(pdev,
 			cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
 		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
@@ -404,7 +404,9 @@ void pci_dpc_init(struct pci_dev *pdev)
 	if (!pdev->dpc_rp_log_size) {
 		pdev->dpc_rp_log_size =
 				FIELD_GET(PCI_EXP_DPC_RP_PIO_LOG_SIZE, cap);
-		if (pdev->dpc_rp_log_size < 4 || pdev->dpc_rp_log_size > 9) {
+		if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG ||
+		    pdev->dpc_rp_log_size > PCIE_STD_NUM_TLP_HEADERLOG + 1 +
+					    PCIE_STD_MAX_TLP_PREFIXLOG) {
 			pci_err(pdev, "RP PIO log size %u is invalid\n",
 				pdev->dpc_rp_log_size);
 			pdev->dpc_rp_log_size = 0;
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 3f053cc62290..4cc76bd1867a 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -28,7 +28,7 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where,
 
 	memset(tlp_log, 0, sizeof(*tlp_log));
 
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < PCIE_STD_NUM_TLP_HEADERLOG; i++) {
 		ret = pci_read_config_dword(dev, where + i * 4,
 					    &tlp_log->dw[i]);
 		if (ret)
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 76f4df75b08a..84487615e1d1 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -12,6 +12,7 @@
  * file, where their drivers can use them.
  */
 
+#include <linux/aer.h>
 #include <linux/align.h>
 #include <linux/bitfield.h>
 #include <linux/types.h>
@@ -6233,8 +6234,9 @@ static void dpc_log_size(struct pci_dev *dev)
 		return;
 
 	if (FIELD_GET(PCI_EXP_DPC_RP_PIO_LOG_SIZE, val) == 0) {
-		pci_info(dev, "Overriding RP PIO Log Size to 4\n");
-		dev->dpc_rp_log_size = 4;
+		pci_info(dev, "Overriding RP PIO Log Size to %d\n",
+			 PCIE_STD_NUM_TLP_HEADERLOG);
+		dev->dpc_rp_log_size = PCIE_STD_NUM_TLP_HEADERLOG;
 	}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x461f, dpc_log_size);
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 190a0a2061cd..4ef6515c3205 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -16,10 +16,17 @@
 #define AER_CORRECTABLE			2
 #define DPC_FATAL			3
 
+/*
+ * AER and DPC capabilities TLP Logging register sizes (PCIe r6.2, sec 7.8.4
+ * & 7.9.14).
+ */
+#define PCIE_STD_NUM_TLP_HEADERLOG     4
+#define PCIE_STD_MAX_TLP_PREFIXLOG     4
+
 struct pci_dev;
 
 struct pcie_tlp_log {
-	u32 dw[4];
+	u32 dw[PCIE_STD_NUM_TLP_HEADERLOG];
 };
 
 struct aer_capability_regs {
-- 
2.39.5


