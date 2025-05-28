Return-Path: <linuxppc-dev+bounces-8983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1321AC71D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jK685Hz2ydt;
	Thu, 29 May 2025 06:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462421;
	cv=none; b=jqxjvW4zg8OiSbxc84JlYivKNCOIUzuJeumxj+2aWbmcJe0z1kvumWLHki9lN3Y6l6Tih3222HDYi9I6R75w5nkhr2xKcQGYzX2+2vcbNf5gFxAEZdC2VtrK0vJd/LWGK4Qe3vemZHGSoZA2M4nvj+phSNsQOQ3JI+z/AuUYycfYqjwMZZ7jnXNHRB41GbNYTIO2qFJcX0XME9QIqTGXLsMQticiyQalH3nO4dXvwSUBHt6dRH1Vw6WlQnJcopXq+KWzsIvKEDmNPO24p+M9wvkBdigJ60r+uiN3IzMRcKCjfscPRO6zxhidNt7NaUI//NH9r78I75bM5SGD7pDAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462421; c=relaxed/relaxed;
	bh=Ea3dEs9bTYxVxfpPjS7I2hituCqW83SA2oFlYXKAEAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwzwdzyR0W8Cn6W90vMZAMJvEwpXgh+vx8j6DZ/zD44e60pmOfSGIPtvm3FqpOHlr1pspMgJG+F8oW8aaOJdpJ0JcvT7vzQNUxIl0qcSHGMMmVKt5M9Sd/GPFZJ3mMXHc8o4KEd2430+jd0XUALvrHoumMWd4yL71FM+P3Fye9MR0VBk4WFg59ZcJ1ihyVUK+DES74uwPOyy+jobXfdmwtnbr+/d2ebPug/5gP/9EfsLAyJH4axQySLBOl46UaMKyF6h7oX/HXfwrRt6lYJ9me9oALdWQmc2JTbX5Xd/+H+/Vi6DKyQTt+w0lOYJcBprZ+DaXpY8waDqHUxN6c9xiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xH2Od5Wd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xH2Od5Wd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jJ6XNmz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:20 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so16366f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462418; x=1749067218; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea3dEs9bTYxVxfpPjS7I2hituCqW83SA2oFlYXKAEAg=;
        b=xH2Od5WdIn0ce2PHg5Xs0fd3w3DmIV3nBHJ8XYAC1CxMB/vvz45eyTjeXWZLWen9si
         Knvjas/ndMlAI06noznbI5rkhoYIbCzefzUmTmIQLuyBgVqzTE9FhbPVPfJGEpYpfWTI
         MpM5H8G6D2uht1ufdBc+j4kKkTs22wRUV4KVGfmmjiTGVXAsWoLLPISLCjXMeoZQuDUH
         oAeclmfVClQD/T5mifrOVqrPxW6ZilBjA3PaO9n10pwJzNIKFRM3TCCLbPdBHicYiHtU
         RxF61PliKmg2uP8VB7O5Ej3GIEXP1vPFOBEWB3hDYPAxqxCTIGc7/421pedZg/hes4Sw
         reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462418; x=1749067218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea3dEs9bTYxVxfpPjS7I2hituCqW83SA2oFlYXKAEAg=;
        b=gCEYmtWAsfCIXnJBKrHn0sAbqM8Jyggs+rATAm2mS4lUHtKxwEVVigFmxvIerpDjJn
         Yiyev9yBaxYydtRqnx/5UFGdCJVrEeDwowUW1/lFoI+A5EWvLqFxy5iOWliiWnJlRny/
         7qwFA2CAdJtkQ2J5H9+Rr5pPzNyoo+gWxQB2Sduy+MVPxwcrk6bL2LMEpRr5JHb8IEF4
         iM9UdmUAJEFofjJG8/3nlXCKXxfktfeSvxnXEq5YkGmjdxOAFYaei47trVvMNndbbbVB
         aSrA3x0er6oWHPoY8nguzCJ8klMCejx/R/kwNswVFKToViXaR49blOpvApjTrFeg314b
         S91Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdp4ddjhijbybEvwyOZD/zAWu9zqEZjl5FPzCCuv5PeaNBUwbtt95BvRsz7A2gZQDtyciNKHHO5eFamXM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVZdkFgdWx0lNmxL+pUrD4V+aaF50XfowYmGDl/w9ZcZ9FZDZR
	WeBMsR2ivsO7KburgAua9cylD/WV8lwrYk4+wPjF4tPKjuLwQTXwpdhLjDhfqtpjmYw=
