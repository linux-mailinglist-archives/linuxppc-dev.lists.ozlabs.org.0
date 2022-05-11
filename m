Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205F522CB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 08:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kym3L0BrKz3cL6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 16:58:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pgjJK2J3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pgjJK2J3; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kym2g6vH0z3bd9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 16:58:17 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id m12so1005384plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6wA7u9nlH2LdboqPtaGVfPJPki2AKRQH5484bIHWMg=;
 b=pgjJK2J39T3beCax1II7a6Dqfmdllwbq+uAase9DTEpHkBGCFCCvVu8HbOEwWKI9T0
 /pih1l6aBpvIl9mSeaXn6BOyuf0MdTOFcY+6lMQf4IMdGYEGbkWgReR5kHEX7G2x9PN/
 qeU/D5dc0FTYlZCoBy87ORI12sLce4/ykfmoeKovnUp0pNWv8y5tZA3DL4prCrdrV7Ts
 n8bXfTG4Hbs4qw8+LlUw1N4qmDjpFNIzKoazkMlomEYbDDFlklO7LH+mb1jrY09jh6ey
 UGfDlNBYejMGhVfof1VA1t/YDu/cgnD2E57oQDnyAfhRzqYYykMJRkAjwOe78YX4hoUM
 ojxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6wA7u9nlH2LdboqPtaGVfPJPki2AKRQH5484bIHWMg=;
 b=hUXHRgIFN2hJ4QJbYp5MOrlmSjTHaWkprnm84NUtJ8TOAChqnlMydC0CmiHal1ymzk
 pP/sZAsbWeTIedJiju3h2CjVqOQ7noiMmMAwOD02gMdHDcXt/E99ndmTCglpQs6nRcWt
 jO3yfzs2xM4Qed8wiVny2ZUIITh/HJ1ZjQWWxOBQKGEnZc/MXES9bi74mUXQXMHjqVEd
 l3PfkIrBMj5Jd71yxKj77n9aCG7zk9DvCTHtAz8cbai77nhJvZoraCSQIRURLw/bI5C1
 JrTE0OBrB7HSlzM7VtN8xi22gOI2ggyYtEu8X/Cue9OqOCfMKAC7Kp+ry2YOA7ksjrrT
 HQYg==
X-Gm-Message-State: AOAM530YidPtrdp1G7goXuWB9Sg+XK2gsQ7/3Z5GtBdAY4/A6vnCZu+u
 m9j7iB65TH/x1MYwwE/RENU=
X-Google-Smtp-Source: ABdhPJycTqz9MfSxmTeQC3NNqRXwnBmg1ggt7GaNqU7Xvy/Afslm0yAQen3gRZ0c3GVtCC7vQ2id5Q==
X-Received: by 2002:a17:902:c2cf:b0:15f:1396:f54e with SMTP id
 c15-20020a170902c2cf00b0015f1396f54emr12870792pla.161.1652252294808; 
 Tue, 10 May 2022 23:58:14 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 u18-20020a62ed12000000b0050dc76281a3sm766115pfh.125.2022.05.10.23.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 23:58:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Richard Zhao <richard.zhao@linaro.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
Date: Wed, 11 May 2022 10:58:03 +0400
Message-Id: <20220511065803.3957-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_i2c_device_by_node() takes a reference,
In error paths, we should call put_device() to drop
the reference to aviod refount leak.

Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/imx-sgtl5000.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8daced42d55e..580a0d963f0e 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -120,19 +120,19 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
-		goto fail;
+		goto put_device;
 	}
 
 	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!comp) {
 		ret = -ENOMEM;
-		goto fail;
+		goto put_device;
 	}
 
 	data->codec_clk = clk_get(&codec_dev->dev, NULL);
 	if (IS_ERR(data->codec_clk)) {
 		ret = PTR_ERR(data->codec_clk);
-		goto fail;
+		goto put_device;
 	}
 
 	data->clk_frequency = clk_get_rate(data->codec_clk);
@@ -158,10 +158,10 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data->card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
 	if (ret)
-		goto fail;
+		goto put_device;
 	ret = snd_soc_of_parse_audio_routing(&data->card, "audio-routing");
 	if (ret)
-		goto fail;
+		goto put_device;
 	data->card.num_links = 1;
 	data->card.owner = THIS_MODULE;
 	data->card.dai_link = &data->dai;
@@ -174,7 +174,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
-		goto fail;
+		goto put_device;
 	}
 
 	of_node_put(ssi_np);
@@ -182,6 +182,8 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 
 	return 0;
 
+put_device:
+	put_device(&codec_dev->dev);
 fail:
 	if (data && !IS_ERR(data->codec_clk))
 		clk_put(data->codec_clk);
-- 
2.25.1

