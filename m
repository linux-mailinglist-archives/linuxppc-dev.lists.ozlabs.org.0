Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128844188BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQb16qsCz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=J+sJvzwE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CQdA+M9m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=J+sJvzwE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=CQdA+M9m; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxt4smqz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65B07580FC9;
 Sun, 26 Sep 2021 05:59:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 26 Sep 2021 05:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c7KwfXz039aW1
 wfmY7eI8n7gO1ZrMIuHg4HVlfkwtsE=; b=J+sJvzwElGAyYmuAvc+rvWp0ItHSg
 UkKXp+NTBtufjuhICbmcyyS2Y7XpX4ciCDBOSZ6cCr5HoMREX/78fOC8VPba+4Y3
 ajmwYa2UkJh+c9eBEKkpyXvoxaMibp9C13GKrV/KdRR8l3N4EXQo0NYiz9BKDDz+
 GC11uKyOW3445Pvm4hyG8nCT4vadtC0G3BeFO3fVPQAFNUTe1LUqhjMjHoLLw+P0
 jqQHJkSzviLCaIBK/t16bFQltKEQat2mlb/MA+drT4p33AcdGtZe8rBqc5MlWi58
 t7HLLniy9mKvTij2eYbNlOF/gME4ZJYfC+XJ0EBx6k0rYvlWuUZqfnkiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=c7KwfXz039aW1wfmY7eI8n7gO1ZrMIuHg4HVlfkwtsE=; b=CQdA+M9m
 8yYPyUKfAxMHgcy0vuzT9QRKKTgSfIcgujXFDNuOJufIWXQxvyEWEgURSKR4Ncen
 7QrcI8X2zCfQmCAxVpUyVj7+VeWPftpGuZOk9edB7s8AkkTyOgCFHCTmIF/8guUD
 93fOlr/KLdkUwBM7SqdKGt2GdlowekQZOnluj6+LD+L5xOKSrSrgrYksUNFpAIxl
 BBNx38PGwEDGG5BG2eWE9ps9u2X8AceBorRhF+95MnAiaU/lx9nRFEKMTRTUYwYD
 r9e0ai6Hf+MxzYozenUa0EEaf0gJQAi9RwjyGxbtH87T4aJejU7mD4L68MyzO7NJ
 tYV8jj+rsphUig==
X-ME-Sender: <xms:lkRQYeLNy5g_gbbhxN6eUauQG8lS2oOILrn8zMsWxBdHqTkDdHVhPg>
 <xme:lkRQYWLRDTrTo0elW9sx2oez6T9DKJA3fVn0NRWrActx27VXOHfeGKk8fTVImXahI
 aEJjoz2v-6RMBpVgCA>
X-ME-Received: <xmr:lkRQYeuKuBtjrJY1u8QDK9ZzekrSGrpE-2Gx3DckFJcDwopQ5c07X1CPCQc_y73zSvuVc98cU_J8Izu68FTkuiRzpp8Ibj4IOcN_-r8fMaTsKrSemxS6_EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
 hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:lkRQYTa06bnislySjDh8RbSjmfrXHf9YTH1bg_RMvH0wASbgR1qkCg>
 <xmx:lkRQYVYDdlJ3zeDMsi84BSOkmEI8AmDAeskLlJye3Mr09oEHmN8jeQ>
 <xmx:lkRQYfBLbUtOvl6FYiodksgIf47MPbAcouPnOaLnrQNFltPff1N1ZA>
 <xmx:lkRQYZrS0c3De-7eMFCAtYKC5NYuMaEePOWfhVBlSYlC3ceiChIfzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:48 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 05/10] i2c: pasemi: Split pci driver to its own file
Date: Sun, 26 Sep 2021 11:58:42 +0200
Message-Id: <20210926095847.38261-6-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Sep 2021 22:47:12 +1000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Split off the PCI driver so that we can reuse common code for the
platform driver.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/Makefile                   |  1 +
 .../{i2c-pasemi.c => i2c-pasemi-core.c}       | 88 +----------------
 drivers/i2c/busses/i2c-pasemi-core.h          | 19 ++++
 drivers/i2c/busses/i2c-pasemi-pci.c           | 96 +++++++++++++++++++
 4 files changed, 118 insertions(+), 86 deletions(-)
 rename drivers/i2c/busses/{i2c-pasemi.c => i2c-pasemi-core.c} (81%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1336b04f40e2..0ab1b4cb2228 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
+i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
 obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi-core.c
similarity index 81%
rename from drivers/i2c/busses/i2c-pasemi.c
rename to drivers/i2c/busses/i2c-pasemi-core.c
index 9d69ff63f674..3eda5e375fa2 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -15,15 +15,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 
-static struct pci_driver pasemi_smb_driver;
-
-struct pasemi_smbus {
-	struct device           *dev;
-	struct i2c_adapter	 adapter;
-	void __iomem		*ioaddr;
-	unsigned long		 base;
-	int			 size;
-};
+#include "i2c-pasemi-core.h"
 
 /* Register offsets */
 #define REG_MTXFIFO	0x00
@@ -329,7 +321,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= pasemi_smb_func,
 };
 
