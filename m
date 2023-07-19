Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7475A09B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:32:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ai77xjd4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5ptj6WnSz3c58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ai77xjd4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=matuszpd@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5hFT46nhz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 02:33:00 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso994714066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689784374; x=1692376374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezYh9TdYf9SPGlHOq/YkmRIkBcOvB6bLPP8t0cvosPU=;
        b=Ai77xjd4Papa7mIdUTLLLOt0HjEVd4UaRKKLVWju83yIoffIwGYoOAGpHNGPTBkW7R
         xzjBMM3CdMTo9T4RB9oSbJ75u9EW9fTtiCbZN8tfdNpmmrilnk8lNUNQTUFeECk61y56
         jkeI/OeVa4PUEAV7qe9J6W64tzVgBxb/uOUch8GEPWxL83j9+7RYdDFueAzwh9u3s9ET
         JrqViZoYcaeJku2l6lKHWbFdDFIwVlXGoDaG72e33Rrlz9B097nXYrVup6zSuA9iomFI
         yhl7MOnt+FU3nyXRgZWaikNNV3lKagEaqODe+zmbirKNVvfNK+S8rUpIgAFCDfSRXVdo
         3Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784374; x=1692376374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezYh9TdYf9SPGlHOq/YkmRIkBcOvB6bLPP8t0cvosPU=;
        b=ixiAlMi9UJBhsENw0tHKYkw+aM1YjEqAjmY7IIlGYbQC3jJl/CSbcgZt9L+Y9RnaIM
         V3HE2EmPddZblaw5QIHuPPJXbXUHIreI4y+7o+X5B1vP0THwLxTjzuOqOVq90F8YDFW2
         bdBMNZfixcVSdzZejUyLaCLenwqxZS5XGH8a0g3DIWSUe/8XF4MBhxSPY46YpXSHHtJP
         WFzVpqpnVpTK0wovDoiu0R0Zy/yhBv2xJ+dXeDojAB2FScxIq1XGx2VKya1Ac/AgjWLD
         kJAL4fIuvP2qvfeLy9Jzj1IRd9HqwA+6/9z+jRyITpZFzs7Zs9k54jKrOdZTCOonpKmf
         B5vA==
X-Gm-Message-State: ABy/qLYZTrvVcYfhLBq37RoAO1bCanJMLdeXRu8T6TJbtD0WgWdO7A65
	MFtsCXP2cJD+P+CkVxCy7WY=
X-Google-Smtp-Source: APBJJlHZwwjBvT87CgsBUjDjYtMiifOSzfmRfPiW+vi01bUGZ/rvbUobuTctzgwoF66GEBo+mJgTOA==
X-Received: by 2002:a17:906:290:b0:999:37ff:be94 with SMTP id 16-20020a170906029000b0099937ffbe94mr2432672ejf.71.1689784373757;
        Wed, 19 Jul 2023 09:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
        by smtp.gmail.com with ESMTPSA id o21-20020a17090637d500b0098e025cda3bsm2571044ejc.141.2023.07.19.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:32:53 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
Date: Wed, 19 Jul 2023 18:31:53 +0200
Message-Id: <20230719163154.19492-1-matuszpd@gmail.com>
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
Cc: Matus Gajdos <matuszpd@gmail.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for 22.05 kHz sample rate for TX.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_spdif.c | 8 ++++++--
 sound/soc/fsl/fsl_spdif.h | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 015c3708aa04..95e639711eba 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -514,6 +514,10 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 	int ret;
 
 	switch (sample_rate) {
+	case 22050:
+		rate = SPDIF_TXRATE_22050;
+		csfs = IEC958_AES3_CON_FS_22050;
+		break;
 	case 32000:
 		rate = SPDIF_TXRATE_32000;
 		csfs = IEC958_AES3_CON_FS_32000;
@@ -1422,7 +1426,7 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 				struct clk *clk, u64 savesub,
 				enum spdif_txrate index, bool round)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+	static const u32 rate[] = { 22050, 32000, 44100, 48000, 88200, 96000, 176400,
 				    192000, };
 	bool is_sysclk = clk_is_match(clk, spdif_priv->sysclk);
 	u64 rate_ideal, rate_actual, sub;
@@ -1483,7 +1487,7 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 				enum spdif_txrate index)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+	static const u32 rate[] = { 22050, 32000, 44100, 48000, 88200, 96000, 176400,
 				    192000, };
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index 75b42a692c90..2bc1b10c17d4 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -175,7 +175,8 @@ enum spdif_gainsel {
 
 /* SPDIF tx rate */
 enum spdif_txrate {
-	SPDIF_TXRATE_32000 = 0,
+	SPDIF_TXRATE_22050 = 0,
+	SPDIF_TXRATE_32000,
 	SPDIF_TXRATE_44100,
 	SPDIF_TXRATE_48000,
 	SPDIF_TXRATE_88200,
@@ -191,7 +192,8 @@ enum spdif_txrate {
 #define SPDIF_QSUB_SIZE			(SPDIF_UBITS_SIZE / 8)
 
 
-#define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_32000 |	\
+#define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_22050 |	\
+					 SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 |	\
 					 SNDRV_PCM_RATE_48000 |	\
 					 SNDRV_PCM_RATE_88200 | \
-- 
2.25.1

