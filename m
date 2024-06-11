Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514C903BB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:16:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WZjX9vTB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz7271Tc1z3dV9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WZjX9vTB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3t518x3z3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 19:54:20 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso20658785e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718099658; x=1718704458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ3mCd5wUk2lO1qNcgaAa/3qo1bLq1N6uMEPGllGy1k=;
        b=WZjX9vTBjVokHLFXIjwAWW33sDNCT0ZttGjTreF80zPmrEqwJchIWCt3CXJb8h9/7k
         3NGSV4DOhXoD1ISE/EkEBHey/GjHaRC1O90YRIXENGJVP3UJpRyENRcOZu5gVYpZAa6a
         LPtYN0kJAbJVA4p8mDC/1ulBeBTe2plUYLhAiyDU23U/OQADtd3R4sDPb8uMe1wjhmZY
         3Gb76NQN54TS6Yow+HiMPXIyTn0YtNdztk3Ddv/PPhrbLFET+cdG5qID+4mPj/M6cFmS
         o6XOFPqbu9sA2hRTNZeaphdkrvGBl9j4Kdo4UUV5tU5DLv0KjmOLroTyFgzr6gdHAcCe
         Gt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718099658; x=1718704458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ3mCd5wUk2lO1qNcgaAa/3qo1bLq1N6uMEPGllGy1k=;
        b=HmRRXL1tq00Vmv4v04klkcCeP21C2jZ6U0yRHKYNbtEGI48pO9RHlO4ONhfEShDDG0
         ODackMaROhJA21SKvzQMm1d2n3k6ygtHa44s56d32LmDFmHv8i80UuhhYzV9hTjJreYH
         MVVe6Da6az137HV4HKMiEAwEbEd94AjweUY09TDKNyrLDZJ2oipC/i4JbEovdcSWQgDY
         o7qsENZCRZ5l7Bf0KZ0h6CTDAXNDrMbpqzb0BgG9WWS5DqtecIBJSKhwgCmQXeSJXgM0
         uwP2M0ULQiWid9Cz0vzf6y1cWW9Yah580/kiPMpNJtMLTFy8kSsdPXuD5e0VfJbhM1g8
         MNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUz0RQjOf/F3DoVK1dlQcJg3b1V4hIAqDkKyEZYqgnctYGPL1SXBDPlqeuO/Df8sHikWkArjmjxaCJKrbLvHG7U5yZVwbwl9qGluko7w==
X-Gm-Message-State: AOJu0YzJX/OteenoP655rKoT1UzxW837oBjH0XX0MbA5hX/Rea0Spr2D
	u2bmzD3CeCKSoQ2Tro1FkREnbsM/WORgMUBUbllSS2QYRyayIHPMxyMEHVE+aQHQhTAbxwckEU2
	QR+4=
X-Google-Smtp-Source: AGHT+IHooVt6LmTwFuGFxgJ/o3hiFrcgWT+jirZ0llFY9ql41kTlwce57rsBvFXCKjUVifeKCsz5yQ==
X-Received: by 2002:a50:a685:0:b0:57a:1aa8:b4ae with SMTP id 4fb4d7f45d1cf-57c50864ad3mr9989734a12.3.1718099298910;
        Tue, 11 Jun 2024 02:48:18 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae2340f6sm9059647a12.90.2024.06.11.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:48:18 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
Date: Tue, 11 Jun 2024 11:47:51 +0200
Message-Id: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Jun 2024 22:15:15 +1000
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver was ported from an old version in linux 2.6.27 and adjusted
for the new ASoC framework and DMA API.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v2:
- Coding Style cleanup
- Use dev_err_probe() for error handling in probe function
- Removed unneded err_clk_disable label
- Removed empty function
- Droped of_match_ptr in lpc32xx_i2s_match DT match table
- ASoC struct adjustmes for the latest 6.10-rc3 kernel

 MAINTAINERS                            |   7 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi |   4 +
 arch/arm/mach-lpc32xx/phy3250.c        |  60 ++++
 sound/soc/fsl/Kconfig                  |   7 +
 sound/soc/fsl/Makefile                 |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c            | 383 +++++++++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h            |  94 ++++++
 sound/soc/fsl/lpc3xxx-pcm.c            |  75 +++++
 8 files changed, 632 insertions(+)
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..7616f61d6327 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8909,6 +8909,13 @@ S:	Maintained
 F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 
