Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2886665D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NshB02kHgz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:47:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Y5B4BSaT;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=i/TqBNK9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Y5B4BSaT;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=i/TqBNK9;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Thu, 12 Jan 2023 03:12:59 AEDT
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsXlb5Hkzz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 03:12:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673453580; x=1704989580;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c9cpAyHWzxXjJFF8d9KlzwQ1StQxFYBmw6tvDxixwNc=;
  b=Y5B4BSaTnoHjZRelN26IJRfOlFKAQX2zgImfPi56UfMHgZnz23T6LQO9
   5isZz9JtFDm9koU+Iu5sIdPKDw69vMXnf5Oo/jfCxcph6q3GjfcS8gIFp
   rOUxZbbXmVKQU+M3uIOp8XllAnQ5U5//9mch6/KE3TEKBozzMS1l3i6na
   CEnzQaeaG+ddEPUwrXLnntAUfW1yvIhlbozjQNDbL/x7qzqmT65/5w+fo
   EyL/4Y5tUeJdKSRV2TD6pyGFPQ1tVO37xOrpbO8LhH/RUwOeNqsxst7UY
   7U5eZbaZPFGR/oz9bea/Zcn45x8BXRWy9GB62TO/xHsOu9The8GMLApgU
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665439200"; 
   d="scan'208";a="28363764"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jan 2023 17:11:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 11 Jan 2023 17:11:48 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 11 Jan 2023 17:11:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673453508; x=1704989508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c9cpAyHWzxXjJFF8d9KlzwQ1StQxFYBmw6tvDxixwNc=;
  b=i/TqBNK9qdyc3cvLiA0cZxg4/yFPkYSOhUQU3zGK/47xLCmIOfSUdwdI
   f8AsrNbC49D2ylz/YnlMEsEhQHtVVo92beEvxz52cXu6dD+tP+I09iayT
   cp77FohBCEGfNnsc72JrbnlsGNrmwJibOKgarO14H1tF/+khJMfylS6ig
   jrRiOwhIIi46yiTgNd33/a/p7MQzq3QgUK40zcUk7ilsUfvqoIcMpyLZk
   JRI72sYAtQysxkV4fHEayQ/p2y36iTAQqpXHZMEz+FM39+qRulobUyVNl
   YKMSF2gNw5qwg32T9Uzkm0+XPYQ9zDQdP7YYOsK2pLI8xQlVUKQ/WdsJJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665439200"; 
   d="scan'208";a="28363763"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jan 2023 17:11:48 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9A204280056;
	Wed, 11 Jan 2023 17:11:47 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/1] ASoC: fsl_sai: Use dev_err_probe
Date: Wed, 11 Jan 2023 17:11:44 +0100
Message-Id: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Jan 2023 08:46:12 +1100
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This helps figuring out why the device probe is deferred, e.g. missing
FSL_EDMA driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Old:
root@ls1021:~# cat /sys/kernel/debug/devices_deferred 
sound   fsl-asoc-card: snd_soc_register_card failed: -517
2b50000.sai

New:
root@ls1021:~# cat /sys/kernel/debug/devices_deferred 
sound   fsl-asoc-card: snd_soc_register_card failed: -517
2b50000.sai     fsl-sai: Registering PCM dmaengine failed

 sound/soc/fsl/fsl_sai.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1c9be8a5dcb13..2a38e2bdf9893 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1458,14 +1458,17 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (sai->soc_data->use_imx_pcm) {
 		ret = imx_pcm_dma_init(pdev);
 		if (ret) {
+			dev_err_probe(dev, ret, "PCM DMA init failed\n");
 			if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
 				dev_err(dev, "Error: You must enable the imx-pcm-dma support!\n");
 			goto err_pm_get_sync;
 		}
 	} else {
 		ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
-		if (ret)
+		if (ret) {
+			dev_err_probe(dev, ret, "Registering PCM dmaengine failed\n");
 			goto err_pm_get_sync;
+		}
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_component,
-- 
2.34.1

