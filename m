Return-Path: <linuxppc-dev+bounces-8979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAECAC71CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jD2wLqz2ySV;
	Thu, 29 May 2025 06:00:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462416;
	cv=none; b=I2t2utiZ6RjziErpIehCKpSmfwTWq/XfJxQG6SsxZ0opxeUtmoM9zj46a+GKvFA5j/G9IUk0a54mly9WRN+jhfEmY29CDPBxu5MvaO2NyWRvQnLieWM34fFgh3O6QUiyPeSSxalXv7l0Gzw/U9JR9bmn6JFBqRhQ7XmtyE5/1FHN09XduuEdTy0+RJcMW6q89i7AP0B5EwB2Nj8dZkHl5s94EFf94pT+ClKWjh88ildDCBqssAE258aH+vBm9jW0sSse+C8Cncry5ARwvQxiWeCjYUh+gEkVH502pViGSY8jUhT0659G3g5SeFKBDTJ4i0c0xAO1b0KXaOunzG4A2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462416; c=relaxed/relaxed;
	bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZq4H0pyNPY6HZmSBzQAeHgcc8RbuqamgR3GvBctF8UsGkBV+HE5HyD28cjLTtE1npL8JSt8pGt6KR/KJCcd+2bUUJCoNJn2JA1dwc0Yoe3dB6vIHCpcc+nkA3lfKyYN+ciip3DTGHD5FPaEUBtA/BxlW/wxIRkmVUksh76tXV0G4gfLXP+4lnOkE4g/+NlP5Erikv3YF3cM3GANDMlmTYY+YLo+6fdwlJG9wMXcv0OVbOrVFC0pgM8jrwS16kVMHn52qHib2QaYVMwWooQz7v5XUUSK2LvW6cWzltev70/WRbDz+QdySBmMOZG3pYrBVQMvuLjgntquyWhJ58nmqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AUdUjdAs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AUdUjdAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70j96JnCz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:13 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso34069f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462411; x=1749067211; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=AUdUjdAsCF5WwxexX8HfJII9sksXRTqfUoWKMnyogOHbt+9Xn++26zLWkQUljTR9SW
         WiBGM2joX5YAy7qG5rO/OUWYKvvyDOJ8nTVmhPNk65JQedh/KywOT8DphLY32920Dxvm
         rkpZn0v6IW9YbbjohZo7/xqp77NKdJO3jITldIoPEa6Q3+2E0OnESyPvdera/lIGQBOg
         WL90EgtZHqQ6R2b0pc4klQLalj5ELPWnGEwMxaJ1LpRaSV/zt4ItFhA3dCIPpW3cL8mM
         SwPrMNfZAlsYUTQRf0Txxs3uRSd4+8+JiY+u8ElwcOnhz5GO6xVt1PPDB8h9L2/n6rUu
         zfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462411; x=1749067211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=NeRngUxfqAbQLsy9B0HaIeTjECNEfujIWb3xZRpedI2UQkow119Fc+I2fp/ciyrw7P
         lVH/Dd37XcG5WotfHp8iXFPCN2eXW62Kb9EU0qJu4g5aF7Hw4TQKa/NG1TbZZ+CxMO9y
         Cw7Q8aQ4VdkdTz3FYFHWvfCpMDb6AABkD6P401+OzTXxSS6/1NpQKNOipBICZqUOxWHE
         BY1PKLG3GJl9URW0Cj4UnSfcTHkUmg9eUHBFW4oKdkKi5KZqK2hxnNPWo5bGR99r9wrg
         xLAcCkHWq30u5J4Jg3LnF5HeIMb7onaX6TW6FnoipFsN3EaxV+zYrwGr3CT7A5iSoMrE
         Fq1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRebv64NfKrTQ9G1kSvWRK7oJMcD7vmUeCGaYc1EHt0bEwjzdrjcfRK0fbFI73EGOyTsa9QDfOgINhjUY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVXJFH7PRpKOOQ0S/Lz4eNKuIVp3GPy3KrwCTR4NSaTVubDBO6
	E5dK5OB42a//K00e7OCMQiaAP1P9yYU1JAhe2/pfbW0vDAuW8nRPUWxzFu4vNi53ydw=
