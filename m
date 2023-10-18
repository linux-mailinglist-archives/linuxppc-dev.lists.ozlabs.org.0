Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B317CDA93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 13:35:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xp3T/cVf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9TKx1r6yz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 22:35:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xp3T/cVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9TK065Fcz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 22:34:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697628869; x=1729164869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MqRibY96VGUvi4t4Y8OdfajrD7rQssLGYBUaujkdMxs=;
  b=Xp3T/cVflQMKptecbDvy9AzdxzT/vvXG2+q7TX1vWXFyoMzfyVJueZYU
   pI6/sVrpWH76Oi1gTL7GQXn3Jdv7P3RMZ2EwdFDIIf3HllIKZvCd+dl/q
   lgEoCVTn3EC18lqS1R7JTjpQUdkrJlBqPvuAoa52ErWhZ+JyRkyMzTsOj
   /W76Rxh7PQ1YUx0rTJVbS+VTyN7+n/3nlrcg8qrsuNLst3tbai1yDwSJ/
   NO3tqF+h6nxtecCaZInvLDLffsRlsw5kxpZRO8y/66W+fz230qw6TfDHt
   RBG0LBNUG5sKFHvyfqkrlIiqB+qfV1b90FV85RAqceWjFqN2bpqySi+JQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="371056793"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="371056793"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="930150816"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="930150816"
Received: from suguccin-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.44.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:34:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] PCI: hotplug: Use FIELD_GET/PREP()
Date: Wed, 18 Oct 2023 14:32:50 +0300
Message-Id: <20231018113254.17616-4-ilpo.jarvinen@linux.intel.com>
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

Instead of handcrafted shifts to handle register fields, use
FIELD_GET/FIELD_PREP().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/hotplug/pciehp_core.c | 3 ++-
 drivers/pci/hotplug/pciehp_hpc.c  | 5 +++--
 drivers/pci/hotplug/pnv_php.c     | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_core.c b/drivers/pci/hotplug/pciehp_core.c
index 4042d87d539d..ddd55ad97a58 100644
--- a/drivers/pci/hotplug/pciehp_core.c
+++ b/drivers/pci/hotplug/pciehp_core.c
@@ -20,6 +20,7 @@
 #define pr_fmt(fmt) "pciehp: " fmt
 #define dev_fmt pr_fmt
 
+#include <linux/bitfield.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -103,7 +104,7 @@ static int set_attention_status(struct hotplug_slot *hotplug_slot, u8 status)
 	struct pci_dev *pdev = ctrl->pcie->port;
 
 	if (status)
-		status <<= PCI_EXP_SLTCTL_ATTN_IND_SHIFT;
+		status = FIELD_PREP(PCI_EXP_SLTCTL_AIC, status);
 	else
 		status = PCI_EXP_SLTCTL_ATTN_IND_OFF;
 
diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index fd713abdfb9f..b1d0a1b3917d 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -14,6 +14,7 @@
 
 #define dev_fmt(fmt) "pciehp: " fmt
 
+#include <linux/bitfield.h>
 #include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
@@ -484,7 +485,7 @@ int pciehp_set_raw_indicator_status(struct hotplug_slot *hotplug_slot,
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 
 	pci_config_pm_runtime_get(pdev);
-	pcie_write_cmd_nowait(ctrl, status << 6,
+	pcie_write_cmd_nowait(ctrl, FIELD_PREP(PCI_EXP_SLTCTL_AIC, status),
 			      PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC);
 	pci_config_pm_runtime_put(pdev);
 	return 0;
@@ -1028,7 +1029,7 @@ struct controller *pcie_init(struct pcie_device *dev)
 		PCI_EXP_SLTSTA_DLLSC | PCI_EXP_SLTSTA_PDC);
 
 	ctrl_info(ctrl, "Slot #%d AttnBtn%c PwrCtrl%c MRL%c AttnInd%c PwrInd%c HotPlug%c Surprise%c Interlock%c NoCompl%c IbPresDis%c LLActRep%c%s\n",
-		(slot_cap & PCI_EXP_SLTCAP_PSN) >> 19,
+		FIELD_GET(PCI_EXP_SLTCAP_PSN, slot_cap),
 		FLAG(slot_cap, PCI_EXP_SLTCAP_ABP),
 		FLAG(slot_cap, PCI_EXP_SLTCAP_PCP),
 		FLAG(slot_cap, PCI_EXP_SLTCAP_MRLSP),
diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 881d420637bf..694349be9d0a 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -5,6 +5,7 @@
  * Copyright Gavin Shan, IBM Corporation 2016.
  */
 
+#include <linux/bitfield.h>
 #include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -731,7 +732,7 @@ static int pnv_php_enable_msix(struct pnv_php_slot *php_slot)
 
 	/* Check hotplug MSIx entry is in range */
 	pcie_capability_read_word(pdev, PCI_EXP_FLAGS, &pcie_flag);
-	entry.entry = (pcie_flag & PCI_EXP_FLAGS_IRQ) >> 9;
+	entry.entry = FIELD_GET(PCI_EXP_FLAGS_IRQ, pcie_flag);
 	if (entry.entry >= nr_entries)
 		return -ERANGE;
 
-- 
2.30.2

