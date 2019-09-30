Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88BC1A27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 04:13:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hQtT5YS2zDqPn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tf6eIchY"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hQnL32SYzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 12:09:10 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f21so3266794plj.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 19:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MQ9C5D2pIjxtgzo4yVQfpILkEUvZWmVx5Oo69HXIq8=;
 b=Tf6eIchYTJJ6HB8+pDvWoFPPKt6DXO80N10eIjs++8R+5WcAvRpfNxZjm6StUBipWj
 7R/Qw9qhqeoUuxUAZTpFKrhuVjFsGyJuPhWPlkX1tGIf6TRudciGXsxHaaPtjjRSIdyO
 7Pkr3T/dUl37GYzU8sLMP2NCEQnqGPk3zBHc22vSOykwQSUNIujJeBORffA/cR2Tdbna
 g5z6Xow/QI72KxWBMs6eNkdLh2oRCcAw62mcwYj/LtTP6UqldwjUgo7thmHXTIfoRoiA
 SFeEeXM/qOQshMdJbkfCuvBmTFEx6yK1wmHAlWzXige09TX3iucC4P5nY1WfFnyDatg6
 fkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MQ9C5D2pIjxtgzo4yVQfpILkEUvZWmVx5Oo69HXIq8=;
 b=U/TXkIcwY6/8Tq2TCu8rAkthc676VsWcKG3SSygz8kf+Le+Vy+kFX8+DhK/uaJ7ieC
 jpKkVTGS3qZFXhx/i8Gv6R/N+/p0WdqhV5KXVhfAv+EYgKzyt4FVjLDKYiPNizizPlGp
 HXuZYfES3WLQ6hvPLVoG9/McmAPvRWJA8SL1e3KmFmSAbWPcyGvyIVlCXYK6rNCVC3nc
 OKHfmVJD9bxbG0UdEnqAlx/QxG3CW4wZY+lH7MHGXGTD5cXMxC/p8qFLXEhoXAIXfJn8
 zHwvKa4GoQQq96Rk1NvIGaV5Kp4DS7OrR0zj90a7bH5ctCURRHGYZhCLan/cARywdboj
 gObA==
X-Gm-Message-State: APjAAAWXXM/LbYukVftnpPw9pshYnGBDKz63jtA7BmT2qrRFVSnP5RH0
 vUfvUerZPzAzixuSAM9wVgInr4K2
X-Google-Smtp-Source: APXvYqyE9QwN95Qw7WOIU+JPp5GuMXB6QLQNlk86LK1sujLh/uxthmQzCx6Dwxoc0VVF61UdtdkwUQ==
X-Received: by 2002:a17:902:b789:: with SMTP id
 e9mr18178242pls.88.1569809347711; 
 Sun, 29 Sep 2019 19:09:07 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x72sm11450733pfc.89.2019.09.29.19.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 19:09:07 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/pci: Fix pcibios_setup_device() ordering
Date: Mon, 30 Sep 2019 12:08:47 +1000
Message-Id: <20190930020848.25767-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930020848.25767-1-oohall@gmail.com>
References: <20190930020848.25767-1-oohall@gmail.com>
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

