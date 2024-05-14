Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4D8C51BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:32:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miVZhObz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdvMq2VfQz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 21:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miVZhObz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdvM20wBLz2yvp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 21:31:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715686286; x=1747222286;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jJsIyGCb+UYU0upD3tEgow1pHR8mvqbiW1YtMiSq/uk=;
  b=miVZhObzHEHb3ce4f/HYgkSzuAlkv1mYSLP8ycVjx7DRBlt2DFAozMfV
   nNHRxGGKLJrBeNFRXho8WF8WnfLaRnHYRsIfJ0pL/vSppxYkqRVr4cY3Q
   15ct95CvKQxVnwhZQS+9h17OUMceeHKgsvNctsq6b0jfCdZ7TK3V3/vce
   NY6vJi/JFpit99+DOXZeRJmDxKWyDdKj3i6/pFa6x3JYXYdE5Ol4GteEK
   hh2m6RwnGfaSOZMLMGLOMoPccORFm90cBmbgAK4Ac1M1V+GGHg3PhqQuw
   IxS9Eg0GlcZ7fZ5E/oMFEFfSnqCxG7Aa0C47+04O8BoOPzIuti9zkszbv
   w==;
X-CSE-ConnectionGUID: 9OKm7xsnQSm3nfs9/TfhKQ==
X-CSE-MsgGUID: bl29mCIoRWeMiEKJiChczw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11532815"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11532815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:31:20 -0700
X-CSE-ConnectionGUID: mijAQijJQFGOD+cpqW0VZg==
X-CSE-MsgGUID: Rk5dwf0BSwaiBBbO4hvl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35179610"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.94])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 04:31:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v5 0/7] PCI: Consolidate TLP Log reading and printing
Date: Tue, 14 May 2024 14:31:02 +0300
Message-Id: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series has the remaining patches of the AER & DPC TLP Log handling
consolidation and now includes a few minor improvements to the earlier
accepted TLP Logging code.

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

Ilpo Järvinen (7):
  PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
  PCI: Move TLP Log handling to own file
  PCI: Make pcie_read_tlp_log() signature same
  PCI: Use unsigned int i in pcie_read_tlp_log()
  PCI: Store # of supported End-End TLP Prefixes
  PCI: Add TLP Prefix reading into pcie_read_tlp_log()
  PCI: Create helper to print TLP Header and Prefix Log

 drivers/pci/ats.c             |   2 +-
 drivers/pci/pci.c             |  28 ---------
 drivers/pci/pci.h             |   9 +++
 drivers/pci/pcie/Makefile     |   2 +-
 drivers/pci/pcie/aer.c        |  14 ++---
 drivers/pci/pcie/dpc.c        |  14 ++---
 drivers/pci/pcie/tlp.c        | 109 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 include/linux/aer.h           |   3 +-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |   2 +
 11 files changed, 143 insertions(+), 56 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

-- 
2.39.2

