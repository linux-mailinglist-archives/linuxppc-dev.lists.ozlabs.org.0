Return-Path: <linuxppc-dev+bounces-8981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B29AC71D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jG2LlJz2xGY;
	Thu, 29 May 2025 06:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462418;
	cv=none; b=ZvRfdhzdK8u0Hh8XaU8KZeG3/umSdw54QWanlsISx3a9q/QDBSXWTfVzP10V7ppqQve5Il/rC2Jjyzsdhf5HuUrdqZjMtZbFEiH1iTki5DpTx1e0B7iMOUtHo5PglMz2EWIPtA6WydW/zPceIHvsyhBrN4nwL53V/0sCl2o93CZd3GID2IgJJUuMQo94d/8kr4CZcCvdjjYuaVXj1kwKBRX8DW5zpmwfgiarGcm5yJIGlX3iU+DtAouAeoSAck96EeUYUvkUddAS6uarrOJxWFTUYKO9JEyMQTBFtarLWdbeNCYWsojaf15Hs3rmaJz5fFnqv9mmpLjbciXNjOyjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462418; c=relaxed/relaxed;
	bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwzMt5YlNEsqfr1VSuna4O4TNd/2qMcjA73EqLxoo0FxK54EcntV3NtfXxbdg3fw4K9HybYOT0dy71QbpGyhV/OCEdK+ABz2QHJhlaDJZuZBrqkHhSWKqaIBwRJkvZ3ZcJM5xJ3hVFHhhIHhv4zPM19nAhWuMh7uZJD91UpaxaiV6e5C3FyszeM7Az6qkb1nYJ5O1i+Aw6bdsqVZ0ZjonA0nx4ocranxr+yk1StI+nt5e78tdZ7QnpbCdmz6EPrqHSjrZb8o1FZSphnicgQg+exeTHo+GpvWkq2949Mx5jEeFBKhv8reMimsfbpJHknRDhs7iAho2lVyQFF2LndXxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwVebnqL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwVebnqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70jD5n90z2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:16 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso29269f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462414; x=1749067214; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=IwVebnqLa4MsV/J08Qij7Ewhpgj6CWOrNdiaJb6UoYETWktGOC8xGsdo9BlKpAhWNl
         Eu7rHIN2RSBnbq7rtQhZjTUGLRm2zvpjEKbZXnqaghE117Yj65QQY6yQeqybqh3XHW+S
         sgktC3/Y8WXA1DZzFfUyucATWABRPdIWIw1rttSqIhfkoPWp20fmKNXyMzxSgPo4KqFq
         bRBxQBDdlyMB2M3+/zwUrHIxDV/3Cd7n/PiARWJEhyukqhQacNa5yQYxots0rIjPJUzP
         GNCPLwuUPCQvV+sOWUx36Ds59MfFBB/2x+ZXZX+2QMwm0FyOJSy4sXUcR7lgN98qdlrN
         iSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462414; x=1749067214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=n5UDU/Jz5rUefeuOjkFdj1zPSmwgfEYSY7vJ6UYHw60fJKQboAHK3rGoD8kn8DPmll
         egdPGVw1dNx2xHJSZq3OFkAajzxyfVoQrntKjy+gTlh85VoUEAJ8CMzIZP6T6DW96HHI
         zHwdxg4f2pIG3Cy6rCHmqYzPjzH89i2983Iusa/TMkCvuHp/qW3BmtjnFEqO6jIAQdVU
         j60wFB8ounkO6IKy8yzGaXKV2fzrsHt4x3pLqV3gGvFTKsmMAV9xxelOztLflWQieYRM
         sQR4yTn+IRJnTh8rrD1i1LkOTQ5vjQJJoEmpXU1+inazK0V9XprovjuGhAQFd9cPtMmF
         dZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn3FKjvSzJlzoyvQJ3ULu5ibR1ij7i1yOIzry9K1GOn1RJGrJX2eY81g9rNLUm3elP6nh2AdthrEy3XE8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7FbF9aEIzzQwM8hJw/Ez4lOcRikjUy5h1o36pWwePpnj3l7XX
	28CxKDDZQqcQM/vR92WL3akOmwlhTYzfAApV93Cux/6/vzTPQrR1apa0Xn0gqjTDKj8=
