Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73DAABD9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:18:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PVpL4r92zDr68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 05:18:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="eJiz/bNf"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PVjx0jDHzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 05:14:28 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 3818C7E74E;
 Thu,  5 Sep 2019 14:13:56 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1567710836; bh=jkDnyyJxLCKRf9Hh3sYC8Cvd+CcM72dsoaJ1/VZoyXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJiz/bNfIq2gq62s8P6uE/cX9dvr2amsxdM1sSH4w9JN1qcmXpWwCfbYM4BybXt0p
 CpEGqgHoVksQl5NNTNqVMiwNiQw0eQDILY37Rra9soEYrYxWMJlqXJOV4LpG9TDWpP
 /Ooz0aPiRe3GMswgMwGGKbClH8EDxvsqET0mp5YXTP+we/Dr6ko4TuCNtQjz0vqTks
 hjuvtfGwl1d9oiLuyPn9iBucUW5tMu1lMw7vJ4aBeM7969LOs8JLDINa7exg0sEwNK
 kEAvb618MyrVplHG8aEEY20rQoulLuDQQyLG5ll0MH06//ZHmibs2LTg8susmD4GEE
 XqUT832Kx2H3g==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/1] powerpc/pci: Fix pcibios_setup_device() ordering
Date: Thu,  5 Sep 2019 14:13:43 -0500
Message-Id: <20190905191343.2919-2-shawn@anastas.io>
In-Reply-To: <20190905191343.2919-1-shawn@anastas.io>
References: <20190905191343.2919-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, aik@ozlabs.ru, lukas@wunner.de, oohall@gmail.com,
 bhelgaas@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move PCI device setup from pcibios_add_device() and pcibios_fixup_bus() to
pcibios_bus_add_device(). This ensures that platform-specific DMA and IOMMU
setup occurs after the device has been registered in sysfs, which is a
requirement for IOMMU group assignment to work

This fixes IOMMU group assignment for hotplugged devices on pseries, where
the existing behavior results in IOMMU assignment before registration.

Thanks to Lukas Wunner <lukas@wunner.de> for the suggestion.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/kernel/pci-common.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index f627e15bb43c..d119c77efb69 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -261,12 +261,6 @@ int pcibios_sriov_disable(struct pci_dev *pdev)
 
 #endif /* CONFIG_PCI_IOV */
 
-void pcibios_bus_add_device(struct pci_dev *pdev)
-{
-	if (ppc_md.pcibios_bus_add_device)
-		ppc_md.pcibios_bus_add_device(pdev);
-}
-
 static resource_size_t pcibios_io_size(const struct pci_controller *hose)
 {
 #ifdef CONFIG_PPC64
@@ -987,15 +981,17 @@ static void pcibios_setup_device(struct pci_dev *dev)
 		ppc_md.pci_irq_fixup(dev);
 }
 
-int pcibios_add_device(struct pci_dev *dev)
+void pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	/*
-	 * We can only call pcibios_setup_device() after bus setup is complete,
-	 * since some of the platform specific DMA setup code depends on it.
-	 */
-	if (dev->bus->is_added)
-		pcibios_setup_device(dev);
+	/* Perform platform-specific device setup */
+	pcibios_setup_device(pdev);
+
+	if (ppc_md.pcibios_bus_add_device)
+		ppc_md.pcibios_bus_add_device(pdev);
+}
 
+int pcibios_add_device(struct pci_dev *dev)
+{
 #ifdef CONFIG_PCI_IOV
 	if (ppc_md.pcibios_fixup_sriov)
 		ppc_md.pcibios_fixup_sriov(dev);
@@ -1037,9 +1033,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 
 	/* Now fixup the bus bus */
 	pcibios_setup_bus_self(bus);
-
-	/* Now fixup devices on that bus */
-	pcibios_setup_bus_devices(bus);
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
 
-- 
2.20.1

