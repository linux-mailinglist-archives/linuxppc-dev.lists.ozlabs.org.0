Return-Path: <linuxppc-dev+bounces-8977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB9AC71CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 22:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b70jB4pFJz2xQ5;
	Thu, 29 May 2025 06:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748462414;
	cv=none; b=lEhwMqZELnIHpgR8Ka7CKCE1TUOUtDtps43cBeu9gAzkA8drVFt8DfH5YmPXvM4pmlckeniNCwy55r5O4kDSSorkqskHC5KHcN5lM9IOisx7D4r5E+zT4KOUhKWt1ohfCViDHKFTj7/7AslYM8d1wNbUsJnuc8HMKTOTay0chZ0PgLtUlSSYIr0G3VfIdfWd09g4pHoZbOBCDyuF8b5BlxBSNaNW/9ROdX4b1GYiv6vulupdBVXlYBbfJX67W199v2K8yCcUvrP+hVMOTGfW5f4gS+DPXko01Muxh4ISGyTmL5PPEmjfdqcA5WelrrAmK9M6Q54Z61HNvmT94Qq5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748462414; c=relaxed/relaxed;
	bh=6vfW+FfH9s8Rae4vVOChz/TDf82CLWQFderngHSXirY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H/DSRSbmlDTZg8PIBWRmewPUhIUt54EUZKSlVrR5HgSpTzEVJeUNUL+WKbzJe+m5L+jV+3CL3ANDuv7HH9R6m8VlGqhtbmXZJdkygLdAxHCggBZTmw4NpC4c9KpdFalkvAHHod99dDLXDjECKa8G1jwYSjyi26cVh/bVz8R5g4uN6jXlPsWStDQCDcrY3PPqcjX1ExfQBP9Mn3l9l2IL6jei5JxNi6xiKemcRUNZ1a76jW/6OofRVK6gnYzkCi3Ba9o7r8dvHuLC/Eo+v36RLhzhOsj01nZRlKm2+9qc0rthuY5sQv9n2yR+Ep5NVuyBxXeRjtq/XNsS4rHZI/Lt6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ry21Qq0V; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ry21Qq0V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b70j84H9Zz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 06:00:11 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso97805e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462406; x=1749067206; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vfW+FfH9s8Rae4vVOChz/TDf82CLWQFderngHSXirY=;
        b=Ry21Qq0VfsHieBVAE9ELy0ViSTixyI7mQhFlcjAMxOsnakszuX8aS8MeskGeSu4kls
         nvWXsvauQve1YGFt7wR0E3TR/szFj8+Y53pcQymfdBPSEKvhcFaisMvuAtGDOZlI1qO4
         uW+fclV7HO06DaF0ldauuGeJ68bj6RzLmTFcF8I/R1AyHqOuScmz5aa/oDVGajvnfrxx
         Jp24QLxPlBai/KDd1KFxr5GRPXvrtpByDy42iX2/VIBtemtXnqBl0pfeuoPDLnByWoNy
         Yrujtnai0neF/gEZFDoh+/WK2NH1gE5Qr/Q6D2nTWum6JxT75+7EDYfj225Z8En5+9O9
         rAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462406; x=1749067206;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vfW+FfH9s8Rae4vVOChz/TDf82CLWQFderngHSXirY=;
        b=vujTJbonQRTCZhMWw3M7KxBWSlXLb2zmraCmVI6fsYzkEP3wfMDBlj8fUci5y2GMzQ
         w2j9359YwBacO+2JHnew7WUMlXRxrmFFZNZMnAwxcR3OFemAQP8fgE1KB61gqLe3ackF
         1/gePqq3hSnIjn8RL1ikFO39UWheAO4oMUR5gSXRQ/0eaQGQxy77TiLY1qqT0KlItOJ2
         xyuxUM2lwDBugkdMJCa/3V19NWaT+kfPs+rhq7xk0PZq7hs9xHh0DxLRReiQnR1ab1Vg
         k0yJgzRIMwWj9uDVwQoil0rHpLkgwe/G1NZ/jPquaTqHx9ldi5I4YuDboWC1U/NpLn4V
         wEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8zBq1EiMcpmW6z8KrHJdzD15GepLOlzeCJfaM2acPfkqNVPnBNWUb/Tnpd4utJSWItSg1pDRStD2MalQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwsXshTMw2+rUtH1TQLcCGZyU2bKUg/0mIdH8L7APoKrd2Fe2nu
	WvLXgEnCGIJnbqwEzeEpVNLbqhfTWfoApZw0et0bhCsCenKhh6oBR365QM/TTDa7wZ0=
X-Gm-Gg: ASbGnctLi0o+00xK2JNb/YKvNBd6UR2sAQFMb6xbNSQQYH4S9qpAteZ1wPRuCIq98Ey
	E6T0Nt2vRDqv7bu9RAQgZVS39DYObzgKShqWdZnqN4BxK93Rttb0KVd0aoKl4CkMg43JycwrXxR
	UxRGUTKeCZcX02+SlNmA0+UZND1tnA4zdO8oykF6lz29yEpi2VE8REik7/i9kLEt5n93/B5l5ei
	Rs/4zIlClBgCTUj2nh9N/lf5mv4z9wZO2asU47s7XLn5ujwGjLUcqIylDV47elyEmaWQgszpoUD
	lhO8i7YwgFyQe2z39pdvzrCYN7RD8d0NFcbdaBwqfZIwjiewy++Coh1G9U+qVbvkPyJ1wnE=
