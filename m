Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C6908E40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 17:10:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rq3e7aU2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W12ll3D5Hz3cYl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 01:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rq3e7aU2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W12l03zZwz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 01:10:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377805; x=1749913805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lNdCgsrxUfgCEbccTO7z4wHAU6PNz++tfaBMuUB6zXI=;
  b=Rq3e7aU2jUtGEgHf6ifv7XCoxNfccXSWP99X7ZxYpxQ3Xe/aIGdRZevH
   6DB2/Q5THo7c+aaavEW4tX4/u4+kcNMk+WRibjtZxoXaDeXQjnrJxZk8C
   t6D/5ufRrgXt1cV051KKP7Ci8TNBpw98qgkPGhrnJXP2fwYcTcOnYBoO0
   2ogapzg1Z5NyBjuH8R8UjZ1Wk8dgpU21Cse5QJO7X/6KMzJvgTK90HzMB
   I0gWuOpJGkRjGgpDM7ilW8NqYzqhaV3bqaQMqurLQWFAcnvYk09aa5Y/a
   MGILM/pxOF9SluYdRz7AnefDQugpMfL+hOFNfv9tdEkk+Dz5DsF3gT2b0
   w==;
X-CSE-ConnectionGUID: 8yITHSqfQPex9MEaNqt48g==
X-CSE-MsgGUID: H1IWLCMdT2Sho6ZCjm8Nvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19089269"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="19089269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:10:00 -0700
X-CSE-ConnectionGUID: DZYqpDulRLKzAfrTJovpHg==
X-CSE-MsgGUID: WRT7o6jHTCSIhcHhpMI8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40629089"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.222])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:09:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 0/3] PCI: Add support for logging Flit Mode TLPs (PCIe6)
Date: Fri, 14 Jun 2024 18:09:18 +0300
Message-Id: <20240614150921.29724-1-ilpo.jarvinen@linux.intel.com>
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
Cc: Tony Luck <tony.luck@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds support for Flit Mode (PCIe6). The series is built on
top of the TLP Logging refactoring series:

  https://lore.kernel.org/linux-pci/20240514113109.6690-1-ilpo.jarvinen@linux.intel.com/

Important note to maintainer: The series carries
pcie_update_link_speed() refactoring change that is almost identical
with a patch in the PCIe BW controller series. The patch itself is
basically the same but the context has minor difference. This will need
to be considered if applying both series within the same kernel cycle.

Ilpo Järvinen (3):
  PCI: Refactor pcie_update_link_speed()
  PCI: Track Flit Mode Status & print it with link status
  PCI: Handle TLP Log in Flit mode

 drivers/pci/hotplug/pciehp_hpc.c |  5 +--
 drivers/pci/pci.c                | 12 ++++---
 drivers/pci/pci.h                | 13 ++++++--
 drivers/pci/pcie/aer.c           |  4 ++-
 drivers/pci/pcie/dpc.c           | 23 ++++++++++---
 drivers/pci/pcie/tlp.c           | 57 ++++++++++++++++++++++----------
 drivers/pci/probe.c              | 13 +++++---
 include/linux/aer.h              | 13 ++++++--
 include/linux/pci.h              |  1 +
 include/ras/ras_event.h          | 12 +++----
 include/uapi/linux/pci_regs.h    |  6 +++-
 11 files changed, 112 insertions(+), 47 deletions(-)

-- 
2.39.2