+FREESCALE SOC LPC32XX SOUND DRIVERS
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Orphan
+F:	sound/soc/fsl/lpc3xxx-*
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..3fa12e3a0093 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -221,6 +221,8 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				clock-names = "i2s_clk";
 				status = "disabled";
 			};
 
@@ -237,6 +239,8 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				clock-names = "i2s_clk";
 				status = "disabled";
 			};
 
diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..b866b9a75558 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/amba/pl08x.h>
+#include <linux/amba/pl022.h>
 #include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/mtd/lpc32xx_slc.h>
 #include <linux/of_platform.h>
@@ -29,6 +30,46 @@ static struct pl08x_channel_data pl08x_slave_channels[] = {
 		.max_signal = 12,
 		.periph_buses = PL08X_AHB1,
 	},
+	{
+		.bus_id = "i2s-tx",
+		.min_signal = 13,
+		.max_signal = 13,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s-rx",
+		.min_signal = 0,
+		.max_signal = 0,
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
 };
 
 static int pl08x_get_signal(const struct pl08x_channel_data *cd)
@@ -60,12 +101,31 @@ static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
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
 
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 270726c134b3..0f100df96f63 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -130,6 +130,13 @@ config SND_SOC_FSL_RPMSG
 	  This option is only useful for out-of-tree drivers since
 	  in-tree drivers select it automatically.
 
+config SND_SOC_FSL_LPC3XXX
+	tristate "SoC Audio for NXP LPC32XX CPUs"
+	depends on ARCH_LPC32XX && SND_SOC
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M if you want to add support for the LPC3XXX I2S interface.
+
 config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 2fe78eed3a48..6d9636919340 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -25,6 +25,7 @@ snd-soc-fsl-xcvr-y := fsl_xcvr.o
 snd-soc-fsl-aud2htx-y := fsl_aud2htx.o
 snd-soc-fsl-rpmsg-y := fsl_rpmsg.o
 snd-soc-fsl-qmc-audio-y := fsl_qmc_audio.o
+snd-soc-fsl-lpc3xxx-y := lpc3xxx-pcm.o lpc3xxx-i2s.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) += snd-soc-fsl-aud2htx.o
 obj-$(CONFIG_SND_SOC_FSL_RPMSG) += snd-soc-fsl-rpmsg.o
 obj-$(CONFIG_SND_SOC_POWERPC_QMC_AUDIO) += snd-soc-fsl-qmc-audio.o
