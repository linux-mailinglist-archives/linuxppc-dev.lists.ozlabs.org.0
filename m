Return-Path: <linuxppc-dev+bounces-8159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B727AA14DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 19:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn6YL5qQ4z30WS;
	Wed, 30 Apr 2025 03:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745947286;
	cv=none; b=gij8JkJiTinxiAv/33psghHjoYMkmbxZdUoLhpGVvwvGSViOtxMzC/pM7FFAz91hovIQG2Jb4mN0JUsLsyHQKSRbxgUuVQ09/625hgvMWDGnYkP7MwL9ChgeDg3AHLqkKkLERqMKoDPHJq6WJScqpOTBh2M67ycEC8O+0YabHM52ToV+sqXf6ZUbXugjTaJlCx/20uzZ9crjkgHoYLBMfm0HNfw14RSSdrpvaoRC6ZAt0VeWK1Y8S5b2xquJFU6P9lMYSgUafeygO2nFHJfoUa3r8/brC2kulfLT0l8j6QPIIcsEFilaXgS2y6sLYWW+l0vyXu5EIM5qjsvslKmU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745947286; c=relaxed/relaxed;
	bh=gJL4WwFG7lOMAOkT37jgqGsAkuEPW0tgi/RGe97k/24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUIDjNj6g5bC7QFVONZWUelOw+YiSgcKp8EmHlRh8k30BuEBuf9DfAWQZubGbKcXeYMSfWYh9TgblvY4SCHw4smf2/jfHZcYfi/7k4bWGsZUvp8YAcUeFhKYoLwrwwub4SEwOr8YGv/ba3yHtRJggon8jJJvYwMTi79moRcl5bzy1vsXx9f7A2dUjY9CKe+yUGKGdbAETjSaGn9P8csk27RUQSJJynNMQd6uhWXdSfOA/D+PyAWRfF3aOKru6pKffauAGokquD8TjVu3ZGB8POeGXrq/01hWK3kiMZr1aD+KSej+KUifEygV0IzS70HyXSG0ABruxQKUJYlN1Klnmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i96cs31U; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i96cs31U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn6YJ0hphz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 03:21:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947284; x=1777483284;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vYY2zbE6OK0wScySObCKJRjYLAvY/gAV9CwgCR4nPcw=;
  b=i96cs31UV3k2PiMipQ/wrbduC1Po7QVKBI8Ska8zx1ZDzuNEBlFuExoa
   zL9WnAgPCIUXi5VLpjBTRLi4gz/bgYmLxgiKxUgfHdfv/bEoNAu0sgjeJ
   HkqdZfcjYUamWhsoTjWyw4NOPRWVBwvhozfIILKXXg9EmRm2p/2ucH9bU
   7K9TxM0TulHapDDeyRqopu3kcBJQ8QmCcsJIkbPph88Hm0LjJModb1JI3
   sEpOYPwnCiV/8VWsPbi8EcjZpPPJmFR1iDazeNXCO4tnQiPL1FgbiF8Js
   JkL1LRN2Z+RvWpD95frSU7Qr++Qz5rUUQmn4GWOPvsjymjWeyNc/XZHng
   A==;
X-CSE-ConnectionGUID: VkbuQilSSF+l7s3p3XXjcg==
X-CSE-MsgGUID: IeS+L7cPTK+NKBIX9SYEiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64996932"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64996932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:20 -0700
X-CSE-ConnectionGUID: 8vZD04tyRg2Aa5RoJMWkAg==
X-CSE-MsgGUID: mHsBn+CMR4uPyr9hrkfPSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139073305"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.intel.com) ([10.245.246.45])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:21:14 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
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
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-edac@vger.kernel.org
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH 0/4 v2] Make ELOG log and trace consistently with GHES
Date: Tue, 29 Apr 2025 19:21:05 +0200
Message-ID: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
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

--- Changes for RFC v2 ---
	
	- 0/3: rework the subject line and the letter.
        - 1/3: no changes.
        - 2/3: trace CPER PCIe Section only if CONFIG_ACPI_APEI_PCIEAER
          is defined; the kernel test robot reported the use of two
          undefined symbols because the test for the config option was
          missing; rewrite the subject line and part of commit message.
        - 3/3: no changes.


Fabio M. De Francesco (4):
  ACPI: extlog: Trace CPER Non-standard Section Body
  PCI/AER: Modify pci_print_aer() to take log level
  ACPI: extlog: Trace CPER PCI Express Error Section
  ACPI: extlog: Trace CPER CXL Protocol Errors

 drivers/acpi/acpi_extlog.c | 96 ++++++++++++++++++++++++++++++++++++++
 drivers/cxl/core/pci.c     |  2 +-
 drivers/cxl/core/ras.c     |  6 +++
 drivers/pci/pcie/aer.c     | 18 +++----
 drivers/ras/ras.c          |  1 +
 include/cxl/event.h        |  2 +
 include/linux/aer.h        | 13 +++++-
 7 files changed, 126 insertions(+), 12 deletions(-)

-- 
2.48.1


