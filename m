Return-Path: <linuxppc-dev+bounces-15714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D557D1DEE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhps0pCbz2ySY;
	Wed, 14 Jan 2026 21:16:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385781;
	cv=none; b=fLPgqbqZKnpDumCtTI3eKDJpk6qL6636a9GZjJgBh7AmJXhxqVLC/rQGdxrfWdcyODFfIHC1VAsoN5M0yWEq81i0hAoz+/o65nbgNVuFaZk7tGU3bnhCNQ2gtkXVGowDkpNLnWlMx4kdVWJSZTORxStT0y0QYzwJuKq0iGy6V2nm7jOmiD0o1A9TIcQqBO0PBuGVol3LRaUFWhylLx9hDOnYbDrA7ajZtasSucv0Hg11zfY2JfBP45D00o0cpzB5d0EXvc3CK2YedGJxinrrWSKJZPWi0c+eM0/We82OzNH1EPhWEp/B0+9tgoQ7nojBaO+j+ySwDuBmH22My3UkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385781; c=relaxed/relaxed;
	bh=37qKSpMro1jyXnU4hp0Wo1Mya813n/3/8c9ILGvBC3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY+hskfk8atairluF+wvfpVQeSAKenO9d2oRNYHpklAUs6s4ldh5lLLQDJqy3m8Ih6kQjV4ElZktuP+BDr1fGvznJqzcleiJ6bB5NZkbn46/jZ/CQ3DQVUVfutgLfb4upLkdKoC+lTU9rUKMJelTVRraoyAA159IOcKWZPnefhmCMtv1MQv2zyUOTfUwEhkSYH1U126s2Fnzb4XjnjUYoH1nYZabGHzHNkj/Idw2H8yEsMp4DuKqNe0K4Q9AvC/59xq5IWW/1jhaneoQVXG8jkcP0gLXAy8f8TIGcZ8IXU1IrwlftE1NCI9z3GmgyEEqtItq5zXssjmXE/Sa1s6RxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/3+tmAy; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/3+tmAy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpr2Xkkz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:16:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385780; x=1799921780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WAaB4x5EtZX1hdIYOdIBpo/Pu2iiyrIR3CaAw6L8S9w=;
  b=j/3+tmAyY4rNum04wH8t1aKGlfMTjO2bX8FSeXh34OBwFqCOvbm59czq
   6o+8+WqWZ8OOY4EiBfdkrQacAM4DhEHFQcjeQTyHy9mdBVrtUsh5xl2Aa
   aOizfZ2Jj9YdXPK0DQGV39cdz8GJ8lff0TDySamiOHQxmhw4W3IaJj7yY
   6Fe59iPhgbWpjhROzOyT2tJeE8r+y+XLjayg4XwX7cfC6bu05isgBhAau
   hz+otxJ4J8mLbN/ruuiq0S1tOZjUrx1jJBxMJnBczMKbJPL+8YCRR8PvI
   ESYKAhND5ilkKNUZ8uVXnlH9C5fFw7eld8e4DsKsdr13F0LIAPHXFfp4I
   A==;
X-CSE-ConnectionGUID: oODkHoFgR7yDwP4giy8SOw==
X-CSE-MsgGUID: sBXHbSeYT9+zSBWxkS43Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765856"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:19 -0800
X-CSE-ConnectionGUID: sSiC9NvLSqmZspQj6bk/5w==
X-CSE-MsgGUID: gVtrgyGhS/qZviZ5bbmSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792798"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:14 -0800
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
Subject: [PATCH 4/5 v9] acpi/ghes: Add helper to copy CPER CXL protocol error info to work struct
Date: Wed, 14 Jan 2026 11:14:24 +0100
Message-ID: <20260114101543.85926-5-fabio.m.de.francesco@linux.intel.com>
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
index f3d162139a974..bc7111b740afb 100644
--- a/drivers/acpi/apei/ghes_helpers.c
+++ b/drivers/acpi/apei/ghes_helpers.c
@@ -2,6 +2,7 @@
 // Copyright(c) 2025 Intel Corporation. All rights reserved
 
 #include <linux/printk.h>
+#include <linux/aer.h>
 #include <cxl/event.h>
 
 int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
@@ -31,3 +32,35 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
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


