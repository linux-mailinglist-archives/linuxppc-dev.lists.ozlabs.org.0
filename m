Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1236FFDA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 02:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHTWP06Rcz3fgv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 10:03:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=krTNOjEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=krTNOjEN;
	dkim-atps=neutral
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHTSZ0Qq4z3fPy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 10:01:18 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 980A64179B;
	Fri, 12 May 2023 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683849674;
	bh=3BPzMXXBFs6fLOYxOkArjjMcNB35OJnLugmMxdqyF3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=krTNOjENq0W8Mw1vYRI/+NhDl9OOYXbclhVOJ0xUJxxO7XWx5PtLW+wE2CemlXfK8
	 +Bt1RCru26m761ZzEWag8gwEaJlkhxF5GNRtrlUzXUArp0di4sd6jzW04vVD4zbJEf
	 +lhhtMYeU2QPmVuUTKzLIxsHn/hwAh+ZP88eLnyDwiFgK+W26Jt7U8AS9Dog+R+4cV
	 O72BrVUnPJ/Gq/QfDDxWoySb2ttdgJ308XQPWO6hWYIA0j4YZkPvyuBaDVaO6Cn7qt
	 eEWPKpAWMGsdgR1ntIyVUTNEz0Oq+Te332xF1S7885V4zhUGdUV7QM6oQve6KbfXl8
	 41cEiRj7I29NA==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v6 3/3] PCI/DPC: Disable DPC interrupt during suspend
Date: Fri, 12 May 2023 08:00:14 +0800
Message-Id: <20230512000014.118942-3-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512000014.118942-1-kai.heng.feng@canonical.com>
References: <20230512000014.118942-1-kai.heng.feng@canonical.com>
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

PCIe services that share an IRQ with PME, such as AER or DPC, may cause a
spurious wakeup on system suspend. Since DPC depends on AER to work, disable
DPC interrupt notification during the system suspend process as AER interrupt
notification is already disabled by previous patch.

As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Management",
TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot), L2
(D3cold with aux power) and L3 (D3cold) states. So disabling the DPC
notification during suspend and re-enabling them during the resume process
should not affect the basic functionality.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v6:
v5:
 - Wording.

v4:
v3:
 - No change.

v2:
 - Only disable DPC IRQ.
 - No more check on PME IRQ#.

 drivers/pci/pcie/dpc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 3ceed8e3de41..d2d845c20438 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -384,6 +384,30 @@ static int dpc_probe(struct pcie_device *dev)
 	return status;
 }
 
+static int dpc_suspend(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+	u16 ctl;
+
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl &= ~PCI_EXP_DPC_CTL_INT_EN;
+	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+
+	return 0;
+}
+
+static int dpc_resume(struct pcie_device *dev)
+{
+	struct pci_dev *pdev = dev->port;
+	u16 ctl;
+
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
+	ctl |= PCI_EXP_DPC_CTL_INT_EN;
+	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
+
+	return 0;
+}
+
 static void dpc_remove(struct pcie_device *dev)
 {
 	struct pci_dev *pdev = dev->port;
@@ -399,6 +423,8 @@ static struct pcie_port_service_driver dpcdriver = {
 	.port_type	= PCIE_ANY_PORT,
 	.service	= PCIE_PORT_SERVICE_DPC,
 	.probe		= dpc_probe,
+	.suspend	= dpc_suspend,
+	.resume		= dpc_resume,
 	.remove		= dpc_remove,
 };
 
-- 
2.34.1

