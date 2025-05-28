Return-Path: <linuxppc-dev+bounces-8984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554FAC71D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:01:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jN5j6gz2yfT;
	Thu, 29 May 2025 06:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462424;
	cv=none; b=KOz7saacotpUo7MHcecdzYayIrgDmmkZ4sST4JvlYBsHa0/cfLB7ggww/D2SqaO+JUKSz1Ld32pI7BKQUmWCWQBEGCYSRkK0skhhAtRrgYuQcfl5s0AMM0bbV2S3xnwwuQuB5KLUHdt8oLTe5bX383YM+JV0d5VcLtrJa7A9Ljr7UfbexzCdQLDlfEcS/qNcjGNY+4ipjdm7Exqmgjwhwzoa1+ZkKcBqd1e3sVIr3w6AkOomi5Yv6ovUfRlVmjI2gDauGVPqnd1T0hUHWFb4nHIcWni0D+bdHqjZ+/ntPelwOi0x6PGcoJP5t128SaGbGd+aD25vNYNk4wAh1XupjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462424; c=relaxed/relaxed;
	bh=EhFsa53Dn3tZ/YQodrCRFl/D/vPq2gHvZA39y3H6S1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NY97Ap27kfbI1FYpnq1tUME2/FVBOLCQBpq1O08SIg0Y1r0B4PVxya47oSd7UhQ4EGp0gm8rNP4I4OcL9wXGhHWYa5NZwA9fcVGeu5K4A7ro+p75D8ct2K3Rfww/kThlhEY8Fx9wQIlt5Jsk1drERWhJ1RcWImul1hapWnuKolnsge3oSO2BqKafpo1ppwtIU9cfi3+EzrInAlx65y59IqZqPdMWHodc+OdDmeASfQdvbhbzil6G4U5/qi6x3OmMVh04HfDGzEP9k8uIuKGwdPPDLEbWcNRScE45sh0np7isK/mVHpuNIO6HgYPuDD1GpI8iWZDokO1RlYF+sJ4hAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hekdZvsL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hekdZvsL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jM5KRLz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:23 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so84115e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462421; x=1749067221; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhFsa53Dn3tZ/YQodrCRFl/D/vPq2gHvZA39y3H6S1o=;
        b=hekdZvsL2u9vH+aRVC5tnRdaZnmCrirW8obAr7cx4iHztFnEMcF9b1xhxoIg3Wm1yA
         JYogViBTWypPgdowU56uxG9vfJcYkUIwRNLkbEJUl0QWcbxu8SF8RsnhgoqSRpYn2tQU
         Es9XjOufQPO1F7bOnwrxligWaXdA+6GHGgXbHlkPLMhTGtCZoGbuHavCHKYEFFzuoN+S
         +H38PBWjFfbhxch6OvXJRJ9Pw78kfkoofPVifLg0fVCErpL0i9gzNOhWlRhV7MwZgDuM
         qiyGXPAAQlTbz8wyCWttQUflzLaVlbztsdHtZCUOAprBSDi4NjmEomJ+zf2QRGk02x5Z
         DMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462421; x=1749067221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhFsa53Dn3tZ/YQodrCRFl/D/vPq2gHvZA39y3H6S1o=;
        b=isu3bXLt92IbwEckMzyE+UMzJMWTQQnDwLr6W9BMfCloUBJHOXGDXq0Hn/k6uhurhl
         ccYKsbDq6mC7K7dChTMfP+VWz7kwGj4czChWcrm+00pj1PZo1ouUSOcNSStcXk9kXrHa
         KBp9yGZk49JJi8g3VVVnfSXjJJ/ahFld6EhIUv2/oCR6aiDFVH0P1a7kE1ixjSeOITiI
         KyWBYtzAuLnAVD7oNrJclDbsob4qwDNo47Ulo225AlqzFlVSl1f1lZl3/nWVspSinhvt
         FSUgvbHkk9UptPcALQO05CzRpgVEu4P8RZ73f2HLYvRTCYfYKmiRhFV9UcxU4GqKJ5s7
         rLUg==
X-Forwarded-Encrypted: i=1; AJvYcCV4vCMbPIfXeLQhGuq6Bn2lTnEBBEShbN8ZuACQC1agIUEiC3WfKgGxeo/LfibXjt38VU0cO0Gn3HeqJ1I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrofgXCDWFLPfsbe5KsTmJiM15MH/q13rXoRJiHVG8z2oUbS/+
	OMegJSSbM9faMRmVsjmTgL0sEyvDf6mUpxSYt0Z+gPxp8+XTtGBP3sxWMbMvYBTuldc=
X-Gm-Gg: ASbGnctCPL5gsdQ7DaPAkBs9aNVDChZeB0F7roLtjV6G48MapLZv46u0ET3HAg23p4S
	iYapa/QsaObFGia2Dzwu2s1CPTKiDN5o1BggxwkV3BIKcZjj3S/DBxb+gOenAiIfV66F6EjnIX6
	dEZY5auX5zcaiMmUNyOZAmUt+1z76RjMtKX2qpazuV+YpojKQb1UzxeFtygWmpRhdhMRninNvy9
	9qOLpbSn2dg/AaQl6Kzo1z39ZPw4k9k81apsHW8Gs1qu3fPBzgt01EHnIFKVIuXqbPRf7ZTycg1
	cIidnwWWHx0ypofyyFoBfUh/RvMUhSI7KMM6bu7W3E6t5zT15A/hmeEkkY0YyEfl/0XLIhA=
