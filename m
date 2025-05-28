Return-Path: <linuxppc-dev+bounces-8982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83794AC71D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jH5YGhz2yTK;
	Thu, 29 May 2025 06:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462419;
	cv=none; b=X2JiS/Phd6MLYBhqSdKb7hrN7P5LNGRqCyTGsLp3+S0veuh2URVJgEmY3cSrYfeI+Y/atlqVz4Eu6C4dbtAYFLhHdqJ5IcafrY4CjYp3I/ANQR26POtje4MCTksByEId1PeiQWmCAA+AMmoJ8QHR8B1hcaQ7OI+ln6U7eLZQiJ1ZFjJVJry+ZhkfaZHJw42NwgKtth0HfKB/c7IznroArt6vCqA6K3DqcKKxW8czUHuJgIkl3vykVk+ENf8jNxI31Pqa6qLu+RompyRo9+F/B4QfnxEw1pE4fzHk5qwHrTSsoqdCAGuviamb2mHtBXjd4fp7OvlehZSEqD9SCpGvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462419; c=relaxed/relaxed;
	bh=ZDDwbVrb+Lr3lW3ZnLKgMm/1vI4UvBgyIYgvCQObe8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VA5xnT9NtSqHHe2dsEdcYwvGZrNZg87p3Sw3xgimod8OdRbcZL3MBKLdhaqP0bLgiSqa5f1snRKjg8yzCLb3i/qh12YA5PUgwtb7ZDgZE9xq0ejWfCrBl+M3UX/ngP4fMkBXes/C+HmepMHEmEPZT3VI9FCFEvLrsWacPmnBezeLagpM5YZ+t5ZPvAqDSJoYPsyzO6pVwyOtsWE15kri6L9KltUZKkoN28rxGQ3JA7lr671UteB1y0XLU6dMAdf0do4xxZyxgUtzwOYqIxotsfV0UEn/O4Ou6mISFjs2GbkIiuawd4lflC2+nLSa1PIPBTeZND5gFeya8S7kcLMaMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L85XKAGC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L85XKAGC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jG55J8z2ydt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:18 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cc429478so202145e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462416; x=1749067216; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDDwbVrb+Lr3lW3ZnLKgMm/1vI4UvBgyIYgvCQObe8g=;
        b=L85XKAGCzATnIB+W3nTkPS2UAv/NZ9Qk/QjMjvkATCuvZKlefYYNFXb3uioJXEdCx7
         R4V/dEvuJwTSjgppm44UImahZFEhlwOu+ZghXOBQNNw3IY3ru/hkQPDI9PlZMhwJgPaw
         IF5+iyBz+pCCgH724kS27yI8WVsZvA9PK7/OL1cMQ9Qfao0gHxg0l8lsceC7aLA6GYNy
         4H+4WqGkHZeC0JHF9hrUQ6rHBgKQMVLPeyK3ATSWacM3HrVSezvqSZ1xx33zlPMxMPmS
         HhdMtsodRvS/Vd8gK0PDJoTb9Yy+RjpPocwxE1e+mTpGH7X3nryEtRFhrkK/dGsWpz2B
         R/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462416; x=1749067216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDDwbVrb+Lr3lW3ZnLKgMm/1vI4UvBgyIYgvCQObe8g=;
        b=Xo3PUNKleRvu8PzFHFJHhLP2QwgOX2wYkzByELgyCym9jU/acB3HIxwbLcYd6qNlyS
         oWrNUfy+QxZN5F3zraxXpY2oFX9EQSEdl9LPLz61GQHHyVjzaQgn7L0AxHaV/WyONDEi
         Slwj8aUpcS28K0AyLxdbVHmc2IiiOMzFOjWRpkBdijjxlZ+Qles15vS5V5BmBm+Kcouf
         MXa6kafA8BTRDxfgyrAwXVxXkGq+tPpVh/k+sRAgTeRnWOo6xTImeVrUzyL2xjeFFs0x
         TGXKhILpOZT8SR9s+Zov8myYOhBcSjYx58LQpk4H5QcWv1BKQzDGzhjm8IFk5Tv/iAfe
         8dLw==
