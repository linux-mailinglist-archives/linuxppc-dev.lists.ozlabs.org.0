Return-Path: <linuxppc-dev+bounces-8161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2A8AA14E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 19:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn6YZ00vwz30gC;
	Wed, 30 Apr 2025 03:21:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745947297;
	cv=none; b=nwUz/aiYLVpHT5ujPUHMVQgGl0mx2qRPjwSRjx6ZqwWVhAF5s1K904YFiPsnI/zCDlZEt0QNhJJeAdw6RqKGDlXpK7zRwU/d8qC1LanqAwnlZ630wNN23hZoEzTBjldB5auE5LP5oAXrcyDRKaorfQ1ztVHM9qVhuzPMrNpOUO2VZDhaM/VZAEcbCckg+++887uX93AMcJxR5NtgItP6kox0PSM6hsfYWeAacHBynXAYMP2mzCeqgac7z28oT9kXtz2coDJzejTbnfb+dYU7wkOjwUIPB0mR62vi3k1wdm70OLO+9gMF2fqKj1Pe3mjHPkLJrM5XtagD/tVuL1q4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745947297; c=relaxed/relaxed;
	bh=2fsmUeBh3o+J1KfkSa8lHwGPdyZke9iwis9FMF2hJbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7PQ6Eqvw72jpsKkYXpvDBC8oggojqLCmwi3F1aiEcEjjLEjgriU4l9Nh0IMnuYBVzUZdUffoITPrdwga9uNAybe8KRt98itXpn1kKSiZXiFsnOTTDa4MAqJlRqHDSzGXhhRDxvcuiuC8Sw5H6eRZpa4+5TOKViRgcjedeIqwQcupZC5L+DzVBh+i3JJdCCGZ1OmX8Uz0SHAB5I4GsTdzhPgw0FIaHCxSLD2h9wR4RBUsjxXuQCo/cV0rvARQ1osGyOW+S6nQQ/e4wiuPOkg3oGzGWFQL0AJyWiNidR9fW8f8AxePcsQ7eZb2goCFt/fktihujenPVqE8Eq+RyGNdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pzd4kjFE; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pzd4kjFE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn6YY06Ycz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 03:21:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947297; x=1777483297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JndCVKWeSSfdR7hNOtWoioyuGzEZye/l3ydjb6NIV+w=;
  b=Pzd4kjFEoLEsmqWEIbtqyuIqAZcz6Rz4awe9spODS3ZeOg1Ew22E7MDa
   DwGJEfSuu7mPt19baFuuEMqkmoaq23ThV/FBqWawV9RGk2pgkbnqkYVTK
   zgWOlG/ZVfwSrQGVuN6xtpbC26VK3rXFnMOj93y4gWFPbyA64/CNBt32l
   IjNZ2iCc8qGFa02FHB/nyfkiPsamBdhldiyYyndXqIQ70EcWMZfnuWSwQ
   W7OSuAEnRO+AQXGfw1Sxhk9McBCiy57IllUhIh5Kq99pS+5ZZ7EQU3bS0
   Nq+nyePViIwmp/j3BXA8X9JGdcO8yyI4vsfjPlDl8D/LSKsJzJ+JbiMD9
   A==;
X-CSE-ConnectionGUID: ugRyuq/6Qj2HvZfQS3ouNA==
X-CSE-MsgGUID: nqOG49hUSyGj42d/snUCKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64996960"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64996960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:34 -0700
X-CSE-ConnectionGUID: 54JYejUrSaOsO1SvURqzVA==
X-CSE-MsgGUID: Cf41YLqzRbqOKAqfoN/PMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139073320"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.45])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:28 -0700
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
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 2/4 v2] PCI/AER: Modify pci_print_aer() to take log level
Date: Tue, 29 Apr 2025 19:21:07 +0200
Message-ID: <20250429172109.3199192-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Modify pci_print_aer() to take a printk() log level in preparation of a
patch that logs PCIe Components and Link errors from ELOG.

Cc: Dan Williams <dan.j.williams@intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/cxl/core/pci.c |  2 +-
 drivers/pci/pcie/aer.c | 16 ++++++++--------
 include/linux/aer.h    |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
index 3b80e9a76ba8..ad8d7939c2e1 100644
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
index a1cf8c7ef628..d0ebf7c15afa 100644
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
index 02940be66324..45d0fb2e2e75 100644
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
2.48.1


