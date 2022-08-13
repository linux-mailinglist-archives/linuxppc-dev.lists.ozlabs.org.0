Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68918591973
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 10:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4Yl92x8wz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 18:35:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CKPeBNjS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=pieterjan.camerlynck@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CKPeBNjS;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4YkW1Rtcz2xGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 18:34:40 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id i14so5511026ejg.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=giMh6CV+ebQaMfil4WhC+L/0OniXZ48oEVWUpwWfMDs=;
        b=CKPeBNjSUoVfcYjf2H0tn6lNfb4WCfH+qcPtLe20kpAf1XSdq1ou13nbDylclZhgD6
         ki1V4f57v8AcfC4HPm7ZSkxfJfiHWfJFaxLzddNKM1YCsQQ0y2mKWNZdL8ixvJ6KD4J8
         FSylg13oxehSO15OyPeLWb7mTRuYpAAL3frMeLcLMGJVoAOwPze667o7nEn1k72/buOx
         BvmU9/stXwcHbfLUgxAW0GOsurGBjg3rXdRIeOfzxj0myq77l9NwosfecMYTlrV3UrZb
         UWcBO43HL3uWb/tUnXCuMy3NlC3B6+MmLoOxACezPUAOC61q0OW8TsrAAXKYtdcVAUr6
         wbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=giMh6CV+ebQaMfil4WhC+L/0OniXZ48oEVWUpwWfMDs=;
        b=myIxmY3nRxUp3EpqJB2ym2RjhJ7QbY3wKCLtS5SVLz2o1HC/p1GyTWfdIlKZfDXQmd
         kGbxxtuJRtd4sTp+HaANv26bzxKT4kWJH1xnMu8/2Wdr6l5gossREU1K6jENMtApbKtn
         sAajPl4g8xi9iGRCl6cnipKMfY/e/oV/jiy24jySNaIPbr114r1ESYcKAhRUWvP31lse
         tqTTV+te0C5N8GKzUfom76/ChFA3Laxg8izwRYtGdV3Ao9TLZUdO1wZXv7dZjAs6ZCug
         sy6TTr6e9/AwPweWQMZZ+zGctFkiuttpJN3CMdw/OGoutYK2X0cjroVw/MoCazHN+bP3
         yXdA==
X-Gm-Message-State: ACgBeo2kwCSaucukpHbtnWW7mIT/KpvVJ0RJ2xpQL3QT0CqBGlMsZ8c2
	0LESPkR7RymQ+43MikB2b0k=
X-Google-Smtp-Source: AA6agR5/50LsvrEBmEVylqJMNR6BNXGjnKBGmDDXPFCJ/to2MC9nIENXqMl7u4Pw4kWk29w7Fk5NdQ==
X-Received: by 2002:a17:907:e94:b0:730:af21:cf60 with SMTP id ho20-20020a1709070e9400b00730af21cf60mr4639547ejc.681.1660379672269;
        Sat, 13 Aug 2022 01:34:32 -0700 (PDT)
Received: from pca.lan (ptr-dc5856nwo1xazteick5.18120a2.ip6.access.telenet.be. [2a02:1811:bc80:f7f0:d03:1d8d:20cb:2215])
        by smtp.gmail.com with ESMTPSA id u26-20020aa7d55a000000b0042de3d661d2sm2718172edr.1.2022.08.13.01.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 01:34:31 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Sat, 13 Aug 2022 10:33:52 +0200
Message-Id: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit c3ecef21c3f26 ("ASoC: fsl_sai: add sai master mode support")
the loop was changed to start iterating from 1 instead of 0. The error
message however was not updated, reporting the wrong clock to the user.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
V2: rebase against latest version
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 7523bb944b21..d430eece1d6b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1306,7 +1306,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
 			dev_err(dev, "failed to get mclk%d clock: %ld\n",
-					i + 1, PTR_ERR(sai->mclk_clk[i]));
+					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
 	}
-- 
2.25.1

