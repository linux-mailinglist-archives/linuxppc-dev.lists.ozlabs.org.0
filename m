Return-Path: <linuxppc-dev+bounces-8163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B8AA14E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 19:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn6Yl4c3vz3bm7;
	Wed, 30 Apr 2025 03:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745947307;
	cv=none; b=KDcBAHY6EW16R427MJxEj3GzPe4NMnIrDi6zCGhvf6Q4FsiXO6d58FWRiPhumnKGwjbFVlQcOcn8p49KFZb4l7kSZZ//tblQxAqPZkWyd+k/oboQn2rFbudclj9/7fsXfdHAxOB/09lOvmkWT9WVm2mj0q4QqHk78uOMMsIN/0ab3RaPB8A3jWDT3+7vxNUpo2bZR1ZZ1QCjVIOvogL7sjpIbjr2Vifo+56OJaUUFj42/pClc8mHntA54QnXiClaMaL+iCAU51LTHCvPa498L09BmiLnYb1btg3iY3wf3EUVpDSl5XOjeAhvy9FJGQTrxiTyAEEhJgZN2YsVZxPcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745947307; c=relaxed/relaxed;
	bh=T8m2y/5m7rpgXa1zInJg1EuMT25wx/aLTvlyz96qP2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBKfaxjOiQnkkoUtLkYO4ib9Ag2GaQOoyC4f5/MWD9zEAiFFdqIG1n0DuCfHNjtj8TicLgjVasFG8HJudhOIqaq8rolU6Px6VQayACK50upNEk/Ao5q4k9RPvJbG8925gm72RuJVMitVR2yxjZ8qfB52vvRDS2Ohon2Lnu+QhKbkzCvDItYo6kMp4/GSQYg4Meew85I0Y3TPnebfwuJRQcnnn7ocEIn8PCrGVO1NENS4CPDUxa+SMBuLHnQADhrHYcsVLDRVyMfvCSlkXpWjLTNiXWqvk9nJeeUlWUCN9eWZ9CqGCYOvClZ4lgKaQ5Q+HjZT9jMljSNZ4DVwUPrhbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X6DrCkAI; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X6DrCkAI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn6Yk5lHlz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 03:21:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947307; x=1777483307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NBgym4/EikYuDm0nWfg1osxoAlXmaBFRDdG5Co6GDM=;
  b=X6DrCkAI6FRs80hJngKR+j/ENZns/hr6/P7KQj0Pf6Onf56gKXC/slqf
   9FpGFONuz2Wg2l4ItVOkYBbW1R+bD3h2Dop4aFhoMCDF8mkX+DQr4aCQd
   TjOk0fCADTRZ9VAKvYO1Ql2mh5esg1mlQcYN/dkhH/EbH/zEdU7V0cJLu
   LabHCDXtKo4lMJzsmAhJW+IykznxKJEFMtNUrFanJKYlCYHp0vanjbbCs
   W1Xtk6JaJOaU5+yDmrEBwmyKW8FZ57iOgbGBBvf2MUIBz59H2I4wdKcPs
   GEHjZRh620Zxo//yPwIUVimRN1v8m1xYRnQEOh/x/dafd7PDJoY7YR8SH
   w==;
X-CSE-ConnectionGUID: v37Dv9E4TpWXZ83814g5aA==
X-CSE-MsgGUID: zdFGwk9aTMS/GSk9ItBd+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64996986"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64996986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:46 -0700
X-CSE-ConnectionGUID: RUWqMx43T460pY1p/OsbGQ==
X-CSE-MsgGUID: XEHwzn+VQVSbGGyfW1jiqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139073357"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.45])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:41 -0700
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
Subject: [PATCH 4/4 v2] ACPI: extlog: Trace CPER CXL Protocol Errors
Date: Tue, 29 Apr 2025 19:21:09 +0200
Message-ID: <20250429172109.3199192-5-fabio.m.de.francesco@linux.intel.com>
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

When Firmware First is enabled, BIOS handles errors first and then it
makes them available to the kernel via the Common Platform Error Record
(CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
via one of two similar paths, either ELOG or GHES.

Currently, ELOG and GHES show some inconsistencies in how they report to
userspace via trace events.

Therfore make the two mentioned paths act similarly by tracing the CPER
CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13) signaled by the
I/O Machine Check Architecture and reported by BIOS in FW-First.

Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++++
 drivers/cxl/core/ras.c     |  6 ++++
 include/cxl/event.h        |  2 ++
 3 files changed, 68 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index 7d7a813169f1..8f2ff3505d47 100644
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
@@ -157,6 +158,60 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
 	}
 }
 
+static void
+extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				int severity)
+{
+#ifdef CONFIG_ACPI_APEI_PCIEAER
+	struct cxl_cper_prot_err_work_data wd;
+	u8 *dvsec_start, *cap_start;
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
+		pr_err_ratelimited("CXL CPER invalid agent type\n");
+		return;
+	}
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
+		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
+		return;
+	}
+
+	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
+		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
+				   prot_err->err_len);
+		return;
+	}
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
+		pr_warn(FW_WARN "CXL CPER no device serial number\n");
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
+		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
+				   prot_err->agent_type);
+		return;
+	}
+
+	cxl_cper_ras_handle_prot_err(&wd);
+
+#endif
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -208,6 +263,10 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
 			if (gdata->error_data_length >= sizeof(*mem))
 				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
 						       (u8)gdata->error_severity);
+		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
+			struct cxl_cper_sec_prot_err *prot_err = acpi_hest_get_payload(gdata);
+
+			extlog_cxl_cper_handle_prot_err(prot_err, gdata->error_severity);
 		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
 			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
 
@@ -375,3 +434,4 @@ module_exit(extlog_exit);
 MODULE_AUTHOR("Chen, Gong <gong.chen@intel.com>");
 MODULE_DESCRIPTION("Extended MCA Error Log Driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CXL");
diff --git a/drivers/cxl/core/ras.c b/drivers/cxl/core/ras.c
index 485a831695c7..56db290c88d3 100644
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
index f9ae1796da85..aef906e26033 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -285,4 +285,6 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 }
 #endif
 
+void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd);
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.48.1


