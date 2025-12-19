Return-Path: <linuxppc-dev+bounces-14899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072DCCFD74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 13:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXnH26jGyz2yFb;
	Fri, 19 Dec 2025 23:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766148126;
	cv=none; b=CJWpja2gJjUdykfYlOlGSLyxMKZ1Rt3cWDssG+UcoTqISLXYdo08WNDlYfeOjWe/B+o8oFKSIYUsPuKlCxNfpf7kPKgSnXiVvkGXeYaKM7s1nx6l1MXOJcUxiLUuTlxq0+IaZMi8wcufdazHHU5mD2ZF1YQlZtutAaf8zhUrITLB+xohCk7NCwYXeKQVnl53UrbF583hODES6b3mu1p6XNoZLuLJtbiwyOAY2wYKyvWyqVkxlxwLD73jAs4ty5X6ndKtU78ac85a0PQww2Fh3Zw+t0LcjikxKbTSznPFnrQS8dp0519WDQ0Kv+Nkggi21pPY2c+j3R5LZQSqks3vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766148126; c=relaxed/relaxed;
	bh=NzNNcLXttlkh4p8g922czyVm+POGNqGVh+UkXrPuVMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBReTe7+UI27QWCM4Puoa25ud6Si8XK33zc6E43BQE1sc0Tnwt99cREe1YmgoC2W5/n/A5J5ensqzFZTmJvH15VIh29tEGmRyiKfJOcEOw5tZQEvId5N368xDBDRhxW3iltjlfpoAbtlnDaem74S2ijDCQlBXNwSDoxdpjGkvFOMtWWyZdFAXA9SoGQwT2hL0imdN6RDuSMNNZuLE6oXtV5s0EuGWxBHfJ6iJlHOinCRc9GEIQEnAX/mEB2YjEHT6fWFyTzpwH31TSnb9h98WcWbB8SQkOM3XMlofRXoGGCK+M3uJcnWzqzXhsIBAGlvCDd/br1VOSYgo01PyWFe5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmJ+EW0n; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmJ+EW0n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 19 Dec 2025 23:42:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXnGz6qyXz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 23:42:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766148124; x=1797684124;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZXNPCHloNzeHHbAH0ZYxqBgLEFoqkQfgEjOzAZkrfxs=;
  b=jmJ+EW0nw/6Ou9ll1WNr5JiqE30CDALRqYWAy98hy31c6ONLBh3lXkoc
   W9HDXFoYuokxj+Du7gOfPv6ugnrLySJxRI0GoAE8mzddzDwwKtuRRqlJe
   kudoRRnlua/I21HcIlUqaGH0ruf5LTINxEybXEzFPr/KaxX+QHywo4MYU
   ZS/DGCdBbRk3z76Z8JtJfLcjOcvn2xckCCF8pTYaaBpk/1/fjaIO2OSdz
   ybb5oFU+vIyBLreD+sJvO1V3DoqixjBAgwwqeJWlA+CzyppzR4xjXnciR
   uJsdOgf+d4Z7TgkdfxFiGKZG8WX8jvoCqq6mOJLMhquc/GOlDj6zjn4Q1
   w==;
X-CSE-ConnectionGUID: 2Ih+8JfvQ/SSIowM0jOUrA==
X-CSE-MsgGUID: OHGPLLTfR0GlUE9GioRVWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78742698"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="78742698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:40:54 -0800
X-CSE-ConnectionGUID: YnF9SIHiTbeI7aKQ2Q6aMg==
X-CSE-MsgGUID: K5IYwhj5SSe9f6wU+tub8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198444375"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.52])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:40:49 -0800
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
Subject: [PATCH 0/5 v8] Make ELOG and GHES log and trace consistently
Date: Fri, 19 Dec 2025 13:39:39 +0100
Message-ID: <20251219124042.3759749-1-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

--- Changes for v8 ---

	- Don't make GHES dependend on PCI and drop patch 3/6 -
	  incidentally it works out the issues that the KTR found with v7
	  (Jonathan, Hanjun)
	- Don't have EXTLOG dependend on CXL_BUS and move the new helpers
	  to a new file, then link it to ghes.c only if ACPI_APEI_PCIEAER is
	  selected. Placing the new helpers to their own translation unit seems
	  be a more flexible and safer solution than messing with Kconfig or
	  with conditional compilation macros within ghes.c. PCI may not be an
	  option in embedded platforms

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

Fabio M. De Francesco (5):
  ACPI: extlog: Trace CPER Non-standard Section Body
  ACPI: extlog: Trace CPER PCI Express Error Section
  acpi/ghes: Add helper for CPER CXL protocol errors checks
  acpi/ghes: Add helper to copy CPER CXL protocol error info to work
    struct
  ACPI: extlog: Trace CPER CXL Protocol Error Section

 drivers/acpi/Kconfig             |  2 +
 drivers/acpi/acpi_extlog.c       | 64 +++++++++++++++++++++++++++++++
 drivers/acpi/apei/Makefile       |  1 +
 drivers/acpi/apei/ghes.c         | 40 +-------------------
 drivers/acpi/apei/ghes_helpers.c | 65 ++++++++++++++++++++++++++++++++
 drivers/cxl/core/ras.c           |  3 +-
 drivers/pci/pcie/aer.c           |  2 +-
 include/cxl/event.h              | 22 +++++++++++
 8 files changed, 159 insertions(+), 40 deletions(-)
 create mode 100644 drivers/acpi/apei/ghes_helpers.c


base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.52.0


