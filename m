Return-Path: <linuxppc-dev+bounces-9651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D9AE478E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 16:55:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQrjf5Fj0z2yF0;
	Tue, 24 Jun 2025 00:55:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750690534;
	cv=none; b=lPtGUEMCq3GYgWvIoxCrtIXY5q1BWQ7/pqS+38S6QFO7RtyAngmlqD20JD90EniQM4uac1MYU3l2Jd7sAMZrBq2o7cqP0gLaacf0h7xfRkIEv65t1cVlyjfaEn6gjYsQEY1jJHg5GaxgetAh5If2vG18cxVolYafrYbRN1OFZgLu5+9uONVwWFOvzvMrbYUq21p9p118XJBQeGGF87nF/Ft/LVglCw91hegrFO93I5CwjqZN4cd2C2KV1fc+Edf8gOsshUoU+EyRZeS7GBncVYGCeqNE7bFYx+qzEhMq4eWA0oMb/zwQ+m8TJUZDQVvPvjt5D3O7BhaaURZQb6u2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750690534; c=relaxed/relaxed;
	bh=3ZfIlIhO20GDqdrloqyeFkQsSj2696yqzHVpcSWIFSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzewuO+dytTU/Lu5DL08OZlpd+3PqbUICm68JjDBsQuf+idso6WmxYbTub79yOG1fsR9xoLXzQppPwNKUygbvMixdT4ExYEI2BZBpnzkX3NBafJxoAQqocGDBFyjobDdP4ROikTf8LFc8VxQ6mOEL0bxWrTT5pGppZPcArYJNA0VV+LJ1nQhO+ddwHhjHspXzK+mRbiGgOm+fnnQWTTRn26WuWqrAh/Lopk/CSAxp7GpsFuiw+saw6A8K3lqqJLb6o7srsuH04L9ffVErFHrXr2wjmgynYGP2I/DaOfOCdK4DFI0kSCl0Dy41HyArwil/COjmHtrAyLBSxR0fGBf1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnZ/Sj8c; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnZ/Sj8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQrjd68RMz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 00:55:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750690534; x=1782226534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gszoEZ/bHkrFTTc3IzYuM4m4Ycm6E1VSniTVLUWbC0I=;
  b=LnZ/Sj8cpfkYHYLHLLPTFiAUZ+4iondudupUQZ8bSMcgVqRWXY56MDBB
   gpt9tftXD3XNV/MO8+P9qduYwMBfaDoPjbOmupfSWXw3gUEXCcSelfYLT
   c44UMqR40Jo/8N5XtGLPAXBO+TmT5AGQ5DimUdy0LKfwIr8QuekFtI6Hy
   pxu2XxQD9LaxRxbSS1oWuBYEakMiBxxfNaUReRhPxPMjQg7DsgtNEyshz
   uFa+SSei3VxXxmr0ax2GUFyJClG5Q9mgkz0Hkrris6RAmm/4HyE+6LZIY
   Nv5BZGgzlwhuxrQMNN/nszb0YtM5Jxqwhx258hDGgUEOh/ykIo64xEN1V
   Q==;
X-CSE-ConnectionGUID: 1jMe+Vk0Q+aj5z2IwJEY0w==
X-CSE-MsgGUID: 1fGeEXvdTdaXfrIGp2vYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53042731"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53042731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:55:32 -0700
X-CSE-ConnectionGUID: IDXBrUhASwOrAxLiN9UO2g==
X-CSE-MsgGUID: i9GOdjm+QLG4QDGi+dI36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155997410"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.11])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:55:24 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
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
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-edac@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH 3/3 v4] ACPI: extlog: Trace CPER CXL Protocol Error Section
Date: Mon, 23 Jun 2025 16:54:20 +0200
Message-ID: <20250623145453.1046660-4-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623145453.1046660-1-fabio.m.de.francesco@linux.intel.com>
References: <20250623145453.1046660-1-fabio.m.de.francesco@linux.intel.com>
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

When Firmware First is enabled, BIOS handles errors first and then it makes
them available to the kernel via the Common Platform Error Record (CPER)
sections (UEFI 2.10 Appendix N). Linux parses the CPER sections via one of
two similar paths, either ELOG or GHES. The errors managed by ELOG are
signaled to the BIOS by the I/O Machine Check Architecture (I/O MCA).

Currently, ELOG and GHES show some inconsistencies in how they report to
userspace via trace events.

Therefore, make the two mentioned paths act similarly by tracing the CPER
CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13).

Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 62 ++++++++++++++++++++++++++++++++++++++
 drivers/cxl/core/ras.c     |  6 ++++
 include/cxl/event.h        |  2 ++
 3 files changed, 70 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index cefe8d2d8affc..9a37b08aacfea 100644
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
@@ -160,6 +161,60 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
 	pci_dev_put(pdev);
 }
 
+static void
+extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				int severity)
+{
+	struct cxl_cper_prot_err_work_data wd;
+	u8 *dvsec_start, *cap_start;
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
+		pr_warn_ratelimited("CXL CPER invalid agent type\n");
+		return;
+	}
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
+		pr_warn_ratelimited("CXL CPER invalid protocol error log\n");
+		return;
+	}
+
+	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
+		pr_warn_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
+				    prot_err->err_len);
+		return;
+	}
+
+	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
+	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
+	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
+		pr_warn_ratelimited(FW_WARN
+				    "CXL CPER no device serial number\n");
+
+	switch (prot_err->agent_type) {
+	case RCD:
+	case DEVICE:
+	case LD:
+	case FMLD:
+	case RP:
+	case DSP:
+	case USP:
+		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
+
+		dvsec_start = (u8 *)(prot_err + 1);
+		cap_start = dvsec_start + prot_err->dvsec_len;
+
+		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
+		wd.severity = cper_severity_to_aer(severity);
+		break;
+	default:
+		pr_err_ratelimited("CXL CPER reserved agent type: %d\n",
+				   prot_err->agent_type);
+		return;
+	}
+
+	cxl_cper_ras_handle_prot_err(&wd);
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -211,6 +266,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
 
@@ -378,3 +439,4 @@ module_exit(extlog_exit);
 MODULE_AUTHOR("Chen, Gong <gong.chen@intel.com>");
 MODULE_DESCRIPTION("Extended MCA Error Log Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CXL");
diff --git a/drivers/cxl/core/ras.c b/drivers/cxl/core/ras.c
index 485a831695c70..56db290c88d35 100644
--- a/drivers/cxl/core/ras.c
+++ b/drivers/cxl/core/ras.c
@@ -98,6 +98,12 @@ static void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
 		cxl_cper_trace_uncorr_prot_err(pdev, data->ras_cap);
 }
 
+void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd)
+{
+	cxl_cper_handle_prot_err(wd);
+}
+EXPORT_SYMBOL_NS_GPL(cxl_cper_ras_handle_prot_err, "CXL");
+
 static void cxl_cper_prot_err_work_fn(struct work_struct *work)
 {
 	struct cxl_cper_prot_err_work_data wd;
diff --git a/include/cxl/event.h b/include/cxl/event.h
index f9ae1796da85f..aef906e260330 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -285,4 +285,6 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 }
 #endif
 
+void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd);
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.49.0