-static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
+int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 {
 	int error;
 
@@ -352,79 +344,3 @@ static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
-
-static int pasemi_smb_probe(struct pci_dev *dev,
-				      const struct pci_device_id *id)
-{
-	struct pasemi_smbus *smbus;
-	int error;
-
-	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
-		return -ENODEV;
-
-	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
-	if (!smbus)
-		return -ENOMEM;
-
-	smbus->dev = &dev->dev;
-	smbus->base = pci_resource_start(dev, 0);
-	smbus->size = pci_resource_len(dev, 0);
-
-	if (!request_region(smbus->base, smbus->size,
-			    pasemi_smb_driver.name)) {
-		error = -EBUSY;
-		goto out_kfree;
-	}
-
-	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
-	if (!smbus->ioaddr) {
-		error = -EBUSY;
-		goto out_release_region;
-	}
-
-	int error = pasemi_i2c_common_probe(smbus);
-	if (error)
-		goto out_ioport_unmap;
-
-	pci_set_drvdata(dev, smbus);
-
-	return 0;
-
- out_ioport_unmap:
-	ioport_unmap(smbus->ioaddr);
- out_release_region:
-	release_region(smbus->base, smbus->size);
- out_kfree:
-	kfree(smbus);
-	return error;
-}
-
-static void pasemi_smb_remove(struct pci_dev *dev)
-{
-	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
-
-	i2c_del_adapter(&smbus->adapter);
-	ioport_unmap(smbus->ioaddr);
-	release_region(smbus->base, smbus->size);
-	kfree(smbus);
-}
-
-static const struct pci_device_id pasemi_smb_ids[] = {
-	{ PCI_DEVICE(0x1959, 0xa003) },
-	{ 0, }
-};
-
-MODULE_DEVICE_TABLE(pci, pasemi_smb_ids);
-
-static struct pci_driver pasemi_smb_driver = {
-	.name		= "i2c-pasemi",
-	.id_table	= pasemi_smb_ids,
-	.probe		= pasemi_smb_probe,
-	.remove		= pasemi_smb_remove,
-};
-
-module_pci_driver(pasemi_smb_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR ("Olof Johansson <olof@lixom.net>");
-MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
new file mode 100644
index 000000000000..7acc33de6ce1
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/atomic.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+struct pasemi_smbus {
+	struct device		*dev;
+	struct i2c_adapter	 adapter;
+	void __iomem		*ioaddr;
+	unsigned long		 base;
+	int			 size;
+};
+
+int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
new file mode 100644
index 000000000000..9a19df31866b
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2007 PA Semi, Inc
+ *
+ * SMBus host driver for PA Semi PWRficient
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/kernel.h>
+#include <linux/stddef.h>
+#include <linux/sched.h>
+#include <linux/i2c.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+
+#include "i2c-pasemi-core.h"
+
+static struct pci_driver pasemi_smb_pci_driver;
+
+static int pasemi_smb_pci_probe(struct pci_dev *dev,
+				      const struct pci_device_id *id)
+{
+	struct pasemi_smbus *smbus;
+	int error;
+
+	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
+		return -ENODEV;
+
+	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
+	if (!smbus)
+		return -ENOMEM;
+
+	smbus->dev = &dev->dev;
+	smbus->base = pci_resource_start(dev, 0);
+	smbus->size = pci_resource_len(dev, 0);
+
+	if (!request_region(smbus->base, smbus->size,
+			    pasemi_smb_pci_driver.name)) {
+		error = -EBUSY;
+		goto out_kfree;
+	}
+
+	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
+	if (!smbus->ioaddr) {
+		error = -EBUSY;
+		goto out_release_region;
+	}
+
+	error = pasemi_i2c_common_probe(smbus);
+	if (error)
+		goto out_ioport_unmap;
+
+	pci_set_drvdata(dev, smbus);
+
+	return 0;
+
+ out_ioport_unmap:
+	ioport_unmap(smbus->ioaddr);
+ out_release_region:
+	release_region(smbus->base, smbus->size);
+ out_kfree:
+	kfree(smbus);
+	return error;
+}
+
+static void pasemi_smb_pci_remove(struct pci_dev *dev)
+{
+	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
+
+	i2c_del_adapter(&smbus->adapter);
+	ioport_unmap(smbus->ioaddr);
+	release_region(smbus->base, smbus->size);
+	kfree(smbus);
+}
+
+static const struct pci_device_id pasemi_smb_pci_ids[] = {
+	{ PCI_DEVICE(0x1959, 0xa003) },
+	{ 0, }
+};
+
+MODULE_DEVICE_TABLE(pci, pasemi_smb_pci_ids);
+
+static struct pci_driver pasemi_smb_pci_driver = {
+	.name		= "i2c-pasemi",
+	.id_table	= pasemi_smb_pci_ids,
+	.probe		= pasemi_smb_pci_probe,
+	.remove		= pasemi_smb_pci_remove,
+};
+
+module_pci_driver(pasemi_smb_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
+MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
-- 
2.25.1

