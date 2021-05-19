Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4A388D8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlWp94F6gz3f6M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlSmX4QF1z2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 19:50:52 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 92EE8F40629; Wed, 19 May 2021 11:50:47 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] nvmem: nintendo-otp: Add new driver for the Wii and
 Wii U OTP
Date: Wed, 19 May 2021 11:50:41 +0200
Message-Id: <20210519095044.4109-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519095044.4109-1-linkmauve@linkmauve.fr>
References: <20210519095044.4109-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 May 2021 22:03:54 +1000
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
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>,
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

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig        |  11 ++++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/nintendo-otp.c | 115 +++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/nvmem/nintendo-otp.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index dd2019006838..dd6196e49b2d 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -107,6 +107,17 @@ config MTK_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called efuse-mtk.
 
+config NVMEM_NINTENDO_OTP
+	tristate "Nintendo Wii and Wii U OTP Support"
+	help
+	  This is a driver to expose the OTP on a Nintendo Wii or Wii U.
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
index 000000000000..de6f5d7c10ef
--- /dev/null
+++ b/drivers/nvmem/nintendo-otp.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nintendo Wii and Wii U OTP driver
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
+	int words = bytes >> 2;
+	u32 bank, addr;
+
+	while (words--) {
+		bank = (reg << 1) & ~0xff;
+		addr = (reg >> 2) & 0x1f;
+		iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
+		*val++ = ioread32be(priv->regs + HW_OTPDATA);
+		reg += 4;
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
+		.stride = 4,
+		.word_size = 4,
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
+		config.size = data->num_banks * 128;
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
2.31.1

