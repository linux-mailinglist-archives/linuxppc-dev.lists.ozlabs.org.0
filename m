Return-Path: <linuxppc-dev+bounces-8719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7AABD32B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 11:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1pt66YzPz2yDr;
	Tue, 20 May 2025 19:19:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747732798;
	cv=none; b=eo1SJFhFhYGu3UTBcPtO8R28hRnEPh1yWvxxmPtdQW5waKMU3SVr+yVZn6wT/4va2i02pJ/VRt7p3dUIvuWeE9nRXwZv25l9UOdulre4zzAvjLGyFIFS4NqqitRrM079U6T7e33Tviud+Q1Qzmuqwtv6I4m6ZQSL/qY0EvXQLV8oUipa67C+Axn0aiYmZawSce2MkMDAydM4M20QkJ3VrrARZQ47XcgZiRCSabItmGj+VwmzA47U8ll1eIToSryRCby8KKpQnY5eQL5x2D5QQXcx98l4Hfa+KQFjYewSivp4tX7VHhJt6U8+N3EbTthe+f/AHsYu1VMTt/J5TA2raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747732798; c=relaxed/relaxed;
	bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2sU0bM22XIenNz+fdnWt7er4OG5Wo3qWWJ6pUagsJRcn+WG3FEV6a0gLL2gpcCBOHfPgBfcRsGhoBKXaTNXpEO9mCsG258zfQPjDWwRO37RWiPtW+Wx7ef1w5o9Bfeb2FlrAjUepbb3CudCE6KVSzOhj4tFoFVWgCZXuWj4OnRreC7SpQv83CKZSixn8Y8vA3JPgFjzbE7rx89Vsqnvu95I5T10T8H/9oH28gkxm3xwYod9W0eVCOMD0OVkSgsaFT+PUIbVMTM4dnnU5Qrclz2lIvz6vnAnDxq1zLswOP8URaS6IiWpJG2gdx8fWdUJ3cEzwcbTIyhjgteP6b7I7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R1qC13vf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R1qC13vf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1pt519rHz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 19:19:56 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a361c8a830so578639f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747732793; x=1748337593; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=R1qC13vfcDqrmOc+fHT0enLkIaARm8BG7Hu8TuPDnyrrG0Te1hBgOR93/zwgxjIeqJ
         Lw3vKi6JhccJ2QPJ3eEJHOyCal1iNSgaccPH6W/S1j1AGCtk7mrc24lF9BbgcoaG+d54
         NceHJISeOWjph9iWYxR1Yh6GegFkva6RtOgirXTimGPtSSGyWg7SnjborwTXhMRzp83J
         7JkbEoWwsYnDJdipnrYCjvGyaaGgA7kMfGYn7BX8SZv4mt4gSwyjV/7SFdM8IgEryJ7i
         hXGSijF1np9d49owXapcL1x7z3b/iW/rtukZqrNankWOXwU+/tKPc16isyBgrIBTLIGW
         yqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732793; x=1748337593;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=WWHF3A+eIwrItNF8AWBRwi+/lAVlhw7azX7YLh4Op6ETXRQCIT4GE2HYG5W18CGuxj
         iK6J38dveA+EJSDw5NOAjUPtRbSoJtpa4Nkw2E3fALl+NlRzgi+KFxCoA2l3jAoyWyuC
         dlZFMsrINHwIwGQeFJ6nPjBdLzWCqkI3YkrHnfIw/XChrgscGLyfIT8V+SVMVXlurwES
         MwV3n72/7LSTJWN5fP+HALbG1+RzCz6pO9OwrBWygjAPQxSkzZ/rt8MAZSkWeZEcQiCm
         wj+f6e0wqhtVbNGHiQUDaTmGa0dG1iKE50LSghmUklbOYwkbBcJsearDsHK9/5QUci68
         ovCg==
X-Gm-Message-State: AOJu0Yxiv0BD7eAhNucanmwLbxIxU5+5RHzaCbrDDKuun9xG4NwjHzU0
	0d8bSafD+peJlcM6q0bLU/9VpdomTFkiRaOmhRDZHtMR4rpJ0xkAWVf9Gi7MlzKP9nI=
X-Gm-Gg: ASbGncswR1/7HhjTxuPd2ZwDUKCfm4vSk5IrW6E8av+8EIfs2NglbqNXU7+T1MvLeuz
	ycZ4q8m7h40OsebqgAFmKQGx6rpKvYZhXUfrZADcFnD6JNBWHx+vfLH9SNaj4qXZ2+krrwohD4Z
	odQtXwKQ3zx2n28VE+SJcI01/rEU1PGZmEImfPsm+EorCD9Aw0sHCyO9H7rNHJhRcdoIRTdyS3e
	514QzurFwPCaOWas8rlbVP4c6ph53KYow1nJIu6GV+mR7G2u+14+biGtpySV5u6fenaeF1bR4sh
	hUfpB5xEjzvZTYccmvyC8lTYWvEurkhYAkRUrogVJtaF8zHdOXzBhfdSwCUpdpE83ANu9ok=
X-Google-Smtp-Source: AGHT+IE0KhG7Byol3rqL9+TUiiilzPQtBPzROXY2nFHPpqSTCakEs3GIZmD5PTaPMzpGGdP9tjEfcw==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr48271505e9.3.1747732792584;
        Tue, 20 May 2025 02:19:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825457sm24395635e9.1.2025.05.20.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:19:51 -0700 (PDT)
Message-ID: <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Date: Tue, 20 May 2025 11:19:50 +0200
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
Subject: Re: [PATCH 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, johannes@sipsolutions.net, perex@perex.cz,
 tiwai@suse.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jbrunet@baylibre.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 srinivas.kandagatla@linaro.org, kuninori.morimoto.gx@renesas.com,
 zhangzekun11@huawei.com, ckeepax@opensource.cirrus.com,
 drhodes@opensource.cirrus.com, alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250520091131.4150248-1-aichao@kylinos.cn>
 <20250520091131.4150248-7-aichao@kylinos.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250520091131.4150248-7-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 20/05/2025 11:11, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.


I do not see any of_node_put() there, so I don't understand what is the
benefit of this and how this commit msg explains reason behind the change.

Best regards,
Krzysztof

