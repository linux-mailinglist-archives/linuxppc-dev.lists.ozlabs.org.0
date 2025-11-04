Return-Path: <linuxppc-dev+bounces-13764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE410C329F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:25:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1H2032Nxz3bfX;
	Wed,  5 Nov 2025 05:25:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762280728;
	cv=none; b=Oh2AVm/nwhB8DI5n8gCgZimAHHc0deKTJdXAtOHllcrorx3Peset9ByVPNq6rljbu7UbqtEdW++0YCT2Gy+RWywxgOo2dPPx8Pw/1RKVGS6bIMt9Uyf/KHdoyCZvSNSyBWF2WDu8wvV+5WBZa5jVa+ONl0O/zHmTw/ZNNwwZwan8aRD3p7gQHvvQ2MYiH86yCpdy6bdCXczEquygU0OHSV6HbkSmsp2jnVWIyXCbR/ObhLfj7uS6v8eWKti3eiD1wxUQRgLyAZxwU3kXLxSoS2/2ibaFysml99jh2bgYrBsErCWUdoiuwNTbEUn3XP9LBgPIx+MCucamwlsqwL2feg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762280728; c=relaxed/relaxed;
	bh=40F2G/tCDvgpy0jvjobPYTWZzRyg4iQgGAOWmZ8iJfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+e5v9Xut2IGeUjfjglytSPjF1WcJjXLkeeD6wbO2DQT2X1nY8XNNWvCraD1tJ5OyxstjtujqSxvNK/yj8V9ZJjaqOI7L5tNm+7lMxPrfDQhw1p1MBRNQoQNyZMQeA09lIjxuoJOPGhkZYBwcBGt7UhVaj6PCFtrjnDqdE1RrOHTw68kCMjzBNg7/xjAXjviJCGHUB5/ZduY/rpz8P8HqlMGt8DTA5CgO/K/IhuIbF5AF5DLctbHx8A/1nqn6EgApUkCB9csqWwd90plNUAo3GH2Xc/KpZHOPWUrCULPnZBzHajQDwL91XFC93LLl+Lbxz41/7WEV4zcP3/rrCCxYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ku80i7tL; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ku80i7tL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1H1z3BVdz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280728; x=1793816728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=juJtXgSRiOYqNUeFtIDyt8rosY/EPjrWHvZ2ju4d47g=;
  b=Ku80i7tLoacgyZ8SJfZNipfaLZSRNobE/4ZN94QSofWidGvxUnw9/cyk
   MSphh0Xy6t70Du7ZTU5LovznHZdO0EU7zSBF3nH6h0c7B1OnUCEgIDjtW
   Zm/SKxQchdvZ9KclzYgYko1MiEQR+fDq2Xxt2S6cxtrTEXfskh36QmzVA
   /vJ/6nHO1Eu7emQUJZSiaoTxpODpZHO9KqTuknfudeTo12vJdV+5EZfYk
   qm0Jub272ks/B8H64IKpMsGju1FYGoIwlq9otgXdfzH8/Skk3WjjP1H0m
   fevMqRSKJpDKjix5s6It7a2ZuE617VWFjbd3SuFccziEk9oNC6YnZTZuN
   Q==;
X-CSE-ConnectionGUID: kgjYkmbMRP+vKI2pokGj2Q==
X-CSE-MsgGUID: Yn4Xn3MJTIeEzLcxh7oVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74991574"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="74991574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:26 -0800
X-CSE-ConnectionGUID: 8m5SSZNuSw+bS+yaYbMORg==
X-CSE-MsgGUID: HMQrkF8GQnGkdgOGnzhoCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191325327"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:19 -0800
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
Subject: [PATCH 4/6 v7] acpi/ghes: Add helper for CXL protocol errors checks
Date: Tue,  4 Nov 2025 19:22:35 +0100
Message-ID: <20251104182446.863422-5-fabio.m.de.francesco@linux.intel.com>
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

Move the CPER CXL protocol errors validity check out of
cxl_cper_post_prot_err() to new cxl_cper_sec_prot_err_valid() and limit
the serial number check only to CXL agents that are CXL devices (UEFI
v2.10, Appendix N.2.13).

Export the new symbol for reuse by ELOG.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
 include/cxl/event.h      | 10 ++++++++++
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index d6fe5f020e96..e69ae864f43d 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
 static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
 struct work_struct *cxl_cper_prot_err_work;
 
-static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
-				   int severity)
+int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 {
-	struct cxl_cper_prot_err_work_data wd;
-	u8 *dvsec_start, *cap_start;
-
 	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
 		pr_err_ratelimited("CXL CPER invalid agent type\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
 		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
 		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
 				   prot_err->err_len);
-		return;
+		return -EINVAL;
 	}
 
-	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
-		pr_warn(FW_WARN "CXL CPER no device serial number\n");
+	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
+	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
+	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
+		pr_warn_ratelimited(FW_WARN
+				    "CXL CPER no device serial number\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
+
+static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
+				   int severity)
+{
+	struct cxl_cper_prot_err_work_data wd;
+	u8 *dvsec_start, *cap_start;
+
+	if (cxl_cper_sec_prot_err_valid(prot_err))
+		return;
 
 	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
 
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 6fd90f9cc203..4d7d1036ea9c 100644
--- a/include/cxl/event.h
+++ b/include/cxl/event.h
@@ -320,4 +320,14 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
 }
 #endif
 
+#ifdef CONFIG_ACPI_APEI_PCIEAER
+int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
+#else
+static inline int
+cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* _LINUX_CXL_EVENT_H */
-- 
2.51.1


