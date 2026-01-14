Return-Path: <linuxppc-dev+bounces-15713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EBD1DED0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhpm6Pdqz2yPM;
	Wed, 14 Jan 2026 21:16:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385776;
	cv=none; b=P4buYReKCWmj337gKJ5q2WeBAKLjUZ/Fp59GGGIt8jKqwUHKwuVW7RaZfIfTgpuzQaJrhRwolRdbIQRQqCDgAHpFI+2W2GjfSrxSCCd77Mko9g+sncOjH2DykZh20fbLfLyPmywpTeqtfacd6ApEWA7kfb95qgdD4YejoSz29wXrAuzEmv4mT6pTgWI+Lj3BQZdGNDPq0ecZNxwAZYh7aJVXC9c6r3sEtRi41Di4TnEbeOqzlPU1E5bKvbQ97GEVhHXlWluY3L9NWXZk4WwSmumUd9oGX7vfFmG0PHVEfftvJS6gEOuXWjVG/t01gvrR+hqmhHDTeZD50LZUmlillA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385776; c=relaxed/relaxed;
	bh=rjaQEg79ylKoXtjUcMVMUZsdIr+jg2ymXN1STjW31ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqnPlb/G4l5dXZdLm9OrBUBw6mKrjBblXtb9+2Q32OBvs613q/RJLy5YfyoyumVaJLmLzxHZ3FW+pOCS/Uet3O36mDr134gIPsIrI5pq7AT4f2hCNDVapBvc64QvT6pKv30+p25DnxkQ26oaIKsM53eBDZSKSufHgzlDK9eF3a0l8v3EX/AW/NJ+UlZuxoVAbOBOIafAkbqUiI9gcKg+vWhHlWU7QsHvldwkjH40PGl7ADufKYuCgBOf6RML73WfnQWd1NGU0lOUmrFxayu6D8Ue+QcA88mHLQqn03eCUKLGYdpCiRIeZzEBiZ+lzn6+i60vPNzF3mXCAxeIW6UQ2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FYWhgScc; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FYWhgScc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpm01Rvz2yGl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:16:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385776; x=1799921776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3JeX3kfiJkV+SDsaXDPJu5yP2rFh1vT9UghvnBJ0jmM=;
  b=FYWhgSccVeTG7B52KOS3opmQYdQ4Drqc2bwP+yZYbnWM7idRTJ5tz3uR
   n/shJGBZ6MdEjKpLaYU1GDuYfkTB+7bE8YhMbalf7sv1/KwAky/jr2iQj
   i61pYJEcGrlQrcDzUSFk8jnMPZZWWTkd3of9HN+bwaqA4K/NX9RYO230y
   JPEamKCW8C8i1mkcfJGA0GtFF3t47gomGnW5R5dGxHX/G2sMBtPhp4US6
   1P6yJM9KDOeGDXF3QrSYldOKN9bTHikE4FQu+KtiRSxa/gwuCA9XGFbzA
   noO40K9noUH5GjM7ePKD5d6Pt+lq3ZX6HDCN5ju96OGgwUOKlVVd3JvYh
   g==;
X-CSE-ConnectionGUID: jpewhH3yQsaa2LG5wLsqVQ==
X-CSE-MsgGUID: skotYl/6SQKme6IoOwbmZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765840"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:14 -0800
X-CSE-ConnectionGUID: Wpgy8ZZWSSSt4c7WkpfkRQ==
X-CSE-MsgGUID: 5XnhheJpQyqsGJQ13GGE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792779"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:16:08 -0800
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
Subject: [PATCH 3/5 v9] acpi/ghes: Add helper for CPER CXL protocol errors checks
Date: Wed, 14 Jan 2026 11:14:23 +0100
Message-ID: <20260114101543.85926-4-fabio.m.de.francesco@linux.intel.com>
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

Move the CPER CXL protocol errors validity check out of
cxl_cper_post_prot_err() to new cxl_cper_sec_prot_err_valid() and limit
the serial number check only to CXL agents that are CXL devices (UEFI
v2.10, Appendix N.2.13).

Export the new symbol for reuse by ELOG.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/Makefile       |  1 +
 drivers/acpi/apei/ghes.c         | 18 +----------------
 drivers/acpi/apei/ghes_helpers.c | 33 ++++++++++++++++++++++++++++++++
 include/cxl/event.h              | 10 ++++++++++
 4 files changed, 45 insertions(+), 17 deletions(-)
 create mode 100644 drivers/acpi/apei/ghes_helpers.c

diff --git a/drivers/acpi/apei/Makefile b/drivers/acpi/apei/Makefile
index 2c474e6477e12..5db61dfb46915 100644
--- a/drivers/acpi/apei/Makefile
+++ b/drivers/acpi/apei/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ACPI_APEI)		+= apei.o
 obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o
+obj-$(CONFIG_ACPI_APEI_PCIEAER)	+= ghes_helpers.o
 obj-$(CONFIG_ACPI_APEI_EINJ)	+= einj.o
 einj-y				:= einj-core.o
 einj-$(CONFIG_ACPI_APEI_EINJ_CXL) += einj-cxl.o
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 0dc767392a6c6..cc4cc7ee8422d 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -713,24 +713,8 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 	struct cxl_cper_prot_err_work_data wd;
 	u8 *dvsec_start, *cap_start;
 
-	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
-		pr_err_ratelimited("CXL CPER invalid agent type\n");
+	if (cxl_cper_sec_prot_err_valid(prot_err))
 		return;
-	}
-
-	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
-		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
-		return;
-	}
-
-	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
-		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
-				   prot_err->err_len);
-		return;
-	}
-
-	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
-		pr_warn(FW_WARN "CXL CPER no device serial number\n");
 
 	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
 
diff --git a/drivers/acpi/apei/ghes_helpers.c b/drivers/acpi/apei/ghes_helpers.c
new file mode 100644
index 0000000000000..f3d162139a974
--- /dev/null
+++ b/drivers/acpi/apei/ghes_helpers.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2025 Intel Corporation. All rights reserved
+
+#include <linux/printk.h>
+#include <cxl/event.h>
+
+int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
+{
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
+		pr_err_ratelimited("CXL CPER invalid agent type\n");
+		return -EINVAL;
+	}
+
+	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
+		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
+		return -EINVAL;
+	}
+
+	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
+		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
+				   prot_err->err_len);
+		return -EINVAL;
+	}
+
+	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
+	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
+	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
+		pr_warn_ratelimited(FW_WARN
+				    "CXL CPER no device serial number\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
diff --git a/include/cxl/event.h b/include/cxl/event.h
index 6fd90f9cc2034..4d7d1036ea9cb 100644
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
2.52.0


