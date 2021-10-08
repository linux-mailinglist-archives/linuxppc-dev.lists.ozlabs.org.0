Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F3426F35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv8L6fkVz3cJs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=lMd+AC6b;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lWjI/0N/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=lMd+AC6b; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lWjI/0N/; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv365cj7z3bP6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:34 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DADCF581011;
 Fri,  8 Oct 2021 12:36:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Hd9JVOR2fA8Cb
 BVqM5ZRD7ZkZFb/IvxEfGJqA+awhtc=; b=lMd+AC6b5ACahKuJ05ooQ6LpCVI6t
 ldgzUNUIVWm2fUlkXfQDTZKJ7F8hkBubbTEuEWwRDUheUridLbztr+3EA+iPEtCR
 yR0r3ZXi1QZ3osFaIga3vXWOudtuaftekX19JcvPcfAF93gXze0kkVibrdAJ04Ky
 kF0SHoKqtmeedFhhyoHszebYjYmcalUhRlkVlpQvudQpN1cz+SxY2n1eH4/UFt9F
 nCbnzf90hDnRnyLrSlFqnfd8zwa9srWFulUvnCuatNIpmTg0EjWDeMaBSM3ElIoc
 UIs3u4uj41aL6fIqCWE157ISDmJL0nAJWBeS8j93hJxD6edI+hAxhRVWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Hd9JVOR2fA8CbBVqM5ZRD7ZkZFb/IvxEfGJqA+awhtc=; b=lWjI/0N/
 IGFwi8MmvynPI9dieJAPpX+krpphYLXMpT0IB18rMo0E7xZdQSiDXCRChGGDsTC1
 uiRXl8OBzIE8/awYBLcQftiduqOSMbyM+9XXsluqvUxHtOulkHQo1yBx3yP7EaZz
 1dYNVuwmjWkvD8fqCHtbbj3FmeI/m2yNzhkwq8wh6fC7yQEhnprRs4+K61BfwhsW
 lT2590rzeP44Z778bneIFrCTACBs86ZpRSOJ6YmsCyxcwDHD1TUzsWWtvdTX8CV/
 fWQKUt1InNyvPKhipzRYTk7tg/lmZL74GFQxNWG9EwdwTwarob67WG4K7pIC+LAx
 i1NQgOVYE3QimQ==
X-ME-Sender: <xms:kHNgYeRIKq-3lQKhpC9hyK5N_g_ucG22XgxL-4HDU3Q_n0612N4xGA>
 <xme:kHNgYTz9o8TgMNTrLh0ctpV8CEsQgQ0CoZsHsnmUP8epfIIFUGH9GabAfvZ9fij2P
 CePgbLbS6o3C_JdOuA>
X-ME-Received: <xmr:kHNgYb0SB4Jn5WbaYKpkKihGhNdqHR-RslvJUpVwNqpNNGgHxQo9psZMlHJrr1dIMSjhLebzBErPU2TI1ymhv4Vvrbb2yQUpfRNmGOmc-fierEvWgizcysE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:kHNgYaA0-CgGh2pv2LtHKfJvknngJqnsMDX0Iu0RhAufWbXegpk4cQ>
 <xmx:kHNgYXjsufDQWdQx_DbXJusDw6Xe50gXIs-luUXk3G9K71RqlQN5eQ>
 <xmx:kHNgYWobJBnI0deRgc5LS5oZ8kaR6p0kHxJjWWpFuJn1-drv12HD4Q>
 <xmx:kHNgYXyxE4-sxEq_KVf7Hu7cfEUZOP7d0kJ4HpinhRWBBe8b0e26yg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:28 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 06/11] i2c: pasemi: Split pci driver to its own file
Date: Fri,  8 Oct 2021 18:35:27 +0200
Message-Id: <20211008163532.75569-7-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
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

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

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
index baf338149673..d1cab11a4d50 100644
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
-	smbus->ioaddr = pci_iomap(dev, 0, 0);
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
-	pci_iounmap(dev, smbus->ioaddr);
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
-	pci_iounmap(dev, smbus->ioaddr);
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
index 000000000000..644656e28012
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
+	smbus->ioaddr = pci_iomap(dev, 0, 0);
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
+	pci_iounmap(dev, smbus->ioaddr);
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
+	pci_iounmap(dev, smbus->ioaddr);
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

