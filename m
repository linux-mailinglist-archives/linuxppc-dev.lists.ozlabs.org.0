Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3E75A09E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y0sBPXTz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5pvg19HBz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y0sBPXTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=matuszpd@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5hbB2nHNz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 02:48:20 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so9778639a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689785296; x=1692377296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yixFqSzT/c4E0mvGw1Uo9KfL2QY9NEvmj8leiEc3puY=;
        b=Y0sBPXTz9dyJZPRwFkzpcMAF8C1+t5QmrsdtFb5qSp1+uPUnaGSzooAFfj2OI2jVWj
         jXB5pXt+6XqggnKKndNnkx0iufj5VXa70c5mH8xOC0FXX7T++VZIlcySPT14vXHduATU
         HsQa6hNZPhbnOmZQOUp6D8ajoMITXzwzGD0dRYoCMLmaqb0gN4AQY727/hfxPSuFik16
         tK4Bq8uQdo820l+L3JHF5LFE/DaQZvenIfCYOUtOuyHHm+an7aqRO/nV05GUQzCYciPc
         oqZJPtv4nR8xNP9OXIgVXRJXvQwy4Q9D88KHaHF7OX1QtbdhcOziKcFxEtGUOB9sFZhG
         jXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785296; x=1692377296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yixFqSzT/c4E0mvGw1Uo9KfL2QY9NEvmj8leiEc3puY=;
        b=Jwp3+uw7sJFt4pBt/dht0JXUCxln3TyptrYVmqGKbJeC++cyTlb/v54FnILhCP6uEw
         16W7uE9qVd0Zls/swQ2Dh/MzJkr+Li3Yqmae4LqY/k4bQSLSCpnc4okNy+cJm/9kZMwa
         X/n5Uy33Rn1ENc6peUUXOVzx8JkkCsrxj+49skUbNmSRs/8v/BE6qqRs/7fcQyI9sJD1
         si7pIrrq91FLBKov6DVVd/AhzqNb1jQn7S9Nl8sBZq2JoDkvVzUKHqh3qF+jTPFAAhfM
         AOzs57KR6Si2dDHgynY7z7l0AyGg3iahQ1eczcjN3IaQcHdXmriD74t4RihEotmiWjHN
         2tnA==
X-Gm-Message-State: ABy/qLb6Pq7VbilG9+XtEwDRjSAyby0NRAzbHrqxOyhF/l2ZTNRQG4KP
	cClX5XqECPE3RcjhMmuVlFZKLsmN1ES90A==
X-Google-Smtp-Source: APBJJlEHbfz/pFyUepLd7VKG/NuQoD7KORKklONmdm98pXW6g5MHna6cHYzQND91adVXuiGLISQbhg==
X-Received: by 2002:a17:907:6d25:b0:982:9daf:9fcf with SMTP id sa37-20020a1709076d2500b009829daf9fcfmr3870702ejc.66.1689785295815;
        Wed, 19 Jul 2023 09:48:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
        by smtp.gmail.com with ESMTPSA id gl7-20020a170906e0c700b00989027eb30asm2566959ejb.158.2023.07.19.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:48:15 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Warren <swarren@nvidia.com>
Subject: [PATCH] ASoC: fsl_spdif: Silence output on stop
Date: Wed, 19 Jul 2023 18:47:29 +0200
Message-Id: <20230719164729.19969-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jul 2023 07:31:30 +1000
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
Cc: Matus Gajdos <matuszpd@gmail.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clear TX registers on stop to prevent the SPDIF interface from sending
last written word over and over again.

Fixes: a2388a498ad2 ("ASoC: fsl: Add S/PDIF CPU DAI driver")
Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 95e639711eba..95bb8b10494a 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -755,6 +755,8 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		regmap_update_bits(regmap, REG_SPDIF_SCR, dmaen, 0);
 		regmap_update_bits(regmap, REG_SPDIF_SIE, intr, 0);
+		regmap_write(regmap, REG_SPDIF_STL, 0x0);
+		regmap_write(regmap, REG_SPDIF_STR, 0x0);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

