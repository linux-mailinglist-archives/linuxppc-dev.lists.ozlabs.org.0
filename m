Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB01909085
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:38:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Hifkx3Uy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14hW4zZSz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Hifkx3Uy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14fG04Xcz3cZr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:36:05 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2eadaac1d28so23877381fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382962; x=1718987762; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy3GGlbh3G2vnmNyR+RwO5HO4iCoGtDW9R/i+yrCC54=;
        b=Hifkx3UyCWJvWfmEjIcId+QNNJNCnucLGr3qnni34K1OSGe/hBigTiGo0FMmzrvfQ2
         9cB6PZ3fBHZRGSo+lJHZdX8cx4ndKae0ZDvcsIWsuAYB/KiDu1Jz48upXVTA0GQEtVDN
         vCSTbSbKuM/1i7TAzE5scHOk885tVaehzRKvu83aHl9AfjLbzHdAFz8YwdXDxPglycZq
         Nh6Wh1N1wyRnbL7l5nHqfLRK6i1FS4jGySZ5ZEY13rJctfjS1eoo7muoEPvbYt+xrwxB
         7KcQwt2YygLTCsdTztXK6wFxlqIfSmzF67EsQjZdLE7Ylm0Mkb9fa30aV3g1zRzTKjtQ
         SMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382962; x=1718987762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy3GGlbh3G2vnmNyR+RwO5HO4iCoGtDW9R/i+yrCC54=;
        b=DTJZcfu/iJgMiJiL281tELadKQrF3w+KA68beMELibKSYDkQjM5OME4R37lWijERIt
         mMX/4ZWAsNpUfVJEQ/TXccWvDqG7u7lrA06gRaJpRRJHe09D944LjtuoyZq9n/V9C3r9
         HRyg6QcRzsNXcuLzLpuOfq28haIx1GTI/hLoZNJbK3RfXcaYcvpSBbSc4RYJffzsQrjb
         sugEp1uoiTFqYx5CXWUMg9OfFjJ5bBmc9QcOK14+fb4A+ANwBWWel84lRTFf+xOPTct9
         A0kWXerpkjpt5tm8jK27jW0sRJmIAdCpGtV6rNC7GpUbZm5ufGu9hBLSk7jd9Sj5BC8Y
         XKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8SDOPjE2aUtDMLUzwMLMqks2MzM+jeWo+WmUMLZJs+vxW1m0+7os8g3Ds1Eco+zoiBaKS/bck8OEt39moIzZTC3l3d0XmsOa317TFIQ==
X-Gm-Message-State: AOJu0Yz5jIsO1tTkOnq+e1a4lXxlr/4g4tNw//GojD4l55/NVPOebZ+M
	FMbbf+sbxnOKSx4B0j3IDvZReOslI2ze4lNtesLXxdIsAOVXw7INYkXQ9kwIZtM=
X-Google-Smtp-Source: AGHT+IGObyo93x6mViEfQkk8dvpSrxYPk4M/l+DCC0LbAFJwHdY+8GEZYaPp5jt0ycxMk4ErP7bBog==
X-Received: by 2002:a05:651c:153:b0:2ec:19a6:d5c8 with SMTP id 38308e7fff4ca-2ec19a6da8emr14442551fa.12.1718382962310;
        Fri, 14 Jun 2024 09:36:02 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:36:02 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [PATCH v3 3/4] ARM: lpc32xx: Add pl08x virtual dma channels for spi and i2s
Date: Fri, 14 Jun 2024 18:34:51 +0200
Message-Id: <20240614163500.386747-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the signals are multiplexed, multiplexer configured at a signal
request.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Split previous commit for separate subsystems
- Add pl08x virtual dma channels for i2s1
- Add dma mux handling, required when requesting tx dma signal for i2s1

 arch/arm/mach-lpc32xx/phy3250.c | 111 +++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 5371bfaed799..2ec0411964f9 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -9,14 +9,18 @@
  */
 
 #include <linux/amba/pl08x.h>
