Return-Path: <linuxppc-dev+bounces-8162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE1AA14E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 19:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn6Yg5mVvz3bgV;
	Wed, 30 Apr 2025 03:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745947303;
	cv=none; b=EpteTGz9mZNP4+GvEf6ttaH796Sl503shUuI1gJ50FSVFEzEhpO5bs6AMSsw44jGQignxLrl5NcbY7q0d4hXDk9ZZ0EdReqX/c8oK7LgX0MjtOj7Iv42XLIyYJd812YVugszsRHtcR3H0d7uDAN3XIjCE4X5am9zF5ztIvH8LBpLDadUxJMZuof6N9Yo19W9mmFb1UMX5nZbHQ3lRbAH6UHfWoL3i0pwKTprkjlHxNv/f66euTmST3ByHIMiX1xjvWtgbpR22tm5jd3H1pqHvsA4KD0NZ6+vMv5UQugzf0PP4hq3s6UDXKb0FuzqwCDVRoDDFpbU2Em0LG7FIb+/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745947303; c=relaxed/relaxed;
	bh=cHnCt+s1VJ6UcrQ6ziW/YFAE8gIjfKWA7vzpIg13Fgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbnrOc1XrEwgOqHofJsoCUlK/Z0HVrxWnNPNwRxkr/lQPBvIqlyYB41Hy3+vd1FOUPSAfT+2c14uzcW8zHrsfEL36STtuQ5qGNpBTaAg63CPVcO8t0aR+8KH8WS5CPU5sdCOESWZIJfaePJV8XrD1/OGDZl2L1a/r486Z7qVlT0zMbpPIef03huorIElM79clQoYFl5nIcW665IQEbmPXIYdiKqGPKJahxnRndJPlahGBqHZao2j8EfaAipnSBiH9KHIxy8weZhluxE7W6CknqvV4x0+eCTvojct3vjT92oZquOHkfIgBPo/66qKa3vs3Vi0LDITekD89VEe9RmjOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4MU7JkT; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4MU7JkT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn6Yf5gQxz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 03:21:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947303; x=1777483303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LHmTP7DiNiCJt6QTpTz14DavcISMhdx93wqkEkSqPf0=;
  b=V4MU7JkT69s67rODALJmR1sxJdWTvFkFmkTOCJPsoHdf9lwqGERyEPET
   Ty4FjjE4sSoWy5xrex8VSJmifu66CfsIa3PMzL5wQGmZjxtbB/WC7Ehre
   qQvPW9RwNNZ8sfVnyhbhLKOW7s7g4D7cAT+/SUZ7+N0vCXD9RDGT3vXy8
   NJuBn5CQO9BySxQr2WLJigt309C77ShhDNycl5D8STOdzK8OfTcO3/CPh
   7MoeUWgeTPnMDPuWTzHa1zdvCCV77qszoS8yc8Fu+6vLE+/BPNlj7J72A
   eGL6zudsNevIW/beLy8bYEf2Nzkeg7yq/Nm+WlhsTlZLd0F0RyC7Q6j/1
   Q==;
X-CSE-ConnectionGUID: kDXaJI+URvaLiFg2htl/BQ==
X-CSE-MsgGUID: 9XJvNEl4Ria1cVccZyf0nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64996971"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64996971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:41 -0700
X-CSE-ConnectionGUID: 06FSbi8qTc6/uxnr0ds6vg==
X-CSE-MsgGUID: clIxOUsESMOKDd1ykWNL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139073335"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.45])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:34 -0700
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
Subject: [PATCH 3/4 v2] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Tue, 29 Apr 2025 19:21:08 +0200
Message-ID: <20250429172109.3199192-4-fabio.m.de.francesco@linux.intel.com>
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

I/O Machine Check Arcitecture events may signal failing PCIe components
or links. The AER event contains details on what was happening on the wire
when the error was signaled.

Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
by the I/O MCA.

Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 30 ++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 include/linux/aer.h        | 13 +++++++++++--
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index caca6ccd6e99..7d7a813169f1 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -131,6 +131,32 @@ static int print_extlog_rcd(const char *pfx,
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
+	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
+	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
+		aer_severity = cper_severity_to_aer(severity);
+		aer = (struct aer_capability_regs *)pcie_err->aer_info;
+		domain = pcie_err->device_id.segment;
+		bus = pcie_err->device_id.bus;
+		devfn = PCI_DEVFN(pcie_err->device_id.device,
+				  pcie_err->device_id.function);
+		pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
+		if (!pdev)
+			return;
+		pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);
+		pci_dev_put(pdev);
+	}
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -182,6 +208,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
index d0ebf7c15afa..627fcf434698 100644
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
index 45d0fb2e2e75..737db92e6570 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -56,17 +56,26 @@ struct aer_capability_regs {
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
+#if defined(CONFIG_ACPI_APEI_PCIEAER)
 int cper_severity_to_aer(int cper_severity);
+#else
+static inline int cper_severity_to_aer(int cper_severity) { return 0; }
+#endif
+
 void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
 		       int severity, struct aer_capability_regs *aer_regs);
 #endif //_AER_H_
-- 
2.48.1


