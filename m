Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD569AE02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJDcr1KG7z3fBf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 01:25:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OJ7TQIHz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OJ7TQIHz;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJDbt4lj3z3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 01:24:56 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id er25so4646940edb.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFjYG4jLURw1kYo7ShDSCBnd1OYlrQohbQF4zsR/gVk=;
        b=OJ7TQIHzJQsa9/EIpru1db+VCZ+X8QPOmP8Ua+5RufEjNaROgv5Dn9z0CgKGtVsa7X
         CNn1AyalhSJZY4Yyk818UgKQh8HiZo36uePEcFO6JiJavsq/SrbxryXvtXI2qPYjBsHQ
         GuF9Erxp4Uz3LxkoIF0rKcclWfy+iF8GSohzT0lI2imelyWfBKATTefqn5GExQgtaAox
         tzoYg81uHbP/ty0VRPfsz8fo4qWr22tRn3VwyvCUoZYcAhIhl3Zt8kUoa6pAOdOIw02F
         afh8zWhUZBDzuP3pY1+DT4w6RnVe70qzP41d4lnTSKDyX1AZljqUeG2KLhdEEUsxB0u+
         /t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFjYG4jLURw1kYo7ShDSCBnd1OYlrQohbQF4zsR/gVk=;
        b=cVoKZC6+DnggVxjNhEhfXOBOsxyGOQ6rIQqXwIQ3dJxNzRIjxnMtg3VMETrdPKdOfC
         xn9ndR5eDVyzMj4fdOU/jo8RLsGRS+0vQVdy4ICF8emu129DiZfsFGORMDEkTjHoI90N
         YZ88C/q/YP6sq6oACnlxtxHwykZqeswWfLjgvw9DzS8rQivK5HH6WVZGoPTO/8NM8Pze
         lzKsQz7NrS9eeoq8zFOzzAX/zQYj37zUk6h8H5imWiUaOU/igqidpK82M9dizBkob2j5
         Eur9y7n2W2tRXKxtzSuF14KZnd3vC2lPJT+YSalA6FZSk+Aybov0JresAXvMxrrnpZOl
         XMeg==
X-Gm-Message-State: AO0yUKVtT6c9SrtHjoaMlIKo1pLhNnMJKCIC/7RkdZhBH7kou0EP/1Xu
	007CXjyUyb1QsrFG5ZLy5ddzig==
X-Google-Smtp-Source: AK7set8cRq4IQx60rnukD9fbsNxxPpGXqav2rSq1nDhiVMKrQpHtAHfPgWf+DofWiP2cGt75L4meVA==
X-Received: by 2002:a17:906:6454:b0:8b1:4507:eec with SMTP id l20-20020a170906645400b008b145070eecmr758694ejn.34.1676643889054;
        Fri, 17 Feb 2023 06:24:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906139b00b008b14399b74fsm2155741ejc.201.2023.02.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 06:24:48 -0800 (PST)
Message-ID: <272c1291-dfea-3dcb-9462-5f84c55f7637@linaro.org>
Date: Fri, 17 Feb 2023 15:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <20230216134226.1692107-2-herve.codina@bootlin.com>
 <6ae9af19-1d52-c31f-79be-a36f06caaf80@linaro.org>
 <20230217145019.0def6f9a@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217145019.0def6f9a@bootlin.com>
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

On 17/02/2023 14:50, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Fri, 17 Feb 2023 10:14:48 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 16/02/2023 14:42, Herve Codina wrote:
>>> Add support for the time slot assigner (TSA)
>>> available in some PowerQUICC SoC such as MPC885
>>> or MPC866.
>>>
>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>> ---
>>>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 234 ++++++++++++++++++
>>>  include/dt-bindings/soc/fsl,tsa.h             |  13 +
>>>  2 files changed, 247 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
>>>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
> 
> [...]
>>> +
>>> +patternProperties:
>>> +  '^tdm@[0-1]$':
>>> +    description:
>>> +      The TDM managed by this controller
>>> +    type: object
>>> +
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 1
>>> +        description:
>>> +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
> [...]
>>> +
>>> +      fsl,rx-frame-sync-delay-bits:
>>> +        enum: [0, 1, 2, 3]  
>>
>> maxItems: 1
> 
> The property is an enum
> Why this maxItems value ?

Hm, it's an array, but you are right that enum forces dtschema to
interpret it as scalar value, so your code is correct.
> 
> If I add the maxItems value, I've got some dt_binding_check errors:
>   /xxxx/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml:
>   patternProperties:^tdm@[0-1]$:properties:fsl,rx-frame-sync-delay-bits:
>   'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

Best regards,
Krzysztof

