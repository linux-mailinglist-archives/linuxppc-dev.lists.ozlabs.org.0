Return-Path: <linuxppc-dev+bounces-8985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31793AC71D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jQ3J7hz2xlK;
	Thu, 29 May 2025 06:00:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462426;
	cv=none; b=kLSKt0FlosJrmS9Vl4J4ot21UDLzrBPJFCFxuGMkUxt7cHm2IF85Z2LuhaVdrnRWc2OMhdgJURr3WXKxZTIYWP4enDG/IUJlcGggFrRDPdo/RmG+rJCFMexZ9aBpFOjOL5mFe0wckQbeNal8jmz4pcJqtMAgrxQv5ljV1w4pWo6ebPlKpf+JH8iMk5P1pQbqEcXB9vg3uh23w/xQ9ZQQavswXwAKZebDQuU/Hq3HUr8ANvhR7NLIsgzHFgtRdAaDh67aPfONmGkxqnhqWlTEKNg04RFVKVRXfVUElnb+FfWhswjwjfONrwY2VERjadQm4KbXjwKyPgTPF19wI8mZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462426; c=relaxed/relaxed;
	bh=UKLxvsv39RxRJwsXICazlS7Jk7LfOfN7XFHnOLZsSTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N742UjxGdiDmjNhkwXy2E2Oc2TuvF4i7vPZQL+5epcjxxcYP2EPbikJkqOsFlKerDIZW4RfInv0kGo7auXjG3WHyVoG8SSuB1nnO5OkZsbvvk9OyeToTIkX/cEdhAdZeTuD1RQABrW+TfcxHPLxKapoMupYFeSCldX76PHMZOAHlIzyDhVzL8DhMO72bP9e6dnUmZx7+iXRVvkSd9H2aVtO7cX6WzrRh5Va+ibWOIdPxtofL898nPjAZj0Nj2hLu5v6mJJQAVmexhu3eV/qI0TCJql2P0HurjCK9dld95FrH7EM4opIs/1LbdFAlwWrvd4BuYzUAOr8jnt2KUO0+3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yhI5gk9I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yhI5gk9I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jP430qz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:25 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so30438f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462422; x=1749067222; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKLxvsv39RxRJwsXICazlS7Jk7LfOfN7XFHnOLZsSTY=;
        b=yhI5gk9IkzjVUVvZzZKobwVF0cRspMBhUMvMQ69hPrjmkucui0mqc4qScMJJ+OZNDn
         NjbhpKcCUi6I4x6ed/maSwoqqCoX+qY+y83wa75ChL8iIwraFY5wYrYPCOE8ebKtN5bX
         Lj1sIs4UuR6qtHwycQ+FMeH9ysoQjeIOdYILgpAeyyBTi8+Pq+qWTLRzQnSjThmGxcP4
         gSkD9YykElF6t7XGdsbXCyWDSKoEb6wKxxgNvEmS2CItyn9eedOTAYj7j+APvnNdMJz0
         fxFFWPp3lvl6T5XhvrMCjCUI7UNmkjDcV4VbYi1tKYmw2PmkJCUv9YGYpudALlvaPKZf
         G45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462422; x=1749067222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKLxvsv39RxRJwsXICazlS7Jk7LfOfN7XFHnOLZsSTY=;
        b=cOocJjt7LvNwRpfzM7hM9mZdWECmXGdY8qzqPqVGCpC6EC3q6ZmrFnCI76dKrygAGN
         LzrlFqvcgHsSXe7oO+2/sGYzkGcHVsWEkiYYW7GzLMXV4HQDtfUpUyATz4nIR0ZiDXM5
         0vnz684qXmu5ZW1CCDG+UomLUFHYSKn1xBEHpZ88n12Cwu0SUF9kWpbxEUnCu8DxW4SA
         Aj493sp2hUO71hgg8vs9BZKIUoAqQI18XQmCIhcBT/BXURu0o8T5+6PeB1IT0v0+qC3H
         8QGw0X13xlZuJkAL+9e/ii4lSJloXTy9/6VXyfDsRK8MCkSFyQ9rPS69cfD9V6zWh66g
         tRKg==
