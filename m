Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFA851208
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 12:20:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mRmTs1vE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYMSn1vVZz3dS0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 22:20:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mRmTs1vE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYMS26nrSz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:19:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD2DE60F53;
	Mon, 12 Feb 2024 11:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47C0C433F1;
	Mon, 12 Feb 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707736783;
	bh=tWF0UWclQ/NoslADhYsN71fCn5aAl9tVNo99KfKidvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mRmTs1vEJdlljNDjvZu6R0W1Wa3NOZ9ZwI+XspkWtO+1QTAq4wj8UV8GJc1smFBwC
	 6zFi06tclH1qtjP7G/h89Xp6dniA/CXx+GsnKK8j5FDWhE3V4RnWZZpgZxfd/GlRxO
	 Xn54RVt6jB1K6X6QjY6FbdGwZttElmLriRplpPnGA3lSELh7hY20UixxevaX6a0ZYJ
	 nRQ5phyfdHevnCJ5/Z4ZeOurZQvDyjmQx6a9+xLelK2evbl0q6yvhz/2RRg9xvGNdA
	 rzPQkXOdw7OTOJqguy5CtpdyJ4T8fnKDpA1jOmMti3FbZ4uGlAOW0bslU+JYSe31UL
	 BvwkwaAtXCRRA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: pasemi: split driver into two separate modules
Date: Mon, 12 Feb 2024 12:19:04 +0100
Message-Id: <20240212111933.963985-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Olof Johansson <olof@lixom.net>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On powerpc, it is possible to compile test both the new apple (arm) and
old pasemi (powerpc) drivers for the i2c hardware at the same time,
which leads to a warning about linking the same object file twice:

scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o is added to multiple modules: i2c-apple i2c-pasemi

Rework the driver to have an explicit helper module, letting Kbuild
take care of whether this should be built-in or a loadable driver.

Fixes: 9bc5f4f660ff ("i2c: pasemi: Split pci driver to its own file")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Makefile          | 6 ++----
 drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3757b9391e60..aa0ee8ecd6f2 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -90,10 +90,8 @@ obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
-i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
-obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
-i2c-apple-objs := i2c-pasemi-core.o i2c-pasemi-platform.o
-obj-$(CONFIG_I2C_APPLE)	+= i2c-apple.o
+obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi-core.o i2c-pasemi-pci.o
+obj-$(CONFIG_I2C_APPLE)		+= i2c-pasemi-core.o i2c-pasemi-platform.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7d54a9f34c74..bd8becbdeeb2 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -369,6 +369,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pasemi_i2c_common_probe);
 
 irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
 {
@@ -378,3 +379,8 @@ irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
 	complete(&smbus->irq_completion);
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(pasemi_irq_handler);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
+MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
-- 
2.39.2

