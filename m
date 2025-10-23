Return-Path: <linuxppc-dev+bounces-13206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E0C011DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslf06xffz3bf4;
	Thu, 23 Oct 2025 23:27:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222424;
	cv=none; b=aeEw8YKOvsPhZRUnUe/yU3DmHxduAhsaNm28eSmdQ1t/wUF4qt0Hxsr2huJdr9KViB/czFjMvPanF4L7GPhhFEt7H+B94Y5tPoxZAVqUpnLGF09h48uofgV3lGR/+cVDyu0WsoS+6oBx3RRByv9KJyuQowjWGWLDRzOL76MCXubshSrWCTfNW1BWhC2KAIQXBdlXIV2jCfljJPLoeYnQxkSTkI3ptFOqDJdY3rhVBg9IvI1zmYOwRxf+X3emIrgdhgCMKYgthFHXGujGEak/2JVNwYCGFOpyef/RWpHqB9M8tHBjI/5HwY7Pf4SKAD5706w46cnDvcOdbI8sdt32fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222424; c=relaxed/relaxed;
	bh=B+wu5n9qUSWZoivSCh1PyY+rrCbIF0emhSS99A9r+U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUYJ9UlVE0B/jnc7+JsHGgmsnEfNyf8k8V9mwyy5J5/Hii2Ak+75yyzz1ysb4ki0xUEhEhURw2TaNN3BPCKzGMcejwBek8V8LKePVrUNPGgPMk3YPlQwa5o1FbwrEJoPNvEeaen5V5E8jtXkkFQPGwkvVb2AKCaX8qoZFdvFVAsNS+8eZUcYJRSrH8N0P2F4c6pSV7LjtySzA0f09Nw93TL+WSR5lSGvyQSApsfRPzr5Yz1JOpM7OLe5c1AxFWijpnJtE9Q5fChKPqoSFKHjs9aB4rvOoKa08EwFRacFppN04jZM/6Nt/cWJHpVbU+x5pRiJ8VZJ4nz6A8PDrsHFUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CI8+Sn88; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CI8+Sn88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csldz568Mz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222424; x=1792758424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PbFADBLewu37LDKf0I/qUmCC86OvOzKhoSduxuMrrMw=;
  b=CI8+Sn88cczUWzEklps8zsBeWIljRZKP4vHdNoQoZgaz414rlGf96q6W
   M7Ly5rpm5PxSz5Aviq8FkDhTGoCTuHKZC8Mn/LTKFSjccNrE2xfZwpJyt
   cKFI1Wq2PVZngk2hrWBAuRcnoQ/v5l6hGBXQHQdAKRzjc7Vw+2j6j16Gj
   GTl4nGJsGNqfJVbGdKyK0nAR/HW8zyI4mhmLhwxE+3q6M1y871qHaFR0/
   Vg8e8kNX/LFllEvgcot9kRHvnTfA2uK5nG+Ehln9NoYxUwlIgTpm24slr
   w7C27fSjDl6w+hTgl3b4neFOc2gCorQxpVxERdEch5P6i5VgNdhCwPvYp
   Q==;
X-CSE-ConnectionGUID: jrhg4E6+RN6f1Rkqv7x+lA==
X-CSE-MsgGUID: Lu/C+SC3RdWP7i0T1BmN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63282556"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63282556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:27:00 -0700
X-CSE-ConnectionGUID: jCz3Ch1MR9+KUQDQFIQXOw==
X-CSE-MsgGUID: j+jCBTy1Tf2GHqB1muXCpA==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:26:49 -0700
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
Subject: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Date: Thu, 23 Oct 2025 14:25:38 +0200
Message-ID: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>
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

GHES handles the PCI Express Error Section and also the Compute Express
Link (CXL) Protocol Error Section. Two of its functions depend on the
APEI PCIe AER logging/recovering support (ACPI_APEI_PCIEAER).

Make GHES select ACPI_APEI_PCIEAER and remove the conditional
compilation from the body of two static functions that handle the CPER
Error Sections mentioned above.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/acpi/apei/Kconfig | 1 +
 drivers/acpi/apei/ghes.c  | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 070c07d68dfb..c265b54d810d 100644
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
2.51.0


