Return-Path: <linuxppc-dev+bounces-9006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63FAC7D0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 13:34:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7PQd0g8xz2xQ6;
	Thu, 29 May 2025 21:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748510941;
	cv=none; b=IOiHWYHFapz3QCyRJoOtqYtBMyFfPIQU9doCJfLvgIjl9lYdalIZ6hAgkbxOjHKTnujVfNXGpsvsHrUf6uBb/cYyxnkHUDOe2sMHb6cXXPBpL0KtRbM/Ma/TT/hp7OW9neNsZxrMvDR71rUWNSX72YPFLsdPKkeFuFdMf2iZ81TaqWaZkO5MB5QC/iOlAwqllCEoAEIV1Gxsu857qj4QD13dIeDRfSCBHbusyISIkh4YFNRkoyyXZF3ID5ZkLUHa9TYTMOc/J6zcCvF9JThQWnrJutydqSkxOlAWXL+vI29/r4YcOpq9cRbWY4117BpoF7FPM4nx3ggZIqlkjP0Upg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748510941; c=relaxed/relaxed;
	bh=d7Qgkw+FjtErEbydIY5tdmXfEMzQTCAQIwwevRaOxjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kl11zop0TtxtEwFK/grTHyTt+uF9MLbLD3zf9uQAIWYJXLzPnSFzOqI5ME4ZCuRcue7o7BH/4K5xMKcF37U9LtyfUa16oFnV6NFwlVAvhUYBA/XOp7v2AAkkz7iuqpSRE5g/7V3+cbd6MgOdiHpuQAHtlJElw+A86EGAY5HH4b3VtYKkY0j0WCnacTiem3n5JYnyeW9aBjE8Pa2gZuf04N8GeeHMafwuV46dzvmpjD37FOSpIhJmQ08X9WoyplNzuDhcYMR9ZnNZwBfpBCUTqx37l8bYK8AxExGcZPhYKN8RIIBy9h1c2FBsJPSTMrjACXoI3tgsG+PjT5V53xP/dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VXgKadtk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=srini.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VXgKadtk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=srini.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7LfN3jrRz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:28:59 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4c9024117so533555f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748510936; x=1749115736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7Qgkw+FjtErEbydIY5tdmXfEMzQTCAQIwwevRaOxjo=;
        b=VXgKadtkMBsnd2rQAWtRYdtPAc5C843tQ5IIdERJYT4fT6VkDpW9G4UGYYa6GJWE5a
         gKTeMmSEyQ+DV20CQr3Sy+2dnv+bPC1tb/gLDMR7lWFpNkzAqFyvoktjuwC99eBNTTLJ
         vrj19MjEEa+YNLNm8ThSeVgmKTxnfIRf0n+CUH+XXUsrSYs8SPy203NG2mu2MQ3UFyMX
         kGReVYxUPg4kX2ymPvzrvktIU7rb9CsAd442Qnmdcvrtxb+RI4LSX3UeZsMWSkSdkCL6
         OEH9IKukE+y16NGVuPlTZbBx3SIE3NVyOelcfLCez2eqkCLTbUiGDCfbBKTibv8TwnBu
         csfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510936; x=1749115736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7Qgkw+FjtErEbydIY5tdmXfEMzQTCAQIwwevRaOxjo=;
        b=ioWcinMa3ualhwVyG+joXVryi93olGi7xY6qaF8IqT0m9FPSBwpWP5BvvPKBClgy0N
         /hoCa4om4EN4Irro2tGS60vYQ5Sx4sIApmEyyhRx+Gyv5kFNjSjdr4KJh+cHYbppprvz
         NkpexkBKUhC6b9B5UkAbmQvDq8Qpieta7g1Qbh1lYkoxxw7XLtsq0ZPfReAK7i6C04FS
         CqyT7eTemsatIlFfHe+Yt2Iqe/cxJEl5037CmRZFUaCQiz0DMWLEq7snxVay2TNutI1U
         LFNRULGIJwIBNxXjPBaX3mkLDcJvaQhv3eKPOQROV0wV2rtFHUsvO3DBY2XlV35Nc8/Y
         2a1A==
