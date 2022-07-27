Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58618581D37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 03:35:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsxD94PQ3z3dqp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:35:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=TFT3im8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=TFT3im8f;
	dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsxBz62tZz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 11:34:03 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E199F3F39B;
	Wed, 27 Jul 2022 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658885640;
	bh=DsZRX8j/q4Cpjzn1W11I3hAQXEWJrBN86NgoVVaLV3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TFT3im8fedDV8eqhGPtwSn5vtGFvE76IEoZRXyiGAyzytfZ8PqyKDLyMGQMWenpoz
	 EdSIjBu6PSxYV7wq2N2wFN1sjp2XAE+SK1jV7fNMAAz8baJle8ANICSqr+hTaycaEh
	 FuYrwAQ2Di/3kKJWgn6RN/72amg9Xwr4/uATsenmxJ0BgIRSXeod0tz+cHOwRMQnu1
	 /R68+i0BdBJgtsIjpvbw9QwfsdOwIwgSUDlTyRXpn9DA6Sh2gOy/CNheuZLoPyvSq5
	 a4cN9IRMFVgkW+Ij64VEIj9aOxWqBDJLEO93w7suSgZPd0+IMpRG85rwJZ24vvL62M
	 1rBCFxj6z5rGg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH 3/3] PCI/DPC: Disable DPC service on suspend when IRQ is shared with PME
Date: Wed, 27 Jul 2022 09:32:52 +0800
Message-Id: <20220727013255.269815-3-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220727013255.269815-1-kai.heng.feng@canonical.com>
References: <20220727013255.269815-1-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCIe service that shares IRQ with PME may cause spurious wakeup on
system suspend.

Since AER is conditionally disabled in previous patch, also apply the
same condition to disable DPC which depends on AER to work.

PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
(D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
much here to disable DPC during system suspend.

This is very similar to previous attempts to suspend AER and DPC [1],
but with a different reason.

[1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=216295

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/pci/pcie/dpc.c | 52 +++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 3e9afee02e8d1..542f282c43f75 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -343,13 +343,33 @@ void pci_dpc_init(struct pci_dev *pdev)
 	}
 }
 
+static void dpc_enable(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+	u16 ctl;
+
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
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
@@ -364,10 +384,7 @@ static int dpc_probe(struct pcie_device *dev)
 	}
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
-	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
-
-	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
-	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+	dpc_enable(dev);
 	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
 
 	pci_info(pdev, "error containment capabilities: Int Msg #%d, RPExt%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
@@ -380,14 +397,25 @@ static int dpc_probe(struct pcie_device *dev)
 	return status;
 }
 
-static void dpc_remove(struct pcie_device *dev)
+static int dpc_suspend(struct pcie_device *dev)
 {
-	struct pci_dev *pdev = dev->port;
-	u16 ctl;
+	if (dev->shared_pme_irq)
+		dpc_disable(dev);
 
-	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
-	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
-	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+	return 0;
+}
+
+static int dpc_resume(struct pcie_device *dev)
+{
+	if (dev->shared_pme_irq)
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
@@ -395,6 +423,8 @@ static struct pcie_port_service_driver dpcdriver = {
 	.port_type	= PCIE_ANY_PORT,
 	.service	= PCIE_PORT_SERVICE_DPC,
 	.probe		= dpc_probe,
+	.suspend	= dpc_suspend,
+	.resume		= dpc_resume,
 	.remove		= dpc_remove,
 };
 
-- 
2.36.1

