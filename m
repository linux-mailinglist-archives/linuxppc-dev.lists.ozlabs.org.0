Return-Path: <linuxppc-dev+bounces-13210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B4C011FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslfb6wTwz3ccr;
	Thu, 23 Oct 2025 23:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222455;
	cv=none; b=aUrZyoxX0U9rdezhz8DF0XtOUJ3s+7JAV0fP9RVD7ldnrv/se9jGx1Ifojc0RlTQn9B6unOLBEBxn6SiukTN8UeZkd4dKx6l5x8ugWY0mDWSSTizX0ULp9NV3M0AswGMUUrlUxQ4MhqfBArQmQmNYnmpLt5FJEhuMtN0KrHoHd6JwfEd2zCjQFZwrnRQhOTiff/o79sCqYOxGP9++1bo45OcCf/3GGK9L8ekezRe4EEw4a2vCopki4Kk5P66xwC/l5SqyeZLAG3w/0PRGc8/yX5q5ZIziw1CZhOi0+VcMqw1//kRILd47XsPgIPqwQ09UbVFSZzFUt6XTpg/tOwv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222455; c=relaxed/relaxed;
	bh=qwV4OQ/fx+KgI6eccakUaNKbuzwVwLDYnkkc3X78iW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7VoEgRoVtJsvz786tbGvdP6+gV1uaDTddhKkPKivOxerElhCkH1IFPbvAbbw7MqC4TAATMVwRy4DXxX22Ay2/QhBdrLdVJOeyYFvnLxflmKDVEOTi590Q9JAMHfKqtdyyGbuc1RrBd3NIiMaTlfr1oH17BQpOy7lCrti/aIO2O47dhzQT3qpAw1wmRTuh6DdlWzVWadnagX7WxZ82gkYaE6dMx5cODFtP7xLS6PuAy3ZNT6WIAWmfjTmUy3mh1Df5nK1Rb6IShPphzUZyjmwkfkblMvff/6a9qUSXrl6RLERUKvkqDpc9bXONoiqetlstlYaJuSj7KvsigowTCBiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kLOwk+iZ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kLOwk+iZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslfZ44RTz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222455; x=1792758455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/SKJMBBXIi4BBnOq3DOm2MRNiysuabmj3qpcAOW/T14=;
  b=kLOwk+iZ0zAb1OtliYVDQZrx11hpjP60z4LEpEwWYXEiz37ooeqiyiCG
   QTggHLDN3csLljy5W2GZIzIli5IDPPj2wA02k0oSTx4bgnTB8BXk9BpJI
   2hDibe15WKd3YGQx7OfkQIv+bVl5m2tt4KZPe+u5mKO2SkzKkRrXLKQbp
   MqXRS6b5sbeJsK7ho584Gz6wPz5uGea8NXcIXDv1a99upDEm+OeK/MQ1r
   0YgOVCBsO0kS5Y8SbfgX2rPpXJD/Tx6C/bezqx3LwQcr0LDp2fFEhQRJg
   ObttTgvryqxfzZQ4S0eibUnTIDVK5OQJGgDD0R3Q4f2ITNK9tHJrL+ec+
   A==;
X-CSE-ConnectionGUID: /0ORo7ShRDyKFrguK0ZIXA==
X-CSE-MsgGUID: iYrkY+9cSteGgb9YU4rb5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80825120"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="80825120"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:32 -0700
X-CSE-ConnectionGUID: eVbxBb7SQ/i8LRB8thKqYA==
X-CSE-MsgGUID: Ius4tWmQQ0C1CmpM/ISuzg==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:21 -0700
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
Subject: [PATCH 6/6 v6] ACPI: extlog: Trace CPER CXL Protocol Error Section
Date: Thu, 23 Oct 2025 14:25:41 +0200
Message-ID: <20251023122612.1326748-7-fabio.m.de.francesco@linux.intel.com>
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
 drivers/acpi/acpi_extlog.c | 22 ++++++++++++++++++++++
 drivers/cxl/core/ras.c     |  6 ++++++
 include/cxl/event.h        |  2 ++
 3 files changed, 30 insertions(+)

diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
index cefe8d2d8aff..b005918517d1 100644
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
@@ -160,6 +161,21 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
 	pci_dev_put(pdev);
 }
 
+static void
+extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				int severity)
+{
+	struct cxl_cper_prot_err_work_data wd;
+
+	if (cxl_cper_sec_prot_err_valid(prot_err))
+		return;
+
+	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
+		return;
+
+	cxl_cper_ras_handle_prot_err(&wd);
+}
+
 static int extlog_print(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -211,6 +227,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
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
index 2731ba3a0799..3f527b0c6509 100644
--- a/drivers/cxl/core/ras.c
+++ b/drivers/cxl/core/ras.c
@@ -105,6 +105,12 @@ static void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
 		cxl_cper_trace_uncorr_prot_err(cxlmd, data->ras_cap);
 }
 
+void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd)
+{
+	cxl_cper_handle_prot_err(wd);
+}
+EXPORT_SYMBOL_GPL(cxl_cper_ras_handle_prot_err);
+
 static void cxl_cper_prot_err_work_fn(struct work_struct *work)
 {
 	struct cxl_cper_prot_err_work_data wd;
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 94081aec597a..a37eef112411 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -340,4 +340,6 @@ cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
 }
 #endif
 
+void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd);
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.51.0


