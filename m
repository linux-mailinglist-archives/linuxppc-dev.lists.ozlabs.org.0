Return-Path: <linuxppc-dev+bounces-9110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18096ACCABB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 17:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBb0j0wFlz2yRD;
	Wed,  4 Jun 2025 01:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748966165;
	cv=none; b=Mdk9Sw6gfQjEQ6C/WNxgh9IjeCGZcS5Jp5/Ds9tewdOp9Xfjl7eQn6L1aVI+QLC6bbeFrQjk/504ZJchz2EWpNQR6FbVaTcn6ir5bTDRqfuhROovTSrIH/UhaZJGJApZTLHPOrdO1cKUCHnytLNwYNVGH7PDOxYtfVIX/r6bTMlms3JVrz9DskWc3Obw82CpkRy+BB1bncYs8OGDufxLXEDRhXnIyS/tVX3IdKV2p+yttOwZ68NBQcLZDCL+tlgsRgQxkFoaBCtyRFkS6Qna/KuUn0t7kvg4tYZIqE8Jz9htKfFuODp8WuIQlFTSCqjtpfcxjhF7DwpZuaNl3U4AgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748966165; c=relaxed/relaxed;
	bh=ZiCZyMrWeXaBpo7mKOLGUvytc+3+bBA4v9lgOYaK4tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Abn5DOf5m3NhxzQhUE8Kfp0HbUEcBa0BbSl7AJtgzRAkAmmzyyRI7/1vwsFAoEujgtFSPY6nJW/C139dTdIgJ7IqRY2J5PFCtrfn/Qef/tiSbmuTGs89fHU6RTvPSU15SzO9ZrxG0S4uY0r8yAdO/q7euxgpuyIyYZOGgoFmpseC6RblaykgxwKzAkKNNW6EImrt1wYu8PkpDMb4J2CE5Zah9rNVSu629sTXI6lDFjKLG/ksQP1ex5TrsJo3B72askNKGrEiezZ/Zip2ff9frOTVsyPuMqy7o/m01GoLYNK84FngfRnq8zxjBM+TmPv2efrRHNBna20aq4wSytj15Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G+2LOAUJ; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G+2LOAUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBb0g4fDJz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 01:56:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748966164; x=1780502164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KTvphffgUyV88Xl6ztOB/XDHgUpzbH4eHZRN6x7EybU=;
  b=G+2LOAUJg0Eeg0PRXbuDAMTIsmI/DymFtEeNqUpZMwDhww+3YQ2N2l5+
   G6ptnjFiDOo5MZD8GKCpwPkxP8DO2Cvb8qMFVhz+vZRwFDXskmeXsFlq4
   9dYddWgXRgc97WqE9rxbTYMPOtNot5nmFTAHwLOfpUsZcY6PphfrHLLFt
   yn5JLFJC11yIDmfwB7MkKRImj5RqmU4Q9UbwDqsL3ueeYHnxL47IlsXXh
   yFWGm97Io1dV9fFVlLc8F1C/P9hxaq8ddppF4FKi3xoJHUlz/19IBdhrH
   fgGKHy7Me5Kw/U5amFkd/WP/QirpI5phwrXVsUPyaaOp5Nu2l0VgJ7tNO
   A==;
X-CSE-ConnectionGUID: 24cF5EHUQICUIwTb1gKtUg==
X-CSE-MsgGUID: BFTktRoJSsaQpCWEnDTGCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62066990"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="62066990"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:56:01 -0700
X-CSE-ConnectionGUID: Yw5wF3zoRo6/IKmOFyuUiw==
X-CSE-MsgGUID: ipi757xUSb6gmEB5EZypyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="175766105"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:55:55 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 2/4 v3] PCI/AER: Modify pci_print_aer() to take log level
Date: Tue,  3 Jun 2025 17:54:37 +0200
Message-ID: <20250603155536.577493-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
References: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Modify pci_print_aer() to take a printk() log level in preparation of a
patch that logs PCIe Components and Link errors from ELOG.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/cxl/core/pci.c |  2 +-
 drivers/pci/pcie/aer.c | 16 ++++++++--------
 include/linux/aer.h    |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
index 3b80e9a76ba86..ad8d7939c2e1c 100644
--- a/drivers/cxl/core/pci.c
+++ b/drivers/cxl/core/pci.c
@@ -885,7 +885,7 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
 	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
 		return;
 
-	pci_print_aer(pdev, severity, &aer_regs);
+	pci_print_aer(KERN_ERR, pdev, severity, &aer_regs);
 
 	if (severity == AER_CORRECTABLE)
 		cxl_handle_rdport_cor_ras(cxlds, dport);
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a1cf8c7ef628a..d0ebf7c15afa9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -760,7 +760,7 @@ int cper_severity_to_aer(int cper_severity)
 EXPORT_SYMBOL_GPL(cper_severity_to_aer);
 #endif
 
-void pci_print_aer(struct pci_dev *dev, int aer_severity,
+void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
 		   struct aer_capability_regs *aer)
 {
 	int layer, agent, tlp_header_valid = 0;
@@ -785,14 +785,15 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	info.mask = mask;
 	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
 
-	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
+	pci_printk(level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
+		   status, mask);
 	__aer_print_error(dev, &info);
-	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
-		aer_error_layer[layer], aer_agent_string[agent]);
+	pci_printk(level, dev, "aer_layer=%s, aer_agent=%s\n",
+		   aer_error_layer[layer], aer_agent_string[agent]);
 
 	if (aer_severity != AER_CORRECTABLE)
-		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
-			aer->uncor_severity);
+		pci_printk(level, dev, "aer_uncor_severity: 0x%08x\n",
+			   aer->uncor_severity);
 
 	if (tlp_header_valid)
 		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
@@ -1146,8 +1147,7 @@ static void aer_recover_work_func(struct work_struct *work)
 			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
 			continue;
 		}
-		pci_print_aer(pdev, entry.severity, entry.regs);
-
+		pci_print_aer(KERN_ERR, pdev, entry.severity, entry.regs);
 		/*
 		 * Memory for aer_capability_regs(entry.regs) is being
 		 * allocated from the ghes_estatus_pool to protect it from
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 02940be66324e..45d0fb2e2e759 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -64,8 +64,8 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
 #endif
 
-void pci_print_aer(struct pci_dev *dev, int aer_severity,
-		    struct aer_capability_regs *aer);
+void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
+		   struct aer_capability_regs *aer);
 int cper_severity_to_aer(int cper_severity);
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 		       int severity, struct aer_capability_regs *aer_regs);
-- 
2.49.0


