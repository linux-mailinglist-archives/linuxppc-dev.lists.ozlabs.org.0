Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14290911001
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:04:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VZ5NAyiM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pKs5DqSz3fqv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:04:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VZ5NAyiM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pDT5bslz3dPs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:00:09 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso1336477e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906407; x=1719511207; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=VZ5NAyiMCMAklkTk6Bz8wjXdPBTcPH92F99vQRhxFwqcbq/gxo2nc1mLCGKaC5sd98
         J3KIUeOGTqcMCet/qHD3hgc0+IoXeDUbGb2C+L5JAHg6s/twg+ybqQYyyUhNHOH4i6xO
         ETPyfsAapVz8GtHP/mSocmGVhlnVUos7cPc17AYSJD+EJLIz2HR6R4+qhT7VLFDLKwxu
         kqtc92EIzJLJmqzBTgHwrGb7aeXcHzgvDOi2yq+8zqbtIIhft88Ujx+Z5qlDwR0DOB2G
         fH9Zhk5b6ZlMnR/DvJB/Ld1/J7Sl8nBo4yZ5Gf8SMOsGEDy97N49qtFhSGZFJFL2pwaO
         Mehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906407; x=1719511207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=A/tCW/8oQqX8bgLXF6cdy/ACBQX1Nc0lr41mGhEfHa7TKbfBmg+beyzH5ZkdPxAPma
         QdLZNAQWh8xF7HTWM7t09FvmJIlOR7QXVkSHSdp4Yv6oTCK0o4YZf63v0a8VXZF/qb4U
         tW45KckvOYegu+nEkwGb81MDLpVDiIRkBHJHIOTURhfOj1Zn4mcxbxfP4Jdm7jOtRQPT
         3h4lSDKjxKawsZeKFY4LIJuUc2WFnUxMxiFD9NSQ+aWV5nY+rr9liJpJBz4QWAEx3dHv
         KG+JC2B8BNEsIpdUNgHvnLT+2abdF9Z3W1HRgyT2I6+GPCChXVVxQuPDM0yJp3fTNE7U
         LqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUHdmkHlnHxPz4aK+66OQy2aqGmD+3cD5R/bTdmybPV62xt6p6kZpJ0LyjMY6ThxdPRWWGIiREDFGcqVSMRLbB17h7VJMAiiMGXnsSLPQ==
X-Gm-Message-State: AOJu0Yz0a7g637fdDpbs/eVt3KqDGa3xlIYT56hojvgpEObugNgTTZAj
	5MQ1IcekU92eK822V1dfra7CsG/XjQ7k+st7RolAMbiFNlfk14Z6ila/ow51GDI=
X-Google-Smtp-Source: AGHT+IEtbhdQIpbe+lcjaI0rwKVV8L/00YnsN7rJtoUW3011krKwq3p0LrSXUUPIJeqY4Obo4tEkWw==
X-Received: by 2002:a05:6512:3c97:b0:52c:a2e8:dc71 with SMTP id 2adb3069b0e04-52ccaa595eemr5990477e87.64.1718906406915;
        Thu, 20 Jun 2024 11:00:06 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:00:06 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
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
Subject: [Patch v4 07/10] ARM: lpc32xx: Remove pl08x platform data in favor for device tree
Date: Thu, 20 Jun 2024 19:56:38 +0200
Message-Id: <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
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

With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
data and let pl08x driver to create peripheral channels from the DT
properties.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 arch/arm/mach-lpc32xx/phy3250.c | 54 ---------------------------------
 1 file changed, 54 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..0c7797a0e44e 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -16,64 +16,10 @@
 #include <asm/mach/arch.h>
 #include "common.h"
 
-static struct pl08x_channel_data pl08x_slave_channels[] = {
-	{
-		.bus_id = "nand-slc",
-		.min_signal = 1, /* SLC NAND Flash */
-		.max_signal = 1,
-		.periph_buses = PL08X_AHB1,
-	},
-	{
-		.bus_id = "nand-mlc",
-		.min_signal = 12, /* MLC NAND Flash */
-		.max_signal = 12,
-		.periph_buses = PL08X_AHB1,
-	},
-};
-
-static int pl08x_get_signal(const struct pl08x_channel_data *cd)
-{
-	return cd->min_signal;
-}
-
-static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
-{
-}
-
-static struct pl08x_platform_data pl08x_pd = {
-	/* Some reasonable memcpy defaults */
-	.memcpy_burst_size = PL08X_BURST_SZ_256,
-	.memcpy_bus_width = PL08X_BUS_WIDTH_32_BITS,
-	.slave_channels = &pl08x_slave_channels[0],
-	.num_slave_channels = ARRAY_SIZE(pl08x_slave_channels),
-	.get_xfer_signal = pl08x_get_signal,
-	.put_xfer_signal = pl08x_put_signal,
-	.lli_buses = PL08X_AHB1,
-	.mem_buses = PL08X_AHB1,
-};
-
-static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
-	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
-		       &lpc32xx_slc_data),
-	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-		       &lpc32xx_mlc_data),
-	{ }
-};
-
 static void __init lpc3250_machine_init(void)
 {
 	lpc32xx_serial_init();
 
-	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
 }
 
 static const char *const lpc32xx_dt_compat[] __initconst = {
-- 
2.25.1

