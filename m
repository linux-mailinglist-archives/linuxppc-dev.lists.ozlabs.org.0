Return-Path: <linuxppc-dev+bounces-15712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12272D1DEC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhpd6pwnz2xFn;
	Wed, 14 Jan 2026 21:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385769;
	cv=none; b=IBklZSIoaSk9+IhLt9V+qCLCR+Ts6caxMlo3IocL+yZDq2468u26E5nPO7wXRN4m+vSCC7pnMhPaWGN7fIJIyuFZB0ikJqQ2eFkzBxqahwYh3letStJesdwj5dbttXKM7dZ7VnzRbknMgIDinenxBzFEKAlJXex8pHfa9Z5h+J3aHOFl2chFpJhbHe75KE0X/bCOboBI0PsdB309QstUct5GyqREwL662TZ5XqVPGBxXCwieqPua4ZA6LtqH6WvcRqlKqt16XjuL+AFxWAL4PVn7WiNcYrFo+O817GCG9G6qiHMxzLafnW9eYBVfDp9bTsqPb0Tc2j7fqNtn3f8pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385769; c=relaxed/relaxed;
	bh=VNAh6gsfZwDEaBVN4HYvJze4GRaPpZ5ux8sBKu5Q140=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niHajkyuWFg7KjhRzKU/xwFvkY3QBeyhHmIK2Pue1W6rs4SE/Ojd7pVEyfzM7CVMVW4QeXiWztk8f0nqpDtdHepLvpfHTgSWl2B5M9eXkAvkuPJ9+myAAxuPpCBcnCVy9RAehPfJMq5IkRldZ5oN5wxTVwCvh34OGWWeF/I87U8q+FsaR/AyLl8xogM6dcCN0uzvzqy3eIHig8HtuXqkgG4zlqnN369ww7nUZezoYGTdrEPzRAUud+6jGDMJ1kFmznDrTx/uzkLkz5i3NyRFC7ZoN3Z7yERWP6iUXb3vTDDgG/57cTT4SlNy3fHbP30kYCh2FsVTtuxVCpKBsEmOTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W1p/eMQE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W1p/eMQE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpc719fz2yGl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:16:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385769; x=1799921769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qBAGDUoxoUz1GVnALDeA12vJreI1EPv7zHhPC8BpEP4=;
  b=W1p/eMQEm8OPdb0sYWNeNqtkAa/LDtLPK5zClUpOO+Niy7gSynrgvusL
   JB6xHlS5N4+1nwyWb41BYQCrcZTb6xiyynrjjOB4w72VJ4caT6a7v3Wu3
   7mS8ZDufjFSXPEklbNRVwftEY3Yiqwcjei4pmlNGweMhWtx9xxdeu4bNS
   Em6D2lw1wRdEa5OLTIN7MZK+Z/zPDzAPrhHcLlQQ6Hu8RNUlLSDqma2B4
   BTfxuYfq1EYn0NHVvMw4lpDxVfqg7rZ+77oTd68GmfBA275fgVtG0G63S
   T9wnAruwp4bwm0G6cQRLEVWDH93C73EZwrWdhMeWQ7Ig00iyI5XjV8JXC
   g==;
X-CSE-ConnectionGUID: sq6tFsdzTV2yO4zb3rGiEw==
X-CSE-MsgGUID: iXtE09VTRXeqZspzkviGiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765824"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765824"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:08 -0800
X-CSE-ConnectionGUID: Lyyf5N7dTvqobdIJjgXORA==
X-CSE-MsgGUID: J8hu9WWzQzqCth5pPfVAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792772"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:03 -0800
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: Rafael J Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
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
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 2/5 v9] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Wed, 14 Jan 2026 11:14:22 +0100
Message-ID: <20260114101543.85926-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
References: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I/O Machine Check Architecture events may signal failing PCIe components
or links. The AER event contains details on what was happening on the wire
when the error was signaled.

Trace the CPER PCIe Error section (UEFI v2.11, Appendix N.2.7) reported
by the I/O MCA.

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 47d11cb5c9120..88a2237772c26 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -132,6 +132,36 @@ static int print_extlog_rcd(const char *pfx,
 	return 1;
 }
 
+static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
+			      int severity)
+{
+#ifdef ACPI_APEI_PCIEAER
+	struct aer_capability_regs *aer;
+	struct pci_dev *pdev;
+	unsigned int devfn;
+	unsigned int bus;
+	int aer_severity;
+	int domain;
+
+	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
+	      pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO))
+		return;
+
+	aer_severity = cper_severity_to_aer(severity);
+	aer = (struct aer_capability_regs *)pcie_err->aer_info;
+	domain = pcie_err->device_id.segment;
+	bus = pcie_err->device_id.bus;
+	devfn = PCI_DEVFN(pcie_err->device_id.device,
+			  pcie_err->device_id.function);
+	pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
+	if (!pdev)
+		return;
+
+	pci_print_aer(pdev, aer_severity, aer);
+	pci_dev_put(pdev);
+#endif
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -183,6 +213,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
 			if (gdata->error_data_length >= sizeof(*mem))
 				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
 						       (u8)gdata->error_severity);
+		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
+			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
+
+			extlog_print_pcie(pcie_err, gdata->error_severity);
 		} else {
 			void *err = acpi_hest_get_payload(gdata);
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803c..71ee4f5064ded 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -973,7 +973,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		pcie_print_tlp_log(dev, &aer->header_log, info.level,
 				   dev_fmt("  "));
 }
-EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
+EXPORT_SYMBOL_GPL(pci_print_aer);
 
 /**
  * add_error_device - list device to be handled
-- 
2.52.0


