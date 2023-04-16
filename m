Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B7E6E35FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Apr 2023 10:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PzjVF5xQSz3chK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Apr 2023 18:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256 header.s=t20230301 header.b=SEYoFLJ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.13; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256 header.s=t20230301 header.b=SEYoFLJ6;
	dkim-atps=neutral
X-Greylist: delayed 5405 seconds by postgrey-1.36 at boromir; Sun, 16 Apr 2023 18:07:19 AEST
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PzjTM1tl2z2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Apr 2023 18:07:16 +1000 (AEST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id nvtHpgynZXvOInvtIpyMwd; Sun, 16 Apr 2023 08:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1681626578;
	bh=4/y1p+J5P4sf9MxwjHggSXgJ0J0v9pbQqECTb6NgUf0=;
	h=From:To:Cc:Subject:Date;
	b=SEYoFLJ6cBxSp77oZjHGudkSCN1Wdu0QQVaXUXyD9Tc7lStPCIDuudzD3KLpRMLp+
	 Pxw34MSPnY20YyCGeujLsredFK6iTizuhxu0H3P0Td9pvLCOZXzpigRMvq45ejxB3R
	 1blo9xNCmMMkqV7eRL48PBVqbiQFOxyhbxZUZlsBS8RGwGD3vKAcB03EiwF6wycErv
	 65wMuxCHWjOSFmughp/lS19wEEEXywu/G4DHvYkWAzVZebWM02j1cTkMlf1yHvLQeg
	 oYG8rJABQnn3qBdK7bVNkUYGVfgR4ZJ/oJgLgkohRx0lhhNJDl81g9uTJRicEwoFsV
	 17SKFihW4aQeA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Apr 2023 08:29:38 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl: Simplify an error message
Date: Sun, 16 Apr 2023 08:29:34 +0200
Message-Id: <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dev_err_probe() already display the error code. There is no need to
duplicate it explicitly in the error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bffa1048d31e..40870668ee24 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -858,7 +858,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed: %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto asrc_fail;
 	}
 
-- 
2.34.1