X-Gm-Gg: ASbGncu0pKSn9lAMLznuYf1CH6NYdcqeA627Id97to4zZB9dLdjNElwLGRZbhedx11E
	f+2f7aRM00UMLBNxA21cgkb9UhwqNCE7lnzodOv7dh+wCFcjmCUV9btQIqGMJea7OLHsvXCHUcG
	CnB91wHW7ezqmnliMzTXPcH7sfzn59kNkCOzIWuBc5vgt/VfeDcV7RR2KB4no1Erhhg/L8tOS2X
	flfVAPJxWd+L+RGDOLGcE4L4Tht+jtrqD39woYmv8LvPQw9RBbjwHfIUZFVBy4AkdHElNVhaQPp
	0qx1Klc9fgnz7HgmLgYVIoMPQlLP0olzfQeKs6lFSRYcsZEqPHmVIqk4Q3RGkhkfq+tKEjQ=
X-Google-Smtp-Source: AGHT+IGfU8NFt+DqotOkDnTjGF7XzJKz4InJeaeMrRliPYDudRhDJYMTWxE+7D8L8v2uiJmW/9+V8Q==
X-Received: by 2002:a05:6000:22c7:b0:3a4:d924:e650 with SMTP id ffacd0b85a97d-3a4d924e7acmr4088338f8f.3.1748462414106;
        Wed, 28 May 2025 13:00:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:58 +0200
Subject: [PATCH 4/8] ASoC: codecs: wcd934x: Drop unused
 num_rx_port/num_tx_port fields
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
Message-Id: <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bE4AstDjnvFxLFE0Ha1Csaz7+vgcKuDvPOFc39zCH/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tAPg4TdSpzrnusk8/T1AviguPqy8H5ac0sf
 fUwz2vi3r6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQAAKCRDBN2bmhouD
 12gcEACIIAskqI79X3CWPeeqtkbf389joGRl9j0Z3/TBo+YE0zAGoLygLCjCxovWSIp4Q9+9bjz
 tjAG5P4m70aauB0+sUTBy9aS7+sTiY0mxrReQKzqh4FtHSZIorAt5e81IzP8h18ONx4o61A2NW1
 ON5zm5321mfYDFeephAO5g+ISQutxjHEbR4Q4QYzIKSHPVJCac1N3gV/xHXRXgCP5TVrBSVbRkZ
 ugKzBhxgXw8KcMB69mnoHWypcP4AB1GxrDirlql+IywJg9fcBaxe+OhandyVmJaBfqpEW3s6Ce7
 2SDdVPdkZhIIPFFwGfcR9gzyW+PhM8l1/m5rq/Tz4/RidVls1Kg8U7woejgDsUakrQsrp2Eia5a
 MRdps9hdh4dIkJhbUsaQGIrLFKD9d7IvuDTKbLWSA7FWuVt7mVd2aXG+SWTX6sIx6uENZLM/nPq
 cy114SC/Fq4zEwoLoLbSkgeLj0BXVuJcfm62aSfQFrYCjyZqtHsyEZ5M8VdHZGBffs1eNRo5cue
 oSSiji8mfSjxawQokubfc+UO99Sr2R65oDtarSkXLjlZtQecJ8yd1WwfobzB96nG8BrQxpsLEDd
 ArCTD9P0YGhujSOt7JL8FDNkD6Um8WbDDWebxCC6foNi1fKypNRnAZFhdGUrY0nZpclACByimX9
 RqKKAUwNqaF8ZcQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Members wcd934x_codec.num_rx_port and num_tx_port are not read anywhere
after assignment, so they can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fa69817c97eaf1bf226b140f3a89095a50a128b2..1bb7e1dc7e6b0a5528cbdb7ada943a7d417fb684 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -537,8 +537,6 @@ struct wcd934x_codec {
 	int rate;
 	u32 version;
 	u32 hph_mode;
-	int num_rx_port;
-	int num_tx_port;
 	u32 tx_port_value[WCD934X_TX_MAX];
 	u32 rx_port_value[WCD934X_RX_MAX];
 	int sido_input_src;
@@ -1928,13 +1926,11 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	wcd->num_rx_port = rx_num;
 	for (i = 0; i < rx_num; i++) {
 		wcd->rx_chs[i].ch_num = rx_slot[i];
 		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
 	}
 
-	wcd->num_tx_port = tx_num;
 	for (i = 0; i < tx_num; i++) {
 		wcd->tx_chs[i].ch_num = tx_slot[i];
 		INIT_LIST_HEAD(&wcd->tx_chs[i].list);

-- 
2.45.2