X-Forwarded-Encrypted: i=1; AJvYcCWccYlAN5/dPadDPdNtO8Cn1IJALv9fVZ+P3iwU1fnr+BtG+20Ojw3iy0pye9zAhG+kb5LRia2FMqyHX+M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkFtDgCjugEPzaH/cgR0yFoShf8tDZ/DSPpwNmqwPjvZUZdqvZ
	J61QCB8DXF5r7nHrxmLLJKOv5xy1dLufQ1t/5MLt9HfuIrgeEW1grmfA/xj901EpHik=
X-Gm-Gg: ASbGncs+7WZFKr3PKgnqfhXnAMGZ27sB4p5uOnRRz+WlmW+g1lxDs9fZnaeg9hjw023
	W+BpstxZxDTXyhb8v695FJMOcFDHYnfujd/xI1xMo2keHzi3peOnQhFhcXsZRapF5IbpDyU3sLO
	31QIRm5aLitnG8eb9b5K66ERpmzlbn5YBKstryH3NmDoESdZpKe2hICFEr/zZP8GA1Vc3N6ZD4y
	60M3CO5XcaWHRGEtCjLiRJ9Fcijb5V2G1eKv3gqThfB00XlyQNsg/j2zuSsWNsJDEU9W9QiESMD
	N+qIkoXykauKE0UKuq+jdF6d3QUa1w/OzEH41FKPXhigwaOi1QdlmMRZ+2dcV95TDzp3MHhS4zB
	7BjFXhg==
X-Google-Smtp-Source: AGHT+IGJ3sSfYBTi3fPzjAN4VbtvolMgUW9qvhXd5IMVHnaBWBDNY4Nx1ZMx26UcQkDgBz2hyRa/zA==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr58577005e9.1.1748462422502;
        Wed, 28 May 2025 13:00:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 22:00:02 +0200
Subject: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
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
Message-Id: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5DA+AqsUHtlrpCLr53RVEPhkKk3E6BWf3tgkSlGM9po=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tDrfib95CIYvZk4xi7M3DrBPE5m3VnGlzkN
 aW+v+MbM4yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQwAKCRDBN2bmhouD
 15GKD/9fKywTDMjSHUBEwvsrMSYZ7PJx1H3Kx5RNb5MUtSG25meDZbWaHgDfMYrAPGpDsrgrtFR
 SGnr2WIOUdS4bx+SOU06YlLibFXpT+Uomolo2M9qHd7FLc9eJoh1VJ51hjHFznCbfpvEHAA7Fd+
 S44waPs6dgPrXRiTebK6adQOIYTf0kbBpNxkpwzdU6qNpSXeDzoDhbBYEI6bVp7ACElErAPg+NV
 HVY1qU+6PYUr2qVy1oTqiRvJoJ+4XQkSRNTLJArUdzXCN0gVU12dVuWu8n02ktCTobOjY1HflB7
 N39K6tqGL+Yu3tuQjuBjiF0asayZYqxOU70Zvz4Uj/82wQ3+yPqLWofZZr5nBf4S+eH7A+nUcLn
 wKuSW0AARL4MBdUQMBsByDZ+1583R5ti1ZzC5jcqWsyd/WUpPz1drs0CH4u9lcIQB6ZrWhQWIzW
 YoOULhkd7QttJe6kqE7XG2yq13z01RP7ONPPWtgJdlBtic1UKttSPbvib5iqZfIiOL0qhzYmcRA
 hLLlgRGEGM+6gL4ZMIpaAhypFVgKfBeyC5YlrjiUEy9y+aDSJTcOmrtR9SSI3JrzAB4lg1AQ2bu
 +t0xvzD0BCNsmMcuB6x3ZWOGTergECuyHVgmIaHVU8ZxvHTWUfHLsqEnc1foLwqqtXekUF4SY7C
 YLds3m08OwHgHMA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -190,10 +190,8 @@ struct wcd939x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD939X_MAX_MICBIAS];
 	s32 pullup_ref[WCD939X_MAX_MICBIAS];

-- 
2.45.2


