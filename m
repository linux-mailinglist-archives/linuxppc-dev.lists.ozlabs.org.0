Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6448B5727
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:52:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JHD3Ws9R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VShXH5HVxz3vcm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:52:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JHD3Ws9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VShST1jHhz3d9g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:49:13 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso6525876a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391350; x=1714996150; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=JHD3Ws9RilPteuFawbM6/WxV1LaBQomQ4CEWMoj3tQux8WkhB4gM7up99ikuQuXfT/
         ZqM18Xv8C4izbrJvJkiPy5R8PV2TY270cnKuc/Nkv5IAhW5bLHIHUfL9arf12cUayf30
         lh43gAFyk6chTVycHuzRckrMgMHXhgFxPAj7kfax9HsPOTi+paYHf7sAm/w5fz+kchDG
         h5I0cGep+jX348xlvBd02Hdt7yL1Lop2em/m+fe2gYjU0HtRyPUYMgU9mGeswNwfidic
         2aBGb4Qw4L1jJVT6/JONp6ek89e2J1M7CN+8uWuJal2VXTQVGEmcEBClcXTiuyUxyTfu
         5dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391350; x=1714996150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=SvkU0VSJPzOAEisMu9kONnp1QCMGSibPrzNNTe2DiFzAiBLGa+9RGcvIzKRslH+lbr
         opo/Cia9/0peo9qTfMVR0F6kDcqHxP7r4PmXV2k40sVvdTfZM9wl9a3DmAC8iCjtGExB
         7mH8nmiF4jUDb+HAaMei87j1YeQder820Acjra3+mJWJmNBaXTkIsuYbwo5osQi5h+O2
         TN/+Ewh7A5yC37BzlryqzWNyJe6iCGxGIG9jdE4y0vMMf5zitX3yyIddeN3HMFC0q2xc
         SLo1OTG+HGQY8baEvBze79juosLALNBYdfCxq3MDoccNmdUEEfAoXGo7ejn7sSh/9afs
         vfDw==
X-Forwarded-Encrypted: i=1; AJvYcCVPXE/CzgulRIYfSknYUoenI2AD6QiR6pHu/TY5DdfBu3bRd1C10vDm+XjyTTFKxKyDOqe0yBFz0V94MRVL4gkhX+VtvwPqo1Bh9QZI1w==
X-Gm-Message-State: AOJu0YxLev+JmAIBT32wBBT3eEec4lxTBhZKglNeE43SgoYjka4YnFxp
	jRodBgwOqSnlbpDA1FBiwmUcw1caW0jDy2jWgDWv0RbL4a8XcoaTZX6VfunKneM=
X-Google-Smtp-Source: AGHT+IG+PpPYt5gJrRGC1b559rFwqcY02Y7afPcoTHrR3gteiPesqjrrRq6V/qr9zfo7soqjuK3G8Q==
X-Received: by 2002:a50:8ac7:0:b0:56e:2452:f867 with SMTP id k7-20020a508ac7000000b0056e2452f867mr4484403edk.37.1714391349889;
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:49 +0200
Subject: [PATCH 4/4] ASoC: uniphier: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-4-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4km9txiF1WGA7UWw3CfsFA6VB2MZtNJU+MOU
 FKjqCQu/4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJgAKCRDBN2bmhouD
 16ccD/9l4cVT56DbQ4s528ydZBWtzc/oqXGu1ZQbNITz14ONADT4bPlxkanL2O0tMltrVTrFj8N
 yCn7wufeyWdt6hobAeT2jnVzkG4kPP2xuFUJiw0pKpgPViDQYQQvypq31/wxF5wzMSJkrW/UClZ
 bBWRtRqsGDuBrUvJ+KQT4y0YzBjxTyieyo0MR2V6ctFh3XKFCW31u2lJSH7xSxiRcyZCeFVyLlC
 I3C0yBX1ofQrBohBO/sGp1xIkY542Vyyb0oYn2HCEiuCgP+2aJz9Uzd5nzG2D8ifsfCZDe1W2fJ
 BBo+ylftctAuKNbBXptE6DiZ/sueGCmNlIOLx1y4jtFbODWgFIG3M8WIB4tB3LimjuI00JTUfdJ
 EXptaN0tyS1nlKORVjO5N2bDN4aaRB+nVEKlcVvOlSMWicMUHepZnzKDP34A+zXPSaKHDyLHiE6
 IaPAkr6rUUVwEK/bI6iC/VKCp4A9TaeQKOmbab41FPXLFr7kS8Vy1KNyrpgxyPSRSQsSD4KjYPp
 4RUTHpCPh8X6nbbbHv2nUUnpwFIGATLbI2x8gsubcs13KPkg57nn3JNnaNhEcr88Vl/3vU652O5
 7AbhSRpcdk7w/Zb9QhAm45Osql//C85WJu45trFQ7Ntpn15eubGiD1sld2555lrF+y4UGAHWksS
 xblzapxOFjAtX0g==
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
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index fe272befd967..265d61723e99 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -14,7 +14,7 @@
 
 #include "aio.h"
 
-static struct snd_pcm_hardware uniphier_aiodma_hw = {
+static const struct snd_pcm_hardware uniphier_aiodma_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED,

-- 
2.43.0

