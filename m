Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7798413C43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:20:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ8K47xcz3dlx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:20:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h4I03uC5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h4I03uC5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyn31xBz307L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:12:01 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 667DC60F70;
 Tue, 21 Sep 2021 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258719;
 bh=qn1jE6K/Qy0HIHv+QnV26gpbLQc45bxFYT32k8EnFdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4I03uC5kjGPIQyAf4dW/mmLrqce0GtF1I+KpkCHGEiZ0GzNmEk1McVHrgIjwG0Yi
 V1uM1HYH/Pl2NzcQ/U9f/vM7G6vJkytFyJtA32nxZ1R8oK7DE/PJRlyMRFOE9uOE5S
 tFw2MMUe/jcoSp3TQ9GK9VzOTZkIvfCXvsUnIYEMYg4rPhpIyW26d3nUaOn+iHy6Ng
 2kK7lFgwX5un5GBcyCtBMNYznOQb9CKO3hOtrBmMAk4F/tcC0+7ff8maZFHSSOQghZ
 EwFJpOxXqktM9ZRGXdYAnExqoNOg2uqYHEfeOBwT4JlwZk5WHvT+tVOygDje6t0y5C
 FT5OQVcVUefjw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 14/16] ASoC: mpc8610_hpcd: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:10:38 +0100
Message-Id: <20210921211040.11624-14-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; h=from:subject;
 bh=qn1jE6K/Qy0HIHv+QnV26gpbLQc45bxFYT32k8EnFdM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknmlzD7rbJdjdY0C549PJSd4DI+vTeHN26l52LM
 pdWlWzaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5gAKCRAk1otyXVSH0GMSB/
 95UpYehfdj2W/r2f4Ca4QD7oVcXgECN+o3ii6tdlCf6TRTH4/XTYJBAQ28/CAijUKmCoT/bLSmv3bI
 y4fcceU8dY6ZDJaMgtf42g5yDnJ0pVDKj/6voHNocuBAVbdYXGWxLzFbuoDI5w8CKYkTgclTWtSfi9
 JTWlCwTr9ypu60RRj3Eako/qiwLYpchtOCacdSLEXZzgFMq3g3B449ExuNTHVGKNGLpfpPlfMT7yAY
 v0P1bhMNPpuVrJwYkeRpHQZ7McT5DelIG2e6UETENTyZWp9qNTiD2qf7L1AS8jWiZ17e4Fy9RJejAO
 Gurl+JgGmhLJCqPrDV9r94vEHeCzbr
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
the mpc8610_hpcd driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/mpc8610_hpcd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index 58b9ca3c4da0..e71a992fbf93 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -264,7 +264,7 @@ static int mpc8610_hpcd_probe(struct platform_device *pdev)
 
 	if (strcasecmp(sprop, "i2s-slave") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBP_CFP;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_IN;
 
@@ -282,37 +282,37 @@ static int mpc8610_hpcd_probe(struct platform_device *pdev)
 		machine_data->clk_frequency = be32_to_cpup(iprop);
 	} else if (strcasecmp(sprop, "i2s-master") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_IN;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "lj-slave") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBP_CFP;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "lj-master") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBC_CFC;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_IN;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "rj-slave") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBP_CFP;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "rj-master") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBC_CFC;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_IN;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else if (strcasecmp(sprop, "ac97-slave") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBP_CFP;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_OUT;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_IN;
 	} else if (strcasecmp(sprop, "ac97-master") == 0) {
 		machine_data->dai_format =
-			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBC_CFC;
 		machine_data->codec_clk_direction = SND_SOC_CLOCK_IN;
 		machine_data->cpu_clk_direction = SND_SOC_CLOCK_OUT;
 	} else {
-- 
2.20.1

