Return-Path: <linuxppc-dev+bounces-13207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193BC011E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslfC0ZVsz3bpS;
	Thu, 23 Oct 2025 23:27:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222434;
	cv=none; b=LpzazAvUNDlUQkGS+ske2bQ/hJa562a9eBoqU+Dob8+JVQQS2dKJ1xGPB/jXmqy5lLTOveSz72dCNhMpb8hSkksRnsQaDUa/nzYcdUgOc1nBA3w45I1E1BrRTp7GA9WFe4SSqtZ0obyzxQuvX7eXfXoX6smZ/0SlXwWZbmlQcAtMuKAKFf8o5xHcuMKSMckGmfwjk9YNWTKPoPeYXBXZwiLDoyYr0zucliw6+LSIn6wrHInxQLhnpdzajDvvm6Ncvm+9bqB2jTxt9t3lVkYELRSRlKqNDpl/VlKwT507kpZ17kVV3uEMkcID3bO3fCxFNRjCT/vATNR4+qkogyYcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222434; c=relaxed/relaxed;
	bh=qBm5c9U6NdPSZ2RgNJL3JKL+FtvTFrhKeb716G8lDDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mer7PIY0GVA3SGinwP467J3XWxNgz3d8Xf6o9ed9s6B9xz8iPB0VtaISh8L9a+Y5s0wojBe399qcLzvK+bgjdgU//8oRMEvVKeZRdqKOeM3l2aHMznpSOxFwrMdfhCTeaDABreN9egIWE0vABA/9vT5LcwAvvsmVQ8TVE5spkTNAtcUtoHKe5uqFAMRQljIlfS2UtRFSaWyQvJkY+fmtUcHE51VV7VdgsEFE38qnMliwfsP6YEVRDQP3MTNQ+lOJ6/Tif64rcD9uU6DmWn5Qygkt8ddzGsCZFQDz0YpOfBmanVMN7e6vSK9DRl7d2DyBP33lD7DsD6OLQto6PSaMBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2aTobyF; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2aTobyF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslf94s40z304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222434; x=1792758434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m/rUtA0AMDKt0v+zqAAwnwEJS8vRn5weJur5wdFlyLE=;
  b=f2aTobyFjdjLArItptROvoL2PvD6xmpPFU5P42N2pPkgRR6zzsvrFDka
   vIasrbpkWEOPPhlAyzeGYOC/WnD+bldmLbn4b/awNpFbXW/nDxQ0ZEZEE
   kUxpqZcJoM8pJTqxJzNYY/VOXna9ekt9tHkMCw10477re/84EELh6TpHG
   COD30rojKG7hXODidcm0zmSLKERQvmaU7sdFYfeIzsMyCmLJWCU8ALEsP
   HsUz9EyuadkHjmiKDvD4I4tkpmSTh4GNHDJTbq0WX5tLnee7xCilMH78n
   l/2VYQ0BiRY1HwX4nCrD/yqrOj5HPPemPajxhyAxj8XMuug3AF56YrUk2
   Q==;
X-CSE-ConnectionGUID: ta7xZ77wQ4+AF3U/Id0Pkw==
X-CSE-MsgGUID: VYKsmyrZQvGQ/QyQPOI3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63292730"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63292730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:11 -0700
X-CSE-ConnectionGUID: iomVXMNYQgSrdGJDUxuTZA==
X-CSE-MsgGUID: eXgs3qMmTeG2602MVH+ETA==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:00 -0700
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
Subject: [PATCH 4/6 v6] acpi/ghes: Add helper for CXL protocol errors checks
Date: Thu, 23 Oct 2025 14:25:39 +0200
Message-ID: <20251023122612.1326748-5-fabio.m.de.francesco@linux.intel.com>
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

Move the CPER CXL protocol errors validity out of
cxl_cper_post_prot_err() to cxl_cper_sec_prot_err_valid() and limit the
serial number check only to CXL agents that are CXL devices (UEFI v2.10,
Appendix N.2.13).

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
2.51.0


