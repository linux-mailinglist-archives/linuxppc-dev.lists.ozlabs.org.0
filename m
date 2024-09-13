Return-Path: <linuxppc-dev+bounces-1336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E04C9782B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xkC07N3z2ytV;
	Sat, 14 Sep 2024 00:38:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238291;
	cv=none; b=C2juOEOHlDx+xP6IUPwbnivmAZdMRk7S11XhHbQeSHHIIYfbcdiULELYna0Ed9iiuBVrKRhcVZDVlWKdHXalhvBjYYEY9mXYsfrYV6XlvQ7Qf7TbAA6db9F76lwty/LSpWTh/f+xfXRgGUz/Hnj7vwGUA2fhhF48Pwmrvlo2TkMFMi7dhir85V6BvjJxAjzNlKVbadhZYgykQ79yVqRE4wcnGSWC3I7lQKyImrvhCBH/t/zNkBFql6Cb14YgeyUs1nY/nK+PmH2IE8qMMhkCbY1mYAs3OCLz3SC5tnP0yj2fsHKzFFkIfF7tIATfO7MaLTWEd5etxz78Z14k8aRSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238291; c=relaxed/relaxed;
	bh=tuCSy6QVCHbLN+msAtFDoyvy5N7Yr5SL7sw6EI9Ukoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGChVUz4xLDT3/03FZ3LCSnjT0BMehdBH6Pq848LVZuOJKrj5GHsUFXWQtEoOQElSww1D0E0elFVa6l1a5Tx4v+a5FQ+jj/d4vu44TbI/9urCQuLaNKDJvGj3wEQZNuQf4+fpx0rH6m4q5BJM4nVyRcpOxlE5ruGZ9515Zas6+4JVsExRfUtSgLK2JsaEMaPMSExIZAYTzv7UJkNt0vLoeeHqwN1dmvp+vo2qnEfxKzh99VMkIADK5pTG/TCdksBr+sDFuc19A0+hb8Bq9imr/o2kATJl2YphFl6VsqQ9eYvLtoVY0pRsQPKCYyvkko20EDuxY5T+3nO70N0mynxDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVaTOfX7; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVaTOfX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xkB3JR8z2ytR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:38:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238291; x=1757774291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hpx9+WwQodoXrthwEqwqEmlWnK4XZe3YjJ3dK1OBRRA=;
  b=PVaTOfX721jkhfdE0/MCR1Cj8dtgbJfhnwNyTQrqRirP7gDcqlV88b6c
   rIw3I68TSFj/qxh0ZWsTn9kCV6e6XY01MjYOOocMrN3FOfKTM/djADKCu
   jncTtXyRxrQmb8HIdZdA0pj9PiEy7oZFPSEOh2SUGgPs1Rk/MlI4kxCZ/
   eWPGC5yt+u06R8kb3fmNIxmPXbDv11nz4SpNj9N33DQZD+JnUzU3fJi6P
   QQAvMe07P3ACNTrdHUTr2U4dSvOEwd2mKtYYnxpbqn/KbiWj1lyqXLChC
   +63ACM5xGDGg8KTpxpMSpmuqjfQoSUud4KIi6Hnnl/jPYGTAmaj8V5GIc
   g==;
X-CSE-ConnectionGUID: hCZ3trSrTgqZnkBYUawEnw==
X-CSE-MsgGUID: 7xpJLonQTTu/0TR17nKhnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24963012"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24963012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:38:08 -0700
X-CSE-ConnectionGUID: O30jobF4TwibO8/vMUr58w==
X-CSE-MsgGUID: 5EMzjNqhRVSTLflx2gi9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98764508"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:38:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 7/8] PCI: Create helper to print TLP Header and Prefix Log
Date: Fri, 13 Sep 2024 17:36:31 +0300
Message-Id: <20240913143632.5277-8-ilpo.jarvinen@linux.intel.com>
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
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/aer.c | 10 ++--------
 drivers/pci/pcie/dpc.c |  5 +----
 drivers/pci/pcie/tlp.c | 31 +++++++++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b47844b97428..cd6ada5d5980 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -486,6 +486,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev);
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *log, const char *pfx);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 651d0c72802a..6484e3a66a41 100644
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
+		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -796,7 +790,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 			aer->uncor_severity);
 
 	if (tlp_header_valid)
-		__print_tlp_header(dev, &aer->header_log);
+		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
 
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 7933b3cedb59..86ae1cf88787 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -220,10 +220,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 	pcie_read_tlp_log(pdev, cap + PCI_EXP_DPC_RP_PIO_HEADER_LOG,
 			  cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG,
 			  dpc_tlp_log_len(pdev), &tlp_log);
-	pci_err(pdev, "TLP Header: %#010x %#010x %#010x %#010x\n",
-		tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
-	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++)
-		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, tlp_log.prefix[i]);
+	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
 
 	if (pdev->dpc_rp_log_size < 5)
 		goto clear_status;
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index def9dd7b73e8..097ac8514e96 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/aer.h>
+#include <linux/array_size.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
@@ -76,3 +77,33 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 
 	return 0;
 }
+
+/**
+ * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
+ * @dev: PCIe device
+ * @log: TLP Log structure
+ * @pfx: String prefix (for print out indentation)
+ *
+ * Prints TLP Header and Prefix Log information held by @log.
+ */
+void pcie_print_tlp_log(const struct pci_dev *dev,
+			const struct pcie_tlp_log *log, const char *pfx)
+{
+	char buf[(10 + 1) * (4 + ARRAY_SIZE(log->prefix)) + 14 + 1];
+	unsigned int i;
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%#010x %#010x %#010x %#010x",
+			log->dw[0], log->dw[1], log->dw[2], log->dw[3]);
+
+	if (log->prefix[0])
+		len += scnprintf(buf + len, sizeof(buf) - len, " E-E Prefixes:");
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
2.39.2


