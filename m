Return-Path: <linuxppc-dev+bounces-4257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD179F4CD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJFm46G6z2xks;
	Wed, 18 Dec 2024 00:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443660;
	cv=none; b=Ks+elsaPVSbZyIL8FXxRkmIpvOmMDjkaD2iLYyEwc3LPa27FrPNRyciFKrkHqFX7pQPg7MAC5Id+gdwRlIqxjyzYH9vvUTnmxgtfTcvWbs8MHPKUS6opjNe4iB7zKVYzBLGD6RSykBJaoF7zH8Vo9a63/1dCfjT1wxZ9iuy/rzsgRcQ9iiMMRsNrihF6DOVXDIYkLzicXXcRFTVhlntuynbng3vj5pNtJjzL5kItl/v+yzzTALJVMLcy7Zl54rtIiKAU3psLB6sM9/Bs/OzSPW4GkBRlAhyyH1ZZ6dWMkgUbaxSb7+1LQ9zeLkyKkoac2X7rlH0PfFkhhJ/T/jyI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443660; c=relaxed/relaxed;
	bh=+mIZ+JVD1ZUeCiFcPq6TkdEQYjZJ22tX3KYfYaF6h+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iAh8Go5N1P9w+dYRUSidiJCLNbvz/gKqvZORd9CxqfqIkX2sqDJrQosspuBWn6oBLvLuujjajAjRG5Fo30n25ldXHIrnizNrLdLj4/bv5gZRUx63pe3b9+PcrL6gRI60uItmhSxLo55m6Xa2VPakQMa8J2kOVo12NS47h401vzq/yg1WkIQ8ecuUFGw4JGygz0soiQiU3HPTwT6cUtt1RGTCIQavVLi4dvgqDhFAOjg60vR+6DvuWcVkYCVkbsibrEaBOMFPQ23vBliLdB8M82pu0rf06UkrYChHsFcpwq8/kmrJVpS2Inp7W2R11rYv9IlMDFEYsyQMOTOyeiKGxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=htxY4ntt; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=htxY4ntt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJFk0F5Hz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:54:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443658; x=1765979658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CZX/6/+OxDVXx5b5rYNO8um6p31384Ad+FAPxWdGq8E=;
  b=htxY4nttodtilg2S4M6ber4wFuNpMYyzpb7a0DqoRXEsqYUs2Hwd4wgO
   TLFRQDS5b/GarUPWhkdchiDtL9CkRBAvpl3cG7Iuwxv3O63t+ASyIcoqe
   B2Vktj9eNoummyA3WKFJuI550in9CwZXWH90XXtW9G3P2DSbyZQyl3kKn
   en9YEyKKlXN4K/clRrnlFPUb9Y+UsOL9zttT+euOkWzZel+i7VQ7/1VKb
   qMox4uTP0j9HcO66XY3JCHYhtxCc87Bg3P6TUItPoSS1gxH0UMRlIrgvX
   72R6cdy8nUwHUyVZhMXChuH24e1I+aqkaCXnq3pNS1B+urOAv2gCHw7oG
   w==;
X-CSE-ConnectionGUID: K99FIp/gSJqw/AbBw7Y59A==
X-CSE-MsgGUID: /F2HFxsnR26dMCajazURdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34192957"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34192957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:13 -0800
X-CSE-ConnectionGUID: js4GW3CoTES7nTTrGKNphw==
X-CSE-MsgGUID: 9tpaRidnRuqgyvaom6Gz5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102634412"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 0/8] PCI: Consolidate TLP Log reading and printing
Date: Tue, 17 Dec 2024 15:53:50 +0200
Message-Id: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
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

I only now realized the last patch will conflict with my pci_printk()
cleanups series. I'm sorry for the extra hassle.

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
 drivers/pci/pcie/aer.c        |  27 ++++----
 drivers/pci/pcie/dpc.c        |  14 ++---
 drivers/pci/pcie/tlp.c        | 112 ++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c           |  14 +++--
 include/linux/aer.h           |   3 +-
 include/linux/pci.h           |   2 +-
 include/uapi/linux/pci_regs.h |  11 ++--
 11 files changed, 158 insertions(+), 66 deletions(-)
 create mode 100644 drivers/pci/pcie/tlp.c

-- 
2.39.5