+obj-$(CONFIG_SND_SOC_FSL_LPC3XXX) += snd-soc-fsl-lpc3xxx.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
new file mode 100644
index 000000000000..ea5df520ca28
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define I2S_PLAYBACK_FLAG 0x1
+#define I2S_CAPTURE_FLAG 0x2
+
+#define LPC3XXX_I2S_RATES ( \
+	SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | \
+	SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
+	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+
+#define LPC3XXX_I2S_FORMATS ( \
+	SNDRV_PCM_FMTBIT_S8 | \
+	SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+static u32 absd32(u32 v1, u32 v2)
+{
+	if (v1 > v2)
+		return v1 - v2;
+	return v2 - v1;
+}
+
+static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq, int xbytes, u32 clkrate)
+{
+	u32 i2srate;
+	u32 idxx, idyy;
+	u32 savedbitclkrate, diff, trate, baseclk;
+
+	/* Adjust rate for sample size (bits) and 2 channels and offset for
+	 * divider in clock output
+	 */
+	i2srate = (freq / 100) * 2 * (8 * xbytes);
+	i2srate = i2srate << 1;
+	clkrate = clkrate / 100;
+	baseclk = clkrate;
+	*clkx = 1;
+	*clky = 1;
+
+	/* Find the best divider */
+	*clkx = *clky = 0;
+	savedbitclkrate = 0;
+	diff = ~0;
+	for (idxx = 1; idxx < 0xFF; idxx++) {
+		for (idyy = 1; idyy < 0xFF; idyy++) {
+			trate = (baseclk * idxx) / idyy;
+			if (absd32(trate, i2srate) < diff) {
+				diff = absd32(trate, i2srate);
+				savedbitclkrate = trate;
+				*clkx = idxx;
+				*clky = idyy;
+			}
+		}
+	}
+}
+
+static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	u32 flag;
+	int ret = 0;
+
+	mutex_lock(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		flag = I2S_PLAYBACK_FLAG;
+	else
+		flag = I2S_CAPTURE_FLAG;
+
+	if (flag & i2s_info_p->streams_in_use) {
+		dev_warn(dev, "I2S channel is busy\n");
+		ret = -EBUSY;
+		goto lpc32xx_unlock;
+	}
+
+	if (i2s_info_p->streams_in_use == 0) {
+		ret = clk_prepare_enable(i2s_info_p->clk);
+		if (ret) {
+			dev_err(dev, "Can't enable clock, err=%d\n", ret);
+			goto lpc32xx_unlock;
+		}
+	}
+
+	i2s_info_p->streams_in_use |= flag;
+
+lpc32xx_unlock:
+	mutex_unlock(&i2s_info_p->lock);
+	return ret;
+}
+
+static void lpc3xxx_i2s_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	const u32 stop_bits = (I2S_RESET | I2S_STOP);
+	u32 flag;
+
+	mutex_lock(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		flag = I2S_PLAYBACK_FLAG;
+		regmap_write(regs, I2S_TX_RATE, 0);
+		regmap_update_bits(regs, I2S_DAO, stop_bits, stop_bits);
+	} else {
+		flag = I2S_CAPTURE_FLAG;
+		regmap_write(regs, I2S_RX_RATE, 0);
+		regmap_update_bits(regs, I2S_DAI, stop_bits, stop_bits);
+	}
+	i2s_info_p->streams_in_use &= ~flag;
+
+	if (i2s_info_p->streams_in_use == 0)
+		clk_disable_unprepare(i2s_info_p->clk);
+
+	mutex_unlock(&i2s_info_p->lock);
+}
+
+static int lpc3xxx_i2s_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
+				      int clk_id, unsigned int freq, int dir)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* Will use in HW params later */
+	i2s_info_p->freq = freq;
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
+		dev_warn(dev, "unsupported bus format %d\n", fmt);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	struct regmap *regs = i2s_info_p->regs;
+	int xfersize;
+	u32 tmp, clkx, clky;
+
+	tmp = I2S_RESET | I2S_STOP;
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		tmp |= I2S_WW8 | I2S_WS_HP(I2S_WW8_HP);
+		xfersize = 1;
+		break;
+
+	case SNDRV_PCM_FORMAT_S16_LE:
+		tmp |= I2S_WW16 | I2S_WS_HP(I2S_WW16_HP);
+		xfersize = 2;
+		break;
+
+	case SNDRV_PCM_FORMAT_S32_LE:
+		tmp |= I2S_WW32 | I2S_WS_HP(I2S_WW32_HP);
+		xfersize = 4;
+		break;
+
+	default:
+		dev_warn(dev, "Unsupported audio data format %d\n", params_format(params));
+		return -EINVAL;
+	}
+
+	if (params_channels(params) == 1)
+		tmp |= I2S_MONO;
+
+	__lpc3xxx_find_clkdiv(&clkx, &clky, i2s_info_p->freq, xfersize, i2s_info_p->clkrate);
+
+	dev_dbg(dev, "Stream                : %s\n",
+		substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+	dev_dbg(dev, "Desired clock rate    : %d\n", i2s_info_p->freq);
+	dev_dbg(dev, "Base clock rate       : %d\n", i2s_info_p->clkrate);
+	dev_dbg(dev, "Transfer size (bytes) : %d\n", xfersize);
+	dev_dbg(dev, "Clock divider (x)     : %d\n", clkx);
+	dev_dbg(dev, "Clock divider (y)     : %d\n", clky);
+	dev_dbg(dev, "Channels              : %d\n", params_channels(params));
+	dev_dbg(dev, "Data format           : %s\n", "I2S");
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_write(regs, I2S_DMA1, I2S_DMA1_TX_EN | I2S_DMA0_TX_DEPTH(4));
+		regmap_write(regs, I2S_TX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, I2S_DAO, tmp);
+	} else {
+		regmap_write(regs, I2S_DMA0, I2S_DMA0_RX_EN | I2S_DMA1_RX_DEPTH(4));
+		regmap_write(regs, I2S_RX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, I2S_DAI, tmp);
+	}
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(regs, I2S_DAO, I2S_STOP, I2S_STOP);
+		else
+			regmap_update_bits(regs, I2S_DAI, I2S_STOP, I2S_STOP);
+		break;
+
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(regs, I2S_DAO, (I2S_RESET | I2S_STOP), 0);
+		else
+			regmap_update_bits(regs, I2S_DAI, (I2S_RESET | I2S_STOP), 0);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &i2s_info_p->playback_dma_config,
+				  &i2s_info_p->capture_dma_config);
+	return 0;
+}
+
+const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
+	.probe	= lpc3xxx_i2s_dai_probe,
+	.startup = lpc3xxx_i2s_startup,
+	.shutdown = lpc3xxx_i2s_shutdown,
+	.trigger = lpc3xxx_i2s_trigger,
+	.hw_params = lpc3xxx_i2s_hw_params,
+	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
+	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
+};
+
+struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = LPC3XXX_I2S_RATES,
+		.formats = LPC3XXX_I2S_FORMATS,
+		},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = LPC3XXX_I2S_RATES,
+		.formats = LPC3XXX_I2S_FORMATS,
+		},
+	.ops = &lpc3xxx_i2s_dai_ops,
+	.symmetric_rate = 1,
+	.symmetric_channels = 1,
+	.symmetric_sample_bits = 1,
+};
+
+static const struct snd_soc_component_driver lpc32xx_i2s_component = {
+	.name = "lpc32xx-i2s",
+	.legacy_dai_naming = 1,
+};
+
+static const struct regmap_config lpc32xx_i2s_regconfig = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = I2S_RX_RATE,
+};
+
+static int lpc32xx_i2s_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpc3xxx_i2s_info *i2s_info_p;
+	struct resource *res;
+	void __iomem *iomem;
+	int ret;
+
+	i2s_info_p = devm_kzalloc(dev, sizeof(*i2s_info_p), GFP_KERNEL);
+	if (!i2s_info_p)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2s_info_p);
+	i2s_info_p->dev = dev;
+
+	iomem = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(iomem))
+		return dev_err_probe(dev, PTR_ERR(iomem), "Can't map registers\n");
+
+	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
+	if (IS_ERR(i2s_info_p->regs))
+		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
+				     "failed to init register map: %d\n", ret);
+
+	i2s_info_p->clk = devm_clk_get(dev, "i2s_clk");
+	if (IS_ERR(i2s_info_p->clk))
+		return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can't get clock\n");
+
+	i2s_info_p->clkrate = clk_get_rate(i2s_info_p->clk);
+	if (i2s_info_p->clkrate == 0)
+		return dev_err_probe(dev, -EINVAL, "Invalid returned clock rate\n");
+
+	mutex_init(&i2s_info_p->lock);
+
+	ret = devm_snd_soc_register_component(dev, &lpc32xx_i2s_component,
+					      &lpc3xxx_i2s_dai_driver, 1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't register cpu_dai component\n");
+
+	i2s_info_p->playback_dma_config.addr = (dma_addr_t)(res->start + I2S_TX_FIFO);
+	i2s_info_p->playback_dma_config.maxburst = 4;
+	i2s_info_p->playback_dma_config.filter_data = "i2s-tx";
+	i2s_info_p->capture_dma_config.addr = (dma_addr_t)(res->start + I2S_RX_FIFO);
+	i2s_info_p->capture_dma_config.maxburst = 4;
+	i2s_info_p->capture_dma_config.filter_data = "i2s-rx";
+
+	ret = lpc3xxx_pcm_register(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't register pcm component\n");
+
+	return 0;
+}
+
+static int lpc32xx_i2s_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id lpc32xx_i2s_match[] = {
+	{ .compatible = "nxp,lpc3220-i2s" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lpc32xx_i2s_match);
+
+static struct platform_driver lpc32xx_i2s_driver = {
+	.probe = lpc32xx_i2s_probe,
+	.remove = lpc32xx_i2s_remove,
+	.driver		= {
+		.name	= "lpc3xxx-i2s",
+		.of_match_table = lpc32xx_i2s_match,
+	},
+};
+
+module_platform_driver(lpc32xx_i2s_driver);
+
+MODULE_AUTHOR("Kevin Wells <kevin.wells@nxp.com>");
+MODULE_AUTHOR("Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>");
+MODULE_DESCRIPTION("ASoC LPC3XXX I2S interface");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/fsl/lpc3xxx-i2s.h b/sound/soc/fsl/lpc3xxx-i2s.h
new file mode 100644
index 000000000000..2796e8782de9
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#ifndef __SOUND_SOC_LPC3XXX_I2S_H
+#define __SOUND_SOC_LPC3XXX_I2S_H
+
+#include <linux/types.h>
+#include <linux/regmap.h>
+
+struct lpc3xxx_i2s_info {
+	struct device *dev;
+	struct clk *clk;
+	struct mutex lock; /* To serialize user-space access */
+	struct regmap *regs;
+	u32 streams_in_use;
+	u32 clkrate;
+	int freq;
+	struct snd_dmaengine_dai_dma_data playback_dma_config;
+	struct snd_dmaengine_dai_dma_data capture_dma_config;
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev);
+
+#define _SBF(f, v) ((v) << (f))
+#define _BIT(n) _SBF(n, 1)
+
+/* I2S controller register offsets */
+#define I2S_DAO		0x00
+#define I2S_DAI		0x04
+#define I2S_TX_FIFO	0x08
+#define I2S_RX_FIFO	0x0C
+#define I2S_STAT	0x10
+#define I2S_DMA0	0x14
+#define I2S_DMA1	0x18
+#define I2S_IRQ		0x1C
+#define I2S_TX_RATE	0x20
+#define I2S_RX_RATE	0x24
+
+/* i2s_daO i2s_dai register definitions */
+#define I2S_WW8      _SBF(0, 0) /* Word width is 8bit*/
+#define I2S_WW16     _SBF(0, 1) /* Word width is 16bit*/
+#define I2S_WW32     _SBF(0, 3) /* Word width is 32bit*/
+#define I2S_MONO     _BIT(2)   /* Mono */
+#define I2S_STOP     _BIT(3)   /* Stop, diables the access to FIFO, mutes the channel */
+#define I2S_RESET    _BIT(4)   /* Reset the channel */
+#define I2S_WS_SEL   _BIT(5)   /* Channel Master(0) or slave(1) mode select*/
+#define I2S_WS_HP(s) _SBF(6, s) /* Word select half period - 1 */
+
+#define I2S_MUTE     _BIT(15)  /* Mute the channel, Transmit channel only */
+
+#define I2S_WW32_HP  0x1f /* Word select half period for 32bit word width */
+#define I2S_WW16_HP  0x0f /* Word select half period for 16bit word width */
+#define I2S_WW8_HP   0x7  /* Word select half period for 8bit word width */
+
+#define WSMASK_HP	  0X7FC /* Mask for WS half period bits */
+
+/* i2s_tx_fifo register definitions */
+#define I2S_FIFO_TX_WRITE(d)              (d)
+
+/* i2s_rx_fifo register definitions */
+#define I2S_FIFO_RX_WRITE(d)              (d)
+
+/* i2s_stat register definitions */
+#define I2S_IRQ_STAT     _BIT(0)
+#define I2S_DMA0_REQ     _BIT(1)
+#define I2S_DMA1_REQ     _BIT(2)
+
+#define I2S_RX_STATE_MASK	0x0000ff00
+#define I2S_TX_STATE_MASK	0x00ff0000
+
+/* i2s_dma0 Configuration register definitions */
+#define I2S_DMA0_RX_EN     _BIT(0)       /* Enable RX DMA1*/
+#define I2S_DMA0_TX_EN     _BIT(1)       /* Enable TX DMA1*/
+#define I2S_DMA0_RX_DEPTH(s)  _SBF(8, s)  /* Set the level for DMA1 RX Request */
+#define I2S_DMA0_TX_DEPTH(s)  _SBF(16, s) /* Set the level for DMA1 TX Request */
+
+/* i2s_dma1 Configuration register definitions */
+#define I2S_DMA1_RX_EN     _BIT(0)       /* Enable RX DMA1*/
+#define I2S_DMA1_TX_EN     _BIT(1)       /* Enable TX DMA1*/
+#define I2S_DMA1_RX_DEPTH(s)  _SBF(8, s) /* Set the level for DMA1 RX Request */
+#define I2S_DMA1_TX_DEPTH(s)  _SBF(16, s) /* Set the level for DMA1 TX Request */
+
+/* i2s_irq register definitions */
+#define I2S_RX_IRQ_EN     _BIT(0)       /* Enable RX IRQ*/
+#define I2S_TX_IRQ_EN     _BIT(1)       /* Enable TX IRQ*/
+#define I2S_IRQ_RX_DEPTH(s)  _SBF(8, s)  /* valid values ar 0 to 7 */
+#define I2S_IRQ_TX_DEPTH(s)  _SBF(16, s) /* valid values ar 0 to 7 */
+
+#endif
diff --git a/sound/soc/fsl/lpc3xxx-pcm.c b/sound/soc/fsl/lpc3xxx-pcm.c
new file mode 100644
index 000000000000..3ccf1473cd76
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-pcm.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/amba/pl08x.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_U8 | \
+			SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_U16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_U24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE | \
+			SNDRV_PCM_FMTBIT_U32_LE | \
+			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
+
+static const struct snd_pcm_hardware lpc3xxx_pcm_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		 SNDRV_PCM_INFO_PAUSE |
+		 SNDRV_PCM_INFO_RESUME),
+	.formats = STUB_FORMATS,
+	.period_bytes_min = 128,
+	.period_bytes_max = 2048,
+	.periods_min = 2,
+	.periods_max = 1024,
+	.buffer_bytes_max = 128 * 1024
+};
+
+static const struct snd_dmaengine_pcm_config lpc3xxx_dmaengine_pcm_config = {
+	.pcm_hardware = &lpc3xxx_pcm_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.compat_filter_fn = pl08x_filter_id,
+	.prealloc_buffer_size = 128 * 1024,
+};
+
+const struct snd_soc_component_driver lpc3xxx_soc_platform_driver = {
+	.name = "lpc32xx-pcm",
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev)
+{
+	int ret;
+	int flags;
+
+	flags = SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT;
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &lpc3xxx_dmaengine_pcm_config, flags);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register dmaengine: %d\n", ret);
+		return ret;
+	}
+
+	return devm_snd_soc_register_component(&pdev->dev, &lpc3xxx_soc_platform_driver,
+					       NULL, 0);
+}
+EXPORT_SYMBOL(lpc3xxx_pcm_register);
-- 
2.25.1

