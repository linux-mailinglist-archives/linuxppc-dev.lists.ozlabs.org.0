Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F812910FF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bsQ87yp0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pK50crpz3g3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:04:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bsQ87yp0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pCy3xjXz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:59:42 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so1661205e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906379; x=1719511179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N96v/xJSF44bcVyCHB4QmppynpZ04LIg2lQPnevoNOk=;
        b=bsQ87yp09pZQ/wl9at+XnpWE2fuqP/UvEVqDP87tFligKqcyEcurOldIfyncAokNMh
         EGa6yXnx53fZ+lSpgy54gRQEVQ2PQTs3stFKaEUm/DpcgxtdLBVYKyDVP+GHjARaxDmu
         A6nMYNHwEGqDoAJYVp+gKDgoXbdoQNY8AyJyQ4UGkX3dKVokW/ZX5LU/G9zcyO4HQR6D
         i/8GKSOkFITApTJjUbvZe+Svjew7nQUb7/oPUw+zEabOujo8wE5+eq59M/3r8Z4huefz
         fS8t21XYJ+3HCE+o5uThMHQq83RCaqMr1lKKyHB0RCBLKWLnKwhCXmmZ1lXcgLMmjKtx
         X2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906379; x=1719511179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N96v/xJSF44bcVyCHB4QmppynpZ04LIg2lQPnevoNOk=;
        b=TYxtRkwyxccaYHfMujoyKzCJUGm6qEMzc+7yBeC1CSM7qBrnPAlzTmPr3xAPDYXTZw
         2TOQBHeebrM7TUQm5l2dO+URXSbXR+U4R7DlXcqc8IzuwhXsqOdvrZJXNbu/h95Mhuiy
         GLG9Sj9eEaqlcdFQyzCxFrbDdBmCQdRu7KUuKmrv28jOUl85C8MR8hEYqEg1ZFNoyJBU
         0kELENxn7hmvk6Mm/c9fhN8hGMlqXOArHEQlr9YWh197/7xAHJ6j27rEa7QwUizZbWs1
         6bWwWGlm5OOHhEojnJ9PbIyrPIKf7LRFkYU58bHPXenH0At20E3u8Kc0UWNdn4M1x29V
         tvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpDbXsQXKHs3OSzrM0iSudDl18zV3GZh/9p2zJ1fPsFwFewHFzYa64ZraGIxyk4KbNBTfOuGORqppL8tt2SeikTs8obj61Gq8FkYdE/g==
X-Gm-Message-State: AOJu0YwJyK9mxsemDT5ZVAFL7l/kGu2FUZO/E706f38qonp4+4czt5HW
	+DxTDRTGwQ826KTHorKeSjs6/xTTZgZgzar4SseSdL+/aRED5iyZLOLHYoVifu8=
X-Google-Smtp-Source: AGHT+IHveDZi3AG+V+IjSIcVQHPKMgHS8NiErS9uK5dRF+3tF//P+rST8N6AhSqc9tu0JXG+kNZsMg==
X-Received: by 2002:a05:6512:108a:b0:52c:cd77:fe03 with SMTP id 2adb3069b0e04-52ccd77ff08mr4842778e87.14.1718906379116;
        Thu, 20 Jun 2024 10:59:39 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:38 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX SoC
Date: Thu, 20 Jun 2024 19:56:37 +0200
Message-Id: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
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
Cc: Markus Elfring <Markus.Elfring@web.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer,
this driver allows to route a signal request line thru the multiplexer for
given peripheral.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 MAINTAINERS                  |   1 +
 drivers/dma/Kconfig          |   9 ++
 drivers/dma/Makefile         |   1 +
 drivers/dma/lpc32xx-dmamux.c | 195 +++++++++++++++++++++++++++++++++++
 4 files changed, 206 insertions(+)
 create mode 100644 drivers/dma/lpc32xx-dmamux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fadf1baafd89..5ffe988ee282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2403,6 +2403,7 @@ R:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+F:	drivers/dma/lpc32xx-dmamux.c
 N:	lpc32xx
 
 ARM/Marvell Dove/MV78xx0/Orion SOC support
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 002a5ec80620..aeace3d7e066 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -378,6 +378,15 @@ config LPC18XX_DMAMUX
 	  Enable support for DMA on NXP LPC18xx/43xx platforms
 	  with PL080 and multiplexed DMA request lines.
 
+config LPC32XX_DMAMUX
+	bool "NXP LPC32xx DMA MUX for PL080"
+	depends on ARCH_LPC32XX || COMPILE_TEST
+	depends on OF && AMBA_PL08X
+	select MFD_SYSCON
+	help
+	  Support for PL080 multiplexed DMA request lines on
+	  LPC32XX platrofm.
+
 config LS2X_APB_DMA
 	tristate "Loongson LS2X APB DMA support"
 	depends on LOONGARCH || COMPILE_TEST
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 802ca916f05f..6f1350b62e7f 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
 obj-y += idxd/
 obj-$(CONFIG_K3_DMA) += k3dma.o
 obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
+obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
 obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
 obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
 obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
