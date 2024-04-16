Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A08A6274
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 06:35:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=HVSM+zjo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJWSB4c19z3vg2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:35:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=HVSM+zjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJWPw14jCz3dV3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 14:33:40 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 967B740B81;
	Tue, 16 Apr 2024 04:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713242017;
	bh=UKp3++ga9pwOFwfl9SX2I6VDxPYriu1Ld2SUETczxGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=HVSM+zjoih8kwdzAuFBkJV2cPYIwRhYPOwAILzUUKOxOs2S6WamM4+DSseiYTl7Ub
	 sjM/XvtIglSMtgEcAtxZK1BphiT80MMW8qckz+uDLyip/Dfna435NZYLQsXGuABpDw
	 45FO5eBgstUKt2atiemkYGev6LytrI7FsR2B2GH3y4ePFdbFcUjmlDOb7AW6KB+jia
	 tCm8E28ZtJKTf7LNAi0rpIp8pGVEsCvnfRg1uBWJrIkJ+nUxXOVWGLPYhdEjXUKtGX
	 6R5A/VxDwA4OA7Tw93nBLNnIZ8bUhThFtiLXRVwpkwKmI7lrsYrFOxX1WvGjXkKUp/
	 85JVXVLr39SWg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v8 3/3] PCI/DPC: Disable DPC service on suspend
Date: Tue, 16 Apr 2024 12:32:25 +0800
Message-Id: <20240416043225.1462548-3-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, kbusch@kernel.org, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the power rail gets cut off, the hardware can create some electric
noise on the link that triggers AER. If IRQ is shared between AER with
PME, such AER noise will cause a spurious wakeup on system suspend.

When the power rail gets back, the firmware of the device resets itself
and can create unexpected behavior like sending PTM messages. If DPC is
enabled, the DPC reset happens before driver's resume routine. The DPC
reset usually fails because the device is not in the right state, and
the resume also fails because the device is being reset by hardware. If
the scenario happens to device like NVMe, it means the whole system
resume fails.

As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
Management", TLP and DLLP transmission are disabled for a Link in L2/L3
Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. So if
the power will be turned off during suspend process, disable DPC service
and re-enable it during the resume process. This should not affect the
basic functionality.

Furthermore, since DPC depends on AER to function, and AER is disabled
in previous patch, also disable DPC here.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=209149
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218090
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v8:
 - Wording.
 - Add more bug reports.

v7:
 - Wording.
 - Disable DPC completely (again) if power will be turned off

v6:
v5:
 - Wording.

v4:
v3:
 - No change.

v2:
 - Only disable DPC IRQ.
 - No more check on PME IRQ#.

 drivers/pci/pcie/dpc.c | 57 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index a668820696dc..7682ac4d6a89 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/suspend.h>
 
 #include "portdrv.h"
 #include "../pci.h"
@@ -412,13 +413,34 @@ void pci_dpc_init(struct pci_dev *pdev)
 	}
 }
 
+static void dpc_enable(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+	u16 ctl;
+
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl &= ~PCI_EXP_DPC_CTL_EN_MASK;
+	ctl |= PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
+	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+}
+
+static void dpc_disable(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+	u16 ctl;
+
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
+	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+}
+
 #define FLAG(x, y) (((x) & (y)) ? '+' : '-')
 static int dpc_probe(struct pcie_device *dev)
 {
 	struct pci_dev *pdev = dev->port;
 	struct device *device = &dev->device;
 	int status;
-	u16 ctl, cap;
+	u16 cap;
 
 	if (!pcie_aer_is_native(pdev) && !pcie_ports_dpc_native)
 		return -ENOTSUPP;
@@ -433,11 +455,7 @@ static int dpc_probe(struct pcie_device *dev)
 	}
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
-
-	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
-	ctl &= ~PCI_EXP_DPC_CTL_EN_MASK;
-	ctl |= PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
-	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+	dpc_enable(dev);
 
 	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
 	pci_info(pdev, "error containment capabilities: Int Msg #%d, RPExt%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
@@ -450,14 +468,29 @@ static int dpc_probe(struct pcie_device *dev)
 	return status;
 }
 
-static void dpc_remove(struct pcie_device *dev)
+static int dpc_suspend(struct pcie_device *dev)
 {
 	struct pci_dev *pdev = dev->port;
-	u16 ctl;
 
-	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
-	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
-	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+	if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware())
+		dpc_disable(dev);
+
+	return 0;
+}
+
+static int dpc_resume(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+
+	if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware())
+		dpc_enable(dev);
+
+	return 0;
+}
+
+static void dpc_remove(struct pcie_device *dev)
+{
+	dpc_disable(dev);
 }
 
 static struct pcie_port_service_driver dpcdriver = {
@@ -465,6 +498,8 @@ static struct pcie_port_service_driver dpcdriver = {
 	.port_type	= PCIE_ANY_PORT,
 	.service	= PCIE_PORT_SERVICE_DPC,
 	.probe		= dpc_probe,
+	.suspend	= dpc_suspend,
+	.resume		= dpc_resume,
 	.remove		= dpc_remove,
 };
 
-- 
2.34.1

