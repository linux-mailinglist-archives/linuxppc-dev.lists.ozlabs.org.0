Return-Path: <linuxppc-dev+bounces-13762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356AC329E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:25:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1H1l63x2z3c2k;
	Wed,  5 Nov 2025 05:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762280715;
	cv=none; b=axsa77RTG+5UEIWjnfC+PVA/CS13XLNOogyWmZOGTt1V4o0dVtZr7kEBDmiiRe8e9S8F299rkg3vN3Vy2AOHDrhOJvBGdh7chB5uiQcSXr3XukxhPbOFxxbJJ/IP98PhdHT37II+if5BAUSu4XQwk7c6e32UZQkxD85p2WAfGdd0iRdYYVwg+UQx0cQrnmwYEFwcHV3Bq7OBAhe7KoBSk1Lo0Ry3Anv8uk62UomMjS3bHnu9tWhy3UYBA6hMjrGB8nApmKlLvJtae74TWA3rb8OLjevozjhroCc2YInnIRTbbr9MhXAB11HfqeWdKFnwhd8iqCed9N4Ww72nrvxxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762280715; c=relaxed/relaxed;
	bh=ZqA+1moxGk6IgGpWiGn84HmHcCI7NUINawTwmeuZGF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ik7+LJUEijxQ21XHwU5Jy1VPjE/VR0IJlcmNb0vZXYJ95gAL+yXjrMLm3FtCXT6T3XmrvVfIYxC68RSvO1qm/D+yq4xsp+Zhr8zx0pzBHa2hu2e0FVsF2Lf3creqflwBWqRkbFxi4n9JV9hqbkq8XHnirgOunKb832r2vei0SotUg84JC4gjAkEdKrgD+seEhT/CU1MZR4uvi8RXfF82aZRItNxKHlV598ZeeWL9gopyifqAGdh2iB5O6HP924SuMbZ8dRovO1zsv207fDI6R8Mb4EAP7E/rhZOIm6cqg15RgoN+PstJBZx8dIjfbp2WB8LJbHiclKzgvcmeKyr6Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQY4ntc+; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQY4ntc+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1H1k6L6kz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:25:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280715; x=1793816715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nhbt4srhoJt6kX/v4YJMSiHFh71zUOhgkVIdyC1vc9Y=;
  b=bQY4ntc+PIg4V+zQwv9qx78xCHJvjUIXAqUhXeIgIbq7iHTmURZT1G++
   Rvc0i6r5dk3RJxHWgLuzUXreCrGO9cRiXFgqzfkyQYYgKVIFvEoNHJPm4
   z2jxte3mW59YhI2RKXUYdGXZ6sDWbRspfNT5uJn/ALc8FA/Zl1Sirfm3l
   AfdZhDqvSbqIjMxQmMg8n0jRTVP4caLo9hyLWOcZAWbOO5pq2W6jg0Eoy
   zNmLmONKGvP1oEo5k3mNJ/LFBRBiLF6ROa64Cxrq3y4v24dAGy/+damL7
   X3nNkI9pUcSb5zcADvX+0tzAt4c3e5tpmVANdY33MiyU0ZV3xgZiRjGuU
   Q==;
X-CSE-ConnectionGUID: lhkHmHGsTi+AaTYm0QBO6Q==
X-CSE-MsgGUID: MAyKNwBJTxm5rOnel3NaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64081463"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64081463"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:12 -0800
X-CSE-ConnectionGUID: 7rXFkehdSG6ES/llyUnt3g==
X-CSE-MsgGUID: hauzHddjRH2wxLDSXXOzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191325264"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:06 -0800
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
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
Subject: [PATCH 2/6 v7] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Tue,  4 Nov 2025 19:22:33 +0100
Message-ID: <20251104182446.863422-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
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
 drivers/acpi/Kconfig       |  6 +++++-
 drivers/acpi/acpi_extlog.c | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ca00a5dbcf75..be02634f2320 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -492,7 +492,11 @@ config ACPI_WATCHDOG
 
 config ACPI_EXTLOG
 	tristate "Extended Error Log support"
-	depends on X86_MCE && X86_LOCAL_APIC && EDAC
+	depends on X86_MCE && X86_LOCAL_APIC
+	select EDAC
+	select PCIEAER
+	select ACPI_APEI
+	select ACPI_APEI_PCIEAER
 	select UEFI_CPER
 	help
 	  Certain usages such as Predictive Failure Analysis (PFA) require
diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 47d11cb5c912..b3976ceb4ee4 100644
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
index 0b5ed4722ac3..1b903e0644d6 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -971,7 +971,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		pcie_print_tlp_log(dev, &aer->header_log, info.level,
 				   dev_fmt("  "));
 }
-EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
+EXPORT_SYMBOL_GPL(pci_print_aer);
 
 /**
  * add_error_device - list device to be handled
-- 
2.51.1