X-Google-Smtp-Source: AGHT+IFgK2K2RWnYXZ98CP7PqDkbOJ7HD/Q61UfK0JTIS6/x1cpTvbtFdyCFL4yZitYpbOagT+DMiA==
X-Received: by 2002:a05:600c:3b99:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-44ff4071f7dmr15017665e9.4.1748462420725;
        Wed, 28 May 2025 13:00:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 22:00:01 +0200
Subject: [PATCH 7/8] ASoC: codecs: wcd938x: Drop unused variant field
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
Message-Id: <20250528-asoc-const-unused-v1-7-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vpHnKSsMPwOT5apYVShhmLQTAWNAh/9Zf7Yg24ClShA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tCjfNAV+kCU10X2cqnxwpT+fWymWyuVDFrl
 /mM6y3R76iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQgAKCRDBN2bmhouD
 17OSD/9sy1aTm6SlmWbrKPTB24a9SyULGvFc6f8kqmmjgsEgGsx7bS2Sshyxn55QGKOe0ABB2oK
 kx0dUHpTHoxUnYz1QLaAVl9uHNHNkZkvFx9YfpJkVSJy1O5nK83aqEunkX9blBQ0c1vnFegsPuk
 3oygNoAGFieGEpTLsGsHEndt5D+uRBdqWTqwi+BNSom8HvfFN5z21tmO0lRi0dva7fiGwRuED/S
 Fdx+hpru1FRbJcBAUcnycfOdK3Etc3XAw6gX1gYsERZFT3K2llZoggkubN/jbC9AkDEYYsTHJxo
 WwxIT5bD18zwQkirmjAeP4oYZ7bUKxsW8VllKXlpNrvsvqEJ+mubb0RuYO1OyeXyphex198W4GH
 87yClKM7xjncSPQsTvhavYxQMaNZui6lcQX6Ri8YAuUoIKQns+c7AG5OldMjoKgZC/RnEELjIoP
 UXc6AeQxYyp56GOQ6tna7ra+FoutpkwAXNX80pvSYaygp2Ca2Ol5Zr7y+IKdWXcO0uQdk8HZDjP
 GNnvMh0p7TgTTtxYkn0SO015It+ceZYz91KYO1j9glfiZWOBFnaooLovnMMWvKD9a6hJsLjHeaL
 kmTfNTMgyZWy1hVL4iQ/+vmk6wG33yxjLIUjyLikKYV12gIehXJEahkLId6eIxy7ozrsP9sExAG
 Jpwt+bKhJF86kUw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Member wcd938x_priv.variant is assigned in probe() function and used
immediately thereafter, thus it can be just a local variable for less
variables stored in 'struct wcd938x_priv' device-wide state.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 43347c14070ca6dd8035b0c290f0dacb0326122b..5a751056a98a5d4cc5716aafc25af27e3ab22786 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -168,7 +168,6 @@ struct wcd938x_priv {
 	u32 tx_mode[TX_ADC_MAX];
 	int flyback_cur_det_disable;
 	int ear_rx_path;
-	int variant;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *us_euro_gpio;
 	struct mux_control *us_euro_mux;
@@ -3044,6 +3043,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	struct sdw_slave *tx_sdw_dev = wcd938x->tx_sdw_dev;
 	struct device *dev = component->dev;
 	unsigned long time_left;
+	unsigned int variant;
 	int ret, i;
 
 	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
@@ -3059,9 +3059,9 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	wcd938x->variant = snd_soc_component_read_field(component,
-						 WCD938X_DIGITAL_EFUSE_REG_0,
-						 WCD938X_ID_MASK);
+	variant = snd_soc_component_read_field(component,
+					       WCD938X_DIGITAL_EFUSE_REG_0,
+					       WCD938X_ID_MASK);
 
 	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
 	if (IS_ERR(wcd938x->clsh_info)) {
@@ -3115,14 +3115,14 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
 	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
 
-	switch (wcd938x->variant) {
+	switch (variant) {
 	case WCD9380:
 		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
 					ARRAY_SIZE(wcd9380_snd_controls));
 		if (ret < 0) {
 			dev_err(component->dev,
 				"%s: Failed to add snd ctrls for variant: %d\n",
-				__func__, wcd938x->variant);
+				__func__, variant);
 			goto err_free_aux_pdm_wd_int;
 		}
 		break;
@@ -3132,7 +3132,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 		if (ret < 0) {
 			dev_err(component->dev,
 				"%s: Failed to add snd ctrls for variant: %d\n",
-				__func__, wcd938x->variant);
+				__func__, variant);
 			goto err_free_aux_pdm_wd_int;
 		}
 		break;

-- 
2.45.2


