Return-Path: <linuxppc-dev+bounces-13760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E3C329E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:25:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1H1Z1JFQz3bf8;
	Wed,  5 Nov 2025 05:25:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762280706;
	cv=none; b=W+8le6AsCjON7Zyy2S/IyhmDtCd90F+1aNDdyhAERA1HbBw1J5lWuoHGz66PO2vltYvht4BtjTjEFvqvbZX0WJ8YlYMpAvZemCuHDU6c0ls2uN1hcJlfHnE2C7z934qxeSL7Y91n9cINC1c069UxJbOx5jiLJHvzz/U5EJ9dhxbNAUbyWcY02k27nJ3Mt/mHF0K56cRBrOJOtUuolMSOQbzvCMqh5S1NFYdMO8pN6jRIr4rpPNx6Eu6hHFP8eb0RW38633IRiZKc8bPwrO+l7BNfTonIqRGSgGpE2JjOMXvYBXZrnXiGd0aCRchycN+Tw5rmKPp0DH9HRY53JC3WDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762280706; c=relaxed/relaxed;
	bh=cEoiGNrkvjkvOctj8uQBfMXJqZjJ6P4mAHcCT2OwPuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAIMKtt/DqhfMf2/9ubiFdsFFsdN5BW5stA6qD9XehlN3iTedhm428KMB110Zek/ZyFMDSaMMOq1xilAH6A81VWdM9mY/03+M02mQkSdzLdfVLfFlJKuWytl5y5nez0O9QS96vsV/byeWligmojrf9be5GpJxEBStpaENSaf27TODPS5D06lIWj7OkWYT0WONKIA6kk0K4MKaR1fUzrY+TGDFn/0aSULs+igx5L9Dgb0de8MyR8tizEyMzpKRMqoOTi0iIOGf5nW/nDAHZYwRrfSKWoYShFLERP4nH7xzHYuwCfyZRoyY9H0mBBZ1Kcph+rZm5qQpatY80qYofo/rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/PgPLfD; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T/PgPLfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1H1W2Rsqz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:25:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762280704; x=1793816704;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ygSV/I+qI9txTatyENS+X8zLXLvRO8BaoyQZ9Ji+fjs=;
  b=T/PgPLfD7wrX1yuGttr9+ELRm0PVqD3jGYiESCwwBJjYxJ6En+wLavHN
   G/tj4OrmqqRWbBfuOSmNewpmXCFaulDiRMY8zC7jG3yEsfMo1VxzxUYsZ
   92H2cuJqujKNn20yzCvFExy7dF2zr+7O0itDqaGfTHO9TzaKntaGHjhs2
   yVvAHkyR7pT3NoHq3tb6/3iOyr69ipxKeuauzwAmhRGFH0xmdnrrqGnoo
   mkpxvCS9vhTuGIuVPfGewd7UnOM95vxjFk5PIW3wXh2tHG4Sf67OdHj+Q
   91QZoGKZ20cZMGNV2pSAivPbIG8Nro1iX3Vjqs0KlmPUCatxjEzJ1c+lJ
   g==;
X-CSE-ConnectionGUID: kZNMaf7eRPewqwhoCGJmOA==
X-CSE-MsgGUID: gpXFyvFlT+Kc3xym4Np7XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74991511"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="74991511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:24:59 -0800
X-CSE-ConnectionGUID: 0zaqPnPkRxO7iCv/hEIXvw==
X-CSE-MsgGUID: szvt4rU3T3WItWVCP4XBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191325204"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 10:24:52 -0800
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
Subject: [PATCH 0/6 v7] Make ELOG and GHES log and trace consistently 
Date: Tue,  4 Nov 2025 19:22:31 +0100
Message-ID: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

--- Changes for v7 ---

	- Reference UEFI v2.11 (Sathyanarayanan)
	- Substitute !(A || B) with !(A && B) in an 'if' statement to
	  convey the intended logic (Jonathan) 
	- Make ACPI_APEI_GHES explicitly select PCIAER because the needed
	  ACPI_APEI_PCIEAER doesn't recursively select that prerequisite (Jonathan)
	  Reported-by: kernel test robot <lkp@intel.com>
	  Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.7aYBpl7h-lkp@intel.com/
	  Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.XIXgPWD7-lkp@intel.com/
	- Don't add the unnecessary cxl_cper_ras_handle_prot_err() wrapper
	  for cxl_cper_handle_prot_err() (Jonathan) 
	- Make ACPI_EXTLOG explicitly select PCIAER && ACPI_APEI because
	  the needed ACPI_APEI_PCIEAER doesn't recursively select the
	  prerequisites
	- Make ACPI_EXTLOG select CXL_BUS

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

 drivers/acpi/Kconfig       |  7 ++++-
 drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++
 drivers/acpi/apei/Kconfig  |  2 ++
 drivers/acpi/apei/ghes.c   | 62 +++++++++++++++++++++++++-------------
 drivers/cxl/core/ras.c     |  3 +-
 drivers/pci/pcie/aer.c     |  2 +-
 include/cxl/event.h        | 22 ++++++++++++++
 7 files changed, 134 insertions(+), 24 deletions(-)


base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
-- 
2.51.1


