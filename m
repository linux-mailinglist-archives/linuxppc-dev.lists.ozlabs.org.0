Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04A11F351
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 18:59:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwKZ1ZCszDqMt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 04:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gHnjEtAC"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwD34L3QzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:54:56 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id r11so1197542pgf.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
 b=gHnjEtACweKJQ9KxtQ461Zgr7NfGqheFDsRZTRRJFz6YFL8wuergs72JfrcnO77sdJ
 /QS7UPm1Bg4iIc3NujE4sEMdigb/F/ubMD4/HZVOB5uT9H+42YKgm8+veKx3a8YgFdtN
 4jggFFFOQRkLhxlPZm6C6OxcyQ1QbRzAyrzeiBX8bXkva7ITvJqNDVSY0Fae7CSC21vy
 JP8PdkfrraxJdDi8nNQMD4jxIHdZTp8NmiB1F0c7GS7VpvR2GLV2CyfBpXw8hFKCMdY4
 5RyngV4Optzg3+dljoTt0tZeJ5RhogtepGPUJ1LqLD44vd/D1CspHKleJVWmOwLZLop4
 BhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
 b=Rg1A6iw2wlByJuFASNrxVDy0jLmQunVHR0YJTDHBpCVG4MVIEq/VQdJH1vs7YT7HEj
 jrL/AfB7t4ncKg+NZXL6o0F+pAOpitl5RGPYDacQdjHo8sjneEEIJ4Fi1Ite1CNo4Et9
 JbZxKv6I/LCycblJ0f3R+ehXWC0MJFtdLDbf0XcYuX6VD5vlvUTdOZgVD+XCKhF9O5ES
 aJevD8A5e6tq/OCc5DntT0CPcAc5wVgwTXfbvvJ+JBbIILKXdKSBA3VrtBcnwUIadG3Q
 lARaq6is1dj7HXDV0zqVN8v/lR/sDgk855cCtSznH2bdJfZN0gsTwZaYQAyqNj6JnV/L
 7PnA==
X-Gm-Message-State: APjAAAWT7gzlnQoqwr/MwMzi2wWnvJ+Bym9i7cj9x9Ak5/CPsB0/xNLY
 7MT1r3BsdK4yQxZ0x0fW2d0=
X-Google-Smtp-Source: APXvYqzczN9kvUPQ7Hc2LxnRw9L6ohEd0G4hrwU0EL1lvwEgBvQanEfnjjXSSKWlr9BOfM41oALivA==
X-Received: by 2002:a63:111e:: with SMTP id g30mr6840840pgl.251.1576346092717; 
 Sat, 14 Dec 2019 09:54:52 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id j16sm16064250pfi.165.2019.12.14.09.54.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:54:52 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 01/10] soc: sunxi: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:38 +0000
Message-Id: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 1b0d50f36349..f73fbcc73f51 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
 
 static int sunxi_sram_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct dentry *d;
 	struct regmap *emac_clock;
 	const struct sunxi_sramc_variant *variant;
@@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

