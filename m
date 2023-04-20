Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EA6E87BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 04:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q217z3wGfz3fRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 12:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=hgKzGosD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=hgKzGosD;
	dkim-atps=neutral
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q21741d3Hz3c8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 11:59:26 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 0BAE641EAA;
	Thu, 20 Apr 2023 01:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681955962;
	bh=18fxRuTXUXBCZGjHQDK8n5GxW6CRAotRhBz1xm7lXP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=hgKzGosDoQ+l+SxBBQSEIp3Y84gOuxy9mDwcnupbbcnr8+74Kfa/GsYlnC8oFbj/I
	 82C7bHnlkby6k5/NlOkjlr6Dc+GXdckGFYc5wAgtv+rCPl3hm2tdJiOvWSZ+PaR0n/
	 xpSBm2HJzFjKl362BADGO86rsOJcv3Xbc11MyRM8R8p6zwXLdeZNuR3bazqluFobOS
	 5p0QOmr51GVlfRbBJBliaLXEx8KEUB3bwEzZaDdIpBH0n/lrVlUX7ohMKCxdelf7jQ
	 P9F6X3pHsl8FgGbcExjV4alT6LkKYkoK64BJmHxilkFRx3qu3h6eyWX/cU2k7OUfx9
	 5A0YsPKDZaDXw==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v2 2/4] PCI/AER: Factor out interrput toggling into helpers
Date: Thu, 20 Apr 2023 09:58:28 +0800
Message-Id: <20230420015830.309845-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420015830.309845-1-kai.heng.feng@canonical.com>
References: <20230420015830.309845-1-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many places that enable and disable AER interrput, so move
them into helpers.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - New patch.

 drivers/pci/pcie/aer.c | 45 +++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f6c24ded134c..1420e1f27105 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1227,6 +1227,28 @@ static irqreturn_t aer_irq(int irq, void *context)
 	return IRQ_WAKE_THREAD;
 }
 
+static void aer_enable_irq(struct pci_dev *pdev)
+{
+	int aer = pdev->aer_cap;
+	u32 reg32;
+
+	/* Enable Root Port's interrupt in response to error messages */
+	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
+	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
+	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+}
+
+static void aer_disable_irq(struct pci_dev *pdev)
+{
+	int aer = pdev->aer_cap;
+	u32 reg32;
+
+	/* Disable Root's interrupt in response to error messages */
+	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
+	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
+	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+}
+
 /**
  * aer_enable_rootport - enable Root Port's interrupts when receiving messages
  * @rpc: pointer to a Root Port data structure
@@ -1256,10 +1278,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
 	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
 	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
 
-	/* Enable Root Port's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	aer_enable_irq(pdev);
 }
 
 /**
@@ -1274,10 +1293,7 @@ static void aer_disable_rootport(struct aer_rpc *rpc)
 	int aer = pdev->aer_cap;
 	u32 reg32;
 
-	/* Disable Root's interrupt in response to error messages */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
+	aer_disable_irq(pdev);
 
 	/* Clear Root's error status reg */
 	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
@@ -1372,12 +1388,8 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 	 */
 	aer = root ? root->aer_cap : 0;
 
-	if ((host->native_aer || pcie_ports_native) && aer) {
-		/* Disable Root's interrupt in response to error messages */
-		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
-		pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, reg32);
-	}
+	if ((host->native_aer || pcie_ports_native) && aer)
+		aer_disable_irq(root);
 
 	if (type == PCI_EXP_TYPE_RC_EC || type == PCI_EXP_TYPE_RC_END) {
 		rc = pcie_reset_flr(dev, PCI_RESET_DO_RESET);
@@ -1396,10 +1408,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
 		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
 		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
 
-		/* Enable Root Port's interrupt in response to error messages */
-		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
-		reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
-		pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, reg32);
+		aer_enable_irq(root);
 	}
 
 	return rc ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
-- 
2.34.1