X-Forwarded-Encrypted: i=1; AJvYcCVVWV4NOGO3ak9TBf9I7ki9WImoImhM45rvgyYr3gcjLkHCIGW0SM4IgGlEdVJ/hBPox6x3P5DYyjSZ7+c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPV0QW/jyKPrS4QGlSfT3fjupbZUUSdPqzxtwXVNmzfhpMUvjM
	eU+fH2r8MfdzTjxzxzx8RfF8HqNXa9k6WD1lmzhlqMHOAtesnp9UaRZu
X-Gm-Gg: ASbGncu2eEQ2qRlSbogimY2A0QOnY9YB7ew3jkNxmIn9vohc65cinU9rgRu7aJ5DVd1
	nu93OxDGDNtcHXrqSuCHZkjHaT3f3LfbLLbOUqwXs/akIrH2t5oqDwBJyJxk7xNXPnPej5gzmAq
	OPKt57ClL6XzYr0HzfiAbBzsWx+N4xnmNneBF7t44bvnq9JcvLoG33d3bdUytFDsyhbvLcJUN2S
	MyBp7QcozCxRg7fsasyM3+BxfNheBw03sFqJHC0P+8ZIer+ZcagFocdsosGg9N2h1xykhkaYwP/
	PmMT0onA8WzMEQ9LhuxVlezeXLB41FgalABIc4XmmoZvcwIRX0y+Axriby0=
X-Google-Smtp-Source: AGHT+IFyob3sOyeaThAioC5DaGtLkXgmUWKgiG2MIRAU2xX+mObPRH4YL11OEXgTlKMuuUSMYg+PQw==
X-Received: by 2002:a05:6000:290a:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a4eeda32c5mr2216564f8f.18.1748510936105;
        Thu, 29 May 2025 02:28:56 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm1442285f8f.0.2025.05.29.02.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:28:55 -0700 (PDT)
Message-ID: <dcd4174f-c3b2-4686-b429-68ec378f9a6c@gmail.com>
Date: Thu, 29 May 2025 10:28:54 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] ASoC: codecs: Constify regmap configuration static
 variables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini.kernel@gmail.com>
In-Reply-To: <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [5.133.47.210 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:42a listed in]
	[list.dnswl.org]
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [srini.kernel(at)gmail.com]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Static arrays/structs for regmap configuration like 'struct
> reg_default', 'struct reg_sequence' and others are not modified so can
> be changed to const for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/cs35l36.c        | 2 +-
>  sound/soc/codecs/da7218.c         | 2 +-
>  sound/soc/codecs/da7219.c         | 4 ++--
>  sound/soc/codecs/es8375.c         | 2 +-
>  sound/soc/codecs/max98363.c       | 2 +-
>  sound/soc/codecs/max98373-i2c.c   | 2 +-
>  sound/soc/codecs/max98373-sdw.c   | 2 +-
>  sound/soc/codecs/max98388.c       | 2 +-
>  sound/soc/codecs/max98390.c       | 2 +-
>  sound/soc/codecs/max98396.c       | 4 ++--
>  sound/soc/codecs/max98504.c       | 2 +-
>  sound/soc/codecs/max98520.c       | 2 +-
>  sound/soc/codecs/max98927.c       | 2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c | 2 +-
>  sound/soc/codecs/wcd938x.c        | 2 +-
>  sound/soc/codecs/wsa881x.c        | 4 ++--
>  sound/soc/codecs/wsa883x.c        | 2 +-
>  sound/soc/codecs/wsa884x.c        | 2 +-

