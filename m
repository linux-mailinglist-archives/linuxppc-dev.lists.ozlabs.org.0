Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B6910FEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:03:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=3IiptRQY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pJJ5zByz3fyy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:03:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=3IiptRQY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pCY2MB7z3dSG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:59:21 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so1463909a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906359; x=1719511159; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+nbkylU75B66T8IPhGtcEUJs01o0nAAuyIYHNhQRcE=;
        b=3IiptRQY6I7wPFNxC/Rqqd1cYHDPfNh4CklbZMTFMsWOWXD9FgHam4jnoivvOrm3Ip
         UDuodzrE16B55H4WtuWLHjm34avzXQVp0LkpWjC+Qy9JnflLpl041D20Vn97gRV04Yop
         Yurbk8/w3ijz6dWpe7TpEbmoA4Or7eNEqDzGuqus2R7/u5HUs8tKhSfrPCm3y/Bdsv4f
         U3yX0MmpE621UOCecEVPPIxPhgk6q/p2+amprE5Q7raFwtzho6KNkrbQ6azbAI7rN1JZ
         PP1kbGygDIQSZCIaNp1ZJGwpJW82woaxFZGuhmGcjsM9VhCvUZ0gkW8LuuuU9BlPtMLs
         oyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906359; x=1719511159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+nbkylU75B66T8IPhGtcEUJs01o0nAAuyIYHNhQRcE=;
        b=eKj2LE+442mZn++Vb4PlLiUR1g5xXN97OpAl7M2jeTrpY2BfifdQh61KLvDR+fhsZd
         gK85hP/gyQPYQqPdwQgmiVQEU8AeW+5u1YMDEL1MrubpNFazKXzkmPPH1cUCtaJtaUgi
         +lFIkxI0UmXTLVvUT+SRlNrn56qhnMzwcAYpJDMxDsUt5RiLz1+qcq0P+4k3Mwi13WLJ
         5+jCzqWFBv2yFtcW3Mej7BOYpqC8RV0CBx0u/WkEEGDrnRyz3AoPT4QSYP33jaqEp/lx
         WTLFOevtB0pmzK4dSrNUgQ3VOfmo1ZXpBkShdp+tTKMxZbmC0BMptH11PNQAU0Qr+XRa
         8Dkw==
X-Forwarded-Encrypted: i=1; AJvYcCWn2RXaFnWF/gJws6hCr2qMm/fwrSL9l+K/PhI23UVItVS1bi+AtWs47KA4tBVEx38of2goNF9XFELaQaAl1Y2jTeEYPyZU7KsXFfAMag==
X-Gm-Message-State: AOJu0Yzjz7LqHJFkPnuxSlSRVoVuKQt8Jun1YTHVdQZI7yEN1H3LFpsl
	U8qGm0SdJfIymLGA++pQaf5+L/4qhCwec8nbNiTsxvGUND7v7OoCcUucJqaXHUM=
X-Google-Smtp-Source: AGHT+IGwiD3L95St/ehfaodQi7lOhfrdpQHGauU5aloxC0usOuACZecYTLoGty75spYidqSIKDxV5Q==
X-Received: by 2002:a17:907:7293:b0:a6f:6f4a:b25c with SMTP id a640c23a62f3a-a6fab60a2acmr584690566b.14.1718906359615;
        Thu, 20 Jun 2024 10:59:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:19 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
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
Subject: [Patch v4 05/10] clk: lpc32xx: initialize regmap using parent syscon
Date: Thu, 20 Jun 2024 19:56:36 +0200
Message-Id: <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
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

This allows to share the regmap with other simple-mfd devices like
nxp,lpc32xx-dmamux

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 drivers/clk/Kconfig           |  1 +
 drivers/clk/nxp/clk-lpc32xx.c | 10 ++--------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3e9099504fad..85ef57d5cccf 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -346,6 +346,7 @@ config COMMON_CLK_LOONGSON2
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
+	select MFD_SYSCON if ARCH_LPC32XX
 	select MFD_SYSCON if ARCH_LPC18XX
 	help
 	  Support for clock providers on NXP platforms.
diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..2a183a9ded93 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/lpc32xx-clock.h>
@@ -1511,17 +1512,10 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 		return;
 	}
 
-	base = of_iomap(np, 0);
-	if (!base) {
-		pr_err("failed to map system control block registers\n");
-		return;
-	}
-
-	clk_regmap = regmap_init_mmio(NULL, base, &lpc32xx_scb_regmap_config);
+	clk_regmap = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(clk_regmap)) {
 		pr_err("failed to regmap system control block: %ld\n",
 			PTR_ERR(clk_regmap));
-		iounmap(base);
 		return;
 	}
 
-- 
2.25.1

