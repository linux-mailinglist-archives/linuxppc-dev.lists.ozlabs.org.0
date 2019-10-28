Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA24E6E9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 09:59:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471pYw3GndzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 19:59:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wgxq6MBE"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471pSS0hWgzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 19:54:47 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b128so6488767pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tz/eLS9GWjuONE2SqgYz3LI8GYDdc5KRtTV4JcWn9cM=;
 b=Wgxq6MBEIWzvIM5FQYlmEILX9B4hTz8Lq5H0AZEGCC3df+NSklJRlKh7ikkgdg2hDn
 JdlFmC/500vMuLjZP7BSjT/B6+dkLjiSDamfs68neMQFck1GBqYtiBynf/N02j4IcUsD
 0b9X0RsxoSmP21mZWUvjLxU86H3qjpz6LidqepRp5pCZ6RrUsl3sJ/snGLq3lpmzvLxa
 zEa7HUcgAKEoEZRSB23bri46zw4ymywIoT4V4agEqRS6IMiXTgVJohr9z/k1kzudAe0S
 j4kBQjlqdLWsAJmz3ohTfNKuS3M8aU0bMgDTFMQMsMFxDwNgXVUTDRv9ducssDBwp235
 eMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tz/eLS9GWjuONE2SqgYz3LI8GYDdc5KRtTV4JcWn9cM=;
 b=PV0DuVVB8LEhrwr4OF9pYGvSxB6JhY0YPiLufhClci5xLMs7xCNm/wapHbRWK4JCoU
 j2n+YvXXAMpoaT2V300cGd04WxQJa6VyP8fbXl5h12Zl2+bG6Ndu6mKrFAZPYsdPPbkT
 4GBQINMEedfZSEdSxIefRX128vey6XlCkc2oqZGNJFS9dMDQRIl/SVMe3hGD3EcSzu/7
 EslpKLubHFK2saTS/MND4oytfkpC3bD8845fVCnuNLRIhWZ8dw13hT02LxYfUnBuxc3p
 2x4FPgvwJbp+iqktFXCQh8fs10yYE2lBb9wSmDFY3LgYczggWU3SwinUSmZeFVVrPIPS
 cECA==
X-Gm-Message-State: APjAAAXZO0dvWl8pWav67b56oQUWnZ8ETjKl4HlQT3QFAYOwNmG6dDTK
 vzrp2sFPcehhugfpVDpJSLiI3kFAIOs=
X-Google-Smtp-Source: APXvYqzs5kotA0RconlUqusn0ksFnt4u5f65QNQXt+doD15LRKJ87F1+51WeR3xnNdC7u12LuIQJGg==
X-Received: by 2002:a63:d50c:: with SMTP id c12mr18190381pgg.199.1572252885260; 
 Mon, 28 Oct 2019 01:54:45 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id l24sm10046115pff.151.2019.10.28.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 01:54:44 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/pci: Fix pcibios_setup_device() ordering
Date: Mon, 28 Oct 2019 19:54:23 +1100
Message-Id: <20191028085424.12006-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028085424.12006-1-oohall@gmail.com>
References: <20191028085424.12006-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Shawn Anastasio <shawn@anastas.io>

Move PCI device setup from pcibios_add_device() and pcibios_fixup_bus() to
pcibios_bus_add_device(). This ensures that platform-specific DMA and IOMMU
setup occurs after the device has been registered in sysfs, which is a
requirement for IOMMU group assignment to work

This fixes IOMMU group assignment for hotplugged devices on pseries, where
the existing behavior results in IOMMU assignment before registration.

Thanks to Lukas Wunner <lukas@wunner.de> for the suggestion.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/pci-common.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 1c448cf..b89925ed 100644
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
2.9.5

