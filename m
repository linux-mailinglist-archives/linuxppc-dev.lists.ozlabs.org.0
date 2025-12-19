Return-Path: <linuxppc-dev+bounces-14903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247E0CCFD8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 13:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXnHJ5B81z2ySq;
	Fri, 19 Dec 2025 23:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766148140;
	cv=none; b=AOtLiakSDK/FdsJFMcubko+4mqrsNGkpbUMS/+Rspfunnx8to37omnirMb61vQsiCDZg3OubUlK/OxegetjEQc9qL/d5S7gR1zsr4uukm0xry1UzkLR7BJto0HXTxJMSGz/htH3X/BAq2Rtd2t8JfsdSdsWbnrFiFpL80hd2b3ieh0W5RV4O3viQGzQfCP3ArkdDAhJD77Pc6WJLld3XWOnPJ3bJDVi6MqWh7AJKljyRKEoX4aLLOHDmmYwFm5kgPOYcESa98SMsGe/1NUw1ma1guOxAsOmzsFNbPSSwg1DvtnD3mDfa2jtEDahAtKhCPUirZjCdq85IB6iNYyXfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766148140; c=relaxed/relaxed;
	bh=lJd2HYJKXmoMm1qi5VZ7T0keA2TuXAIPvZ1Y0nxQksc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzyKPq3lrFTEk8YyJbtYS4zZi+FKuPg1gvCvyYB+DghCyTCNCiAK90cFG0EwO8hXGyG6HVuzKDZqUOrEHc3hzsd7dDhahVVg6V7up9QNgQOYUXyIeIP0SV9ORy3aYe41m/7ULmyF1avnMspoRumHOCuDmc0wDlfuLbT8j8jHJFysw0WaOWnxzTIriAk7fi2bvpXxGf7IgHfuKaY7DVofosSSdyK7B87lbgm/LzHIQGyRQ/QgrGhfhrzvHPc+77LX7xb5CSRw2SgRYa4LQZD1ABrWal65qGnolFysop3qUx+M4g+L3FSu4NBhQMNIxp56i3w3GuRxXeCEu4tqBjHJeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kK3ewFDi; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kK3ewFDi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXnHH5HSSz2yFb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 23:42:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766148140; x=1797684140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bMRmGR1rGj4puoieARiNtp/gc4NLDWlWUing+a+sS1g=;
  b=kK3ewFDiChHK6VrVA/8oJRLGMUHwlg8jKhR6Z/93sQ9d4P7LXJ+lv0Jk
   sUNWz+6Hz2IAGe9WALQlugaJ7BQG5X6R/kxf1s1m9Spf5VuiMx3hwy1EQ
   losCaHPVMk6Ck8Te5THFsXApcySl8b/RlUMxr5/ebEH+uwPjZXDLd8Z4J
   iXxydZX1gQgcZWWXsn8NHST/8506L+3qypAbyAkuzYh/tbpTz5gqjpta3
   c9mklSAJupSPz/p/zB4p9lAVQEPiJymmkKzNOO9j8E1W0A66asoTAxXsc
   l9FqPHvd4DASZPAglx1Y7eolt3tghY34sIggxzgRErJR0rh17X9BRxrZJ
   Q==;
X-CSE-ConnectionGUID: YoYNKRzSQf2QVN8Le9E4jw==
X-CSE-MsgGUID: NLCNIiNYT2qO8rZGz2g3eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78742751"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="78742751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:41:17 -0800
X-CSE-ConnectionGUID: H3MnhiU1To6NKkiRpLISDg==
X-CSE-MsgGUID: Jdb60cRFRhSXGqIZaj8JAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198444429"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.52])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:41:11 -0800
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
Subject: [PATCH 4/5 v8] acpi/ghes: Add helper to copy CPER CXL protocol error info to work struct
Date: Fri, 19 Dec 2025 13:39:43 +0100
Message-ID: <20251219124042.3759749-5-fabio.m.de.francesco@linux.intel.com>
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

Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
type and copy the CPER CXL protocol errors information to a work data
structure.

Export the new symbol for reuse by ELOG.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/ghes.c         | 22 +--------------------
 drivers/acpi/apei/ghes_helpers.c | 33 ++++++++++++++++++++++++++++++++
 include/cxl/event.h              | 10 ++++++++++
 3 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index cc4cc7ee8422d..79755587871fa 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -711,7 +711,6 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 {
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 	struct cxl_cper_prot_err_work_data wd;
-	u8 *dvsec_start, *cap_start;
 
 	if (cxl_cper_sec_prot_err_valid(prot_err))
 		return;
@@ -721,27 +720,8 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 	if (!cxl_cper_prot_err_work)
 		return;
 
-	switch (prot_err->agent_type) {
-	case RCD:
-	case DEVICE:
-	case LD:
-	case FMLD:
-	case RP:
-	case DSP:
-	case USP:
-		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
-
-		dvsec_start = (u8 *)(prot_err + 1);
-		cap_start = dvsec_start + prot_err->dvsec_len;
-
-		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
-		wd.severity = cper_severity_to_aer(severity);
-		break;
-	default:
-		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
-				   prot_err->agent_type);
+	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
 		return;
-	}
 
 	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
 		pr_err_ratelimited("CXL CPER kfifo overflow\n");
diff --git a/drivers/acpi/apei/ghes_helpers.c b/drivers/acpi/apei/ghes_helpers.c
index e5f65f57d9ec7..8b7f330c97b29 100644
--- a/drivers/acpi/apei/ghes_helpers.c
+++ b/drivers/acpi/apei/ghes_helpers.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2025 Intel Corporation. All rights reserved
 
+#include <linux/aer.h>
 #include <cxl/event.h>
 
 int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
@@ -30,3 +31,35 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
+
+int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
+				      struct cxl_cper_sec_prot_err *prot_err,
+				      int severity)
+{
+	u8 *dvsec_start, *cap_start;
+
+	switch (prot_err->agent_type) {
+	case RCD:
+	case DEVICE:
+	case LD:
+	case FMLD:
+	case RP:
+	case DSP:
+	case USP:
+		memcpy(&wd->prot_err, prot_err, sizeof(wd->prot_err));
+
+		dvsec_start = (u8 *)(prot_err + 1);
+		cap_start = dvsec_start + prot_err->dvsec_len;
+
+		memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));
+		wd->severity = cper_severity_to_aer(severity);
+		break;
+	default:
+		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
+				   prot_err->agent_type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cxl_cper_setup_prot_err_work_data);
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 4d7d1036ea9cb..94081aec597ae 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -322,12 +322,22 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
+int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
+				      struct cxl_cper_sec_prot_err *prot_err,
+				      int severity);
 #else
 static inline int
 cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 {
 	return -EOPNOTSUPP;
 }
+static inline int
+cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
+				  struct cxl_cper_sec_prot_err *prot_err,
+				  int severity)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.52.0


