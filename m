Return-Path: <linuxppc-dev+bounces-13209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B7C011FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 14:27:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cslfb3mT7z3bjb;
	Thu, 23 Oct 2025 23:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761222455;
	cv=none; b=JgkHCT3U7daXccVM3GGcHEyLNFb2O7AmG2kx9DGdy9PYJKnZo+N1g9hgn3z/6+KOhlMC7gvbS6wa8yUKoy9HgS44H+2uy3yt0DvpSzpY6zJX05K+h053xHxHI+/4R9+hsnHpjWMWvCPm5Ax2uYhNXGH+08Cj2uRNTHzzGyYLpxWrPy44ZD1pgtPZWIapVUekrn/I5OzAjZhjd7iYJLnk4vywhMiZxWGoE92nXp51M1uCsD6oSRwCTNhvGQlUrLOpKIiFNPxCTItWMjk75OsUpK/7RkLbH3UML8xrABqioTZbAg/t6M8hNnoUjRaL4wt+Lo8mKHultv3+BcYzSCOMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761222455; c=relaxed/relaxed;
	bh=+RhTVrv+gILZPbKoHLSUtLHIVpCkmpeE+zfc6fDthvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uvg6bRSu9h9EjBllSVkSau8IxDzGRr0IDWEAAPH6aAILobecq8qrznYtApb98mQIHZrU7IFoEW0gGLmWD4UMUzLkIpiw4BbWhuZ2xatIVufFJ3/adfyMU5bm+5LHIGPXBodkwqUa093E2+HrBU/i+zMngc7UB/YdhpZ095U48AYh8TLMU6aUEbSD8+esVqziIYInlkanJ3jSLieGzqzfWAaoAiL1ZP1L3MPcZMYi46QumOjJ6TWtzDW58XBWRYHahqDFLH7aw13dTu3PQyQSP5kfQ1nPzrCUSjGXG49GnNwlPNwefT9FKNH/sYfH6G0+ipvI1QUO2xapFJ9BZTzvxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbLEMXxL; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbLEMXxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 23 Oct 2025 23:27:34 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cslfZ43plz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 23:27:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761222455; x=1792758455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WkRBZU6DdRBPBvlJ2N3/YkvCzsXVTcOCM1yMrI1FnBQ=;
  b=lbLEMXxL/WhpEmnNNq5BHP3Gvm09gU82b1n8SfHeDGZ2W9kyHQeH5r7f
   7eIKCpmvvNZNRuKXl0/T3Y1Il8IsvOKMov8DCyxEDgUDQR19L8S4/QMrU
   PONhI7HboDvIktkXjT5t0ZpaV15Mg8a1uJiMhPkSt2UPnhOBO4Ezht4b6
   0RyrO2gfGaZ1HSkGMIZT+cKMDIP13CB+D1DvGJx4qa9cB0JUKr6uU9ggb
   27ypK8J5A068arfAMpAaIFu0FMZO/5clKVugO8o9PwHNyeXhFUSStSOX0
   6nH1oqVV5yP//pUl+gJP0AlYuaCmdi73r6aRxlJhtO2QziS2dk4M1q/Kk
   g==;
X-CSE-ConnectionGUID: HC/JtmeTSeeN/Qp3HB/4zA==
X-CSE-MsgGUID: ngIQ2dIuTNuqBMb8SGwMVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74734857"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74734857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:26:26 -0700
X-CSE-ConnectionGUID: rbNur2/2SmyTNh2buCmzcQ==
X-CSE-MsgGUID: Thbs1WH3RtSINmLU3Tnm6g==
X-ExtLoop1: 1
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:26:16 -0700
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
Subject: [PATCH 0/6 v6] Make ELOG and GHES log and trace consistently
Date: Thu, 23 Oct 2025 14:25:35 +0200
Message-ID: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

When Firmware First is enabled, BIOS handles errors first and then it
makes them available to the kernel via the Common Platform Error Record
(CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
via one of two similar paths, either ELOG or GHES.

Currently, ELOG and GHES show some inconsistencies in how they print to
the kernel log as well as in how they report to userspace via trace
events.

Make the two mentioned paths act similarly for what relates to logging
and tracing.

--- Changes for v6 ---

	- Rename the helper that copies the CPER CXL protocol error
	  information to work struct (Dave)
	- Return -EOPNOTSUPP (instead of -EINVAL) from the two helpers if
	  ACPI_APEI_PCIEAER is not defined (Dave)

--- Changes for v5 ---

	- Add 3/6 to select ACPI_APEI_PCIEAER for GHES
	- Add 4,5/6 to move common code between ELOG and GHES out to new
	  helpers use them in 6/6 (Jonathan).

--- Changes for v4 ---

	- Re-base on top of recent changes of the AER error logging and
	  drop obsoleted 2/4 (Sathyanarayanan)
	- Log with pr_warn_ratelimited() (Dave)
	- Collect tags

--- Changes for v3 ---

    1/4, 2/4:
	- collect tags; no functional changes
    3/4:
	- Invert logic of checks (Yazen)
	- Select CONFIG_ACPI_APEI_PCIEAER (Yazen)
    4/4:
	- Check serial number only for CXL devices (Yazen)
	- Replace "invalid" with "unknown" in the output of a pr_err()
	  (Yazen)
	
--- Changes for v2 ---

	- Add a patch to pass log levels to pci_print_aer() (Dan)
	- Add a patch to trace CPER CXL Protocol Errors
	- Rework commit messages (Dan)
	- Use log_non_standard_event() (Bjorn)

--- Changes for v1 ---

	- Drop the RFC prefix and restart from PATCH v1
	- Drop patch 3/3 because a discussion on it has not yet been
	  settled
	- Drop namespacing in export of pci_print_aer while() (Dan)
	- Don't use '#ifdef' in *.c files (Dan)
	- Drop a reference on pdev after operation is complete (Dan)
	- Don't log an error message if pdev is NULL (Dan)

Fabio M. De Francesco (6):
  ACPI: extlog: Trace CPER Non-standard Section Body
  ACPI: extlog: Trace CPER PCI Express Error Section
  acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
  acpi/ghes: Add helper for CPER CXL protocol errors validity checks
  acpi/ghes: Add helper to copy CPER CXL protocol error information to
    work struct
  ACPI: extlog: Trace CPER CXL Protocol Error Section

 drivers/acpi/Kconfig       |  1 +
 drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++
 drivers/acpi/apei/Kconfig  |  1 +
 drivers/acpi/apei/ghes.c   | 62 +++++++++++++++++++++++++-------------
 drivers/cxl/core/ras.c     |  6 ++++
 drivers/pci/pcie/aer.c     |  2 +-
 include/cxl/event.h        | 22 ++++++++++++++
 7 files changed, 132 insertions(+), 22 deletions(-)


base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
-- 
2.51.0


