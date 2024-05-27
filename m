Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A28D5558
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:26:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbg3ZAZ4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr17X5lWzz3dWZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbg3ZAZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 28 May 2024 00:45:23 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vnz2q5g8wz3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 00:45:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716821124; x=1748357124;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N2BkBEfMjIfRh7g1dfIjn0MfLhYtzu3BShYG5yFIizg=;
  b=kbg3ZAZ4Y+wFAfVUy1JIQjGp3hClPpiaF6qBKS5YrZ7Kx0a8ob9kOz7X
   D+lYLATxpqx/sYh062PDMy+G5LFSrn6h2QeYB3uZPFYvmgqi9FU/15CXM
   fJRK/iSYXQicnwVmR+d7nlKaewsNMUtnl+glyNRNPOwQGSJVV9Ulvgl2K
   YBiA6CvIdsVYxNBy8lAqznhKmiD7NXNbhltRJuz5Fl+q/DnANQuqlYeCx
   RfqxzkBnbBtM6P4ZEjJ73OF/FsH9dPBcF8VoKbJMv07xgeUwqDP1wArXr
   DisG2cHsH+wJTu3Vuv+55zhQBnSdtO9tvNWk0S4NZwTI4jsAyJtsnlFRM
   w==;
X-CSE-ConnectionGUID: JPHHW0zbRVOdG+xOpq8jjA==
X-CSE-MsgGUID: US0ikNO2T66XOKrZcJEuOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13269744"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13269744"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:44:13 -0700
X-CSE-ConnectionGUID: Y71KIk33R0SQTM5KxhYC5w==
X-CSE-MsgGUID: R+PV6+o1R+Oqcy6DJptl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="35279780"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost.localdomain) ([10.245.246.214])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:44:09 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 0/2] Make ELOG log and trace consistently with GHES
Date: Mon, 27 May 2024 16:43:39 +0200
Message-ID: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When Firmware First is enabled, BIOS handles errors first and then it
makes them available to the kernel via the Common Platform Error Record
(CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
via one of two similar paths, either ELOG or GHES.

Currently, ELOG and GHES show some inconsistencies in how they print to
the kernel log as well as in how they report to userspace via trace
events.

Make the two mentioned paths act similarly for what relates to logging
and tracing.

--- Changes for v1 ---

	- Drop the RFC prefix and restart from PATCH v1
	- Drop patch 3/3 because a discussion on it has not yet been
	  settled
	- Drop namespacing in export of pci_print_aer while() (Dan)
	- Don't use '#ifdef' in *.c files (Dan)
	- Drop a reference on pdev after operation is complete (Dan)
	- Don't log an error message if pdev is NULL (Dan)

--- Changes for RFC v2 ---
	
	- 0/3: rework the subject line and the letter.
        - 1/3: no changes.
        - 2/3: trace CPER PCIe Section only if CONFIG_ACPI_APEI_PCIEAER
          is defined; the kernel test robot reported the use of two
          undefined symbols because the test for the config option was
          missing; rewrite the subject line and part of commit message.
        - 3/3: no changes.

Fabio M. De Francesco (2):
  ACPI: extlog: Trace CPER Non-standard Section Body
  ACPI: extlog: Trace CPER PCI Express Error Section

 drivers/acpi/acpi_extlog.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c     |  2 +-
 include/linux/aer.h        |  9 ++++++---
 3 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.45.1

