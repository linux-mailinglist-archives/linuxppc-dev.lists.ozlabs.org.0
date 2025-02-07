Return-Path: <linuxppc-dev+bounces-5946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF48A2C867
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 17:19:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqK0m2F3lz2ynL;
	Sat,  8 Feb 2025 03:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738945144;
	cv=none; b=TZaeGMrk1WrxA1x67HU2Ojnal72aD/6X3W4TpxFEtac0uWFsLoUUbDFjbcs/szRCsbcSZCBU0Hr7IbKj4byXlDy+aOv6wyFUD1SxQJo9h5DI5pFBU5HX45S0iCAkldaov4ZKvGppeIbpeD3GFSJt6O9tiNEvnC5PO8+3xGlVZeNjUmCVm+fDO/G0nu9nMWa+NdDoZ7tMNB9K64lVgDdTNGGKUmAtvgnBEfGXhiwGA/aJOP6O2NfpGw43RdrtTw9qPec/+GgiOb9IhFcFDlUuXueMmtj8H7L81JuyA0BYLlyqjRXCkWKEwHF0fWxG1ZgAp55aFrFp/OEaRcwq07oXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738945144; c=relaxed/relaxed;
	bh=ZGKL+nUxmhDvy41YeiX3+6OnEc6+TMxbXsmKxK1DLvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=giaejqUtsuBbQoXTtA2GEF8+avQwIL0AWt2zX2cncZNGRmfGFwOajhi0uuL6nq7Gg26CaWES/y326bLK6SIb0RVIjw3ndJbDFhHHrj5/rDGmurUB1rJsgGJ9vZ1yA0u7eJx41N/3YVWjhXdLvHUc4wcON62DvOKMYIxWY/KMF5LYXuNvs+u+qfO+NuMo0ewdmiaLQA9wT3oaM7JrcvALVKf1ZC7huuQ673SfAh4pRMr8xwx7VBY17nNXo0zXiQ/8r+Gx7mIXWJkJkaYYrBanZNT8zgj2Dm0YLkT6GUa68F+7xayZqM0q9iG8SweMcACnZxcW4bPUDKH2MzAShyFRDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIHPXmtC; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIHPXmtC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqK0j6gGYz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 03:19:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738945143; x=1770481143;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ffYOgS4UhPejR6mXfcmPkQCxK4R+XKjUS4+aNbxNe9I=;
  b=MIHPXmtCz4OZIdFhpnYGH+JzCSsTuJ7n3TwQfAjyrbK4+dAfnJEz0V9G
   GA4nuZ6+g3ojhpr+hCY1ArJDjuxFlV1xcnH29Wu55PI2O2uuRCAvH1GaD
   mzWRD1Z4H84EVVGuZcjxoHos86w/H3ahYQx9jEKe4r9TBk8x86LpIEX7c
   EEPFqZnIS8WzfjlIwQETtgXH/tYLKxylO2+cwBzTSo320ilkWzWoUbkxy
   F6otiSUfSUzcKd2oFgXX1BPa9K2r/AU8/PhVNnlI/7vkP9C/1+TspKxNm
   HcXP6+yq5Sqdz9Ldt13OcDwbgQKuFaZPGArTIkLZbnrifpdF6vo8+ycFc
   w==;
X-CSE-ConnectionGUID: wDktQ1LzTgSfZDeKzfDieg==
X-CSE-MsgGUID: qZTwJYQvQ8SM0H2Y/CVxNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57006826"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57006826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:18:58 -0800
X-CSE-ConnectionGUID: uxOX1lgPSoii9D6Sxtphgg==
X-CSE-MsgGUID: Prm7B2SPQRG+ICL20NFI0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116502373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:18:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 0/2] PCI: Add support for logging Flit Mode TLPs (PCIe6)
Date: Fri,  7 Feb 2025 18:18:34 +0200
Message-Id: <20250207161836.2755-1-ilpo.jarvinen@linux.intel.com>
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

This series adds support for Flit Mode (PCIe6).

v2:
- Rebased

Ilpo Järvinen (2):
  PCI: Track Flit Mode Status & print it with link status
  PCI: Handle TLP Log in Flit mode

 drivers/pci/hotplug/pciehp_hpc.c |  5 +--
 drivers/pci/pci.c                | 12 ++++---
 drivers/pci/pci.h                |  6 ++--
 drivers/pci/pcie/aer.c           |  1 +
 drivers/pci/pcie/dpc.c           | 18 ++++++++--
 drivers/pci/pcie/tlp.c           | 56 ++++++++++++++++++++++----------
 drivers/pci/probe.c              |  5 +--
 include/linux/aer.h              | 12 +++++--
 include/linux/pci.h              |  1 +
 include/ras/ras_event.h          | 12 +++----
 include/uapi/linux/pci_regs.h    |  6 +++-
 11 files changed, 94 insertions(+), 40 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5


