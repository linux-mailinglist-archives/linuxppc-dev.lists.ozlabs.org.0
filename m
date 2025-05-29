Return-Path: <linuxppc-dev+bounces-9004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD32AC7B31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 11:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7Lry73TFz2yVv;
	Thu, 29 May 2025 19:38:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748511490;
	cv=none; b=UYL/m8bayqXYvXs+eOFHUWPinh0YtWDczPMqiNxa7SeBZZE1AoEihdvkMeDR8yrQrkrZPZfO0WSvktRxXtCzY90IFLFw3IA8tc7ttmdMzu0TrMDxPpPDESIY7hKKxXLmVj5JVoFMxMN9H7u1TF4JgThGWw4BEFF1PIdV/IV0Q8cTIy4TurZ7tGRRFYqu26be8OLccYcwPx+kh2sCkKgBvP9+VduMzxHN52vysqL2FmLiHhNO4+R9Y33oliGssQg5n7UXZus1VV6avbylMuwvOwsMEZIJ7P7OvxBip2CJ5H5rNiFpKZ9xoVML3TuEYMQHk/hLxNz7T6xHbzwDISGcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748511490; c=relaxed/relaxed;
	bh=gQA3tchOGlR5qDPRloAnwGTrIDQ4bOFY7MUhX29PeuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRaEqW9pUHUptGVYwo8w+728iWCp5KHseUD5gyl6WVdCYHLSZxwNb3qErulnc82JNwCrvtnNBu68McblQZoOR4rOtsZ6GP7D2Y3yjyBQlk+4GwCOroz4ZYOyKVmGWy8T9qhS4AyxC53jSMx/+Q5Vadfd7BmSqREVhi4trWA6aUKTEw23F9p3sjG0XoE2KFRblx0Z5qn/8KT4kcTgpTlSCpqRlD6cje4kXPRzJWSSScoxKEtQ2X2P66MGBrmU/1u7ptWjBAQzCdfJwZpt7bAIHD8Db1Hd0gaEV9faG0rIaWEsX/wTzdb4ue/z9pUYJKd4oZa1kJQbcotwczSObM3UAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t+RIm72B; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t+RIm72B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Lrx57d1z2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 19:38:08 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso107747f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748511485; x=1749116285; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gQA3tchOGlR5qDPRloAnwGTrIDQ4bOFY7MUhX29PeuI=;
        b=t+RIm72BQrZ0HKGGOLdxg2glzCYt/mczDv/Btz++gwtg7uXUbz1N2xX4y1/FNFyqVj
         lB7jCCIAWGd97dGwTYgUDUQgSyAJt9uf3tMTJwUeZm5pJbS6SxaMn4UFAgKSIzkQXH/C
         rRsHRugCbOzO0uNZNPWT4bJUt4Xhym9JkHMPEmybyofD9cXX4pEIZj9wrnFggQP+axAX
         oXinkO3Vb049GGB8zRcUMF5MBFuDO5T/f7TBQWWrsIOytf7TcjjDoYOJqebSFjniv7iC
         PMwfT6h9GuisApbBIMe/E0JCxzBvTMzC5sykcajVq26n/6S3jmvnmePaAgg9aowqqmaf
         nSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511485; x=1749116285;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQA3tchOGlR5qDPRloAnwGTrIDQ4bOFY7MUhX29PeuI=;
        b=BGef0uuhovpW2V+YbHcB5Gpy4Hb2cmcreB/jXCSU2Oj4zkDM4l3ln1vtjnI3+6UIHR
         0cFF9X/wBguhVtk1nC8ipdzRn1yVL1gDGJfcbRWly2I+WBsYyk4UVjGbi3C/qH9YMC9o
         4ACTlf0ny2qsJhsgTmze8D+TAqeIUrUNIqTyAFkP9KbuyXS69QYJZlDs5J5ogRquQS0d
         IGWPLdnGtRxVv9dbdPqtstepIFH6kTpzNXy6ZBdl/ApiplR5zSgty8pfWHFKqCPfbRwm
         5RZwlQZDDoMn5r35opP83YqWx7q/9zTyHQQn2gVKVgEpDXTE+YQFkJgymVTS6PQAOqri
         ylOg==
X-Forwarded-Encrypted: i=1; AJvYcCUZd8Lcfq75SVTukUhvVJGmsIKuViSRdjcY7k5pyhKOmwMnYaafuZ0caYf4PkyZKBlJgyfiGxicHZSYXxo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzY6ST2UaNQ6DN1+8gzJZkpQ8JzeSzcPEre8PbQ3u7MSz1UbctS
	EkPIyXdwCtV1NRj8vYSgv8WKJZ0Dsm+Z1BDDvz1Kevn1E1s0jMFLI7fe1zTLZlnmmS4=
X-Gm-Gg: ASbGncuslHrQ41pLky/Hd5dYWr+sVTjiYaESUM3zTI4Rq7QrYPgLLBGEPkGGSOTAl4u
	BehalnSkbNUUbHCWHn3EsWCbYm23W18pieSY4xNfppRO06+LMXDgsaAhPHiZLhnvvMpkgUkTaGE
	4HS146ck8y3f7KFpqRVdPsIcOlEUnkXuciA0c8cVsyLnCAL0t6mop+VXMuM2CsHV02B7YZgW5Pw
	eo/tiZFQsA6bE7aUwsK39mEDc5SVFDemoPRrM8b7jjmKa8nNB+kMyo83D/hpL8QLoaIKx92k5gl
	WTf0cs7WAHa3l0q1VAcAqeh6DiOJV99i3VLbcwhVRFYL08PuZnqkCmiYbmttCJ7vgcRUHg8=
X-Google-Smtp-Source: AGHT+IG2KHg1RZohAGcF8Ql9GO6udEqYKqOIjzHEygo2NxgJdK/utVnegk1sAe3vpwYFfGdGIM1yBw==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:e8c8:fb89 with SMTP id ffacd0b85a97d-3a4e8c8fcc2mr1629165f8f.0.1748511485114;
        Thu, 29 May 2025 02:38:05 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009f865sm1405197f8f.81.2025.05.29.02.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:38:04 -0700 (PDT)
Message-ID: <60c39c91-4ef7-4a14-8317-da0e2c3aa962@linaro.org>
Date: Thu, 29 May 2025 11:38:02 +0200
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
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
 <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/05/2025 11:33, Srinivas Kandagatla wrote:
> 
> 
> On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
>> Make static data const for code safety and drop some unused fields in
>> structs.
>>
>> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
>> driver.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (8):
>>       ASoC: codecs: Constify regmap configuration static variables
>>       ASoC: fsl: Constify reg_default array
>>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>>       ASoC: codecs: wcd938x: Drop unused variant field
>>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields
> 
> 
> Thanks Krzysztof for the cleanups, its surprising to see so many unused
> stuct members in qcom codecs. Did you use any static analysis tool to do
> this or was this manually done?

No, only the tool between seat and keyboard. I should find something
better (more automated), because every 3 months I discover a new unused
field. :) I think now I cleaned them for good, but some new cases are
added when some code is dropped or simplified.

Best regards,
Krzysztof

