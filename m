Return-Path: <linuxppc-dev+bounces-5243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C992A10D0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbFP1WLXz3bNs;
	Wed, 15 Jan 2025 04:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874537;
	cv=none; b=aPkEiWuBbuflKX6Fd6vQEO0nxq69CpTwOibrDCjr5tJ9Sau/4Ob1ktj5L7U3eewuE3iUJUyJvszUpGWwXxAg6HZM8dcOXP2AwUrhxsGB78j3+L8xK2ujPGHZ4x99dkWL9ZUjeJN/FgVF4f+7pTDLkX7y7e/Oe1yBPRqM6rOnnkr5eCfUG5ypnjU6OPKCtUHckPW5KJfvNkGspiuNdk2C5R5rmElhgjKNnUQ6RyC64YRrF8LQkrpda8V3eh9Zr1wwmL58aKK3YZsWwG7lUkL1uhfSowuSD4m9Vz4eTUrgfH9VHzipa9gbkPTQqOo0jASKtitxeXNUls3mJoSXyOtGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874537; c=relaxed/relaxed;
	bh=bluPSNvUUPrv+mS3VBiK6nqMdx94tW0dEZtxjA0oTGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ciLpS0VUHSTr0sD4Ndcz3X/PPjdujhEaw7fRuXdNjIscKlj6uwlEpUWN1mVbPmy690NJrRZUkygh8SujPA7p3FLO5mDPbolYFaMjglDMD2FcgG1N+Q8b18zhgREX6dvQi/v1UcEob7t9Gk1/ibkN2hHHWKk+Zp9oIEzLuj6sK0/YYzVdVVSOMP2oseAuT4WKCpeqydySBU3Z6Yk1SW79hHy28a6LmkJ21ST+lQrB4hhkRt5+SdhmRdVTnlgkEHdBRGJpkR10dYgv3GJXOupUQqGki7Peh9d856EPBt1EVqAswBGLg94GiDwyPcQPzHv6/62mkW+ESzOQ/X2jO+QOZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iiZouo6G; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iiZouo6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbFK577gz3bLS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:08:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874534; x=1768410534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QoAbELA2hs+ktMu/3uW492VdOm9IyqJhwn5EdVVM7mI=;
  b=iiZouo6G0SMoPZhSednRUCvWjqSwxRNsBvrohVu7nRTxv0V2DslXlD3d
   nvNbsGAXS+oqwHhNaAYc7ZaRzkMy3x7Ux4rkykCFa64d81uaY3VZC/FS9
   4PO3auvWLbsrsycuKLp1d8/55hICWn2t0TlB0AAmLcSOVCwH/jOWoz7xo
   EXSrLYYrYPF3f+YLmvzxr0N195HlducK/qxwmkCB7wEuE3N4V8RrXD5FR
   9SDWw1XejGK/FzY57VPwXwHMR+TsEy9Nrrr8X5bS91nd7U1iLIlsjtVMc
   zCrMfw7j5fW8jgePWcmK4sIEerzGUz4TPd4JvFUloxb+urxfDQZ6Z+TGc
   A==;
X-CSE-ConnectionGUID: MOIm8ixMQsKZD/tvUVIFRQ==
X-CSE-MsgGUID: VZhjQx5jSYmJWV6YyLpF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24783645"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="24783645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:08:49 -0800
X-CSE-ConnectionGUID: YlLpw4xMTxWet7T/w8XAHQ==
X-CSE-MsgGUID: SIWtfQiCSp+OuqElbEBLNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105377249"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:08:45 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 0/8] PCI: Consolidate TLP Log reading and printing
Date: Tue, 14 Jan 2025 19:08:32 +0200
Message-Id: <20250114170840.1633-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series has the remaining patches of the AER & DPC TLP Log handling
consolidation and now includes a few minor improvements to the earlier
accepted TLP Logging code.

v9:
- Added patch to define header logging register sizes.

v8:
- Added missing parameter to kerneldoc.
- Dropped last patch due to conflict with the pci_printk() cleanup
  series (will move the patch into that series).

v7:
- Explain in commit message reasoning why eetlp_prefix_max stores Max
  End-End TLP Prefixes value instead of limiting it by the bridge/RP
  imposed limits
- Take account TLP Prefix Log Present flag.
- Align PCI_ERR_CAP_* flags in pci_regs.h
- Add EE_PREFIX_STR define to be able to take its sizeof() for output
  char[] sizing.

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
  PCI: Add defines for TLP Header/Prefix log sizes
  PCI: Make pcie_read_tlp_log() signature same
  PCI: Use unsigned int i in pcie_read_tlp_log()
  PCI: Store # of supported End-End TLP Prefixes
  PCI: Add TLP Prefix reading into pcie_read_tlp_log()
  PCI: Create helper to print TLP Header and Prefix Log

 drivers/pci/ats.c             |   2 +-
 drivers/pci/pci.c             |  28 ---------
 drivers/pci/pci.h             |   9 +++
 drivers/pci/pcie/Makefile     |   2 +-
 drivers/pci/pcie/aer.c        |  15 ++---
 drivers/pci/pcie/dpc.c        |  22 +++----
 drivers/pci/pcie/tlp.c        | 115 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 drivers/pci/quirks.c          |   6 +-
 include/linux/aer.h           |  12 +++-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |  11 ++--
 12 files changed, 172 insertions(+), 66 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.39.5


