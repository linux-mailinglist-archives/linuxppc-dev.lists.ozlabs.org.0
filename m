Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64FA9984
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 06:27:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P72w533KzDr1g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 14:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="jWXbsz+q"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P6xX2ZrvzDr1g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 14:23:12 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 7047184B9D;
 Wed,  4 Sep 2019 23:22:38 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1567657359; bh=EmICgee2nNUFVTp9r6uhX6GMoMfnTqEaFNlse3ssPuc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jWXbsz+qQlJDwPgeEAudXQxT2TUqfzpY3dno5FjhVl+ySQe2k4YPNyAJiizFaGOW8
 30eusimYMGDWVV7N5VurXjBJTEyl9yrF8DKNx07OkJqUG2CdXRF3XRiveqkvL/Agu/
 R6S4+HhElHqIKVI/so6TWwk0f1gVazk4YZXazlJ55PF1irrgDOBWGOUXfsQIvvVwHJ
 7j3xsXfcQuaVRbQMPLQRFFCKtF3+qi+oI/7z5Fdxia2KRbzsq1y0cm4CcmwenSb1pV
 4P4WG4fVojFNGuUYaAN1N+DR6BxczBQEEjiY2rmffJyPKAxGrybqVtkVYodtVYRY/i
 SAbsgciFBr2aA==
From: Shawn Anastasio <shawn@anastas.io>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pci: Fix IOMMU setup for hotplugged devices on
 pseries
Date: Wed,  4 Sep 2019 23:22:15 -0500
Message-Id: <20190905042215.3974-3-shawn@anastas.io>
In-Reply-To: <20190905042215.3974-1-shawn@anastas.io>
References: <20190905042215.3974-1-shawn@anastas.io>
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
Cc: sbobroff@linux.ibm.com, aik@ozlabs.ru, oohall@gmail.com,
 bhelgaas@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move PCI device setup from pcibios_add_device() to pcibios_fixup_dev().
This ensures that platform-specific DMA and IOMMU setup occurs after the
device has been registered in sysfs, which is a requirement for IOMMU group
assignment to work.

This fixes IOMMU group assignment for hotplugged devices on pseries, where
the existing behavior results in IOMMU assignment before registration.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/kernel/pci-common.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index f627e15bb43c..21b4761bb0ed 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -987,15 +987,14 @@ static void pcibios_setup_device(struct pci_dev *dev)
 		ppc_md.pci_irq_fixup(dev);
 }
 
-int pcibios_add_device(struct pci_dev *dev)
+void pcibios_fixup_dev(struct pci_dev *dev)
 {
-	/*
-	 * We can only call pcibios_setup_device() after bus setup is complete,
-	 * since some of the platform specific DMA setup code depends on it.
-	 */
-	if (dev->bus->is_added)
-		pcibios_setup_device(dev);
+	/* Device is registered in sysfs and ready to be set up */
+	pcibios_setup_device(dev);
+}
 
+int pcibios_add_device(struct pci_dev *dev)
+{
 #ifdef CONFIG_PCI_IOV
 	if (ppc_md.pcibios_fixup_sriov)
 		ppc_md.pcibios_fixup_sriov(dev);
-- 
2.20.1

