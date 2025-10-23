Return-Path: <linuxppc-dev+bounces-13211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92CC01209
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslfz03pSz3btx;
	Thu, 23 Oct 2025 23:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222474;
	cv=none; b=apq2URmJwZgSf5oQuxRY1eDCtMyDFFFwvpoi6pdnOd7jcXNFOMXV54VGmKpKLJjq0c3TvjyaJxkBKltPzMi6ScUw/36B6sMLvKOBbNqTF0oLJDreL7vVUn1fhK6CqxeeTLGUQJto3wHLNea1Jo6YmsbPs3vYVd9WVMirziu9n9cQJKgFa2DKgL9DwKTvZo51ohaqCIMsIlw/QEV6KEoVqwwLjVrl/2yVv1/UljFnLuPWe0sK/gcpXmPw7ZzwSAaqpd+1WjKXiEoNG7FrNW/2RNV4vT5dlPpOhDMoYesRdQPzbItfb4OGXrWGWzvZMHI13pErfwFBBVrAWyG3vNANAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222474; c=relaxed/relaxed;
	bh=mhNJ5UVjbR9XwZg/RG4WVaadVBacBt963EXV7HuFDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2hlQoosISarIfHQWmmHDxxEiiZl6JtazitXqSDJFoILj2OiMvCA4AnTyA1EC2NuhZfz/TMX7/AOfOUChImPjeibK6eGIYpSRTl1Trq97HR3Q5SbwHDnwxAGGggrZPkP0cIUm0hkXPEd0S4lO1Zr48QbCMW1mYlL1pRGccxtO2f1E4Uwa1/kg+HJX/jsSEjC7+fyPPBJG9CEOukxJcZaWk/tf/9P6jijgOSOxv2SWsq3mfZENTmcuaYAQSszqVrdI0Py1IauPQIAPbjsciOQx+FRzt+ake6fTTc47mFPoY4YgzeYSxWpQ9fbLPfcA80Qe0xazxM/otZR1KPiz+zxYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drbVBHYG; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drbVBHYG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslfy0ZLxz3btv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222474; x=1792758474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zLJMDs9079RK5MwXvZr2M8uR5FmXfMibcm6mFiquR+k=;
  b=drbVBHYG1B0XocQYbuJ3WkhioXLzmpj4/qMfM9bKirI6dtbiP+6Qbm2n
   MGwe/AX9ojXnL6ss0pdt/yQOGitG9Sy82Zln55gl7lxVa1UptiQ3SIQqR
   7NHWVgoQNVgZ9U3LWMrX+n8WwKlSHQgMKCaEX5XmJpiDzoUcUaQYAvoPf
   yeRF0hoHEJ6sANeuBW5UBqyQIcU3TAV5F/OKcV6avoRBAm34TZI7uJuE5
   3Ytu9HDeJ7PYY1Zk0R22Yll/7IdA1WO4Af/Q/fhfR3fJdQfI2kTV83XDX
   031Rk7CuFSYkUfVhqfN2fsKRw/o5QGZfhsEwDebnmRGGAMUB4mNtpsxAq
   w==;
X-CSE-ConnectionGUID: HVy7TmhcTVCLzLQm6C97Bw==
X-CSE-MsgGUID: VGCMauUTTaGYN9oSQZLO4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63296832"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63296832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:26:49 -0700
X-CSE-ConnectionGUID: vdRp44lcSV2X6qSpo0BJeQ==
X-CSE-MsgGUID: 2NFambV/TLubggDm+0LoVg==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:26:38 -0700
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
	Sunil V L <sunilvl@ventanamicro.com>,
	Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Xin Li <xin@zytor.com>,
	Will Deacon <will@kernel.org>,
	Huang Yiwei <quic_hyiwei@quicinc.com>,
	Gavin Shan <gshan@redhat.com>,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Li Ming <ming.li@zohomail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Jon Pan-Doh <pandoh@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	Shiju Jose <shiju.jose@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 2/6 v6] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Thu, 23 Oct 2025 14:25:37 +0200
Message-ID: <20251023122612.1326748-3-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
References: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
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

Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported
by the I/O MCA.

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/Kconfig       |  1 +
 drivers/acpi/acpi_extlog.c | 32 ++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ca00a5dbcf75..f8a97db075fc 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -494,6 +494,7 @@ config ACPI_EXTLOG
 	tristate "Extended Error Log support"
 	depends on X86_MCE && X86_LOCAL_APIC && EDAC
 	select UEFI_CPER
+	select ACPI_APEI_PCIEAER
 	help
 	  Certain usages such as Predictive Failure Analysis (PFA) require
 	  more information about the error than what can be described in
diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 47d11cb5c912..cefe8d2d8aff 100644
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
2.51.0


