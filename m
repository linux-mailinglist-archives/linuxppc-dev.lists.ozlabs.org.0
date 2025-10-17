Return-Path: <linuxppc-dev+bounces-13012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8DBE8E2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 15:35:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp5Rq5Xrzz3cgl;
	Sat, 18 Oct 2025 00:35:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760708135;
	cv=none; b=UxO9RN8V/wLqQNxWwyDvPoml6AW3vy+DiskGNzVV6ogOvdXJ/jk+Ni1COlbWJxpSK0tOKN1YbgpXsWHm/IDiuW9MSu8Cgi8Po12aOLp31AWD67AD4eJUCfyIY89oFCEN3sDfltjR6vkoQjxgLL9vxF5zcHOr19IwZbv84k9YBcC2TpWj3+95Ed/Ga00XBE0jFmJqkhNkn7ToH0moMnnAwuBnf/8zrrZNC9s0XkjcDy1f4ogr2IyvuMlhg3Eft3PUGfxQVmZzFGHIWI6KTZEo/msVtrcYVwSD4Z+CJBSllDReN2HgPlkd88/Re0j+Pwx1Y0F8rTy7TYr/P/JQ9zp1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760708135; c=relaxed/relaxed;
	bh=5PmFhauvbaIInmZt7SOagVyTd7+VADuHLzV3prwo08Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj7KdATeadmlD8jeWvDLiyr3vxjQfyOqY6iEnBHYQb/W4ePOsVOH63PZBdvEAST/xQa6hbGVDaGoInwqu7iUfLKX3igP046+YaxZ8dAWWqYKS08djMjDdxpJ6FKo0yGR3ErLq4Ag2eDb4dVkfgHDGkZ/FZ+eyfSyrW/yKefCg1SPZo6qXH+d99HrYZ1VKv6gMQSJcVJTMg5nxEgIslnPVLfMchWCgipXlG0qE3szh/afamElFT6uACoHrGjLHOoMi3Q7r0EEYaulJoSQgC/RlD/hRvj2Vur9M+XNazzfjOegeLwMAFWo7QKVuag8tBn8QwtmtdKO7ohcpgI71xtEYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHo8Jb1f; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHo8Jb1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp5Rp354tz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 00:35:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760708134; x=1792244134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84zYUBs58TPuLt5DtEUEpeEKcZIouLRzd18oCcQNbrQ=;
  b=mHo8Jb1fs6tWR1jBiH7zlXktDRoTWpfUUGqdhTrlbMfyPy1c1AIZZi0M
   uGQbWFG5bmZvi/RPY+O0f943wQR+lYTvf2w7cKQ6mUZ9hzcLksvdC4xWj
   bTWbd0UzOX+u4UXe4xQpLeRx5I2JBIzTkE4MYa71L89aCV1xSz522caoU
   3nhEuZcaC2ltHiMCG+koxSz9bGflDT8lhlJq8/B4duBEfcQyB+UXc87Zv
   hPdw9MFgm2W1lgGeAb2WjK1K0/I+74jh9aNSSd121uJDvRapL01b7KTzg
   m1oq2XJPaZ5eRvagnN2It+TwC8PDBdGt0HPh0jF5ZsGLw4nGb2hWT2DFP
   w==;
X-CSE-ConnectionGUID: STeFl2xWTw+Bxvj6Gu7ECw==
X-CSE-MsgGUID: p31cz/ELTYum/CC0fFszUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63065005"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="63065005"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:34:59 -0700
X-CSE-ConnectionGUID: YrbVSnjgSnCOxL/V4X/weg==
X-CSE-MsgGUID: bk2G3qJwRzmBCUhwOxHDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181925088"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.215])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 06:34:45 -0700
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
Subject: [PATCH 3/6 v5] acpi/ghes: Select ACPI_APEI_PCIEAER for GHES
Date: Fri, 17 Oct 2025 15:30:48 +0200
Message-ID: <20251017133357.1150982-4-fabio.m.de.francesco@linux.intel.com>
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

GHES handles the PCI Express Error Section and also the Compute Express
Link (CXL) Protocol Error Section. Two of its functions depend on the
APEI PCIe AER logging/recovering support (ACPI_APEI_PCIEAER).

Select ACPI_APEI_PCIEAER for GHES and remove the conditional
compilation from the body of two static functions that handle the CPER
Error Sections mentioned above.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/Kconfig | 1 +
 drivers/acpi/apei/ghes.c  | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb2..c265b54d810dc 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -23,6 +23,7 @@ config ACPI_APEI_GHES
 	select ACPI_HED
 	select IRQ_WORK
 	select GENERIC_ALLOCATOR
+	select ACPI_APEI_PCIEAER
 	select ARM_SDE_INTERFACE if ARM64
 	help
 	  Generic Hardware Error Source provides a way to report
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 97ee19f2cae06..d6fe5f020e96e 100644
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
2.51.0


