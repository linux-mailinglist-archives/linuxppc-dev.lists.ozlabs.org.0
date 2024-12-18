Return-Path: <linuxppc-dev+bounces-4324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D29F68AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCx9r32MRz30Tm;
	Thu, 19 Dec 2024 01:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532688;
	cv=none; b=SUmjRa5MRyGOZf8CbJU9QBYFiJcVK4SAinK07tjbSIpz79Jz5JAIr00s1UiIoXwsyjSrBUd9yMPY6wl3iJfTyuP9b5KeHYXuVaXfLBAw/WRkGSKPBlA1xdwCQ88wB6sHPq2atTIQuNDwJIN+327nJcHu4VgG2sx8+WZU3/rGz8GuVaEFYAPlHi/S5Oyw2gUt7RLJd5f47PMAINmCaVxfmQwRli7kRC895zHTWCS76NCz3kYabAZ22w8E557GEn/X81hSLSf7ptloI+wHZAJOvyfVri0TMVYukxlX9AMEgPh6VLkoD9s3aiTMEvxn1jo+WYm3zz/aLnBanL9RJO+rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532688; c=relaxed/relaxed;
	bh=zCEzF6b3AhIcrZU2Osp7l7afSKWH7kr0h8i2eZ7eRhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bCO8TJrilE1eO3e2DqCkb4wPHZE7MztoV8JTZ8GBrFnperOtcfwOi7P8bkLWm2AXbduJVCv6lquZTYzVnEPVen7bBxUM/otRsIDqKWUBnhdMCEZuMW/5Y5WztnSnp8xpA74rYnwefpbfbLgXggYUBzO0NmggpMawLEokB52q1vq+WDNwU20xhVPs1eog0JH93NZK71PyFC9wOvOZ6ZE8gC2viCr+l49L3x+956B1J8lhUSa9PpwN+skAMi8wiQfxHk01aNT5mDEMrGexsTcfpWPfev745ltOedjdC28Ax4TCfaW8BVCN6v9Hg5AQrxKwKbauqTYegBBU7rGoVzbUgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6OSXiiz; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6OSXiiz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCx9m0GPGz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532685; x=1766068685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hEYACrOz31CVWF4+kaFkukP67Pa2cOMxI/UHaf8xp/A=;
  b=L6OSXiizdM/Y7Z9bLBQ9cJO04CX0sHhW06YanJnXGgc3F8Af1FvO2Jw3
   3zLZTMVr0YdiI/UGHJhlQAPlZ6vKrszswea5sr41RY00Ib0YPcp1wogZn
   J3z3e8F1n1bBmjZvD3zWOLhZFg6IQ5eLRRZJqtpPdd2K10JLGJCKv88ax
   45XMzvZoFt6Tf50+cOOKC2ONoYBpoqfRPHFscV4vU+0x+43CBxKFgjnyI
   HDGpxtq0c3vM4PoFIlXy3iml/dwvyGaNktg+XYZ96svvSSFKXGS0fWGvY
   DOy7RP3eGG6IPmaMFv1LFgO9KTurugye3FKnhTgNJwI87nZ7Y8CHTBxnn
   w==;
X-CSE-ConnectionGUID: 2s+7QuoZRBq9sR5MnuPrUQ==
X-CSE-MsgGUID: 1bRJEHBYT2qz55+aRTjzhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45499310"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45499310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:37:59 -0800
X-CSE-ConnectionGUID: qVrAda+6R46rb42byuBurg==
X-CSE-MsgGUID: +bPR9X9US5y1ZRJjScW0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97726883"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:37:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 0/7] PCI: Consolidate TLP Log reading and printing
Date: Wed, 18 Dec 2024 16:37:40 +0200
Message-Id: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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
 drivers/pci/pcie/aer.c        |  15 ++---
 drivers/pci/pcie/dpc.c        |  14 ++---
 drivers/pci/pcie/tlp.c        | 113 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 include/linux/aer.h           |   3 +-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |  11 ++--
 11 files changed, 153 insertions(+), 60 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

-- 
2.39.5


