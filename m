Return-Path: <linuxppc-dev+bounces-15711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29439D1DEB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:16:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drhpc4py5z2xlP;
	Wed, 14 Jan 2026 21:16:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768385768;
	cv=none; b=kKVC1zd512ZoIL9K6tgk9pzA1FCcWahtt/yOySdFrQO5BBb2vajIpwSQcgzbL6WBe0ig3X1siRPHM20sBjgez6xNYTKMYRtniz898z3LgMmJi1LBFk7T1fP15CtgQAuUBlv/6BCfXkrRvRK/gkIqd99xbwsih6KFWFgEJeuM4y0QIFXzQpb5RsbDeoEuxb1KkEHjEzrmSK2ci8YD7eAqeHBDrUhu5x+PG7Ai26ziHlPMwhCMdFtQXOXSaulIM8idQBuNZa34c4KQU73jCv+IwkOsZUhXlslXJl0u2V8J2dnj5YsGJGaQekKoemTgsFVp39Der6FP2EbYPxomi95xyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768385768; c=relaxed/relaxed;
	bh=oXWZeS8l/XyyH5AToh/wLbm0Ei8tESJU/O7/5JEnTr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLjOy3P5bl5nori33PmpcF57cQ8pxOqeLLKG6XfRWdCliU7FHP5YFglrYtKiL4cky5h4e9JwqcArS0li3gKQ/6uyTpOojxBAVvP0DBhKoaNvgYTf2LEuM1n1ibNikEhb2YVDxo6B3uT03ZSn5RdgGI+PIqhSJAFx2cTUcekX1wuSjp/Lylfe7fPW7bf+a3dqmReFjf0Nd2GQuwBwwbElaKuJjxYR/tT9PHXUlZdEiFNKZGnrez+1JMtRJBCg508JZjW+i1qcfPxPUdFkfdC6WUhxoDf20GrDuRFc8fbZ6kt75svsCqIfeS3q56Bz2+t8qv2hkGMgIwlRh1RuPQVgiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvmkCEim; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvmkCEim;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drhpT3Wksz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:15:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768385761; x=1799921761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MQi58lIxeirVopK0zZ+tUuUpYRwLp1BLjQ9AcO3m0Q8=;
  b=nvmkCEimFhZmr5SNkTAY/Sa0JLupUS+uLC9SDsj6ul5y2xMHNdR8bqa5
   VdM2MXiR7mTp9c8hfwqcUvCmLtRTBvxg4sLM4uIoJ+oLQxSCaQREma5t7
   6nwUFl9Ti399WvJSNk0wUEQuI+2WyH5PamN0HYYe+9EdvTdbyCjjELI3l
   Dm7At26gHrjXIo1v6qcRpuQ2qf35A261chc17WhBGdsNbt/GKDR9zI/0/
   WSyrrmz1RFR+I6eJ4CTdBg+stM82zTXItTcTfK/grP+N6syyQiTYQFo7Q
   mpH1gr4y+azksXPV40QXqyw8hNMNfgBqX/L+UE1C6gpLl466Gk2wt21zh
   Q==;
X-CSE-ConnectionGUID: L8jjuogrTpy3UWEpCpgS6g==
X-CSE-MsgGUID: byCRFdN+RI+k9YY8dcMyZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69765779"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69765779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:15:56 -0800
X-CSE-ConnectionGUID: V6gTHZTeSYeEaDud2DeoHw==
X-CSE-MsgGUID: x0iffcUXRx6UlBYFLGobyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208792729"
Received: from unknown (HELO fdefranc-mobl3.igk.intel.com) ([10.237.142.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:15:50 -0800
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
Subject: [PATCH 0/5 v9] Make ELOG and GHES log and trace consistently
Date: Wed, 14 Jan 2026 11:14:20 +0100
Message-ID: <20260114101543.85926-1-fabio.m.de.francesco@linux.intel.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
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

--- Changes for v9 ---

	- #include linux/printk.h for pr_*_ratelimited() in ghes_helpers.c
	  Reported-by: kernel test robot <lkp@intel.com>
	  Closes: https://lore.kernel.org/oe-kbuild-all/202512240711.Iv57ik8I-lkp@intel.com/

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
 drivers/acpi/apei/ghes.c         | 40 +------------------
 drivers/acpi/apei/ghes_helpers.c | 66 ++++++++++++++++++++++++++++++++
 drivers/cxl/core/ras.c           |  3 +-
 drivers/pci/pcie/aer.c           |  2 +-
 include/cxl/event.h              | 22 +++++++++++
 8 files changed, 160 insertions(+), 40 deletions(-)
 create mode 100644 drivers/acpi/apei/ghes_helpers.c


base-commit: b71e635feefc8
-- 
2.52.0


