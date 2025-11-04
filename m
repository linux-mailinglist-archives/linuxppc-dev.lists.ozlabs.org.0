Return-Path: <linuxppc-dev+bounces-13763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75975C329EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:25:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1H1s6FrVz3bfQ;
	Wed,  5 Nov 2025 05:25:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762280721;
	cv=none; b=LCsxSIlLiF1lNTMxCaX3s9C+yduchK/oP8WkOr8UwwFzHPnNZglH7SJwSbyB9BFYQudTgBMI7yC7XjkhW23eKxZ8VgdlymSjIr5ZmgiJvizfooBM1c0Ylk5uqELN3xm2Ojez5IQQdIgzSeTzAD7arqSKw1HNNAm8jz2RKLg9jcjlPD1LRL/jYNud4Afwe72bYy3KBNPjJMtinlifmPxzo5WMKqIDUIk0SaaJTVMvhXo9TE8T4ZJVpUnh7OZUMBGBDIFRTVk4ohGXVTEFkbxtjPGa6CmJl5xPbR+ESTQ6zyMy/NGYMDK7UiMWWDnWL7JVSxtLMesjvWxBnplyqOB43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762280721; c=relaxed/relaxed;
	bh=wquTXQfKHTSYvPqGs2kh/OfsbM+Wxhdx0hdVCa7MhXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0k4t//zsHEIVyWnD254WsRDSkbTJz83e/HhYE4c8Grm7ycajtAI678YR1H6QM7wrpxntyz+Kp8zqQQ1J8ZmQcXbJEUxg6kHN4+pvtRjsJH8bkbkOYHSe/HtWS4G1KP1uIdZU+voOlj1odyPeMowlqfV9HaCEMJM8KJO4m/KnYvhJKDO+IeenyChYwHX/FlSAlXMv182ew5F++bbK2UP1nOUIzjn1UOHSxwq/GVggWoMIP80CuRNSj8l5qg54Bkzb2gzi2iJ7TAralWNY/0NliazOiVC6irHc9hC2jOXh6u42OrG+h0N/rGfdpCCw+UNXNI0WNwRVQ/57vRVuqn8eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XgJTRFj7; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XgJTRFj7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1H1r6gllz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:25:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280722; x=1793816722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QnhXMP7wXOVrP174faH3L+NNwVmNt29iN5MSC3ZkiGw=;
  b=XgJTRFj7byxV+uQ0IKfLMaRfeqLouzGljZkYeW/l1YKobYlGNWYrYDKB
   A7VlxwXOmPuJOQrWlZjdb5z+68q35yVFIufzzSRAJx6iwWRb3OKWqkf0k
   ZrHPN1Jyj3t9WOL++rF5wkE5SaQNk8/i3nZI9354cHNiOg/RsiY89C3w2
   8Nig7vuka/Q387rcvXZ9t1F8G0uPmJveASex/7YZbrgvFOwAst8lnzZce
   ZEs8H8VE89oZM21Bdsmc/UP33031ibO3vLe8PiWedVbvisASTa9eBDa/3
   u2FekutzsflJXkc+8JgqsLJMs+y4L8sY0PRPH5QOQjjomIZeN0Q+UMDbw
   A==;
X-CSE-ConnectionGUID: P46eMn4hQ1+tDwQtj04x+g==
X-CSE-MsgGUID: wl1QTFZITFW20ZLH1lXt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81791385"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="81791385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:19 -0800
X-CSE-ConnectionGUID: TFUlblptQpmM9/IBwY0GSw==
X-CSE-MsgGUID: 5/n0eOw7TxOgKhGVuQFCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191325308"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:25:13 -0800
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
Subject: [PATCH 3/6 v7] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Date: Tue,  4 Nov 2025 19:22:34 +0100
Message-ID: <20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>
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

GHES handles the PCI Express Error Section and also the Compute Express
Link (CXL) Protocol Error Section. Two of its functions depend on the
APEI PCIe AER logging/recovering support (ACPI_APEI_PCIEAER).

Make GHES select ACPI_APEI_PCIEAER and remove the conditional
compilation from the body of two static functions that handle the CPER
Error Sections mentioned above.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/Kconfig | 2 ++
 drivers/acpi/apei/ghes.c  | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb..cdf3cfa233b9 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -23,6 +23,8 @@ config ACPI_APEI_GHES
 	select ACPI_HED
 	select IRQ_WORK
 	select GENERIC_ALLOCATOR
+	select PCIEAER
+	select ACPI_APEI_PCIEAER
 	select ARM_SDE_INTERFACE if ARM64
 	help
 	  Generic Hardware Error Source provides a way to report
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 97ee19f2cae0..d6fe5f020e96 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -613,7 +613,6 @@ static bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
  */
 static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 {
-#ifdef CONFIG_ACPI_APEI_PCIEAER
 	struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
 
 	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
@@ -646,7 +645,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
 				  (struct aer_capability_regs *)
 				  aer_info);
 	}
-#endif
 }
 
 static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
@@ -711,7 +709,6 @@ struct work_struct *cxl_cper_prot_err_work;
 static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 				   int severity)
 {
-#ifdef CONFIG_ACPI_APEI_PCIEAER
 	struct cxl_cper_prot_err_work_data wd;
 	u8 *dvsec_start, *cap_start;
 
@@ -767,7 +764,6 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
 	}
 
 	schedule_work(cxl_cper_prot_err_work);
-#endif
 }
 
 int cxl_cper_register_prot_err_work(struct work_struct *work)
-- 
2.51.1


