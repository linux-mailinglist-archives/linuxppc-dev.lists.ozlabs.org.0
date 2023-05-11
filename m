Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D66FF322
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 15:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHCd64KrPz3fbK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 23:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=boAXbNMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=boAXbNMq;
	dkim-atps=neutral
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHCcG6Jsmz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 23:37:02 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 46A3D42A99;
	Thu, 11 May 2023 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683812218;
	bh=k6U60AfyHoi50EUXdw1yC205/vKIebqXK872eoYXLZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=boAXbNMqDUHZwzGQv4J58ZS/mKyhZy13pTeRNv17MLiFusW7e6vhqXAKS0mcDdrGr
	 LAmfQ3uwlG7oRvscmEMnBwBJEkgq7O23Vkc3n7vk+zOxczHzWS7rjuss6SdDO9x49i
	 VGGer0xXbwzWTv45h33SY2Kebu7bhqe3dz6xrVNFrtN9WqSZkY7a1wa7Q9vaGU5rIU
	 fAaXEmIwmim1zjLHss1DEk3xzE2QT3TLmDTLh2dKATTUgRNYHX4Fdq59dke3yAwT/U
	 qqpQvcXqXi81i0GmpFbEThzUPamaKbvKFUj1j0g0yFJaRaxB64Rw0HzJnEVNAiEuu9
	 hsPURx+u0mV7Q==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v5 1/3] PCI/AER: Factor out interrupt toggling into helpers
Date: Thu, 11 May 2023 21:36:07 +0800
Message-Id: <20230511133610.99759-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many places that enable and disable AER interrupt, so move
them into helpers.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v5
 - Fix misspelling.

v4:
 - No change.

v3:
 - Correct subject.

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

