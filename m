Return-Path: <linuxppc-dev+bounces-1875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335519961EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 10:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNltW4Yv9z304C;
	Wed,  9 Oct 2024 19:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728461411;
	cv=none; b=c3spbjCBEjUHeKH7wo6vsalqc1j34AUwln72yhsCstZ6PjuijZO+ARn+dkQQIdv6PjujmwRAtcJnuIOrg9kDvpe3zTSdQZUXhfwuLoclNrnHzhzEOynVbpgLQL20u5VAdtQ9zS8lIYOTGcCjdNmn7ARh0e+9JN5UoNPsR5ejet+H8CIarTRtxSrbm7hTFnrmFpMGxmjjq9ai+NkqHGpRZSXVqSNyvogIShV48rHZOFKeaTER42eFbPlDmxuOZdZ2Dhpp99GSUykKRyzrjdYQiAi/9Rq3HL1m0g6tcmTo30tKxBQHrh8DdSu+B+Ykw4aN5XZ8gCVHLA7mk4ccmAduJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728461411; c=relaxed/relaxed;
	bh=yFjgQDz6utMISJUJD4wo8VKeKkVarbNpjlJuyH7AnOc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=ZTH9AwxjmiauYFXh38UCWRF2HCOSFc4WLG1o8qPguSWwjdtvLiX754I7DRUGpK1ZhVXw1ctvQ4sPnrVgTvXi79jbwlgm7wh9QRINdD6Vh7QKt3miPrhPrkADOLlot18AVP+0MHRQO1VfEiLnpPWuo5LBo/7Pau7oTQSHqQuyMr6H/g2bqm3dnaMJ0DEgbDZb1xRoHV/e0Qni4lxDtxNpwR8nUKH0xmNMdaM8CJGmRwVW9jwWXyhiJIgLxX9AYMIT2CaliU9YpdOr428pxQyAQBaEi5of9p5AHFYBVOGPG2ddsDJArJ+tXnP7LzCmwPSobS7826EouY7b2w8/GHBxKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNltT6gF0z2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 19:10:09 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BBAD1A27D8;
	Wed,  9 Oct 2024 10:10:07 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E7AC31A1D73;
	Wed,  9 Oct 2024 10:10:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 38FFD183F0C7;
	Wed,  9 Oct 2024 16:10:05 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chancel.liu@nxp.com
Subject: [PATCH 1/2] ASoC: imx-card: Set mclk for codec
Date: Wed,  9 Oct 2024 15:46:43 +0800
Message-Id: <1728460004-364-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

From: Chancel Liu <chancel.liu@nxp.com>

In some cases, ASoC machine driver may modify the mclk frequency
according to sample rate but the value in codec is still initial
frequency which should be replaced. For example, we should update
mclk before setup for cs42xx8 mclk relating registers.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index a7215bad6484..2f3dbbd15791 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -370,6 +370,11 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 		dev_err(dev, "failed to set cpui dai mclk1 rate (%lu): %d\n", mclk_freq, ret);
 		return ret;
 	}
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_freq, SND_SOC_CLOCK_IN);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set codec dai mclk rate (%lu): %d\n", mclk_freq, ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


