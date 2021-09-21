Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D61413C30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ3v22g3z2yxP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fD5r1+S/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fD5r1+S/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyV0l2Pz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA27D60F38;
 Tue, 21 Sep 2021 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258704;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fD5r1+S/1nCsv6H4NjZ+G0hNpCUEsKHVUIVQgiM39Kn/HaHfDO6faQS5rh7CX0F+u
 Y8pqjWv5Se1dykNALBcIzce4TEPOy49nleFWILJUOKBf2d0gEaVvsis35Kr9KCv5Lp
 vokNgEj3NrqMNnAT5TZ8G4BiVxSUkgVGnhnlo4/FVZupzMLKUS7jO7t/61IuIPdKP7
 VBM9hT9DGfQtQMMgz17oYVCxZNQ44mLRMm0PqRGjTjeQyd5BHZ9jbRSNGPaXRmA56p
 Cz7WmKrHa16XhxDu98ZYKTFTgYgz8gLqnShsWTUv6akmI6WdcPXpXoZi2e5DsG945e
 EewfwBOwgRPVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 08/16] ASoC: imx-audmix: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:32 +0100
Message-Id: <20210921211040.11624-8-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; h=from:subject;
 bh=QnS5Cga8MAQ6BFduVQ+0hsBboMZot1AdyZOYHd/YW4M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknhpSHJMIZLeNDcthjEQHy+0FccpWtf96EdaQPR
 DPI46haJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ4QAKCRAk1otyXVSH0DHnB/
 90xHZIal1qmot1WZQkjlkBZSWPffQoQQQPbj4n7ljDk1kSVX4/Ej2XURCFegAs2Dkevp5H9eOFOw1O
 2i2Uxoo7lpzFo2NSnLwDlPZZqcgGLZxch4MNmsQCYioyqGOK2e2KUICKCym4HMMcXDF39UH2AL6RfZ
 aCusdVhPNN3Jj7KqNIVJ1HAasORBhblIPZf7xR56Cok9Yar01VV3mkhMFhFIsgfZAIj3LnsLdCnPLV
 EAqNKOWKM0HG+7QfRnt1yF2TgBjlCZ5PhEDSE25lzhAYKggEK4F9Iee9l3BxlSLS3v7DZt+t/qIEGI
 4Leu4+L67s/6u5+7JGIZAeMr05/9hO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the imx-audmix driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index a364e2415de0..e8b438a0329e 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -80,8 +80,8 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	u32 channels = params_channels(params);
 	int ret, dir;
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	fmt |= tx ? SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBM_CFM;
+	/* For playback the AUDMIX is consumer, and for record is provider */
+	fmt |= tx ? SND_SOC_DAIFMT_CBC_CFC : SND_SOC_DAIFMT_CBP_CFP;
 	dir  = tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 
 	/* set DAI configuration */
@@ -121,8 +121,8 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	if (!tx)
 		return 0;
 
-	/* For playback the AUDMIX is slave */
-	fmt |= SND_SOC_DAIFMT_CBM_CFM;
+	/* For playback the AUDMIX is consumer */
+	fmt |= SND_SOC_DAIFMT_CBP_CFP;
 
 	/* set AUDMIX DAI configuration */
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
-- 
2.20.1

