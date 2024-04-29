Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EED8B571D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:50:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xHmH6IMz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VShTx3tV8z3dW2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:50:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xHmH6IMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VShSN4LYyz3d3Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:49:08 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so4711014a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391344; x=1714996144; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=xHmH6IMzYrjFqLa0zK9bNYQ8u1gTVJygTw9uyOIlhIvUUlnBsFlQn4iIDw5mjZakOD
         cIklSHmWPNSbX9GW3udhFLrMFof5MOfge0Je4doaaxlj5yQg6N6OLVuLtGPN4OavQ6Z9
         gte3gkiRHEkPd/I99PrUTj0f49u+Mp35vKrAc1pqzYAXrnmbpzF/0kH+IYgpPOCfmAoQ
         UZR5GP0k0JsSKWqC3fRWgD0WmxzNfWerf5h1oL6x7QUlSC42CyHIwUnXfSasVWLILZO2
         KJSubwpKuI4Yln3kJpQ1+k88wMDc0MFY5GRuPgfHSu8ArXOWjKMbq8+pSgOSKiCBedJF
         boPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391344; x=1714996144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=mmfPy4pNdLx8wL+ehffdn5nHOObVNZkgNR87x/gZNozYePuN+c+hMlIG2fmhO5UQuT
         UoP/OZXGBazClBedTan0b6oLs7c82D7hxvH7QcJddyEKGJKnvme9q8BQo5N7cpNAb7PM
         QjKvU+mHl2fF1TcNj0MFPUuXU93l9ZRDsh6xlECo5oAxG6q82dhh5uUgDh+ty6CPK3Md
         +4m3IkQ3meMulGHcUmhxts20HYuFIMqBhB3mK+l41ExkJQmmulfBqkFi1p5CkmatIml3
         5pKff4j5IL1WylEnooR8ioW1+7mQzBLRU1THXPqzDJcVndxvy4+OmUEDdauPP+GHPIoE
         oXTw==
X-Forwarded-Encrypted: i=1; AJvYcCV+zSLypW2KNTz58cx7b9xEh5RQ6LnRadrYZpIuU3w3yZO/A9q/bwkrapOUUZLPj+z2TVmnfvH90bLuxa7yW/uZSNwSI/G8v5ACLLDtxg==
X-Gm-Message-State: AOJu0YyzKrbGcSd8cbGjUnJBJEN/xT0FIYW63g/jWkw4qULIL70yTkPj
	iYUfBdCVmfuJMuhhcVr/PlAGjKsXrzjOB9j7AdJMDlvddlO09DTEleYtoVnAEkU=
X-Google-Smtp-Source: AGHT+IE7Wa1uhxiwDIcwEN93hp17bsG0rm9iXFrpgirDNmmGz9BzEYEL+4mFW282MhhBjXekfPbkUA==
X-Received: by 2002:a50:c34d:0:b0:572:4e6b:958 with SMTP id q13-20020a50c34d000000b005724e6b0958mr8878245edb.2.1714391338535;
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:46 +0200
Subject: [PATCH 1/4] ASoC: qcom: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-1-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kjQtqus+caDsWogKmeSbNLXw+geB1/pDh6h
 zr4LbfsFbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIwAKCRDBN2bmhouD
 14b0D/0V8sY+FV/qujbJc2MZicjp6syHrzotc7cYVvSeV+dkb439YYh+NaGaaqpeJUxjyJb2iwN
 g80bspO9f4x8zDrj33iaDX6i3PTrzUfqIdX9sdjRVTV3Fr4uwKC3aCbsFa2Vxiv17HN44sBJGNk
 xcWehLqO4B7ywwZItmOd80D5xro3XPgXNLdKOH0MdqlZklYl6hO+1xNLiPfWpip/W612624D8iQ
 9cP+3JFtg/WOs8bs1pw19ck/erjsxcK5agwdvb8/PBDqzGw+thqtLTiyhfNYkK84HIQRMnr/HAB
 zZ2imnBm+Sq/JYviHRnhDisoAwtJIMJjkKz5LVikIN/ZncgetLX/XtHcabi9PUe8u1UVTlQI35t
 p8N0ddiiugWxBSwUqeB0l/oUYVGD25BM7rw6FvLyxGRRbq6wNHIF2FM5L+CvTbf4Cjj7en2yqIe
 YAmbAszVP1IJinxReJfTLotoI8eOEInUmx5Oi6/RtoiA8PrGDx91vg9sv8+GHiPKwyUq86gzY56
 lnNPaYQ7rkZ3xUUxNfiaxz3bU/Xfdd5mCFC9bVihIo/K+xYvtE7VpBIULyS/kS+qAUaKjOPuTWS
 nSbxB6Ep7ZaUfi/J8Le0Job8rTy/m6gU/Q+TRR6KLg0Fp6FzUP4wqvblu8wCjozXsnk7ZvM43r7
 Qo+Ozchtl/HeR4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..3c78440a2f0f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -85,7 +85,7 @@ struct q6apm_dai_data {
 	long long sid;
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
@@ -104,7 +104,7 @@ static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index aeb6a9d479ab..3913706ccdc5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -103,7 +103,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0

