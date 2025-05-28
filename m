Return-Path: <linuxppc-dev+bounces-8980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70140AC71D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jF3Zwxz2yZN;
	Thu, 29 May 2025 06:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462417;
	cv=none; b=W6wIdRzDioIiNOFyuSEL8VlH4nLte0o3kEr7tkEmaftiykmimxnc6wh2iwtdZBFGzy+3QttnKpuza9n0ng26vteLN7A5IqpZB/RghKGMBVGz/WOUQgaP4amfw/YIVLv+fJ74SgiUdbiF33YHIXrEnDkJRFiutTF7jdHKSqgDY/dGS0ixq6/oKljOkda8krC+zBQYnKtipwzOpOVxafdON72xT2TQkmnNFEqvZo1TCuo0824C4nYK9A8qLFF1bxOxZscRhmVFVFsPCXksj5HWvoXPnT0130HgKwInWVb8VGSt0nDT7/NljvDj9FksPGqOnz4mN4TUp3flFa+1zc5zTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462417; c=relaxed/relaxed;
	bh=b7yDCQi4rHSCnETU9ud9r++MJrTNq+R9cHXXFxzlNlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqbCWNfg6kOmUgIhqT198ttChLBPoyOHUTsTG/h14+bS9bYwBx+GjG+G7U1XRqsRTR//e9JE2IJTec4U+dxRGJg5qOAlJ5igXXesOBrlGgDWdWKI8uoM9d9Kh/xQY4E0j3zES9HV04/RWmWXTtgJM51xiLGZMesj8AIv2swWlGIWszuV/6uTnzvav/2avlsAmm05lcxFfmBDzku2ItlOZllMqAdpsQNvUK6jBac+U1ZlW3Dck+nscsNP9gS8JDaKG1Omg7eHuH8TL4hDiCIPuJM7tY64+fhHxlf9zd90ALD5nHT6L0tK2IVTSKJ6nBhuERXCOWtlLpFntpM0YkJ0vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4xMKBBI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4xMKBBI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jC5cNjz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:15 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so25930f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462412; x=1749067212; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7yDCQi4rHSCnETU9ud9r++MJrTNq+R9cHXXFxzlNlc=;
        b=T4xMKBBIt3XomxaPTBsEPn9nciakLeCt3iJ1mLVoWeU7v3i8WNNVZFlIdgp0zNvaCJ
         GmYAtTsguxuuaafmOqX73HWK7B8DQA02oq3uP0JF/duIP7kV1s791tpXg8/RYwe7FYA/
         Cr0LU9KVgvXyGCdsdJ+F5xnOiI0Y6QHu+U5Prhb73JchGXuleETLaCT2jc9w9r1vdSXb
         HpsbCGT54m+rfcqZOE5NvwU5Xji/pf0ngo7FCko55Z5Of7gEpiAhA7Pj0UC9x/cp7m3T
         E6rQ5fSO7IlbMDddyn2Qv0jN6wWN4iAy1+v/7S3JPJNIRdezIPWbz9nVWl2DP75B2zG6
         zGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462412; x=1749067212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7yDCQi4rHSCnETU9ud9r++MJrTNq+R9cHXXFxzlNlc=;
        b=M8nXxNdlTYaDsV50h/dKR/0sInwq0mf0DsbpMXsqo1kNI+b081RXF3j5ysgSJyeINZ
         yLMEjTUgnwzenijgMV3BpKz8rC4uOamizJkFZZgJiqhUzjznwUqzYiHbs8VDjrZXt1RO
         Ngp94UJ3K6kpsenyFVN70xDLfZV3kYwRkK8sYwI52TbUrz/dKOEJorLaPTtxK3gATeF1
         e16dQSTrh+3XHOffj1S0+53Gvg7f61V8GeMzbfESWTD+xGGC2n8YKKxkwtopNtopwvYE
         GiKiF/fOWxOpSzPWZH9eYR2xW2f36pIc86b6xUVz3YKZX4CG/Ph68FPJf/itj1Ble/Io
         gGXw==
X-Forwarded-Encrypted: i=1; AJvYcCW9oaVwBX25dJk+LZrh22Nyq2UqI/ZiNtJrxlXrWVUn+xmqTqR9TUsJH3puPZj/hAatS5tCnfBvl8cfkTk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLLnj9OzcN+7aVHjKzMrQdHiQNBOyCooCdWxf7zVlWPNJYfzHT
	bpJlEa2RiWiUyXrQ+hs0Z/4bQMTdqcwzUxikum+9315wk2Af9aDUdhflBir7Gam49DE=
