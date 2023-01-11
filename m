Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A408A66585D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 10:59:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsNSD3Plcz3fBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 20:59:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNHLAM9U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNHLAM9U;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsNRG56ZNz2y32
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 20:58:18 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id h16so14458993wrz.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 01:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CHpIDH1rMG1Owv5eVtyw16nuH+y+qhna5O7yLLSeRw=;
        b=RNHLAM9UMNWjzNdMdG9Xyke7V2tvwiaMWk2yetrWIWk9PiP/TiIgBaI7hQJ48yicT4
         ikwmc6VkZcZmcvmInImlhlTcbzYAdTtI0ONi7CsZfA/3YVmrSVuC6Lj5FmVYzx9abd2z
         IbpjEW7Fe0Um491Fc2PgQwnUgaK8c+u/gHBtfSORSP1rSCb8HbiQY7ZgqFvK7jTK/1vr
         MUHsO9KB+uPJQItW/4BEcTne3K4I6ZuK1oa8sfXQzHAlwRaT5w5ilr97DBqfJD9cgewo
         NWUgqy4lD4+ZXvkI/W53F2X28SAzkNK4d/r/0BXXP4t3zVLrdhBmcLjZf3NySRS0ECLc
         PHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CHpIDH1rMG1Owv5eVtyw16nuH+y+qhna5O7yLLSeRw=;
        b=5K2+OJV9ibBPdw12SWyc0E4L41y6hc1rFVfDS9GugDf+FwL4EYV8urZtaVh90UkWHj
         5H8+b/SvTEn8MHi/otPRQO+5cs9RuBT/6DPSzChcBdd2/aEjjM7UvP9rUnj8mpCylNiu
         p2g/S/mLuYC0b7Zo8MPovB5fzzqq992zbkI8ySIhEu6vq6xXhmCNkOIZREwMmvUma4hc
         a/2SE6JAlgNKMGJ29jAQWx/0EW7D2TADBdEeMmLD5sFwthvPa+LuxU/zDda24x+WnuWR
         AxcuH4t79e2k8uS8rDUNBM6+ifT2naqcXCoilxTif6S6J7C1DKWli0IWC0b8lQ3FuXON
         dPQw==
X-Gm-Message-State: AFqh2kqbfEaUthqs5tdjS6io9YVJ9l8n7hZ3C9YjmanBpfedjif4lo4l
	vcyQV6GewU920n32RWKEdjgEvQ==
X-Google-Smtp-Source: AMrXdXvOO92JdADUb6pK4nZXTuSXDpapYvVg5c/tyfJN2x9QXp+QTXqy7lCQx9L1qO0ZWPHWZu3bXw==
X-Received: by 2002:adf:fb88:0:b0:242:1809:7e17 with SMTP id a8-20020adffb88000000b0024218097e17mr40370295wrr.6.1673431094509;
        Wed, 11 Jan 2023 01:58:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020adfe786000000b002bdbde1d3absm3053607wrm.78.2023.01.11.01.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:58:14 -0800 (PST)
Message-ID: <1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org>
Date: Wed, 11 Jan 2023 10:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-9-herve.codina@bootlin.com>
 <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
 <20230110090728.2024b5eb@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110090728.2024b5eb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/01/2023 09:07, Herve Codina wrote:
>>> +      qmc-chan:  
>>
>> Missing vendor prefix.
> 
> Will be changed to 'fsl,qmc-chan'
> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array  
>>
>> Why this is not a phandle?
> 
> I have try '$ref: /schemas/types.yaml#/definitions/phandle'
> 
> I have an error from make dt_binding_check: 
>   dai@16:fsl,qmc-chan:0: [4294967295, 16] is too long
> 
> I need a phandle with an argument ie <&qmc 16>.
> Is there an alternative to phandle-array to handle this case ?

OK, then you need items like here:
https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


Best regards,
Krzysztof

