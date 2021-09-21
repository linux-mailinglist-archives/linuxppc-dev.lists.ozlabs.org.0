Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04993413CDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZk56k9Zz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lGLPyysB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lGLPyysB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZX61Gkvz2ynJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:37:26 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 185A261019;
 Tue, 21 Sep 2021 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260244;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lGLPyysBCGU1zepwlNZzaX5AauEv5DcFvwEB/5WPHoPH24pVbrDT8akdjyHVnkSyG
 fwEg2u4kcQvLaQIPT81xKUd39rDmP/qowmo5KBqf+06YX781ZuvlUJl3OexBKY9OfU
 eiZd/DaM+pGhQe/cfLdkep/lo+8fX/wK2eAuAebhco+bj1FyN9SwtfIuM7bWzgaFur
 wHuFRKdBJtTpIVnNABdChT0PR24cTBmHiJInuXkDERCI1EVSZ63cnQCaOizp13+zca
 DOZTL9DXAoPiXYRQHNt5WwPJ28ckcHXFAF4Yzarbwk+N7AeEfyxqVEbbwFWvUlUvz5
 pofDJtGOHRq/w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 15/16] ASoC: pl1022_ds: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:41 +0100
Message-Id: <20210921213542.31688-15-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; h=from:subject;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8eraBkqj0wEwEH9n/wZXSoslC7ytCzj5bPJuG2
 iiO9U+uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPHgAKCRAk1otyXVSH0Fr3B/
 wK8fSgybKNjVM+xJHjb6+L2EDuvGrI3VzlhLgI/HK0LcX9s9mKjRnCY9ABRJwdS7SER6Vo6bgjLMi3
 pzNTx7LbJ+vOmmlBF6Cc2ZRi7TqwVFV1JRsMUfdiXhqQoBFPwVjMzVWTJEKbYPjQe+ZK8fwOhm1jzE
 Eu27tYyDxLMvsTBsmsaA6hoCoK4/pwHhw/ob6IZ7arSmHtCPY0irKEW9W/N2M3RUbSyX8FHNnuWAXT
 YJjc/6MvlaVjZ3SZmbIsUDSlCKh+Dv/o8gnB5bW8y6lRp+PkMtOz/Cp1hHjZcnON5gTzUR7S2AXEK/
 xtQzclLbjUMG3YxwHJ0JISbaj6YEGP
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
the pl1022_ds driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/p1022_ds.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 317c767b0099..b45742931b0d 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -275,7 +275,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
 
 	if (strcasecmp(sprop, "i2s-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 
@@ -293,37 +293,37 @@ static int p1022_ds_probe(struct platform_device *pdev)
 		mdata->clk_frequency = be32_to_cpup(iprop);
 	} else if (strcasecmp(sprop, "i2s-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "lj-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "lj-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "rj-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "rj-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "ac97-slave") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBP_CFP;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "ac97-master") == 0) {
 		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBC_CFC;
 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else {
-- 
2.20.1

