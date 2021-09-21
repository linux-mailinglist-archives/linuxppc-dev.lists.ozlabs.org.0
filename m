Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363A413C44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ913qWRz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qZHTV8DO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qZHTV8DO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyq6rzwz30Bl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:12:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9BC961159;
 Tue, 21 Sep 2021 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258722;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZHTV8DOHq7oNRYFVVCSsrIyYsBSOmaD6zpecjOgeKkj6FTScP5ozC/FpNYoCPj70
 kwiopUcouOo6pQdJJbII0gCs3EwYrIjEFEs4eiaGJa5tXfnJFJRpVqrl5dvGci7Kdc
 /T7mTh8Xg3nhpsVFt3YScv7m5D0KUN5hEj/Vp/YadIrhdaOgVVZsh1Y1GEu88qu+ZA
 EYf809XbbgxL2x1afyvegTSYuo3ITdazRUA6VtdYJEW6wEDBtd2Q4/3tDRLII1ch3c
 J22HCAbeTZVvLIQXTOKeMsJgpPHJowf0qKxz+C9TGVL75ha+xk2lzXpxevNVixbx76
 myqKO8ARq5d7w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 15/16] ASoC: pl1022_ds: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:39 +0100
Message-Id: <20210921211040.11624-15-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; h=from:subject;
 bh=tBTmSySfLPKEPabaMellE/V522O8P+h67TeK2y/iQkY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknmraBkqj0wEwEH9n/wZXSoslC7ytCzj5bPJuG2
 iiO9U+uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5gAKCRAk1otyXVSH0HadB/
 9E4fxdlHjmP1lGFzuCqwLhyH6bSW0oO6jyJWZ+YzXftg9Yiz78YzYn0rW0Ms+SjuSNKAd5JeW0Vz8c
 ykNxAUi5p4RrxSdgOkHB9u2LSqOTnJRWrKspCIjuC13Qov2VjaxLZCtlogijLO8zKmbqdNANjJeEIa
 PNpsdGL5h56v6UVG142q8ZanqzvBz/F6teVQckkagOo4GIjuJaPehYwL0JQgxXb6GfM+2yQvj8F9ob
 e9CNwJrG/KXG76p3MGEzS9JIk2NbM3ozVVSPnPhZiymwayMbtE2W6DL5Q4OtUgMg/SACsvHeCSyrCL
 y+iiCUbv6rJPdz5xoSJd++R94sVfVC
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

