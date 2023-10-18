Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21697CDA99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 13:37:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VFbMMJNp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9TN83m9hz3vb1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 22:37:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VFbMMJNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9TLK2j48z2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 22:35:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628937; x=1729164937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eqc17uG/Wp2D66WXcFZdwU3+R9wxUscpDbfeTvikXZs=;
  b=VFbMMJNpjnDtIaOlaum3efpFoZ7nu3B85drk/txRoBO21vB5k7Xusoul
   T3bYEuz28yyhucO1Ql1dOAr8LJg6hbgr3YGnTXGITHVprfEw73oPYslme
   MAHvqoWSaW4aL8WbiF2O/OLrP22Wc7wWvDZCqBlgVMsfHnYWLHMoM98pC
   Uz6csUcfcjkamjdok3/tv3JQy9hHvPgTVTLEslUYAWRNM5aPfKqpdcJmK
   znP/hdGaN36FHVGKdb5B5h8ICmey60yQ+OUldwgQuxUqkVda1y+Krv4Wa
   ISG+/u1yzqTiVyr/enr1QGNi7nuHsAEJi4oBZsTy2si5uNDWuStYx2ea0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="383215929"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="383215929"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826855323"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="826855323"
Received: from suguccin-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.44.63])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] PCI/DPC: Use defined fields with DPC_CTL register
Date: Wed, 18 Oct 2023 14:32:52 +0300
Message-Id: <20231018113254.17616-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231018113254.17616-1-ilpo.jarvinen@linux.intel.com>
References: <20231018113254.17616-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of using a literal to clear bits, add PCI_EXP_DPC_CTL_EN_MASK
and use the usual pattern to modify a bitfield.

While at it, rearrange RMW code more logically together.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/dpc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index a5c259ada9ea..0048a11bd119 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -18,6 +18,9 @@
 #include "portdrv.h"
 #include "../pci.h"
 
+#define PCI_EXP_DPC_CTL_EN_MASK	(PCI_EXP_DPC_CTL_EN_FATAL | \
+				 PCI_EXP_DPC_CTL_EN_NONFATAL)
+
 static const char * const rp_pio_error_string[] = {
 	"Configuration Request received UR Completion",	 /* Bit Position 0  */
 	"Configuration Request received CA Completion",	 /* Bit Position 1  */
@@ -369,12 +372,13 @@ static int dpc_probe(struct pcie_device *dev)
 	}
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
-	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
 
-	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl &= ~PCI_EXP_DPC_CTL_EN_MASK;
+	ctl |= PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
 	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
-	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
 
+	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
 	pci_info(pdev, "error containment capabilities: Int Msg #%d, RPExt%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
 		 cap & PCI_EXP_DPC_IRQ, FLAG(cap, PCI_EXP_DPC_CAP_RP_EXT),
 		 FLAG(cap, PCI_EXP_DPC_CAP_POISONED_TLP),
-- 
2.30.2

