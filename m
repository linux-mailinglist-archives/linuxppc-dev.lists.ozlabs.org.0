Return-Path: <linuxppc-dev+bounces-4331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4C9F68B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:39:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxBz119Nz30Wc;
	Thu, 19 Dec 2024 01:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532746;
	cv=none; b=BKtk51ySPN/cZjWVcr9dEmszwvUowN/famwZ9MwD3fovn65LtH/qizFgJNlJ9DcG9IU6YzqtAsPwwiQhe5FSQ4O27X70E5xFL6wIN3k6bNxxJ6FPJda2qT+1jEuaKBqyFzITgZw2K2+nGYf8WlQnrLfl0fTqpE/aJf2PSyUyuVjdZkE1jiqzGmcj1rl2WZSxeRqzP5TSNBZSfmzLKf/7EGg1kVC04x9Ubf+tOD4sGKp/vG0C9N0RZOlUL6BNz0ZM/wmxOxaXbTjmIo5MZlme05y5ias+Lq6a3Mv/PStaEm9BCDYb48lMgx7lWTbmEUqfOqwZBYxNBPS1115/p1ftOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532746; c=relaxed/relaxed;
	bh=rqInIMVxJ04EkOsmmLbigK+dvlqkleEbw4/VcMV3jrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2tQJOD9I0sc2flNJwxVdUOQsNh3H8HhMpX1EG5SDKXj3oSOiYaEUGqJJ1JLcQcMX02CkFnx3inpUhZFR8H74yokI28r1Szw1e4avfumaMgRyu1WkJpXRjXl2qmVMccockdwZpUsVs1mEIM0FsEodYXybl3SirjeeK+ZBqJC+McjoJrFVlKM7xD2WN6onclPTY7K//bQ+Jkd1LRmZvn0SRqa58MLiksYPPnhdf9hfGCqQSPgLY2Z/SMSo8//30rc1YFdDK5otiK8jOM9uxiB9uWRQI7szwNFYhUs+feD/+Vr6zTOw6Ata4izuMoseIuwgjfKlvVmjCPX5TcLf1Un9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqaZ2Rmp; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqaZ2Rmp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxBx5m6Kz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:39:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532746; x=1766068746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bWvOTaisMpQBSif7giRzN7nMj/yh22ERijcYuuLnMH0=;
  b=fqaZ2RmpH7Hsmj4WORfUoKQE099/S5FKo2kwYxGro6VCAiSTrGCmDQo+
   cGY8ZqDVTXgKdZNJal//2pX5ZbOeredxUmVvkez9EYJ1YD2y0a0lyzTib
   zKlshrUSDShY5tR7ROPr87Dq63wh0upYlKPNTmx/PRwFx5DsVovEANW2u
   2qP4MVZZk/QgXFd+FuZASMwoprutXFV5BhvF3xjJjL0FBLAMVPZmscL3F
   R6a2PY4rCCiETf0pP8M6aue1e5x3Ir5AKsRYhbhK60p0Vt63m0vz19TjW
   /TgpAo1yOj9yowo+tpRyOZfZ/Pm4545sRLcEK8LSka0tp6A8cE88Jz3KW
   A==;
X-CSE-ConnectionGUID: Ia/WRJEtRAS+XLZfd+x2JQ==
X-CSE-MsgGUID: GWt03a2TTRWpegbbZfdiDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597506"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:39:03 -0800
X-CSE-ConnectionGUID: cpfZDhGZTb2mUs+0v++QvQ==
X-CSE-MsgGUID: QA7wU5yUSkeu5dMn2QtqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 7/7] PCI: Create helper to print TLP Header and Prefix Log
Date: Wed, 18 Dec 2024 16:37:47 +0200
Message-Id: <20241218143747.3159-8-ilpo.jarvinen@linux.intel.com>
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
 drivers/pci/pcie/tlp.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 12 deletions(-)

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
index 302ba99e64e6..6171cb3a682b 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/aer.h>
+#include <linux/array_size.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
@@ -78,3 +79,35 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 
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
+	char buf[11 * (4 + ARRAY_SIZE(log->prefix)) + sizeof(EE_PREFIX_STR)];
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


