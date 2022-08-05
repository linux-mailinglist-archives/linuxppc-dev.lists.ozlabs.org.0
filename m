Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711458A5F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzbZb1gztz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 16:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kpA6bYaZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=pieterjan.camerlynck@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kpA6bYaZ;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzbYz1p4nz2xGx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 16:40:05 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id c24so3291003ejd.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Aug 2022 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
        b=kpA6bYaZVNdY5XPuTwRvs/4t2P2Jn7AIV5rT96nKfRBPIB8wjbIhAI7XMVCuac5coR
         o4CO9nwCDgK+whRCFocX/baE6lWplV7v0ePT/D5Zm+V5MOoc47d3uDQkHzBTy60nfPgx
         kh0ocgfXKM2mMG1ncreWjMHozyZd6Sm6lXfUv+rwHNvCtLVuCBq1FLLa5kfqNKfmzuRI
         it+GR7DmZpbaIQdX2cK0ZsjVWWMVrJMRLfpu0y6nbck1Z+nMO1OoYhyMHPDj63ShN/Gz
         8LZzqE3E3ogl7GLsA3/2tSgV9c7qKgkw9YRhIXPGs1X8bOlBzUBTfdvPNlAtDMEYY77q
         8DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
        b=biYkYFDf+lFhKjdeS1tez9ULrIiGyWWNUI32kPNDOCb1qOZScTYo++uOYNZ/kTcOwN
         oQevDPyfUmYPcuM4B2H69O6BBgOox4W/2qwNoMt0R4o+GhEO+2JlRjmLol01Mfkwe6EJ
         nnEqSPWHcGzQt4y1v3y2ji1aHke87yzkIBa2hHLuYipTJGfHfTF1osYx0462HlsJvI5a
         SIA5fsgfEee0EkzIgzSOylNrOQcvIBDl7LX41uKlMx0gwNTdEZYkLypGJid32imf3X8f
         0lnq1RpUxQFvJLXGTr7AkVXopanBMcVbIKjRLG3K37nRCz23DwsYomvrc8W2qrJbcBs5
         aneQ==
X-Gm-Message-State: ACgBeo3CzMlvZ24Rqz19ks+R/TpPPKQz+gz9RmKXLA5wQegPxvJaNvpf
	5+6LTbq28N38mnkk4yVOzUA2Ezvl9ObTQw==
X-Google-Smtp-Source: AA6agR5MnwJei2qMi9xCPBXMyJBR3CjOgKjjo5gERif3wfzLaWzUTeQyRhVX5l+BxEggBeS4PVlK1g==
X-Received: by 2002:a17:906:93ef:b0:730:69e0:dd0c with SMTP id yl15-20020a17090693ef00b0073069e0dd0cmr4120144ejb.609.1659681600787;
        Thu, 04 Aug 2022 23:40:00 -0700 (PDT)
Received: from pca.lan (dd57636e4.access.telenet.be. [213.118.54.228])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906140700b0073066d4d7a4sm1184987ejc.80.2022.08.04.23.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 23:40:00 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Fri,  5 Aug 2022 08:39:42 +0200
Message-Id: <20220805063942.8520-1-pieterjan.camerlynck@gmail.com>
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

In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
the loop was changed to start iterating from 1 instead of 0. The error
message however was not updated, reporting the wrong clock to the user.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ffc24afb5a7a..f0602077b385 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
 			dev_err(&pdev->dev, "failed to get mclk%d clock: %ld\n",
-					i + 1, PTR_ERR(sai->mclk_clk[i]));
+					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
 	}
-- 
2.25.1

