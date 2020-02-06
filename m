Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D061548A6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 16:56:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D32l6XzgzDqKl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 02:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sirena.org.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.a=rsa-sha256 header.s=20170815-heliosphere header.b=CZkbK093; 
 dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D30c3JzxzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 02:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eFZpDdmMDc+jg0LQsv6cOH8jUl8NU8Wb3prM5WogJw4=; b=CZkbK0934Flb
 PlFSFEfPcSC1DjY1rrTXiRvPEKG+WXzVzsaZIi6UK4y2ymJdtolZb3Irl4t3RaVV79EDZ6Ar1PqD3
 8Kpfxol4XRvMuLUI15TW/hU8ZpTWH9TaeosaZplboZyJQrJ5Iv6EEn1Q7CUHw7TY3WrSuoJSg4uUo
 5UJAA=;
Received: from fw-tnat-cam2.arm.com ([217.140.106.50]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izjUL-0002lU-O2; Thu, 06 Feb 2020 15:54:45 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 29824D02A55; Thu,  6 Feb 2020 15:54:45 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Applied "ASoC: fsl_sai: Fix exiting path on probing failure" to the
 asoc tree
In-Reply-To: <20200205160436.3813642-1-oleksandr.suvorov@toradex.com>
Message-Id: <applied-20200205160436.3813642-1-oleksandr.suvorov@toradex.com>
X-Patchwork-Hint: ignore
Date: Thu,  6 Feb 2020 15:54:45 +0000 (GMT)
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Mark Brown <broonie@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_sai: Fix exiting path on probing failure

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d1520889782dff58610c0b6b54d4cf3211ceb690 Mon Sep 17 00:00:00 2001
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Date: Wed, 5 Feb 2020 18:04:36 +0200
Subject: [PATCH] ASoC: fsl_sai: Fix exiting path on probing failure

If the imx-sdma driver is built as a module, the fsl-sai device doesn't
disable on probing failure, which causes the warning in the next probing:

==================================================================
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
==================================================================

Disabling the device properly fixes the issue.

Fixes: 812ad463e089 ("ASoC: fsl_sai: Add support for runtime pm")
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Link: https://lore.kernel.org/r/20200205160436.3813642-1-oleksandr.suvorov@toradex.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8c3ea7300972..9d436b0c5718 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1020,12 +1020,24 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
 			&fsl_sai_dai, 1);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
-	if (sai->soc_data->use_imx_pcm)
-		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
-	else
-		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (sai->soc_data->use_imx_pcm) {
+		ret = imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
+		if (ret)
+			goto err_pm_disable;
+	} else {
+		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	return ret;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static int fsl_sai_remove(struct platform_device *pdev)
-- 
2.20.1

