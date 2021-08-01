Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6893DCA99
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 09:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GctM76Sm8z3dRP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 17:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GctKl70yRz2ymH
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 17:38:33 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 4ED11F409C5; Sun,  1 Aug 2021 09:38:27 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 1/5] nvmem: nintendo-otp: Add new driver for the Wii and
 Wii U OTP
Date: Sun,  1 Aug 2021 09:38:18 +0200
Message-Id: <20210801073822.12452-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801073822.12452-1-linkmauve@linkmauve.fr>
References: <20210701225743.14631-1-linkmauve@linkmauve.fr>
 <20210801073822.12452-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This OTP is read-only and contains various keys used by the console to
decrypt, encrypt or verify various pieces of storage.

Its size depends on the console, it is 128 bytes on the Wii and
1024 bytes on the Wii U (split into eight 128 bytes banks).

It can be used directly by writing into one register and reading from
the other one, without any additional synchronisation.

This driver was written based on reversed documentation, see:
https://wiiubrew.org/wiki/Hardware/OTP

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Tested-by: Jonathan Neuschäfer <j.ne@posteo.net>  # on Wii
Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>  # on Wii U
---
 drivers/nvmem/Kconfig        |  11 ++++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/nintendo-otp.c | 124 +++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/nvmem/nintendo-otp.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index dd2019006838..39854d43758b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -107,6 +107,17 @@ config MTK_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called efuse-mtk.
 
+config NVMEM_NINTENDO_OTP
+	tristate "Nintendo Wii and Wii U OTP Support"
+	help
+	  This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
+
+	  This memory contains common and per-console keys, signatures and
+	  related data required to access peripherals.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-nintendo-otp.
+
 config QCOM_QFPROM
 	tristate "QCOM QFPROM Support"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index bbea1410240a..dcbbde35b6a8 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+= nvmem_lpc18xx_otp.o
 nvmem_lpc18xx_otp-y		:= lpc18xx_otp.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)	+= nvmem-mxs-ocotp.o
 nvmem-mxs-ocotp-y		:= mxs-ocotp.o
+obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
+nvmem-nintendo-otp-y		:= nintendo-otp.o
 obj-$(CONFIG_MTK_EFUSE)		+= nvmem_mtk-efuse.o
 nvmem_mtk-efuse-y		:= mtk-efuse.o
 obj-$(CONFIG_QCOM_QFPROM)	+= nvmem_qfprom.o
diff --git a/drivers/nvmem/nintendo-otp.c b/drivers/nvmem/nintendo-otp.c
new file mode 100644
index 000000000000..33961b17f9f1
--- /dev/null
+++ b/drivers/nvmem/nintendo-otp.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nintendo Wii and Wii U OTP driver
+ *
+ * This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
+ *
+ * This memory contains common and per-console keys, signatures and
+ * related data required to access peripherals.
+ *
+ * Based on reversed documentation from https://wiiubrew.org/wiki/Hardware/OTP
+ *
+ * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#define HW_OTPCMD  0
+#define HW_OTPDATA 4
+#define OTP_READ   0x80000000
+#define BANK_SIZE  128
+#define WORD_SIZE  4
+
+struct nintendo_otp_priv {
+	void __iomem *regs;
+};
+
+struct nintendo_otp_devtype_data {
+	const char *name;
+	unsigned int num_banks;
+};
+
+static const struct nintendo_otp_devtype_data hollywood_otp_data = {
+	.name = "wii-otp",
+	.num_banks = 1,
+};
+
+static const struct nintendo_otp_devtype_data latte_otp_data = {
+	.name = "wiiu-otp",
+	.num_banks = 8,
+};
+
+static int nintendo_otp_reg_read(void *context,
+				 unsigned int reg, void *_val, size_t bytes)
+{
+	struct nintendo_otp_priv *priv = context;
+	u32 *val = _val;
+	int words = bytes / WORD_SIZE;
+	u32 bank, addr;
+
+	while (words--) {
+		bank = (reg / BANK_SIZE) << 8;
+		addr = (reg / WORD_SIZE) % (BANK_SIZE / WORD_SIZE);
+		iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
+		*val++ = ioread32be(priv->regs + HW_OTPDATA);
+		reg += WORD_SIZE;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nintendo_otp_of_table[] = {
+	{ .compatible = "nintendo,hollywood-otp", .data = &hollywood_otp_data },
+	{ .compatible = "nintendo,latte-otp", .data = &latte_otp_data },
+	{/* sentinel */},
+};
+MODULE_DEVICE_TABLE(of, nintendo_otp_of_table);
+
+static int nintendo_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *of_id =
+		of_match_device(nintendo_otp_of_table, dev);
+	struct resource *res;
+	struct nvmem_device *nvmem;
+	struct nintendo_otp_priv *priv;
+
+	struct nvmem_config config = {
+		.stride = WORD_SIZE,
+		.word_size = WORD_SIZE,
+		.reg_read = nintendo_otp_reg_read,
+		.read_only = true,
+		.root_only = true,
+	};
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	if (of_id->data) {
+		const struct nintendo_otp_devtype_data *data = of_id->data;
+		config.name = data->name;
+		config.size = data->num_banks * BANK_SIZE;
+	}
+
+	config.dev = dev;
+	config.priv = priv;
+
+	nvmem = devm_nvmem_register(dev, &config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static struct platform_driver nintendo_otp_driver = {
+	.probe = nintendo_otp_probe,
+	.driver = {
+		.name = "nintendo-otp",
+		.of_match_table = nintendo_otp_of_table,
+	},
+};
+module_platform_driver(nintendo_otp_driver);
+MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
+MODULE_DESCRIPTION("Nintendo Wii and Wii U OTP driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0

