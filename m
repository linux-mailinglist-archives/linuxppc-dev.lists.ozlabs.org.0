Return-Path: <linuxppc-dev+bounces-15715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F326BD1DEED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhpz1xQfz2yft;
	Wed, 14 Jan 2026 21:16:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385787;
	cv=none; b=C5m+m32X6i3qI+88RLUemcnDOenCkgqOBsYlGaaWSMpKhnGdr2bHiOOw5KRn/gWladiVSwaN4l8pv5Sd5DT7GjA4RYXe2kSgBtMMtZXwr/E8KIiOPIL5e/8GN65a3kbIxHojjv6e0oAUVhkhdIAV2vPZRgCm2xyjznfFIdkDMofYvBbLE0O4mG9hyk4CyhX5kKrzuqAFPJty7WofkFH+N1TG+sV36B5/2+Xw4kIelGmT+rpaUm6dibiVEXmZRDm9six0wi3SBgOqQBGynIO4d7rytyucCZRsenEGPoNG/QIlzT0X5T3/7SYDDjlK19I7JY9dVwzB0v8l+s3SL1Mzew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385787; c=relaxed/relaxed;
	bh=qfhsC7tVJzP2EF2Tm/8qmc7Z+5pHBO5nbWDSxy3fyqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mt5FkVYal2qaS0Unu1cGQLkFa3A4ZdtqCrLAzZI6T2frg/HOCpBI0ERlDARqBBE2z/CFTiuSaqgSIYG9PPR2JAXMLfWey/gBvhjN7ouCJixiGc4QGagyDIA70JVo+p94HTssKsF0EyacHLwgsvzyazmW1q1HiKQRy4tU5+PP3iHNUFaosvdXzriR3cwZN+Lexe+HcQWE/HILny/rhAZHhxrEQJZe71d+hwOUzRygYG9y0PeMrY65N0OqeGRMhgy8roCAQJJhIawChhKuj3nYSw5hKR2PThzc1IJLAEEG7lFxUi8dcvTRrCfv6d1cr+mRf9M11+DtDqO4WLzODmXK5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+fKJHzH; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+fKJHzH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpy2fYVz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:16:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385786; x=1799921786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YiVlGQCr+FTIJ4B2/AoJNeziKA/MhUEzfyR0foaLu2g=;
  b=V+fKJHzHw2RrM1lcaXJZ+runuse65yy73sJYcOt9F+ivc1ly734XY5gp
   NHrJ7gdzcQV+ckmcFryppW9ld/U/v3YHot95jK4rtaJhI/Ep+JeXM/2Z0
   Zy/z0WqT3LgpyIpJu82m636IIoImDqOAeieStp8lZZ51dlI9SGJ1QAfue
   icMSj3+J27Htc/ldP0DBcX+FW6xeLWGeZiyOwhehfpwTdt8NJeks5FkLb
   QWGIlNcQNX4Zz1So/EBU7QgLaR9uipza6rTQJ3Z4Iqyaw411edQYNkWI9
   1TyCuO4H4uTf1Ms3uA5tF1MigfWYRppXVmgpTs2Nm/Ob0m0F/NcfzwAO0
   A==;
X-CSE-ConnectionGUID: TUxaw/LDQxWwS1CK8lsMUw==
X-CSE-MsgGUID: ugflPy/KT0yfG8xVn/5eAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765869"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:25 -0800
X-CSE-ConnectionGUID: rE2LwQp9T36u45hrhdgfxg==
X-CSE-MsgGUID: dKpe5iEjRW2dDBf+x62EXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792833"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:20 -0800
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
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH 5/5 v9] ACPI: extlog: Trace CPER CXL Protocol Error Section
Date: Wed, 14 Jan 2026 11:14:25 +0100
Message-ID: <20260114101543.85926-6-fabio.m.de.francesco@linux.intel.com>
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

When Firmware First is enabled, BIOS handles errors first and then it
makes them available to the kernel via the Common Platform Error Record
(CPER) sections (UEFI 2.11 Appendix N.2.13). Linux parses the CPER
sections via one of two similar paths, either ELOG or GHES. The errors
managed by ELOG are signaled to the BIOS by the I/O Machine Check
Architecture (I/O MCA).

Currently, ELOG and GHES show some inconsistencies in how they report to
userspace via trace events.

Therefore, make the two mentioned paths act similarly by tracing the CPER
CXL Protocol Error Section.

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/Kconfig       |  2 ++
 drivers/acpi/acpi_extlog.c | 24 ++++++++++++++++++++++++
 drivers/cxl/core/ras.c     |  3 ++-
 include/cxl/event.h        |  2 ++
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ca00a5dbcf750..df0ff0764d0d5 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -494,6 +494,8 @@ config ACPI_EXTLOG
 	tristate "Extended Error Log support"
 	depends on X86_MCE && X86_LOCAL_APIC && EDAC
 	select UEFI_CPER
+	select ACPI_APEI
+	select ACPI_APEI_GHES
 	help
 	  Certain usages such as Predictive Failure Analysis (PFA) require
 	  more information about the error than what can be described in
diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 88a2237772c26..7ad3b36013cc6 100644
--- a/drivers/acpi/acpi_extlog.c
+++ b/drivers/acpi/acpi_extlog.c
@@ -12,6 +12,7 @@
 #include <linux/ratelimit.h>
 #include <linux/edac.h>
 #include <linux/ras.h>
+#include <cxl/event.h>
 #include <acpi/ghes.h>
 #include <asm/cpu.h>
 #include <asm/mce.h>
@@ -162,6 +163,23 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
 #endif
 }
 
+static void
+extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				int severity)
+{
+#ifdef ACPI_APEI_PCIEAER
+	struct cxl_cper_prot_err_work_data wd;
+
+	if (cxl_cper_sec_prot_err_valid(prot_err))
+		return;
+
+	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
+		return;
+
+	cxl_cper_handle_prot_err(&wd);
+#endif
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -213,6 +231,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
 			if (gdata->error_data_length >= sizeof(*mem))
 				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
 						       (u8)gdata->error_severity);
+		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
+			struct cxl_cper_sec_prot_err *prot_err =
+				acpi_hest_get_payload(gdata);
+
+			extlog_cxl_cper_handle_prot_err(prot_err,
+							gdata->error_severity);
 		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
 			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
 
diff --git a/drivers/cxl/core/ras.c b/drivers/cxl/core/ras.c
index 2731ba3a07993..a90480d07c878 100644
--- a/drivers/cxl/core/ras.c
+++ b/drivers/cxl/core/ras.c
@@ -63,7 +63,7 @@ static int match_memdev_by_parent(struct device *dev, const void *uport)
 	return 0;
 }
 
-static void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
+void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
 {
 	unsigned int devfn = PCI_DEVFN(data->prot_err.agent_addr.device,
 				       data->prot_err.agent_addr.function);
@@ -104,6 +104,7 @@ static void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
 	else
 		cxl_cper_trace_uncorr_prot_err(cxlmd, data->ras_cap);
 }
+EXPORT_SYMBOL_GPL(cxl_cper_handle_prot_err);
 
 static void cxl_cper_prot_err_work_fn(struct work_struct *work)
 {
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 94081aec597ae..ff97fea718d2c 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -340,4 +340,6 @@ cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
 }
 #endif
 
+void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *wd);
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.52.0