new file mode 100644
index 000000000000..4e6ce6026164
--- /dev/null
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2024 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+//
+// Based on TI DMA Crossbar driver by:
+//   Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
+//   Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define LPC32XX_SSP_CLK_CTRL 0x78
+#define LPC32XX_I2S_CLK_CTRL 0x7c
+
+struct lpc32xx_dmamux {
+	int signal;
+	char *name_sel0;
+	char *name_sel1;
+	int muxval;
+	int muxreg;
+	int bit;
+	bool busy;
+};
+
+/* From LPC32x0 User manual "3.2.1 DMA request signals" */
+static struct lpc32xx_dmamux lpc32xx_muxes[] = {
+	{
+		.signal = 3,
+		.name_sel0 = "spi2-rx-tx",
+		.name_sel1 = "ssp1-rx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 5,
+	},
+	{
+		.signal = 10,
+		.name_sel0 = "uart7-rx",
+		.name_sel1 = "i2s1-dma1",
+		.muxreg = LPC32XX_I2S_CLK_CTRL,
+		.bit = 4,
+	},
+	{
+		.signal = 11,
+		.name_sel0 = "spi1-rx-tx",
+		.name_sel1 = "ssp1-tx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 4,
+	},
+	{
+		.signal = 14,
+		.name_sel0 = "none",
+		.name_sel1 = "ssp0-rx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 3,
+	},
+	{
+		.signal = 15,
+		.name_sel0 = "none",
+		.name_sel1 = "ssp0-tx",
+		.muxreg = LPC32XX_SSP_CLK_CTRL,
+		.bit = 2,
+	},
+};
+
+struct lpc32xx_dmamux_data {
+	struct dma_router dmarouter;
+	struct regmap *reg;
+	spinlock_t lock; /* protects busy status flag */
+};
+
+static void lpc32xx_dmamux_release(struct device *dev, void *route_data)
+{
+	struct lpc32xx_dmamux_data *dmamux = dev_get_drvdata(dev);
+	struct lpc32xx_dmamux *mux = route_data;
+	unsigned long flags;
+
+	dev_dbg(dev, "releasing dma request signal %d routed to %s\n",
+		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+
+	guard(spinlock)(&dmamux->lock);
+
+	mux->busy = false;
+}
+
+static void *lpc32xx_dmamux_reserve(struct of_phandle_args *dma_spec,
+				    struct of_dma *ofdma)
+{
+	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
+	struct device *dev = &pdev->dev;
+	struct lpc32xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
+	unsigned long flags;
+	struct lpc32xx_dmamux *mux = NULL;
+	int i;
+
+	if (dma_spec->args_count != 3) {
+		dev_err(&pdev->dev, "invalid number of dma mux args\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lpc32xx_muxes); i++) {
+		if (lpc32xx_muxes[i].signal == dma_spec->args[0])
+			mux = &lpc32xx_muxes[i];
+	}
+	if (!mux) {
+		dev_err(&pdev->dev, "invalid mux request number: %d\n",
+			dma_spec->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (dma_spec->args[2] > 1) {
+		dev_err(&pdev->dev, "invalid dma mux value: %d\n",
+			dma_spec->args[1]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* The of_node_put() will be done in the core for the node */
+	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
+	if (!dma_spec->np) {
+		dev_err(&pdev->dev, "can't get dma master\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	spin_lock_irqsave(&dmamux->lock, flags);
+	if (mux->busy) {
+		spin_unlock_irqrestore(&dmamux->lock, flags);
+		dev_err(dev, "dma request signal %d busy, routed to %s\n",
+			mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+		of_node_put(dma_spec->np);
+		return ERR_PTR(-EBUSY);
+	}
+
+	mux->busy = true;
+	mux->muxval = dma_spec->args[2] ? BIT(mux->bit) : 0;
+
+	regmap_update_bits(dmamux->reg, mux->muxreg, BIT(mux->bit), mux->muxval);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
+	dma_spec->args[2] = 0;
+	dma_spec->args_count = 2;
+
+	dev_dbg(dev, "dma request signal %d routed to %s\n",
+		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
+
+	return mux;
+}
+
+static int lpc32xx_dmamux_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct lpc32xx_dmamux_data *dmamux;
+	int ret;
+
+	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
+	if (!dmamux)
+		return -ENOMEM;
+
+	dmamux->reg = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(dmamux->reg)) {
+		dev_err(&pdev->dev, "syscon lookup failed\n");
+		return PTR_ERR(dmamux->reg);
+	}
+
+	spin_lock_init(&dmamux->lock);
+	platform_set_drvdata(pdev, dmamux);
+	dmamux->dmarouter.dev = &pdev->dev;
+	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
+
+	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
+				      &dmamux->dmarouter);
+}
+
+static const struct of_device_id lpc32xx_dmamux_match[] = {
+	{ .compatible = "nxp,lpc3220-dmamux" },
+	{},
+};
+
+static struct platform_driver lpc32xx_dmamux_driver = {
+	.probe	= lpc32xx_dmamux_probe,
+	.driver = {
+		.name = "lpc32xx-dmamux",
+		.of_match_table = lpc32xx_dmamux_match,
+	},
+};
+
+static int __init lpc32xx_dmamux_init(void)
+{
+	return platform_driver_register(&lpc32xx_dmamux_driver);
+}
+arch_initcall(lpc32xx_dmamux_init);
-- 
2.25.1