X-Gm-Gg: ASbGnct5Zl8iLYeXlWu1Qej77hRus03Ty5y49wdWQVrgWBh3ylVlrxCDFpqygK599j2
	IlOqzsSDlNt7lYsIJ+A6RI7sZkyIRsSCQC1frlwF4Hjx7GuNjlndmZ3EGBpXd1ePU+0GGSnI7+i
	4X5shA03Qzrz0sb1aZkw2OkuvnqErzMq0PcYOC08k7PP+n00koeBZbih2a+9N0pqKXE2L36R+KL
	7apdPByJ99+1JcSHOXNGCS+Pzt8rbDhulvjSnEBe2DGj8dLiyvXd2/ilU+QQ2BsNyCWJD+yZHtB
	os7956fNusw6CS/anE96u4ibkO8vYcgTNaH28vzqjVOz9hx3uvPatq1a7NA8ZfbnphdbagM2jxW
	oG8uReA==
X-Google-Smtp-Source: AGHT+IHZUGUK6yTkOMly/UTCf5TfkRX+RuLMJ+zm0TaswuyyY5q5bbmG4zBXo05PBD4iH1y4pl+NdQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr61901665e9.9.1748462410755;
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:56 +0200
Subject: [PATCH 2/8] ASoC: fsl: Constify reg_default array
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
Message-Id: <20250528-asoc-const-unused-v1-2-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CpYH823lP1gANgxKRTCYkC1iXZwcMTKwp/L88jc6Xws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s+XsqS9sFfoi0z9c+1UBE4EIIisHahFoDdV
 IQAKD8fYDSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPgAKCRDBN2bmhouD
 14HkEACFdeeKCanwIs9cv17+UMezTLZWq0x8/jrTebWUBqQqWOfNZFxDU6WjQcbXZ7dXF5S8wQ4
 7bLJBjpg/DGuUc+eS4RBF2PEZ6NX2WBqzoXpwQqGh5IU8mjJoaqnNFYzOQandX1OW//JzbLGrGO
 YFprEji4Oid03TG7/AgU/DvnN4+g+/8BtNMeq1G+VklfGrQKT49hUMNnST2geP66RYQwpi77ogY
 2s+J3a1eRLYcA04uRF54ZJyA2FLE6SMIm6kwzLmwGliMUbqO6w3bRbbwMTdizD3zn3aBPEEZtpG
 ++ayreX9g0cV5IzOIFqbVfycaLLHom3iO7dy3K4L8Pqz4Ozx5YGewOHbcb3G0kllU6sxYLgfkDX
 tXro/sl120J1X55bh9T2FwBWVNQuFhi6V8REO7tRcZj/cYwyfXrq3tbAWfH+/iUTKX7dFXCWIk4
 BafMN7HfrnzbHhhm0m4SrH57UsvnoLA9ZZhao+zwe5EerO0Wb0TKL7tgV3g1I/VdWKCRyHn9wM9
 jUvYBzaZqnoxLhtU0JcSwfNjwz5TKbJo0TnrJq35lqZOw+zKvpHlx7hqUiSyr088rslYMHZJXp6
 2RAFQfgHUZhqSe2i8GfEeRoanO/1RWmQOD3NOHWI1RbMqJObKGTgBWW3+LYWY5ssXczSr3oHcfu
 3MvwM/3z7gf87DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Static 'struct reg_default' array is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 677529916dc0e53a15952c53016930203c56dc9d..637260f306ecab109ed23b92a882cffce1c65421 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -930,7 +930,7 @@ static bool fsl_asrc_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct reg_default fsl_asrc_reg[] = {
+static const struct reg_default fsl_asrc_reg[] = {
 	{ REG_ASRCTR, 0x0000 }, { REG_ASRIER, 0x0000 },
 	{ REG_ASRCNCR, 0x0000 }, { REG_ASRCFG, 0x0000 },
 	{ REG_ASRCSR, 0x0000 }, { REG_ASRCDR1, 0x0000 },
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e379e24ce46715ba53b4a4dac65988..c84e3bb1290fd1188118b220adeb4f8e279a3372 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1059,7 +1059,7 @@ static const struct snd_soc_component_driver fsl_component = {
 	.legacy_dai_naming	= 1,
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TCR1(0), 0},
 	{FSL_SAI_TCR2(0), 0},
 	{FSL_SAI_TCR3(0), 0},
@@ -1082,7 +1082,7 @@ static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_RMR, 0},
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TCR1(8), 0},
 	{FSL_SAI_TCR2(8), 0},
 	{FSL_SAI_TCR3(8), 0},

-- 
2.45.2


