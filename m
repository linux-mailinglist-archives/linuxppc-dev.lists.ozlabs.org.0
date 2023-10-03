Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD77B6986
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 14:54:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHzSWgQ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Hnr1fvFz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 23:54:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHzSWgQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Hmy5B2fz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:53:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696337603; x=1727873603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=702HqFQNmxV7YgGeTBn23DHTxJX9WZ3IGA7eOFHSmOU=;
  b=cHzSWgQ6Rqp2V0d4D/iGsGd9c1juvpdkB1y9x44c1x4V0g/2A+pN1HKX
   z7oIkjr93d/hqNguv2I+Q+B7HWEmBXlFN0Ojz1K86C11RyBQ824/+CF4c
   6c5AtcoYgD8yICrrg11soLRQphcZosLv71i7vvUtMVZMFwbFwDjP4KrJU
   5azefmRAD6Q1MSchxQ3zTNuKml+S67OG/xCAhBdBPliQyMJ82p82rSKSN
   1CSWbJmsdgZb6Yq4Gl+XIWk8UJGNj5QmeaAXWOuDIihEZizqXl5O4o9zp
   vwlOzvoIibNUBECG/aoa3pSH2Dn/wdX8pUOHzrKp5SQFBZ2BkH5gdnI4B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022282"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="447022282"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005890"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="998005890"
Received: from bmihaile-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.222.64])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jonathan.derrick@linux.dev,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	marek.vasut+renesas@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	m.karthikeyan@mobiveil.co.in,
	nirmal.patel@linux.intel.com,
	rjui@broadcom.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	sbranden@broadcom.com,
	yoshihiro.shimoda.uh@renesas.com,
	Zhiqiang.Hou@nxp.com
Subject: [PATCH 0/3] PCI: PCI_HEADER_TYPE bugfix & cleanups
Date: Tue,  3 Oct 2023 15:52:57 +0300
Message-Id: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One bugfix and cleanups for PCI_HEADER_TYPE_* literals.

This series only covers what's within drivers/pci/. I'd have patches
for other subsystems too but I decided to wait with them until
PCI_HEADER_TYPE_MFD is in Linus' tree (to keep the series receipient
count reasonable, the rest can IMO go through the subsystem specific
trees once the define is there).

Ilpo Järvinen (3):
  PCI: vmd: Correct PCI Header Type Register's MFD bit check
  PCI: Add PCI_HEADER_TYPE_MFD pci_regs.h
  PCI: Use PCI_HEADER_TYPE_* instead of literals

 drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
 .../controller/mobiveil/pcie-mobiveil-host.c  |  2 +-
 drivers/pci/controller/pcie-iproc.c           |  2 +-
 drivers/pci/controller/pcie-rcar-ep.c         |  2 +-
 drivers/pci/controller/pcie-rcar-host.c       |  2 +-
 drivers/pci/controller/vmd.c                  |  5 ++---
 drivers/pci/hotplug/cpqphp_ctrl.c             |  6 ++---
 drivers/pci/hotplug/cpqphp_pci.c              | 22 +++++++++----------
 drivers/pci/hotplug/ibmphp.h                  |  5 +++--
 drivers/pci/hotplug/ibmphp_pci.c              |  2 +-
 drivers/pci/pci.c                             |  2 +-
 drivers/pci/quirks.c                          |  6 ++---
 include/uapi/linux/pci_regs.h                 |  1 +
 13 files changed, 30 insertions(+), 29 deletions(-)

-- 
2.30.2

