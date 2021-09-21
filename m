Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CD413CC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZfR22LFz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uD29ZCcE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uD29ZCcE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWq6jqFz3c8y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:37:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D285F61166;
 Tue, 21 Sep 2021 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260230;
 bh=NW3bpE8J3VKBnOZtBpB10bBc+DHax4UYEF50tjdaBmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uD29ZCcEG51Y4IHXtR7X8qbkvC3ON9oM3WfgcP95ksV9Mdza87pjZpZz8KfGs4MqM
 QZ4TzXkFbMb048UvrDVmgLalmg2oDECWj0GO8fONJJKyqJI0XVqvJ54qZKIloDmSZD
 bmvLIj4BXSmbrHVTdOztHpSVXyeRdusoHsBzrOrZ0Q+0or/et6cigSzmqsyVdnOc3w
 7BC7H15wY0I8Zg4nXhgDpXh/+7X/Tokot1DjX7K5pLwc4pMdhBM9gXc99JBFSqkzHD
 jAy6/kFaKnI2yrHt/DkVi9clf1kDQbdN2cIUXKZc8ejMpw5BHCMZnjYsPOaMu8n+7F
 6PWKI7acBSrNA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 10/16] ASoC: imx-es8328: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:36 +0100
Message-Id: <20210921213542.31688-10-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; h=from:subject;
 bh=NW3bpE8J3VKBnOZtBpB10bBc+DHax4UYEF50tjdaBmQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8ai/HuhL2+C59n6SMrEtArdewZFCYqAk0/3TuH
 hSAfRLiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGgAKCRAk1otyXVSH0LGlB/
 9H0CeulkUvRZuZc4vy3WrTNRmoNab/2J/cAZE+Mr7BTsnfIRn3OfMj09E6X9vVo2tNjZoDQ8eJHMkx
 6VNu9h7QyFhQpIh9tdpFYAyxpX9Q5VtLW9WTCYXHpZSYmbdsGPZ3TiO3eheLjLDgrrFOmrakau8w3/
 TvA464kZ8TK/ObDqPCZk4DCwld8HJ+GTCDQdku4U56Wo9Ss8Z2BKr4B+XeZuqE3AMT3t/peiHlLkFb
 aQqlH3gKvrpCHvDrzSa1JkDlWh42x9wltX8VKxgxLGm3vdOQU80znrC1/+O/U2/XvfasqmBUG2A03C
 awr6gN7Pos3BruoMxzrLdjsUDayuOF
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
the imx-es8328 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-es8328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 1981dcd7e930..09c674ee79f1 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -174,7 +174,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_es8328_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBM_CFM;
+			    SND_SOC_DAIFMT_CBP_CFP;
 
 	data->card.dev = dev;
 	data->card.dapm_widgets = imx_es8328_dapm_widgets;
-- 
2.20.1

