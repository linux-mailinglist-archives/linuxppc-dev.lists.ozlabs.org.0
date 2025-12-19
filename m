Return-Path: <linuxppc-dev+bounces-14901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9042CCFD7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 13:42:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXnH53vxKz2yMB;
	Fri, 19 Dec 2025 23:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766148129;
	cv=none; b=fRLVihky1BRHWXDmqPuWu0KR+DmtHcL+srCYHAjXhSjewxA+aqJoWEUGsK4SbRhQF1lR1rV6NTd4z+GqsO7ZNlarKb7haarBfwFyL9E1mv1kWNJeXZcDjbclHE6f6GGAjrC4qu2iPRN3gaP39WTDC4TCm3ZGmF1a6GHc2VhNzyLP65hlNdEs/m8kNnZxeRa3fMayD/7neBX12F0R9nrjcAw6PaCOFZniXu/k8X7ddRQvPot/+ZzuFF2qs9SyzEk+5pdV6E+FfnUwsOw5XtHFKj7LfB1YqMxUuLjdbwRY0g8x0iLehEOx2OYy5zZRHh+fYdhYvG77x6yKX4cQZM+4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766148129; c=relaxed/relaxed;
	bh=VNAh6gsfZwDEaBVN4HYvJze4GRaPpZ5ux8sBKu5Q140=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4n3u3Qq4Qrn/HYUEcZtCEbHAj0qBm+CduIB8VsUc7r5X4fjkcxxhvhrW3rASqnjxI2ISHlTAfrg1n040n+IsVU6qXhcKacn9gQ97Q4gdn57p56CPCwUEw8rfSt3NnAGuklBKE6LJv6JNYHvRH5dT2BDcrhUqJb4WbDePlcM9QDSw/4GLkG15Fps7UopW0fj6aOm1ztFEIwrtl0xvouEh2e3l2tFAjTFecnMi9xYoVUj0yMVSIodcJMqKc5n+bQ3TvY11kJ2om5VMDv8ejCGtimke0Ku1mlqO0KKS9UFnJ/CVTn43DkK6WOt9UbQ28HeErskFRjYVfIDGacbJ/Ytgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T++HtGXA; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T++HtGXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXnH458Fdz2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 23:42:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766148129; x=1797684129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qBAGDUoxoUz1GVnALDeA12vJreI1EPv7zHhPC8BpEP4=;
  b=T++HtGXANfQmw3mIopTA+FG0OqKoZqaQEpeLZ7KF0QD2db4cLC8srWwn
   348ctNWW36ubhhudngELI/aDCkXRnNuIqOxLkKFA7F8aIs3hEntxDCyVQ
   qtX6FaEd1b0RRk2Gi5nN83ZMe+LDrcC39H8xI8DkrOWe1lk1MZjM2iuLZ
   gQBjOwRwbHuBIsaxijUGXpfZlgDw2ZOBbtzxBbljsAOVN8uOXA8FRTLPD
   dt2ltlty7x23gkmkU8KgpG1ZD4V0wTQmzwwq623XS75MOnCmgXAskgnVJ
   ESPU8QJ5hzKyBg/cOibZHXd6t8femnqcg88gOrJhlY8KHG0Z+QviQsw71
   A==;
X-CSE-ConnectionGUID: L4W53za5T7aGmi0a6Yx+2A==
X-CSE-MsgGUID: fx9MCaNbRsCNAHX5jcI0Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78742723"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="78742723"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:41:06 -0800
X-CSE-ConnectionGUID: JV1KnbaxQt23YuFmIBPhWQ==
X-CSE-MsgGUID: aOJ52LCiSSKLzXtMLLJWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198444401"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.52])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:41:00 -0800
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
Subject: [PATCH 2/5 v8] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Fri, 19 Dec 2025 13:39:41 +0100
Message-ID: <20251219124042.3759749-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219124042.3759749-1-fabio.m.de.francesco@linux.intel.com>
References: <20251219124042.3759749-1-fabio.m.de.francesco@linux.intel.com>
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


