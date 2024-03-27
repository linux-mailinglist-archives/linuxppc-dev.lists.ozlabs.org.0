Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E788DFAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 13:25:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=keMkcfbe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Qr43n87z3vcD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 23:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=keMkcfbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Qq33LhQz3vg2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 23:25:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40275CE178E;
	Wed, 27 Mar 2024 12:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C5CC43390;
	Wed, 27 Mar 2024 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542301;
	bh=jLjPNhssEhsgVPKSr4v89Roh0XQJGGM530uvVjhi2oU=;
	h=From:To:Cc:Subject:Date:From;
	b=keMkcfbet4tgL/ysu50if8HpKVm3GOxd+MJ70eBG6RtdlInNtTuMYcYv57ymAApo5
	 EsK15tcPOBPYg8IpsU8OSeBQ47BZJUvlDRFB/eBnjjkYTZv0cCIu5QZIGJIJypkxBG
	 nX4qE84LyVPfkb95+gzO7vKZGdMYnsFL1hHwkqGApcBDso1SJdXhLRb0f8hZUZBjcG
	 hclI2LffCjyw51E6SzYZHQ8k7wwNESdM8bw1YOZJlWf/GcoG+I8k5G72kVzRvHMr7H
	 UMS6M0zjkh+eqZ59SmpDwif+m9RTmkOjs4RBcG01L47cuAba74bfuP4Ua4wGxa5zbm
	 0N7rxGvE35xkg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com
Subject: FAILED: Patch "PCI/AER: Block runtime suspend when handling errors" failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:24:59 -0400
Message-ID: <20240327122459.2839840-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 002bf2fbc00e5c4b95fb167287e2ae7d1973281e Mon Sep 17 00:00:00 2001
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Date: Mon, 12 Feb 2024 13:01:35 +0100
Subject: [PATCH] PCI/AER: Block runtime suspend when handling errors

PM runtime can be done simultaneously with AER error handling.  Avoid that
by using pm_runtime_get_sync() before and pm_runtime_put() after reset in
pcie_do_recovery() for all recovering devices.

pm_runtime_get_sync() will increase dev->power.usage_count counter to
prevent any possible future request to runtime suspend a device.  It will
also resume a device, if it was previously in D3hot state.

I tested with igc device by doing simultaneous aer_inject and rpm
suspend/resume via /sys/bus/pci/devices/PCI_ID/power/control and can
reproduce:

  igc 0000:02:00.0: not ready 65535ms after bus reset; giving up
  pcieport 0000:00:1c.2: AER: Root Port link has been reset (-25)
  pcieport 0000:00:1c.2: AER: subordinate device reset failed
  pcieport 0000:00:1c.2: AER: device recovery failed
  igc 0000:02:00.0: Unable to change power state from D3hot to D0, device inaccessible

The problem disappears when this patch is applied.

Link: https://lore.kernel.org/r/20240212120135.146068-1-stanislaw.gruszka@linux.intel.com
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Cc: <stable@vger.kernel.org>
---
 drivers/pci/pcie/err.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 59c90d04a609a..705893b5f7b09 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -13,6 +13,7 @@
 #define dev_fmt(fmt) "AER: " fmt
 
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -85,6 +86,18 @@ static int report_error_detected(struct pci_dev *dev,
 	return 0;
 }
 
+static int pci_pm_runtime_get_sync(struct pci_dev *pdev, void *data)
+{
+	pm_runtime_get_sync(&pdev->dev);
+	return 0;
+}
+
+static int pci_pm_runtime_put(struct pci_dev *pdev, void *data)
+{
+	pm_runtime_put(&pdev->dev);
+	return 0;
+}
+
 static int report_frozen_detected(struct pci_dev *dev, void *data)
 {
 	return report_error_detected(dev, pci_channel_io_frozen, data);
@@ -207,6 +220,8 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	else
 		bridge = pci_upstream_bridge(dev);
 
+	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
+
 	pci_dbg(bridge, "broadcast error_detected message\n");
 	if (state == pci_channel_io_frozen) {
 		pci_walk_bridge(bridge, report_frozen_detected, &status);
@@ -251,10 +266,15 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
 	}
+
+	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
+
 	pci_info(bridge, "device recovery successful\n");
 	return status;
 
 failed:
+	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
+
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
 	/* TODO: Should kernel panic here? */
-- 
2.43.0




