Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AB8B5725
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G0CYii1p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VShWW1BSQz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:51:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G0CYii1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VShSR30tfz3d9H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:49:11 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so4517131a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391348; x=1714996148; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=G0CYii1p1fw8VbEXermKoyLun8RQRPlfWPmP7A5bXujQwWO/WoHBkpr6/Y+tN6Qc8y
         jdrh1zzE7Y4qYpa80P4pncLu7BFEEfg0qGgDZZT9KK8vaQzJpHrndDohsVsAQ4fyC0xw
         ilDIHg3imP6EXYzPRjIhqmJ4Cc5/7C4veUjWKyMUVSIDUbEC3By4KsUe0iExCKOkAG6c
         YAWWNo294Vo5BL1/FwZ5815NVKcsXKnexnWbRr2NljuOtqf1JNbShdSKRsst2bAZ7sJZ
         wx1eBNvl9h6JdRP3L6Ptt+lWJ9684OonDmqoA8LYRkQXcrMsinK7TMck+QCwatF/Cgsb
         bHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391348; x=1714996148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=YS5G9IT8Qay+xdOq2aYMk85Ec1c7d83TafRZFwG6M/7a4rXGCM6jL+zJyP+1a76BNB
         nSpWfz1O1MfSOXLZa5kMB3sMxqopTKdFsrQQz840Jmkm85XMoQ9DaH2vF638OWuE5cyH
         98IdWS3qfTNG+x6JyRjSV5WiXn7ww9hAgCJmLHmw5CpCvMeNwvYaaZCX+ygR7jD+Blt1
         VvHBhsvCOvRB+l0iUA22l7l7JUdhZ9EBQekcLAf3zVAVWyc1OmEiZ7p2/NXy+ybvnNkg
         qEtlMiT1EJopFKLGji/m867w54n5Eh7d1BXYw7WMIfpiGdVGe/4I3WC6ODcvA/miqEhu
         8KDA==
X-Forwarded-Encrypted: i=1; AJvYcCUDsjrMBQKroGiztGCSy1XBozXUiFeiF8+g0UO7nxuHsRHTYnRsQAMd79y3pwUuAIpMJM+QXL2BkircHMkBeskTUQApxln7u9XBcbDacg==
X-Gm-Message-State: AOJu0YyStZralEPk7FZBjpDPKVyh/xvzVj6fiCKsugThztIKz+pLfZgx
	fgM7GrwFPbBu/e8CBXmTLIJDU/j8FBDmJJ9V5Qe2Vidy+cTLjE94a7UuKNl214Y=
X-Google-Smtp-Source: AGHT+IHr1i+P/yQq8bNC4hXAKz0hI9Zk8EupFlwsHF2uyxSdfVH1X92jPdRxN/6FjGHLuxgVDiSE9g==
X-Received: by 2002:a05:6402:1a4d:b0:572:8aab:4420 with SMTP id bf13-20020a0564021a4d00b005728aab4420mr504841edb.39.1714391348231;
        Mon, 29 Apr 2024 04:49:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:48 +0200
Subject: [PATCH 3/4] ASoC: meson: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-3-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=siprCfRQtWpQCCCk/EgBvG4/nMgpZ/i2CNSROadlb+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4klip7kMQMnb9G4Un51jC6C4Sy6sBF7+x0fz
 ZtOzlrSQNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJQAKCRDBN2bmhouD
 1zwfD/oCx8UsThy03fZQjvfzPPcHgd0sRjY0kzWjofPTFWoZrVbUl44+srODgATNkHSmXju076H
 /8V0+7FBomIBsrL/34jm+W7Ws2vae7j5TdY5WuquXO2P6hR5pry/+g8stMlQ0a09eWKWwOTUvuP
 09V4EzktH6rje90J1+lyxp9U0H0ROUA7LVYvj/uipaB/xhKtMk8CIuMIhpmkwPBBLfK11iXpjLk
 E2RvbOBGvGQd81MNYefDVd9DRbqfqcuLEmqjm/9yx7fLKq/A0AmAYbBQr66grnffuPOmoQD0Brz
 448EDhEzJcawBxb1rCp46MqUN8IYEMZMLsXXCkcpJIdJzUYeQunzaZp0Neu+haV/pZc02pOr3qN
 uEzMnAOOP0ZVoPyPOvWaJ19G/tlxIvOmLxPuG9WktTK3F5n5Kn0GaxpWvLth5zXWj+OITLwkfZo
 Ki3HsUbdVtdhPM3Vx4gW6BHI5l3UzxqQK3slZQnatydFdONKuXuKKIa0uNvspzVB+Jes2wZoKE8
 Bg05N8617xn/CcWWHYg/Rheq+bxja9iY5ZXhfmpUAQLsyebOXkfmxY8DB891GxnCFDOuuUtipbA
 xZDgKdZ6MAMWj2eZYZCzPwcML4hWxnH6sG4b8Ep0QD2u46DE4BM/yuRcaanbojeZz3UktdT8/ou
 SUnWJYvw0bJJVAw==
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
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 7d833500c799..eccbc16b293a 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -25,7 +25,7 @@
 
 #define AIU_FIFO_I2S_BLOCK		256
 
-static struct snd_pcm_hardware fifo_i2s_pcm = {
+static const struct snd_pcm_hardware fifo_i2s_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index fa91f3c53fa4..e0e00ec026dc 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -27,7 +27,7 @@
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
-static struct snd_pcm_hardware fifo_spdif_pcm = {
+static const struct snd_pcm_hardware fifo_spdif_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
index 42ce266677cc..84ab4577815a 100644
--- a/sound/soc/meson/aiu-fifo.h
+++ b/sound/soc/meson/aiu-fifo.h
@@ -18,7 +18,7 @@ struct snd_pcm_hw_params;
 struct platform_device;
 
 struct aiu_fifo {
-	struct snd_pcm_hardware *pcm;
+	const struct snd_pcm_hardware *pcm;
 	unsigned int mem_offset;
 	unsigned int fifo_block;
 	struct clk *pclk;
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..633fd971b444 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -23,7 +23,7 @@
  * These differences are handled in the respective DAI drivers
  */
 
-static struct snd_pcm_hardware axg_fifo_hw = {
+static const struct snd_pcm_hardware axg_fifo_hw = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0