X-Gm-Gg: ASbGncum07C86nGq5aa7p0oyKTPDFsPK6jlHYT7Xm2SZ6EYx4sUQltUeTBT69xG+iUj
	oOyPXj0Jqow9tDIHCF9dJQsBAH8+pcOiHUuXhVXepCQmWTFKv+36X87jxZPkkAzbqxHNRZivlUy
	JkEEH+TTNU337Q44QMBqrQmXt/Vy+srgWhZuDL4rxTNdOinBf/QpESfY9khH2xHCLI0EVuIe1wB
	ZlGuliPFcfUZ6NdhxdWnT2dxTCHcTkPulZnuNBAoju4X7McVNuaEvBq9JWjc25ZJXehw4EAIFY0
	+pJJlCfQeyAx3ENgvaPr29JKJ0l/6skgeqiCdL3KuoM4ASIy8gWdprFXhK/ozn+z5h6X/C8=
X-Google-Smtp-Source: AGHT+IFQP0FibM1rqz/lOLHDDJIP46KUlhvU3MMzWhlSZjooZREosH5m2BiFsQxW10TootF1bWqdog==
X-Received: by 2002:a05:600c:4f0c:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-44ff407200bmr13873405e9.5.1748462412453;
        Wed, 28 May 2025 13:00:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:57 +0200
Subject: [PATCH 3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src
 field
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
Message-Id: <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0ZRY/+q+W8Hjs6RGmmOVXS/0Gcaj4yO/XRQKw0A/w7A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s/W7KGWelejUXL5jEOanL3Ib8Zn2ryY+42I
 viAZm3zT/uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPwAKCRDBN2bmhouD
 1w1mD/0TE/pr2WWpzbfzTZpzuf9Ihpzqt5a1AGUtL71i8JsTXwd7jut9/Gm0IH0nme0q1yGZ9dZ
 praHkDhRMtcT9pyzKbMwyz9ZqNFlKSJPWmGG0tA5kd+cSFAOUcqyIVknxv2katMudoqLAXi72XX
 VzqQrT4YVsoP95hFaKGCb0lOnpIiHu56DJKJvdGSPV8SOkVmh45MIILx6SgMXVWfJKnNKITmrsP
 iLTUF2HnE8S5rNM7WCdCxn87Tevk6EREKKWi2BXjLwMPjKYzHGm4sbITJuZ9/Ondk+CZIJGGk37
 I6U9dMaoCm9v5m3MNpIW9e+tLL3h1VIUrqfd/egIrkSkMGZZC+HWN8aL4rPPry604hZy4iIt2+/
 GoN1EA4gtuKpwN9/1fw/5baSiNgZSkW0b8HIXp/VN8XSAJ/Dy3DTv+8fT55ulerizsBTcpo9RC8
 vwIFOktKU74Op6kLo0q2t3TVsCf8YELIge+FEFKbAbORWdq8anQvYDdElWqDxh4JUtI3OzTLb8X
 jGt5qZZIMoNLTh896qRPaEDJKVnKFsjCOBdxXi59aSKFqEjVUjszRZx0ktaQa/xcUwvi0JKSR9i
 iSzmtn7L6KTu2Mh8MRgpkPdkbNSXRJQlMteUkQdPsCw3zshP3vKJjvovpudc7fz6o1mBNfGeA/W
 b6EdcUurjtIG3VQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Member wcd9335_codec.sido_input_src is not read anywhere after
assignment, so it can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 5e19e813748dfa0d065287494240007d60478dea..1c050b8c19de43cf494583d2c96f50f65aefe567 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -312,7 +312,6 @@ struct wcd9335_codec {
 	u32 num_rx_port;
 	u32 num_tx_port;
 
-	int sido_input_src;
 	enum wcd9335_sido_voltage sido_voltage;
 
 	struct wcd_slim_codec_dai_data dai[NUM_CODEC_DAIS];
@@ -4725,8 +4724,6 @@ static const struct snd_soc_dapm_widget wcd9335_dapm_widgets[] = {
 
 static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
 {
-	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
-
 	snd_soc_component_update_bits(component, WCD9335_ANA_RCO,
 					WCD9335_ANA_RCO_BG_EN_MASK,
 					WCD9335_ANA_RCO_BG_ENABLE);
@@ -4740,7 +4737,6 @@ static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
 					WCD9335_ANA_BUCK_CTL_VOUT_D_VREF_EXT);
 	/* 100us sleep needed after VREF settings */
 	usleep_range(100, 110);
-	wcd->sido_input_src = SIDO_SOURCE_RCO_BG;
 }
 
 static int wcd9335_enable_efuse_sensing(struct snd_soc_component *comp)
@@ -4871,7 +4867,6 @@ static int wcd9335_probe(struct wcd9335_codec *wcd)
 	memcpy(wcd->rx_chs, wcd9335_rx_chs, sizeof(wcd9335_rx_chs));
 	memcpy(wcd->tx_chs, wcd9335_tx_chs, sizeof(wcd9335_tx_chs));
 
-	wcd->sido_input_src = SIDO_SOURCE_INTERNAL;
 	wcd->sido_voltage = SIDO_VOLTAGE_NOMINAL_MV;
 
 	return devm_snd_soc_register_component(dev, &wcd9335_component_drv,

-- 
2.45.2


