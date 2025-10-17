Return-Path: <linuxppc-dev+bounces-13015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D1BE8E44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 15:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp5S2665Bz3cm7;
	Sat, 18 Oct 2025 00:35:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760708146;
	cv=none; b=oDZ4kiyl8HoPLsISwAa9QSMl761Zv4iLZikWKDDEoJIQ6z4agsXKrE11zMZg3/jVTBvL8vJZRyF/DuaVVICORM1qmkiwF0043ysSMoEgqNlwgGzM7HThFEE+YdARYAQn2hO7gCjcnGYCvJQI84XY0fauHHWClFYpC1iimhaOJcMa/mK2zqxvm5ErRzZ5e6EVNgrWsjc73Fc5h0RTTx5QMJTr+zqEjkoCoh4kgUJPFmZBErUr/321KywQn0JQquaXjC4bcYtsmfvDZNEeAhvvDHr6Vckc0F9rbByb0Qy4p9Ua1dbUW5KcqEV+WQDu5gGnaOJtV3w7gv/kscPpK0KfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760708146; c=relaxed/relaxed;
	bh=M6CvyjvU74AxpjcvBhC17vJd+0NPmS49+aqYBklCTS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbPTRR7E1fjXB8y2cR0VSGH8aAzsJpEwj/sC2luPV71Dwch2+kCYBfrQhPe50askf5c+nY1KS7pug0/+NqN9orc5HeBhziOMjqq/nGKAvEGyeSZuQFLG1GlinShCBAieVXBCfHWPPU77x7qWUQe/5UZHb/pD65LXCFyKV3wRM/jmvnUi779TxnNUuhTVjPfFLTcwtz/8Sa2yPo8z/eqEo7I6cef5z4ht9TzHo1spdUHy3YaOKSpcM6Rgf5rZV00KAw1dC2hD2WJhbypheIuaImppx7D+mszlaEPDNxDxKlQqhEozqptUb5HE3OYfS15fwkLQsurnAcqjW5Cy7g7D1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHUbAit5; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHUbAit5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp5S15pXJz3cl9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 00:35:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760708146; x=1792244146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6cWsfVK2uywEugF7lxsG4Yh9ydRfGMntJrHORzhDVkE=;
  b=hHUbAit5MRLWWLDLyw+vh9x9wqFccNkeuiJ1zwxV58j+HEYuIBjF7bSm
   9EvGBTBLC05UufIIH+eByL3IZOViCyPXINnNPOLPsWDc6vkIExP5h6KaT
   bvULZSRkQ+ho/i+HUX1kYL07heofKCUTIHkglg1URB/yPJ30PXuA2ies6
   G3/Xxawk8QPeBEt4SOUM/FdyWcOGxNAvH7PTu+EfKYrUoB/oSsmFYE3UK
   ELYibTnVD0qavebo26v7VFmhqrhwlghEEUpKOdiTeZw/i5oFyIAyRQx51
   ISTpJQBCkO52dP/zqQeJ061x5YUurK2N32jClbZsx3zut0jz/op9FmNqH
   g==;
X-CSE-ConnectionGUID: CrsIg/vmQHCvwbEJmmBN8A==
X-CSE-MsgGUID: JFdv30C+Qjqbrbt09YGaRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63065080"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="63065080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:35:27 -0700
X-CSE-ConnectionGUID: gKeP+cXbT6ax9cP8SQcYig==
X-CSE-MsgGUID: H6mglz3GRx+7F8DG4fPbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181925286"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.215])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:35:14 -0700
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
Subject: [PATCH 5/6 v5] acpi/ghes: Add helper to copy CXL protocol error info to work struct
Date: Fri, 17 Oct 2025 15:30:50 +0200
Message-ID: <20251017133357.1150982-6-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017133357.1150982-1-fabio.m.de.francesco@linux.intel.com>
References: <20251017133357.1150982-1-fabio.m.de.francesco@linux.intel.com>
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

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/ghes.c | 42 ++++++++++++++++++++++++++--------------
 include/cxl/event.h      | 10 ++++++++++
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index e69ae864f43d3..e0f8b8ed2b7c4 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -734,20 +734,12 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 }
 EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
 
-static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
-				   int severity)
+int cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,
+				     struct cxl_cper_sec_prot_err *prot_err,
+				     int severity)
 {
-	struct cxl_cper_prot_err_work_data wd;
 	u8 *dvsec_start, *cap_start;
 
-	if (cxl_cper_sec_prot_err_valid(prot_err))
-		return;
-
-	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
-
-	if (!cxl_cper_prot_err_work)
-		return;
-
 	switch (prot_err->agent_type) {
 	case RCD:
 	case DEVICE:
@@ -756,20 +748,40 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 	case RP:
 	case DSP:
 	case USP:
-		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
+		memcpy(wd->prot_err, prot_err, sizeof(wd->prot_err));
 
 		dvsec_start = (u8 *)(prot_err + 1);
 		cap_start = dvsec_start + prot_err->dvsec_len;
 
-		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
-		wd.severity = cper_severity_to_aer(severity);
+		memcpy(wd->ras_cap, cap_start, sizeof(wd->ras_cap));
+		wd->severity = cper_severity_to_aer(severity);
 		break;
 	default:
 		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
 				   prot_err->agent_type);
-		return;
+		return -EINVAL;
 	}
 
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_copy_to_wd);
+
+static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				   int severity)
+{
+	struct cxl_cper_prot_err_work_data wd;
+
+	if (cxl_cper_sec_prot_err_valid(prot_err))
+		return;
+
+	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
+
+	if (!cxl_cper_prot_err_work)
+		return;
+
+	if (cxl_cper_sec_prot_err_copy_to_wd(&wd, prot_err, severity))
+		return;
+
 	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
 		pr_err_ratelimited("CXL CPER kfifo overflow\n");
 		return;
diff --git a/include/cxl/event.h b/include/cxl/event.h
index e1deb66c2197e..5f06cea5d6005 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -322,12 +322,22 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
+int cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,
+				     struct cxl_cper_sec_prot_err *prot_err,
+				     int severity);
 #else
 static inline int
 cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 {
 	return -EINVAL;
 }
+static inline int
+cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,
+				 struct cxl_cper_sec_prot_err *prot_err,
+				 int severity)
+{
+	return -EINVAL;
+}
 #endif
 
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.51.0


