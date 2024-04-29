Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C48B5724
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 13:51:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4tNRZ2N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VShVk5Y9gz3vgl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 21:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4tNRZ2N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VShSQ2Fkwz3d8X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 21:49:10 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-572250b7704so4441702a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391346; x=1714996146; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=T4tNRZ2NN3XJYRGJnT1aJ77p54Ko74171Dz2Lk5Gf0+OvqSmh8qRFjH3fOVtiZVYbe
         ksJB1/F+YWuQyXtFoUoOxg7Ef047YpsOuQ+LUse1LhUgeBUpjxYAjy9KA8FxWDSSwB6h
         Cg8S0Wm8RJN0nGZDQVKgNmtVimeafBzOltiN3AhrtMcQhXIaSmBwMFZ9vDP00FRexTG2
         aLNagf6rRsDOzV/Q3Do8YFOM5W72Ulvb2a/W+VtRYqhH0LHK0sCnaacVPNn53ox5+XfJ
         hk9vRuG1b3DqvVkvb3umZPPbT6i4NXlnC+HDltd9pkBhl8VrmnwxWZvZlmkVizK3IdDH
         rjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391346; x=1714996146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=U6L+szA7++nV8lpXbJs27hPAkzDQkMNLuCfOIqftquap/HgQj7nQcF7+dOW8HzmtUS
         9qbQZiVFrlssI7qQhbOgkldQCTug4SeHF/Pr6O0100rLyUCQ4Lt9RSBMZByuI9F9c5Wp
         Mu+cKWuiAyr2zLGOfyGiyQtvggfk8v6KZvet6zKwidpf+3hhH8QYHnZ9+eMj8gFWiMKM
         ECraXVZqueiXq+lQfHOUbYl2rZlmvlcT6LeHlb5aOUtjTF7wSbcU7UxOCE71XyFehoQU
         9ujTQjwUJuxEfRrrCJ32owasB2SfXAWBN43zCimVmqVpQS8qaNfCHP45p6MYRP0ElUfU
         7+iA==
X-Forwarded-Encrypted: i=1; AJvYcCXx06adNrf4hpfN3339l0OILxfVOOCPH8drmQwoEaOPbwBpGo5nZPzHseVC7CPnzEgN58zbL1JXdTtBrU4iheZZ2m8yAL9PLfuim+Hyuw==
X-Gm-Message-State: AOJu0YwN7hwsf+z/HFJIzqXfQUUVkiBuabcGf5zMC/mJ8Nak5y88hVmI
	T5R+B+n1HxM1JvOmEttojoUdvztnBDHwn+KbNy8nbjKS6Z+JA9A91KNoD7tJUr2tSO/AERGZMEz
	d5Ug=
X-Google-Smtp-Source: AGHT+IEcZNlFMX0KN5Zv3Mt9V9vUg/Vy8Fa9KRdDd7Hab4D4q7tKY2rb228nXG1TnPQpT2jd9cvgNw==
X-Received: by 2002:a05:6402:3487:b0:572:689f:638a with SMTP id v7-20020a056402348700b00572689f638amr4800369edc.17.1714391346466;
        Mon, 29 Apr 2024 04:49:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:47 +0200
Subject: [PATCH 2/4] ASoC: fsl: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-2-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=07XNlzH+Om30NPL+5RgZatpoAnoy8SZw09iGVLs1Juw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kklslopCBSQVS24U7RLVNAErQ+RmdZW+cnY
 2vP6DhzCt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJAAKCRDBN2bmhouD
 1/OhD/9OuP5DVUEzlKoiXyRfzWiPWETGaurZlgqXePCKIhR7Aw4zgQNkrl7olw7V0PXD3AG+lxB
 kQuxk8MGNdzM5gRQ5QvitxieqGs7Q6wB65JF4E6nljMW38QLNdX8xK+9AWe99iF6Y3Ljii/Sa9d
 QmF2lRiKOifVy5b84Ro2jZFhzL2IRk6zPR+kAAkHQmlxNfAqjGJWJwRF/XQG2azeaVobrL7Z69t
 Wjv6ACChJ4RMAH1iMe6Rm9khR3AByTKQSi6OEgO9pC8lsiGxjucEMfRmQ+naf/VSjjcVdBfgaaG
 Q8eTW2nPWJFZoF4tuDX++42H/5gf4cMxpgTQ4b4rRU4czeBYwRLBULJOjAWCXps0jxBBniD35Rw
 aYXsnzH27A4T1myauv8wnF55tdbunLfRlYFeXh2/vGe09r8v1gY0ZsmXKw0A+GE7Q7UHYzTHU3c
 0iOiLeTEzwX5sjIlF7NAhYxIhvDLWQdOBOeRioCCqUk2retxoDCP7ytx55nRYTFY7Y7/PQlmLy/
 D0KFHsf7XdM7Q+FzJePSXI+QPgtGwuWIP5LkO7YQ2YwmQwUyNc00Iwo9H+JnB1acl7IU0c/nC/a
 y2Q3MIQjM8Gocdd/6jN78rhB/DEqkZppZX1UMVkC88/l0ZD2sNPIV0++IJ5qJ4rRR3c4oGObRaJ
 TcPObSVlxia1CEQ==
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
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..128728b65a3a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -16,7 +16,7 @@
 #include "fsl_rpmsg.h"
 #include "imx-pcm-rpmsg.h"
 
-static struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
+static const struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |

-- 
2.43.0