X-Google-Smtp-Source: AGHT+IE1Mm1hj0KXA6UQHYEYpLLI9gqUavUoSQwksygHkZby3xzXc62jj2qjprP5G8oWcOEhnKqxKQ==
X-Received: by 2002:a05:600c:511b:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-44c94c246aemr64196675e9.4.1748462406321;
        Wed, 28 May 2025 13:00:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
Date: Wed, 28 May 2025 21:59:54 +0200
Message-Id: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIADprN2gC/0XOQQ6DIBAF0KsQ1p1EAa1wFeNCYWxZiBbQmhjvX
 tQ2TWbzJ/lvZqMBvcVAFdmox8UGO7oU8huh+tm6B4I1KVOWsSIrWAVtGDXo0YUIs5sDGsiRy05
 wgYLdaepNHnu7nmbdXNnja050vJZ/WZGvW0Injjn1tzaSywIWY2Ba4cQg01gKLqteaq2W/DjUt
 QHTK8NgoyIO1wg/jTb7/gEkqKVZ2wAAAA==
X-Change-ID: 20250528-asoc-const-unused-1e39b434e427
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+RSQH1WWEw3OUmjRpYHyCD+79jexEjxzP96wMUdlgH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s8GaxaeUdgNhIEnN7feOgfCTXlEE/tNIcfQ
 w7fQgJ/0PiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPAAKCRDBN2bmhouD
 1xbAD/wLQHSFVgebaLynwR9dza3iq6tgF1gSzhFhVcuXsg6P0FrtS/lrgOzQT7LszOt/96uK4oz
 IMidlTHwKDQD+qcjRnRxcDYgJFTMPuZnlOGnqA0xoT+MD4djX2sd4sFdWDTeXXvm8EptQ6iyFQc
 OSnOICEE2zWQaDWE6Bws/ggAFo+dF+qm6bVyRsBA4aRbaNqIi9GbzkMtKDOLx9EXooZrUs7lgkg
 asbGuhUkWdq11XX39sP6/WlaqXpHV7WmSwVJg7EZfrLC+v4Fnts6XCnugBiMcUOmOebSOI7927z
 ue6LjpZWd5+K7SbTthbkuEH3SfdE/FnyRCNPp1m/0Yhh+irzaoVTzCA4Av2uIgOcXtOGA5iW3fO
 9cqwpO5hHeA88z35DAOqACtL0rDv9cHp3JdFPv4PSBtEs2H3ETDCPpeOvDe0egZjA9wVNMVQ87R
 4SvNhBZVK+/f1GTRsGpINzo11Le+Qly8lSkpXRjyPrxiyJy3CBxyqxYzsC92xddruBz/CfQIoIW
 TB8HJZ+FyR5yZ24zR2dYW9vDrkIs2bwiVoPT9peQChkeozUETrkS/CxLZAp22Wo3CMZ+rBleOWn
 JHuvsXTxZ3QypWNF+pcqdzy1u+Fz+VpdMB0MiF45VP3ia9e/yjMs/9juBjWDx1pmDvz/DS2xCoc
 SSChHiV+h9DSBWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Make static data const for code safety and drop some unused fields in
structs.

This is based on for-v6.16 branch in ASoC tree for context in wcd938x
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      ASoC: codecs: Constify regmap configuration static variables
      ASoC: fsl: Constify reg_default array
      ASoC: codecs: wcd9335: Drop unused sido_input_src field
      ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
      ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
      ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
      ASoC: codecs: wcd938x: Drop unused variant field
      ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields

 sound/soc/codecs/cs35l36.c        |  2 +-
 sound/soc/codecs/da7218.c         |  2 +-
 sound/soc/codecs/da7219.c         |  4 ++--
 sound/soc/codecs/es8375.c         |  2 +-
 sound/soc/codecs/max98363.c       |  2 +-
 sound/soc/codecs/max98373-i2c.c   |  2 +-
 sound/soc/codecs/max98373-sdw.c   |  2 +-
 sound/soc/codecs/max98388.c       |  2 +-
 sound/soc/codecs/max98390.c       |  2 +-
 sound/soc/codecs/max98396.c       |  4 ++--
 sound/soc/codecs/max98504.c       |  2 +-
 sound/soc/codecs/max98520.c       |  2 +-
 sound/soc/codecs/max98927.c       |  2 +-
 sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
 sound/soc/codecs/wcd9335.c        |  5 -----
 sound/soc/codecs/wcd934x.c        |  4 ----
 sound/soc/codecs/wcd937x.c        |  2 --
 sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
 sound/soc/codecs/wcd939x.c        |  2 --
 sound/soc/codecs/wsa881x.c        |  4 ++--
 sound/soc/codecs/wsa883x.c        |  2 +-
 sound/soc/codecs/wsa884x.c        |  2 +-
 sound/soc/fsl/fsl_asrc.c          |  2 +-
 sound/soc/fsl/fsl_sai.c           |  4 ++--
 24 files changed, 31 insertions(+), 46 deletions(-)
---
base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
change-id: 20250528-asoc-const-unused-1e39b434e427
prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