+#include <linux/amba/pl022.h>
 #include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/mtd/lpc32xx_slc.h>
 #include <linux/of_platform.h>
+#include <linux/spinlock.h>
 
 #include <asm/mach/arch.h>
 #include "common.h"
 #include "lpc32xx.h"
 
+static DEFINE_SPINLOCK(lpc32xx_pl08x_lock);
+
 static struct pl08x_channel_data pl08x_slave_channels[] = {
 	{
 		.bus_id = "nand-slc",
@@ -30,11 +34,97 @@ static struct pl08x_channel_data pl08x_slave_channels[] = {
 		.max_signal = 12,
 		.periph_buses = PL08X_AHB1,
 	},
+	{
+		.bus_id = "i2s0-tx",
+		.min_signal = 13,
+		.max_signal = 13,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s0-rx",
+		.min_signal = 0,
+		.max_signal = 0,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s1-tx",
+		.min_signal = 10,
+		.max_signal = 10,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s1-rx",
+		.min_signal = 2,
+		.max_signal = 2,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-tx",
+		.min_signal = 15,
+		.max_signal = 15,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-rx",
+		.min_signal = 14,
+		.max_signal = 14,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-tx",
+		.min_signal = 11,
+		.max_signal = 11,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-rx",
+		.min_signal = 3,
+		.max_signal = 3,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+};
+
+struct lpc32xx_pl08x_mux {
+	int signal;
+	void __iomem *addr;
+	int bit;
+};
+
+/* From LPC32x0 User manual "3.2.1 DMA request signals" */
+static const struct lpc32xx_pl08x_mux dma_mux[] = {
+	{3, LPC32XX_CLKPWR_SSP_CLK_CTRL, 5},
+	{10, LPC32XX_CLKPWR_I2S_CLK_CTRL, 4},
+	{11, LPC32XX_CLKPWR_SSP_CLK_CTRL, 4},
+	{14, LPC32XX_CLKPWR_SSP_CLK_CTRL, 3},
+	{15, LPC32XX_CLKPWR_SSP_CLK_CTRL, 2},
 };
 
 static int pl08x_get_signal(const struct pl08x_channel_data *cd)
 {
-	return cd->min_signal;
+	const int signal = cd->min_signal;
+	unsigned long flags;
+	int i, tmp;
+
+	/* Set corresponding dma mux bit if muxed */
+	for (i = 0; i < ARRAY_SIZE(dma_mux); i++) {
+		if (dma_mux[i].signal == signal) {
+			spin_lock_irqsave(&lpc32xx_pl08x_lock, flags);
+			tmp = __raw_readl(dma_mux[i].addr);
+			if (cd->muxval)
+				tmp |= BIT(dma_mux[i].bit);
+			else
+				tmp &= ~BIT(dma_mux[i].bit);
+			__raw_writel(tmp, dma_mux[i].addr);
+			spin_unlock_irqrestore(&lpc32xx_pl08x_lock, flags);
+			break;
+		}
+	}
+	return signal;
 }
 
 static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
@@ -61,12 +151,31 @@ static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
 	.dma_filter = pl08x_filter_id,
 };
 
+static struct pl022_ssp_controller lpc32xx_ssp_data[] = {
+	{
+		.bus_id = 0,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp0-tx",
+		.dma_rx_param = "ssp0-rx",
+	},
+	{
+		.bus_id = 1,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp1-tx",
+		.dma_rx_param = "ssp1-rx",
+	}
+};
+
 static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
 	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
 		       &lpc32xx_slc_data),
 	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
 		       &lpc32xx_mlc_data),
+	OF_DEV_AUXDATA("arm,pl022", 0x20084000, NULL, &lpc32xx_ssp_data[0]),
+	OF_DEV_AUXDATA("arm,pl022", 0x2008c000, NULL, &lpc32xx_ssp_data[1]),
 	{ }
 };
 
-- 
2.25.1

