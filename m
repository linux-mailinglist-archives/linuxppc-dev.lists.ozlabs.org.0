Return-Path: <linuxppc-dev+bounces-1329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EF9782A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:36:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xhj2r2kz2yY0;
	Sat, 14 Sep 2024 00:36:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238213;
	cv=none; b=kD/sypx66RWU99tk32jkDcqHTHTp//5RPLjHWhc2ezTfKTKmiNpe6/rTn1k09hPtUo1uXlYaeO/DwD/tDoyOFaqe6Blt1ImxY7NT2+g0lS8Tqe+sk9vmnwjL1aXU2RX+rjYSpAfySkxO7a213eYklMa1z/aVGtBBsp4olChA+osyak7o1FJo3YCnLuW04t4s26ughMUZ99dppWE/vc4M7gHuK8WsG3/CSdfHpVa7E5VKcW5WhVByTAproWi482cGEhvC5IWY6J1W+XNUaFkO10GspUQdAfG2YpHNyv4Fs0drDiQvgXe5vv56+SRPLjB0etC8UmrVyX+0neSGnrYMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238213; c=relaxed/relaxed;
	bh=v+FP6CejnGnHaWGmLxVELPjCNmgsIoqs5MX3PZT/pVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=keduyIrYwL+zAHPPVSWsGRw3MQFG+unigI/7yNK481UPapzmlOscSA/WAEkwQXn0R9HQ8bl8WOOyax3llAiN0F1Z+nD29VYQlVa+k2F+c3oLAL7J3y+n642eUER7FDGR7rQCO7IRBSRVmCbkj0U0Uwevl6GlI2FIcyIxR1Y9taUbX8FHbNTypG+a/o/4m/mSZQcEuY0H3HbqIg4H+E3B4HZupwDHxxFd4C92q7ZALqrp6VZaTmZcN0tlejye71319m3xDtDZmJh0FBhtd0jevsA6K9AphPIUd3v3PXx23E/fjLuC8M8j5ln4j891iKCWSEQ5oi6aScw2E7Tpa8fSSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aUxhsdpR; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aUxhsdpR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xhf6Mybz2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:36:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238211; x=1757774211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4EVcw5ALi48rEKGiCGqMlcmXwSupGapNFrHyhpwwt9M=;
  b=aUxhsdpRpDVj0lAdOHamtRZyHn8R7AGAV8ySaaXLkP7ER5nG0dJdOBXe
   k+0P74qvxRxSfgzUNwHZf2YC6XFFwfx3j2Xytu55ojiG1aB6XX/JBEBSx
   AQL5CbncTJmi3CwLeXeZEuZjeOvboJeYsUxDIeZ/9iDHgNxztxJtvu/sr
   lkaK537B9rLiG7pBbzbHN5ss9Da01wxackZxl28lFvwsF+634OSqSZwOY
   FYW0CiGlstlAOiU8XJzpXGs1HjtaMMFs+1MXlFiCDTK2Ju6ZFhR6OsaWB
   BnhSxLk2cauFJxySyf7N08rUzSz/ccDglzfIUU64dZOAbZTrpjCLEn0II
   Q==;
X-CSE-ConnectionGUID: QVF9USG0SZO/RFAkQaPYZg==
X-CSE-MsgGUID: btOUUVr3RcC2NMU0UhinSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25075221"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25075221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:36:46 -0700
X-CSE-ConnectionGUID: 6GCoO4HsQIyf9VPHugOaeQ==
X-CSE-MsgGUID: sK3F++UySP2dM8Q4dUBCdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="67934555"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:36:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 0/8] PCI: Consolidate TLP Log reading and printing
Date: Fri, 13 Sep 2024 17:36:24 +0300
Message-Id: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series has the remaining patches of the AER & DPC TLP Log handling
consolidation and now includes a few minor improvements to the earlier
accepted TLP Logging code.

v6:
- Preserve "AER:"/"DPC:" prefix on the printed TLP line
- New patch to add "AER:" also  on other lines of the AER error dump

v5:
- Fix build with AER=y and DPC=n
- Match kerneldoc and function parameter name

v4:
- Added patches:
	- Remove EXPORT of pcie_read_tlp_log()
	- Moved code to pcie/tlp.c and build only with AER enabled
	- Match variables in prototype and function
	- int -> unsigned int conversion
	- eetlp_prefix_max into own patch
- struct pcie_tlp_log param consistently called "log" within tlp.c
- Moved function prototypes into drivers/pci/pci.h
- Describe AER/DPC differences more clearly in one commit message

v3:
- Small rewording in a commit message

v2:
- Don't add EXPORT()s
- Don't include igxbe changes
- Don't use pr_cont() as it's incompatible with pci_err() and according
  to Andy Shevchenko should not be used in the first place

Ilpo Järvinen (8):
  PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
  PCI: Move TLP Log handling to own file
  PCI: Make pcie_read_tlp_log() signature same
  PCI: Use unsigned int i in pcie_read_tlp_log()
  PCI: Store # of supported End-End TLP Prefixes
  PCI: Add TLP Prefix reading into pcie_read_tlp_log()
  PCI: Create helper to print TLP Header and Prefix Log
  PCI/AER: Add prefixes to printouts

 drivers/pci/ats.c             |   2 +-
 drivers/pci/pci.c             |  28 ---------
 drivers/pci/pci.h             |   9 +++
 drivers/pci/pcie/Makefile     |   2 +-
 drivers/pci/pcie/aer.c        |  26 ++++----
 drivers/pci/pcie/dpc.c        |  14 ++---
 drivers/pci/pcie/tlp.c        | 109 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 include/linux/aer.h           |   3 +-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |   2 +
 11 files changed, 149 insertions(+), 62 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

-- 
2.39.2


