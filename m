Return-Path: <linuxppc-dev+bounces-9111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ACDACCABE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 17:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBb0q3yjgz2yhX;
	Wed,  4 Jun 2025 01:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748966171;
	cv=none; b=Jzi5mRwH4+/7sLXZe0fcX4JNgYjm+bUrwWTFL4Xis4EhLCoAIZwiQxTNf1VnAE6q+xgZ2709CzBNBuqEU/DW8jmaz8vU8YLeWFDfQ4ECAjTczQFtEBkYlHQAWF7E6YC70nyGmUnOnrgZ1iBWr1ll3p2c6dQ1bwhdN8xjw32eeVR7YZCW3NqgQ5HkubwSCRMACXb/A+mkK1yNvid58VJAccrISjGyeZ0f+37ctYAW1qnoBYBxFFw/hcXhCHqS+/2ERE+aqKi74uFOEcHK6bfa3ZI/J/pVLzbhMi1jX5eXSKNwmF5pHhL4WMgQnfmui0hAtpNvcycTgqiB2iD5Km5ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748966171; c=relaxed/relaxed;
	bh=5UgVeBHcMQV0gsknw6XlEarJ6tWfh7UDiTYKTe7fKos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4OvzP98LFhodfG39Duquz3+bQGf2XbAQSV7vjHhVqOLWm26+3ugElJ+jNBSE/usUWn+wub+St6iOynZez4eJI6Bkh6cQLDZGyJxzsNIO/BU0d8kFsUGTENDXmkwzs3SvB4QJugeDIC4IqBVPlBb5T8zEUVhnP5IuanDsVndmU/mZaDFMl68piZOO9OnzwUWeLgUJ+QKCwCptfJS3b7yeIArH4ZMHm/vlSFmFIjlW/R+ksO4HIZMPvNCqY/R/8O+wryJ+igdgzKPAKdXOXkW8vve2i3Ea3hGYfgEAM5bcAmR/st5qdcT1p0ay9hXDebTfHFht/h5tKVJSLLfjmvRGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oja3Whim; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oja3Whim;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBb0p2Vdgz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 01:56:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748966171; x=1780502171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y1RORX42Sy4+lziOrtB3W+PirCLsRq62pRiu3jXpg7s=;
  b=Oja3Whim0cNKru4iHMs9f0C3ifA6mFKLt8h6V7TAnH8ZZM4jssdGJELe
   pedeSqqmGH7de5IQ6Itnv/4wZI95Oxt8td8Fki2qk/2sa+83ZBuECYucw
   iwPNZVlYIvcnPERrskhP97L8ugOmg/S4sYiZykOA9ErHsSYgGxylzBfIV
   MHOwsZlEPRUYT5xTCn30SbLBRQQ0lwyKhXiZdeS+kxGSVE8ZrFWJccHS9
   Xw1E1ZNFtfp5YsRYIj74NZYHja2FnxbmJxAPrLpzBoay4QogPpoK9yYYx
   8nVKitf2QFTC4EowMfCx3YqPhpqIf5MwScAsTm3dXcaztLmhTbq9lA+eQ
   Q==;
X-CSE-ConnectionGUID: Mqq+BL7RSQ2By6AnPO57yQ==
X-CSE-MsgGUID: ++mxwFMOSCiGmZWICpiaMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62067005"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="62067005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:56:08 -0700
X-CSE-ConnectionGUID: cNo/tu2QTBebr/73DeO+Dw==
X-CSE-MsgGUID: bBoVVZ7/TPialP0v7Jm/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="175766116"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:56:01 -0700
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
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 3/4 v3] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Tue,  3 Jun 2025 17:54:38 +0200
Message-ID: <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
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

I/O Machine Check Architecture events may signal failing PCIe components
or links. The AER event contains details on what was happening on the wire
when the error was signaled.

Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
by the I/O MCA.

Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/Kconfig       |  1 +
 drivers/acpi/acpi_extlog.c | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 include/linux/aer.h        |  8 ++++++--
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 7bc40c2735ac0..2bbd9e4868ad7 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -493,6 +493,7 @@ config ACPI_EXTLOG
 	tristate "Extended Error Log support"
 	depends on X86_MCE && X86_LOCAL_APIC && EDAC
 	select UEFI_CPER
+	select ACPI_APEI_PCIEAER
 	help
 	  Certain usages such as Predictive Failure Analysis (PFA) require
 	  more information about the error than what can be described in
diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 47d11cb5c9120..b2928ff297eda 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -132,6 +132,34 @@ static int print_extlog_rcd(const char *pfx,
 	return 1;
 }
 
+static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
+			      int severity)
+{
+	struct aer_capability_regs *aer;
+	struct pci_dev *pdev;
+	unsigned int devfn;
+	unsigned int bus;
+	int aer_severity;
+	int domain;
+
+	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID ||
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
+	pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);
+	pci_dev_put(pdev);
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -183,6 +211,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
index d0ebf7c15afa9..627fcf4346983 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -801,7 +801,7 @@ void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
 }
-EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
+EXPORT_SYMBOL_GPL(pci_print_aer);
 
 /**
  * add_error_device - list device to be handled
diff --git a/include/linux/aer.h b/include/linux/aer.h
index 45d0fb2e2e759..6ce433cee4625 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -56,16 +56,20 @@ struct aer_capability_regs {
 #if defined(CONFIG_PCIEAER)
 int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
 int pcie_aer_is_native(struct pci_dev *dev);
+void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
+		   struct aer_capability_regs *aer);
 #else
 static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
 static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
+static inline void pci_print_aer(char *level, struct pci_dev *dev,
+				 int aer_severity,
+				 struct aer_capability_regs *aer)
+{ }
 #endif
 
-void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
-		   struct aer_capability_regs *aer);
 int cper_severity_to_aer(int cper_severity);
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 		       int severity, struct aer_capability_regs *aer_regs);
-- 
2.49.0


