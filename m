Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C52413C3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ7d6Czfz3cR3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:19:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jU4XvWbo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jU4XvWbo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyl1XpSz303f
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:59 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A724C60F38;
 Tue, 21 Sep 2021 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258717;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jU4XvWboZSzRPKhb/vn1o8OuJnTe2Ny0E2jx4Tf53rwm256N9xgl+zasRtk8ZroZJ
 11qElLnYgEg297JHkJJSYr/LEMmrCMSWx4Dc1M55boV+oLSKKx+FnP4ty9R9dhTXGV
 TooIeChgV28w/kaYBdSnisNZTQMyYYag+of+sPy2H0Vp3lWg1RmQMY2oxSU3IpjpMy
 41OcvZxyOzjubg5J3BVAjRsMWNhf2fTIeUBCKLBs5TFq2vbLUIQKYvag9ZunLs/YzW
 qo7lRKFGJPFaCAFnmRC930iqc/mACDbUzXKZNFgXbqJ50TbontS94/3iN/caL+aOuS
 3sdpip5mvkVbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 13/16] ASoC: imx-sgtl5000: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:10:37 +0100
Message-Id: <20210921211040.11624-13-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=+31WT2YpLY1PNFXYWVUJANX+51GF0audki7RRoE2ToY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknlajJbtErs5M2JHhrPL9v3ObE8KSKu2qOqnXTt
 /WwinpCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5QAKCRAk1otyXVSH0KjUB/
 4v2feYY34VgPgN0A1XUuH5RRkA+dqcx4F9O7LxEN2O7Ip/BGUMaDASCQpHTMyALpQUA1XNLGcrSono
 Cl8g6ZYK8//R87uzsiBBxgzPJOlDLYabFjDgwB8/o2R/U0Q9P0OowPjZ0BUMVulOeogPZ0G5vuCXIi
 juVLZ/8n/xHzcU/ANZ4IT4wlDYNk8+2RflNIVDMwEpnhYBy7azn0/0lTtGMNItGPMz8nUXis/BB6I1
 5ZdA0CA/EoPtdnyplRNJ+IvRl66nVw7af0KicT/eNoaQLqiBbpSpJQtV5B/6ZM2boFNqhGx5090Zax
 wErUjnSY0/++1GIG1VweYi/sBz29ao
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
the imx-sgtl5000 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index f45cb4bbb6c4..2f1acd011042 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -153,7 +153,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_sgtl5000_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBM_CFM;
+			    SND_SOC_DAIFMT_CBP_CFP;
 
 	data->card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
-- 
2.20.1