X-Gm-Gg: ASbGncvdCXGots07KRv3gGlfpS7JAEjrxa5xNvXmgTbuZXu3V0twJ0b3rZH6Dswx+XB
	NVu1K/s5BG2frojha3tYyqueSR2LU9HltwKiYn9EPjeXwsZzuJbkCzy57QAPmJxF6582jcs7a/w
	Nwl6ET9F0v8MkSpQXrHi5DqD/eUcgxifG8gAxZS158EGcA2kicSJ4X88h+nzhXeRZjM44EHTykJ
	qTnV79GYT9SVvAOTUqRnop/rriYh2kqMEKCJ+VYYqq7HCxhzziSxD9q5uDhlSaWZ8jTQpah3wnt
	F9+lQZRYA9Lscic5HAv8WWn3m0qOaNWX6z5YyDVLl4Ixa0t/SQxKranjCH/hVlchj8hbaQU=
X-Google-Smtp-Source: AGHT+IFtclKo+09hBvWcaA31MANMniSSR3dkpZhR44JC9e8qX1d5fzwX6jzxBVXv3eOZIbMOIQHv7Q==
X-Received: by 2002:a05:600c:1ca3:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-44da83f6d0amr52288855e9.6.1748462418080;
        Wed, 28 May 2025 13:00:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 22:00:00 +0200
Subject: [PATCH 6/8] ASoC: codecs: wcd938x: Drop unused 'struct
 wcd938x_priv' fields
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
Message-Id: <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
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
 bh=Z3E6oDJPvDaUYacpuceMJjGq51yqfq9d1bcUwD94Ip0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tBcrZHChf8/ltrvvcWeilQUPKYCEoVAI3WF
 kFIF1ShmMOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQQAKCRDBN2bmhouD
 1wwZD/9BdU75kK7j0OCvqJCnr/wdNWfI5o0ONXRaXUHwVAJLqxX8XNjGRzJ/VWy368PSGuDEbvp
 FYmPomg3lI2VXO02pZgFsFlHf+XkHGdDjsFPfzJSTWKYpLqQhQlEOqOwjDex2Qz0AWlx82lyNd+
 Z8UP8Z7gg9wOk7ba0/YEcDRcrXNkrhFz6mpYk3U2RjRlfSCP2Zb7xee4Gp41ILpX+Kg1C5arNvY
 Ip5NrnqJUisJeNee4tk5sNH/sndo6iNngY4CBTZ/39Z0LaPNNSB9p9/quvh7kgHXFsH77hn6uoa
 6hF+g18EoEjxz/lP8+p69hyfJBKK2mitWDp9w33WMxxSfo8kSIlV+puRWzu0Ui9/LQEZboQB/nC
 eBXRcWXVtldTvxM9iHv31XirBezr1HFLPhXqx9RnxttVU/24GsGALDs1ypvK646ekz/UwnYBqUA
 jaeWQlr4d6wWHxWpyFis2jHH1SOeSXgZ/VwyFU6Mc7WEPsDb5k9odD/qNZh+cdEcrD6wEARB3l5
 FKDTfzwPaUxUSmOIqOPULOVbUSmDCYpwrtd/CeOjUJckSU9mmiLN+qUAuz4u3JGSw+p5cO008F7
 o1GG3E+avvMiP5RGreaGPOiiQfWdTWTZd2zKu7EJbUt1RCsc+HtSiKk4nZCEiG5edS9XKWgTFtJ
 kpChjEVikYq/O7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd938x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 342d1f7d5dee3ac2d703e5b5602aef9ca2987158..43347c14070ca6dd8035b0c290f0dacb0326122b 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -159,10 +159,8 @@ struct wcd938x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD938X_MAX_MICBIAS];
 	s32 pullup_ref[WCD938X_MAX_MICBIAS];

-- 
2.45.2


