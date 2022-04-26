Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C350F188
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 08:54:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnXfg4YKpz3bpf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 16:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x2RzL+Ht;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=x2RzL+Ht; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnXf04xdwz2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 16:53:26 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id gh6so10004334ejb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q40uyIs3xy8w9+WmqoeowW/ecHV3cseBYLZ+cOlF5Ew=;
 b=x2RzL+HtmzrhBc8qv/r2cwqJLfFCCozO2PVNKmUiM7Dv92qDUCcmgDQAz97JnmG/Lu
 6Ev868iq3M7ypokHiRCcWOBClvbPXuXb0JPdpZTxQXeEGtPyBCzuiJAqUCDIkFA6a/ni
 IPtn98jd5aa1LnUC3F4YtJ8vpJInb4lcYvN7J2RUio5OYvv6YrgG3FKm1kfgtBhLUbP/
 KHQkXJxG+PZEGe+vtmvpGxuwbFEPMtsTa73MaSrzT7Exk2vQcNnh7TFDT5EJ4pDxflGG
 CeVS2H3yVoZMIijX5/Ud72YLP/xnXc2BIttio0A5QGWniUmgAeGRqOGuzg55OL2qXUb5
 2lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q40uyIs3xy8w9+WmqoeowW/ecHV3cseBYLZ+cOlF5Ew=;
 b=GWFKN+iyI+0Fyqqq0cOpq8qWAZ6V9lUAxeR3iFuh7Y7EuUcJfRtifa+k2vzGWUvH/D
 d+4RhaCnVVXClJIACyXuxCHmZVT5+iqJ5QYZPOstIwoCc30+okMuw4HJtbje/WAHmG3c
 8CIzWTDZ3PVp8zd8RmUwy2sLAM5zXXgkGFo2fVe5/xQOH9x7KCG9V4op+QRDi7xcYa7P
 tWkrIsqDd8Tm84ua7HV1Tqomnb/7kVJUuQGdxQsV8zZKhChwt/jaVnbXbkDcApPZonHP
 8vWVjYRpPUYhiPw+xHhCno1uuyYM1gXCvwhcGQeS7OGHQ/IKOPrxv6ixCTNfQPfrlH1m
 79Tw==
X-Gm-Message-State: AOAM533cSX7Ft/gmTNt76sepdAGsckVTIvqkxKwtbSKFHkcUwSCoKTZ0
 PV/4o3llIJ0KmdMtyl67nR5a2A==
X-Google-Smtp-Source: ABdhPJx+1t6SUKBo8VMaI71GznlhDLDPRtmEPfD+f3z/pZNKjISvnVzcMhRQ3d2QoeqqC8yUOa3plg==
X-Received: by 2002:a17:907:d26:b0:6f0:2a0:d3d5 with SMTP id
 gn38-20020a1709070d2600b006f002a0d3d5mr18853912ejc.608.1650955999804; 
 Mon, 25 Apr 2022 23:53:19 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm4371417ejh.214.2022.04.25.23.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 23:53:19 -0700 (PDT)
Message-ID: <c324eec7-79b1-33da-c38e-4a480fe23126@linaro.org>
Date: Tue, 26 Apr 2022 08:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220425140214.32448-1-michael@walle.cc>
 <658851ed-33fd-8e2b-7db7-ef1ca9e31c33@linaro.org>
 <83b596d0570c779c61c3c37c6f512679@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <83b596d0570c779c61c3c37c6f512679@walle.cc>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/04/2022 23:58, Michael Walle wrote:
>>> +  reg:
>>> +    maxItems: 1
>>> +    description:
>>> +      Specifies the Interrupt Polarity Control Register (INTPCR) in 
>>> the
>>> +      SCFG or the External Interrupt Control Register (IRQCR) in the 
>>> ISC.
>>> +
>>> +  interrupt-map:
> 
> btw.
> 
> minItems: 12
> maxItems: 12
> 
> Isn't working here, is that expected? The validator seem to get the 
> count
> of the elements of one tuple wrong.
> 
> I.e.
> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: 
> interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 
> 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 
> 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 
> 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too 
> short


Works for me (in different schema)... maybe update your dtschema?

> 
>>> +    description: Specifies the mapping from external interrupts to 
>>> GIC interrupts.
>>> +
>>> +  interrupt-map-mask:
>>> +    items:
>>> +      - const: 0xffffffff
>>
>> This looks highly permissive mask and should be instead defined per
>> variant, for example (quickly looking at DTS):
>> 0x7 for ls1021
>> 0xf for ls1043a and ls1088a
> 
> Just that I understand it correctly, the result of the AND with that
> mask is then looked up in the interrupt-map (the first entry there)?

Yes, the child (first) interrupt specifier. Since address-cells are 0,
this will be bit-AND with [0-5].

>> You might need to correct the DTS. Some confirmation from someone with
>> datasheet would be good.
> 
> According to their datasheets they have the following number of external
> IRQs:
> - ls1021a has 6,
> - ls1043a has 12,
> - ls1046a has 12,
> - ls1088a has 12,
> - ls2080a has 12,
> - lx2160a has 12.
> 
> That is what I need to confirm, right?

Yes.

> 
> Is there a better way than the following snippet:
> 
> properties:
>    interrupt-map-mask: true
> 
> allOf:
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,ls1021a-extirq
>      then:
>        properties:
>          interrupt-map-mask:
>            items:
>              - const: 0x7
>              - const: 0
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,ls1043a-extirq
>                - fsl,ls1046a-extirq
>                - fsl,ls1088a-extirq
>                - fsl,ls2080a-extirq
>                - fsl,lx2160a-extirq
>      then:
>        properties:
>          interrupt-map-mask:
>            items:
>              - const: 0xf
>              - const: 0
> 


Exactly like this, looks good. Thank you.


Best regards,
Krzysztof
