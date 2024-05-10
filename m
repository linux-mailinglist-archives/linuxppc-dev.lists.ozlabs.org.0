Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 994728C21C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLHiCpI/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbPmt1Rpcz3fVS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:11:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLHiCpI/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 10 May 2024 20:08:53 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbPjd1vyTz3cZm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:08:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715335734; x=1746871734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OCWYMtnallfof9cmVRtJ1kPAbbWtnFDn34D2Owmif80=;
  b=nLHiCpI/vdFMKLeFabvsKyh7DtAhX9CXs2VCu4VsKqz7VDzai8RamPnn
   tvP1LGK1z8tmgj5EKxvzL0MTrnumjRq2FWHK53I0N3G9WwPdzQmJPJftb
   NU/pp6nwNAGSbBiXmU6JolBpXUDCqJ2egGuK7c8BL+HT/6qViCSj3HiCQ
   0kukcIKWXunxjH2pvsKPyABCc1DrV4eBj+XNUamaG4ZAOR74cfjJP7nJP
   W2dDbSWvMCG7o3ZgiEjX8LwHBVl4wWpka3odAeUHi4wGAnH7mALfVZmcZ
   fD5GV8SBjHwQIZ0I93WFQ5OSpGdHi2ZMr8ICjzqiKICfdrVPsimKaTuO6
   w==;
X-CSE-ConnectionGUID: ZniuGmqmRSeXR8WLE3Z++g==
X-CSE-MsgGUID: kfUkYoL0SY2vgS8xgdf2Qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11144828"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11144828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:07:42 -0700
X-CSE-ConnectionGUID: TqrY0fPERpWwBY1Kjl+aIA==
X-CSE-MsgGUID: iZwTQAU0TY6ihNHFo1S42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29588212"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:07:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v4 0/7] PCI: Consolidate TLP Log reading and printing
Date: Fri, 10 May 2024 13:07:23 +0300
Message-Id: <20240510100730.18805-1-ilpo.jarvinen@linux.intel.com>
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
 drivers/pci/pcie/tlp.c        | 107 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 include/linux/aer.h           |   3 +-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |   2 +
 11 files changed, 141 insertions(+), 56 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

-- 
2.39.2

