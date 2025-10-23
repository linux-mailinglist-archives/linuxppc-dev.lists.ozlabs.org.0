Return-Path: <linuxppc-dev+bounces-13208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D7C011F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslfN3Swhz3btM;
	Thu, 23 Oct 2025 23:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222444;
	cv=none; b=f3UjzMNRJaVYMAHBHuxnbFaYOEveCvw2I3cPlZQ6ND4ri1vQqQr/XeXI58t6O0VcDiD5WwDKr49eGeROOYKsyB7EVm1EaAZHP8kb2pKCafe/NcJhYdCOboGhlzSm2HsOXac51nuIHfTKPt03Vy8Ym6w6NNKZOosHtEE1B7ireVeXyQCuJlOg8/d486DJFsqaJDxmienvIrdL9xbx9Qy+bPMiOd4B0V09d9KseaOcEzzWp2mWe2HOcZCOFxxU7YjL0wbirMIsC0+NaSM5Q1YOPs2Ee6bi/fbL7PHK36SIYOXd71cqZxHrmYwRjqS+Taeya6x/MXsgQtEsPEs61yr2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222444; c=relaxed/relaxed;
	bh=kHoEh07Rq7UXNqOAmS/YYzA4Gr5MMFu1YNenh67VbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZp3KRFUCK/7TdTz4v1bfDT8FWjaKZdd1rZvr4F0aLtUmGK2R8HGPDtscTvBP9/qT/M/ExAQzGUccZd/JFh7vt2kP+/7xLfT+C00piS9YODVqEa/Tna1cWkBDYLoONMONWtx+LtK9n0FTG0iRCPDxr5eiEBfDQ94Blb6ItpHge/hh2gDjn6LdzHkGfZs12y8+0ESZIgH973EzwXm0fqghguYwsX4ODkkI+ZEhBQ45FWZ3X6zjmEQ1LGoDYwfR+VcdQw3o6dQ2a04JUHlWNF5QzUbRTCNuTbwvOX1dpCTfmpqFJvHEtKB/FBU3ROnKEhrWdjzo3DEOqJ8Vz4ifmgNCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcaD4Fbv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcaD4Fbv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslfM3g1Fz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222443; x=1792758443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3PEBfRTe7JZt2iqS1pUdjJp09lBaWXbuiuUIHEzIPCE=;
  b=fcaD4FbvrJx4cs/1WKML5KYsovIDgzjYTpb6ZATCMqT0NcbgE5/ysRIY
   PQAn8Q3+YAWEeY1fV9D6BCghF2i1P210K7RI6FmvghuTZLbThxzV8kKYA
   YMoB9OuAbkiy4aWpoU8Od6BXbTASMlGV0r4iBC01P9YRMVWi4eD5Hr9Dp
   /X3xqsAanDjp8My+8bgWFEmwbJvHi1ghIztAmX3n/d4dmRcPqJakY5Ecr
   C3p82xV1xDbCnoZLirvSeoAiNU5XJym4jIbD684Ar1QlwiKBsq2rNYjOK
   oI2sAeDlwpgVev4+RIB6usEmRUC83rncZNvB/gYWIYbZ11YW7PzgcGgLW
   g==;
X-CSE-ConnectionGUID: Zp0dVq6eQn2KLIR5BtjuFQ==
X-CSE-MsgGUID: nbqZrKNyReCqPmXR6lecjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74826042"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74826042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:21 -0700
X-CSE-ConnectionGUID: xiVafP0KT26HI5G6NsDhQw==
X-CSE-MsgGUID: h1ze7RpSS5+Tb8XdI3Q+8g==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:11 -0700
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
Subject: [PATCH 5/6 v6] acpi/ghes: Add helper to copy CXL protocol error info to work struct
Date: Thu, 23 Oct 2025 14:25:40 +0200
Message-ID: <20251023122612.1326748-6-fabio.m.de.francesco@linux.intel.com>
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

Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
type and copy the CPER CXL protocol errors information to a work data
structure.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/ghes.c | 42 ++++++++++++++++++++++++++--------------
 include/cxl/event.h      | 10 ++++++++++
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index e69ae864f43d..2f4632d9855a 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -734,20 +734,12 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
 }
 EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
 
-static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
-				   int severity)
+int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
+				      struct cxl_cper_sec_prot_err *prot_err,
+				      int severity)
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
+		memcpy(&wd->prot_err, prot_err, sizeof(wd->prot_err));
 
 		dvsec_start = (u8 *)(prot_err + 1);
 		cap_start = dvsec_start + prot_err->dvsec_len;
 
-		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
-		wd.severity = cper_severity_to_aer(severity);
+		memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));
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
+EXPORT_SYMBOL_GPL(cxl_cper_setup_prot_err_work_data);
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
+	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
+		return;
+
 	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
 		pr_err_ratelimited("CXL CPER kfifo overflow\n");
 		return;
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 4d7d1036ea9c..94081aec597a 100644
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
2.51.0