X-Forwarded-Encrypted: i=1; AJvYcCVDfSKbw/nk2S0/0btTPpRuQBc4gJl5eQuesT3oFpnMCBY37oxE1uMhQCqHBkD8g9eAZ4suA8Q39cH+MOo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyny0O97XljlkpbEc5s4FvHuW/Jvh6UJm5SxONFiG9Sj8sEQf74
	U32Vjcd/NzMmFCdZTZA5rqv3H8/g3C2xLmQqs59IzcM12hb1XXZDUlwYmI2wsc4VYJs=
X-Gm-Gg: ASbGncvc4Tm05awVvERSrLNHrIZ2QjdDSGS2TEcW1PSxzbjgVvuYdRIo5dBxwHZxF2B
	xkhhhB+P1e0MI1IzlHgPfDgaparOdMqgU1hfw4SESYKv7yHGG9D/HkaJu601Fz1yys+mnn1xh9p
	4oKkOsiE6LqO4by7U9qvzlyWpXQAMJMViUgnkqA+w1GlqogfhMBtkM2lNqOxuWeXxCheUd5tY6R
	IWwvwF0XFYjIjYieutFxw2ZST9r023J6YMfMwcCQ5xIm2llVtuFsa+7zlvCcGxcS57N7FMAa6Sl
	1/aZnFDfGMdAA7+otL6MN+VvlPoofwp1v0xlzCFifqKzWY1n40ZD/UIQFO/y8zAc+DHe9EQ=
X-Google-Smtp-Source: AGHT+IEUp9P1Rdo95+j/qcn/d1qWkR9KlqEdDyLtA2WNzV3fonyT5InSDZh/G4WeFsVOslvd6Hfk+w==
X-Received: by 2002:a05:600c:4e8e:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-44c93caf3f6mr63270165e9.9.1748462415869;
        Wed, 28 May 2025 13:00:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:59 +0200
Subject: [PATCH 5/8] ASoC: codecs: wcd937x: Drop unused 'struct
 wcd937x_priv' fields
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lT1m78a5qGVOKbZAbB7diz61bVOOaiAaHoKCKGNWh50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tAX+wAD12p4wigYDY2/hz3QwOsbso9X89lR
 Ng5mcXQlruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQAAKCRDBN2bmhouD
 11AFD/9Si+7Fm+Q9EnVv70UQBi958XlJvg081OyT55YpIa1hxdhWjvtPv9J/Tye5eA3z4M6f6uH
 ne2XxAWlpsZ6axzmSaGie4ev6B8SA8VjFw+WJ9S+35z+X96cXo1U20WxWfFEYOpPuVPQ6JJuwEC
 j+SjJosdkFzjQmnk8vCjAa49kAcoj1JNwx/7UfGV6zqldKw5KoWcuPd/SQijswZYH322lHgAX4g
 tjQXn9iAiLMjbk6hJEir6vuX4KW2O0QyBSV57xXbG6WoLRU/wB7pQaazNbmscfplHfdky0k9f9H
 X+MhRxj7Qu9E7+Z7yaD2LMsY/NNpXCd5P9amcRD5H4qw+lgutinstXm2B0Sta+CRcNkZ41mME5/
 ZSJWzxzya2xMJLRzMNXbMNoA2RF+igv9pGmV58qc7vuvOBJpgRLP35kzauyyyBTTXH98KjMpN2S
 /h96NKtr8WlY1OQHyqo4ht122F7EbXOZaZUjnPIdJyw6QEkLZgjG4rDJhNfPQMPiub/hNA2t6j+
 c7UeNznq5hoiDPS6gZd+Xa5n7RI3iqp+xYLrhhxmINw3lC0XfkhcDg20CgFd9iUZH6NHD5FsG0D
 LFaUlKgXuxHXeK/uKHGbMlSiAvlqasEmdqAx9OswqTLn4b0k/dDqNPuftnlmU20Fikt6/UanITc
 a1ICln+E/ZwXwFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd937x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..126a29e0b3ff96c12fdaba2b9344a3040b455e44 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -88,10 +88,8 @@ struct wcd937x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD937X_MAX_MICBIAS];
 	s32 pullup_ref[WCD937X_MAX_MICBIAS];

-- 
2.45.2


