Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEC8B5717
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:49:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IZujhDOG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VShT20886z3d8M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:49:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IZujhDOG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VShSH0XgRz3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:49:01 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-57230faeb81so2592747a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391337; x=1714996137; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=IZujhDOGCgPnuFZnAnQpbL+l8wY/i9xXPeEaPqydTmjAGBn1R8hiR+pC7a2UZQ92eU
         GDA5MRs7R/3h74hq7fXMh6YryJEUzyvrm1Le5K4ii2kIKpJpJiGHZs8Qy3tJ9H6D8pgB
         QGOtTVaYeezVv3kvkJOhxM9IY7Irj/jcbkBg5Xmdyq7pGzTzobQNlGNELW+28Ccg7226
         6E+UjfotlV6m/2ZYTQBJ/i4CpSyyP98nv1D7EGXEafBxmXD5x6po/22aOnisMmfchOoS
         6WQclGa9SPAARrSd3u3SVEONBBN8fIiHk9gFDahR8ZNmdsLRQ/45GIL+kiIUP8nji0XI
         qkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391337; x=1714996137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=EKcW/DWAaAy1nIYOUNh99gJMCbwZZ/+wJpOW3J1iqDMQaNEByznGSAYgTpr6mFXagV
         Nm/3WjJl+bEB42l8uYilpJQAE6MuQyQK4y6SfzTiiosGGeIYEZbdAnLS1WktScXBkRtS
         rDgKpUVmRogYcdmcnGa6KubO3O2vChEmdr23ZptdRAiwLJBT1m71QpDS5Lcnf8jBbMM8
         Qubn2OgKoafj2z5CI9PE+iZToPy9Dj4dl63Lea43458AtqRmbh9MwT9mxDzHrhzKJpqP
         +AksdTt8/pMzkUMxLp1TF3TcBr/xRA96Q0SPoooy/8bxlfHQuBDekEKiG1KuRlKlTen7
         exxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvBnJMnczH/RIxTICMjBJ2VAmXT7Ohx/q3dfxGs3GO4MWe8OngIhZCg8ntoxJOo0gSa4Pt+n98mCpcXJDiqK/NWbaHlGR/W+28F9kLjQ==
X-Gm-Message-State: AOJu0YyqIOU8oQCx/DQglypFJncEPf+N2NsvSMGSF6sCXqITb0ETv4rx
	u8+0JVmTfQhbAdSKu0cPPyT+p409N/46AJNj18v6qPOZZpD0KH2Mem+hBB7lZG0=
X-Google-Smtp-Source: AGHT+IFMulAQp2dFZ0Q7CZL4pR5DvDvO/9NEVxfbIybQWLY3FZZ5OUXvmdGImHkWL/GlP/fLlPTrQA==
X-Received: by 2002:a50:99c7:0:b0:572:3f41:25aa with SMTP id n7-20020a5099c7000000b005723f4125aamr8735212edb.11.1714391336676;
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Date: Mon, 29 Apr 2024 13:48:45 +0200
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2JL2YC/x3MQQqDQAwAwK9Izg1sFwXrV8RDyMaaQ7OSFFsQ/
 96lx7nMCSGuEjB1J7gcGlqt4X7rgDeyp6CWZsgp96nPDzSkqIxcLd4YVnDnF27k5UMuuCYaqMg
 4DkzQjt1l1e//n5fr+gFMAIkPbwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8hlbxDVsli5Uho2Dc9zk1d5MLlzWuHE+5PgzBXH717k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kgxXlqNnnMKJpg2EaIkw0QWwus3XmTLMuWB
 hWfdwwddXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIAAKCRDBN2bmhouD
 14MsD/4wk/fFPGuo07Tc6t4ZBVVny/yf56kqMyV3UPs7GTN7fgENz4Vs5Gin8llVwv9nvvbIrfh
 cBrBJ53HMb7tMNtKDhoCjXLKV6y/XFF3OcjnUu8dFKF9+HWsntLk2pUa7XZf/m3xuCoFz+I2+2X
 FtEvt7tK7J1L1CbOP082IC4ZkhfTVvhN7VjqiC1AcntknqAwCKb5II6RAtl044X2cAgHBFXI7B1
 Qo/+a8PGKa0K0uBnIoHoNp75nHACjabA/jn601auP/o6zvNEBbjmG/1jviOgBIo6/+12fvjPqxx
 E9EcND0vFAI4b2W8IiR2Xg4uWuTtkzGOQ8gVmSQMUY/Xqhgulo8rrUYpnIV5JlSObZpNZstIdHZ
 3di//AnjPfGRIgVC0kO6jiOPGtCi/WnZe8zyg1tkArBgsmXLIXbuACRbR90yWnYeWGk0Ny8w76f
 T0pJ7kVVgxhVy84se9GzdxXC3V4bBs8KB0UmtCrmfQTKLG/ZcYUIptvLIejPfxSNAnOYcSN4XMu
 DF8BifoTInlQ+Xw9QYLBMmT5zOa2kXfIiS04T/C0Z55+ur3NPpX35/hwD93URXyFfrBLnClmjbo
 PHSEi6tWOFhgJAg8kZWEuqJOx4/8mOJxKL+LiIkCVek5bgHt7OxbuIiY10JdZB1Gy6BujtRGdnc
 RzHz8OsHOxt8zBQ==
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

No dependencies.

Static 'struct snd_pcm_hardware' is not modified by few drivers and its
copy is passed to the core, so it can be made const for increased code
safety.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: qcom: Constify static snd_pcm_hardware
      ASoC: fsl: Constify static snd_pcm_hardware
      ASoC: meson: Constify static snd_pcm_hardware
      ASoC: uniphier: Constify static snd_pcm_hardware

 sound/soc/fsl/imx-pcm-rpmsg.c    | 2 +-
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 sound/soc/uniphier/aio-dma.c     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: ebbaba914053d8bcadd7d64eb8d2555299509a27
change-id: 20240429-n-asoc-const-snd-pcm-hardware-f0a5ade885ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

