Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9C3569BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 12:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFghn2ZFMz302y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 20:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PFu66/SN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=musamaanjum@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PFu66/SN; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFftr17jCz2xZy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 19:56:50 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso250222wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=XI8zjCWrHrG5RIk4b3Hbm5Q3Z+HRUCQWg5bfMzD9Jsw=;
 b=PFu66/SNVZwtKmaSFIdn/9ceMMmMfrg5wm0jZCzFUOkxp7UMTjNzv+rpxe0GGHZd2t
 OyUq7Wdpon8ac2O4cHKkqaff7q9WnGVUzBrPFeGiEbUVFvKU3kWjyer2a4ATgUMZDm9b
 0J+3qUscAHVFfQyzTikzaUaXOOBRcJpsZErg1MNFGMuYnF2lN6VKu3TiA75OUhjxYsNX
 +i2RPqiOvBGzHehsYWL1vZn/9M3gxc2B7kw4cXkDaED/e5vGrrRg2FJQhKOh1zPdOaL6
 tfxlWfOxCek89UCQERc0S+8OmZU2a/9n3S87Bzw6VAKoruJH54FsPLrqQkBgpdiqxosf
 u4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=XI8zjCWrHrG5RIk4b3Hbm5Q3Z+HRUCQWg5bfMzD9Jsw=;
 b=TBeDv7CxcHbxr3izztkimMrrXjfBEkdRgySQ/df1DiGllNTWGlwlQ0jTPW3rWcymPO
 H/c6M3snUClKXVtz70xmx0vgi5n9A4IhqWEJyvk4yDVFVwY+y2H7rmPrpcGfWeFt7siu
 ShMQ4agAdkiN3CmfH+4Twla5JrxRuzOqfOEu7XQJJEEUbSwF5s9qS00Ry2IpbbtODSq+
 XKAtfDuFnXe8B+TosJ969o25Pw0+4/jp3yezA/Xstqp6FzKb8YKFnx1Vyte7bJ+16MTg
 rfGWVgqAgSdOdTwpSWKObL+e5RruSvEATPq4LUo4JlaZUwvhW80xI2MciBLssYbmEuWU
 Edkg==
X-Gm-Message-State: AOAM531BvXzJsS9jJxL7kFStvi0SvBc2R91lNMYzwzCXFApv7mWAWg0r
 dMH9Rd0ZVgvpRUtBo2+4uPo=
X-Google-Smtp-Source: ABdhPJyFvIZgCudXxRH75W0b0/ObztMY9OZAeZr5OgyvwLXGLUX3a+7dZmd43PJqWcc67lcFZcMvMQ==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr2286646wmc.132.1617789402785; 
 Wed, 07 Apr 2021 02:56:42 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
 by smtp.gmail.com with ESMTPSA id u8sm39863959wrr.42.2021.04.07.02.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 02:56:42 -0700 (PDT)
Date: Wed, 7 Apr 2021 14:56:34 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH] ASoC: fsl: sunxi: remove redundant dev_err call
Message-ID: <20210407095634.GA1379642@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 07 Apr 2021 20:32:49 +1000
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
Cc: linqiheng@huawei.com, kernel-janitors@vger.kernel.org,
 musamaanjum@gmail.com, dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 sound/soc/fsl/fsl_aud2htx.c   | 4 +---
 sound/soc/fsl/fsl_easrc.c     | 4 +---
 sound/soc/sunxi/sun4i-codec.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index d70d5e75a30c..a328697511f7 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -198,10 +198,8 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(&pdev->dev, "failed ioremap\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 
 	aud2htx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						&fsl_aud2htx_regmap_config);
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 5e33afe87c4a..b1765c7d3bcd 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1889,10 +1889,8 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(&pdev->dev, "failed ioremap\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 
 	easrc->paddr = res->start;
 
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 2173991c13db..6f3d9148a185 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1711,10 +1711,8 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	quirks = of_device_get_match_data(&pdev->dev);
 	if (quirks == NULL) {
-- 
2.25.1