For sound/soc/codecs/wsa* an sound/soc/codecs/wcd*

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  18 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index b49c6905e8727d7c07fd10e668507ca07bf2cff5..b60697ff7a506dccf3dba1b01faa985761bbbc42 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -129,7 +129,7 @@ static const struct cs35l36_pll_config cs35l36_pll_sysclk[] = {
>  	{27000000,	0x3F, 0x0A},
>  };
>  
> -static struct reg_default cs35l36_reg[] = {
> +static const struct reg_default cs35l36_reg[] = {
>  	{CS35L36_TESTKEY_CTRL,			0x00000000},
>  	{CS35L36_USERKEY_CTL,			0x00000000},
>  	{CS35L36_OTP_CTRL1,			0x00002460},
> diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
> index 5f2f67e3bd29240acfa0d53a0892c8e92f711c1f..a7539e1a18939683558accd207b57324a1ce6aeb 100644
> --- a/sound/soc/codecs/da7218.c
> +++ b/sound/soc/codecs/da7218.c
> @@ -3033,7 +3033,7 @@ static const struct snd_soc_component_driver soc_component_dev_da7218 = {
>   * Regmap configs
>   */
>  
> -static struct reg_default da7218_reg_defaults[] = {
> +static const struct reg_default da7218_reg_defaults[] = {
>  	{ DA7218_SYSTEM_ACTIVE, 0x00 },
>  	{ DA7218_CIF_CTRL, 0x00 },
>  	{ DA7218_SPARE1, 0x00 },
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index 3958e88a244563c81b373cab38bc221fc8ba795e..221577574525a5fd60180a4441331d7db88f50e2 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -2312,7 +2312,7 @@ static void da7219_handle_pdata(struct snd_soc_component *component)
>   * Regmap configs
>   */
>  
> -static struct reg_default da7219_reg_defaults[] = {
> +static const struct reg_default da7219_reg_defaults[] = {
>  	{ DA7219_MIC_1_SELECT, 0x00 },
>  	{ DA7219_CIF_TIMEOUT_CTRL, 0x01 },
>  	{ DA7219_SR_24_48, 0x00 },
> @@ -2443,7 +2443,7 @@ static const struct regmap_config da7219_regmap_config = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> -static struct reg_sequence da7219_rev_aa_patch[] = {
> +static const struct reg_sequence da7219_rev_aa_patch[] = {
>  	{ DA7219_REFERENCES, 0x08 },
>  };
>  
> diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
> index decc86c92427c0c61a1531fb0fed1d9b853449d5..d12b3dc9e1f7fc03b8737e6b001b44c0d51c1b93 100644
> --- a/sound/soc/codecs/es8375.c
> +++ b/sound/soc/codecs/es8375.c
> @@ -619,7 +619,7 @@ static bool es8375_writeable_register(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static struct regmap_config es8375_regmap_config = {
> +static const struct regmap_config es8375_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
>  	.max_register = ES8375_REG_MAX,
> diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
> index 950105e5bffdc2c7606e10e7af6f3cf97ece5b4c..fd6830a7579d4860c8bc4fdd26d05698834ddcc2 100644
> --- a/sound/soc/codecs/max98363.c
> +++ b/sound/soc/codecs/max98363.c
> @@ -14,7 +14,7 @@
>  
>  #include "max98363.h"
>  
> -static struct reg_default max98363_reg[] = {
> +static const struct reg_default max98363_reg[] = {
>  	{MAX98363_R2021_ERR_MON_CTRL, 0x0},
>  	{MAX98363_R2022_SPK_MON_THRESH, 0x0},
>  	{MAX98363_R2023_SPK_MON_DURATION, 0x0},
> diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
> index 56c4ba1f37826f279df4007b0de36fa932257b8f..f58b8c8625a7061fc9564c9f84dd95d77df33b72 100644
> --- a/sound/soc/codecs/max98373-i2c.c
> +++ b/sound/soc/codecs/max98373-i2c.c
> @@ -23,7 +23,7 @@ static const u32 max98373_i2c_cache_reg[] = {
>  	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
>  };
>  
> -static struct reg_default max98373_reg[] = {
> +static const struct reg_default max98373_reg[] = {
>  	{MAX98373_R2000_SW_RESET, 0x00},
>  	{MAX98373_R2001_INT_RAW1, 0x00},
>  	{MAX98373_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
> index 6088278e6503dc7ea743ccc439cd6365c7475017..43b52bda6ad5297d856123aa515e0019f4866097 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -26,7 +26,7 @@ static const u32 max98373_sdw_cache_reg[] = {
>  	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
>  };
>  
> -static struct reg_default max98373_reg[] = {
> +static const struct reg_default max98373_reg[] = {
>  	{MAX98373_R0040_SCP_INIT_STAT_1, 0x00},
>  	{MAX98373_R0041_SCP_INIT_MASK_1, 0x00},
>  	{MAX98373_R0042_SCP_INIT_STAT_2, 0x00},
> diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
> index 99986090b4a63a9759763881f3004d0e509e53cd..076f15a9867e13527324354cd6364ade3bca4846 100644
> --- a/sound/soc/codecs/max98388.c
> +++ b/sound/soc/codecs/max98388.c
> @@ -18,7 +18,7 @@
>  #include <sound/tlv.h>
>  #include "max98388.h"
>  
> -static struct reg_default max98388_reg[] = {
> +static const struct reg_default max98388_reg[] = {
>  	{MAX98388_R2000_SW_RESET, 0x00},
>  	{MAX98388_R2001_INT_RAW1, 0x00},
>  	{MAX98388_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
> index 76296176f9486f72a9d6077a0c69a475e277ed88..a8a282ff9fc5abfbf6c6bdc7fc209ed15bda0cfd 100644
> --- a/sound/soc/codecs/max98390.c
> +++ b/sound/soc/codecs/max98390.c
> @@ -23,7 +23,7 @@
>  
>  #include "max98390.h"
>  
> -static struct reg_default max98390_reg_defaults[] = {
> +static const struct reg_default max98390_reg_defaults[] = {
>  	{MAX98390_INT_EN1, 0xf0},
>  	{MAX98390_INT_EN2, 0x00},
>  	{MAX98390_INT_EN3, 0x00},
> diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
> index c1888cd83dbc6fe2d418012dc1a9b1c58c3ded86..4b4e1fc98a6da5bf3a713133ce974b2f09161ed4 100644
> --- a/sound/soc/codecs/max98396.c
> +++ b/sound/soc/codecs/max98396.c
> @@ -16,7 +16,7 @@ static const char * const max98396_core_supplies[MAX98396_NUM_CORE_SUPPLIES] = {
>  	"dvddio",
>  };
>  
> -static struct reg_default max98396_reg[] = {
> +static const struct reg_default max98396_reg[] = {
>  	{MAX98396_R2000_SW_RESET, 0x00},
>  	{MAX98396_R2001_INT_RAW1, 0x00},
>  	{MAX98396_R2002_INT_RAW2, 0x00},
> @@ -174,7 +174,7 @@ static struct reg_default max98396_reg[] = {
>  	{MAX98396_R21FF_REVISION_ID, 0x00},
>  };
>  
> -static struct reg_default max98397_reg[] = {
> +static const struct reg_default max98397_reg[] = {
>  	{MAX98396_R2000_SW_RESET, 0x00},
>  	{MAX98396_R2001_INT_RAW1, 0x00},
>  	{MAX98396_R2002_INT_RAW2, 0x00},
> diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
> index 6b6a7ece4cecc3d114da276faf859c8176955300..c94142768c818228aae8b90c636cfd6b496e9859 100644
> --- a/sound/soc/codecs/max98504.c
> +++ b/sound/soc/codecs/max98504.c
> @@ -35,7 +35,7 @@ struct max98504_priv {
>  	unsigned int brownout_release_rate;
>  };
>  
> -static struct reg_default max98504_reg_defaults[] = {
> +static const struct reg_default max98504_reg_defaults[] = {
>  	{ 0x01,	0},
>  	{ 0x02,	0},
>  	{ 0x03,	0},
> diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
> index adf5a898c6df5b10661861f6329ca54db6445f1a..2bf8976c1828210d2e6106f08e571df650640606 100644
> --- a/sound/soc/codecs/max98520.c
> +++ b/sound/soc/codecs/max98520.c
> @@ -16,7 +16,7 @@
>  #include <sound/tlv.h>
>  #include "max98520.h"
>  
> -static struct reg_default max98520_reg[] = {
> +static const struct reg_default max98520_reg[] = {
>  	{MAX98520_R2000_SW_RESET, 0x00},
>  	{MAX98520_R2001_STATUS_1, 0x00},
>  	{MAX98520_R2002_STATUS_2, 0x00},
> diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
> index 55cc18451a2d26e0ad72031d5017d68c215240ef..0e9b8970997cf6485a775a3187b1470f93b5c057 100644
> --- a/sound/soc/codecs/max98927.c
> +++ b/sound/soc/codecs/max98927.c
> @@ -19,7 +19,7 @@
>  #include <sound/tlv.h>
>  #include "max98927.h"
>  
> -static struct reg_default max98927_reg[] = {
> +static const struct reg_default max98927_reg[] = {
>  	{MAX98927_R0001_INT_RAW1,  0x00},
>  	{MAX98927_R0002_INT_RAW2,  0x00},
>  	{MAX98927_R0003_INT_RAW3,  0x00},
> diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
> index 609ca0d6c83a1f28c73a0981f2a8f857816e5eb2..70700bdb80a14374321d1d8d8744356484ac01ac 100644
> --- a/sound/soc/codecs/rt722-sdca-sdw.c
> +++ b/sound/soc/codecs/rt722-sdca-sdw.c
> @@ -147,7 +147,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static struct regmap_sdw_mbq_cfg rt722_mbq_config = {
> +static const struct regmap_sdw_mbq_cfg rt722_mbq_config = {
>  	.mbq_size = rt722_sdca_mbq_size,
>  };
>  
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index d9b61eab029af3d4782620ee017fc84fbd26ce0b..342d1f7d5dee3ac2d703e5b5602aef9ca2987158 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -275,7 +275,7 @@ static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
>  	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
>  };
>  
> -static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
> +static const struct regmap_irq_chip wcd938x_regmap_irq_chip = {
>  	.name = "wcd938x",
>  	.irqs = wcd938x_irqs,
>  	.num_irqs = ARRAY_SIZE(wcd938x_irqs),
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index 6627d2da372206eff879f8f3bd5fae9ddc0757d7..d479521a6d504ee45797be8ea99206a4b1787f73 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -202,7 +202,7 @@
>  	SOC_SINGLE_EXT_TLV(xname, reg, shift, max, invert, \
>  			   snd_soc_get_volsw, wsa881x_put_pa_gain, tlv_array)
>  
> -static struct reg_default wsa881x_defaults[] = {
> +static const struct reg_default wsa881x_defaults[] = {
>  	{ WSA881X_CHIP_ID0, 0x00 },
>  	{ WSA881X_CHIP_ID1, 0x00 },
>  	{ WSA881X_CHIP_ID2, 0x00 },
> @@ -346,7 +346,7 @@ static const struct reg_sequence wsa881x_vi_txfe_en_2_0[] = {
>  };
>  
>  /* Default register reset values for WSA881x rev 2.0 */
> -static struct reg_sequence wsa881x_rev_2_0[] = {
> +static const struct reg_sequence wsa881x_rev_2_0[] = {
>  	{ WSA881X_RESET_CTL, 0x00, 0x00 },
>  	{ WSA881X_TADC_VALUE_CTL, 0x01, 0x00 },
>  	{ WSA881X_INTR_MASK, 0x1B, 0x00 },
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index f04d99c66f332e18fe4c201f78360416c1607466..13c9d4a6f01537e448a5595f489c1716eb2053f2 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -572,7 +572,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
>  	},
>  };
>  
> -static struct reg_default wsa883x_defaults[] = {
> +static const struct reg_default wsa883x_defaults[] = {
>  	{ WSA883X_REF_CTRL, 0xD5 },
>  	{ WSA883X_TEST_CTL_0, 0x06 },
>  	{ WSA883X_BIAS_0, 0xD2 },
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index fd6ebc25fe894a5981df4e39d10d0f27d21c3a25..07d8a2645404ec49d4b12297d79bbddbe2950a4c 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -899,7 +899,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
>  	},
>  };
>  
> -static struct reg_default wsa884x_defaults[] = {
> +static const struct reg_default wsa884x_defaults[] = {
>  	{ WSA884X_BG_CTRL,			0xa5 },
>  	{ WSA884X_ADC_CTRL,			0x00 },
>  	{ WSA884X_BOP1_PROG,			0x22 },
> 


