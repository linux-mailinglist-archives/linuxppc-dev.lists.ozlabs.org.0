Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C299B6BA03C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 21:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbksD513gz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:00:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n38EiUE6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n38EiUE6;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbkrL3dvkz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:59:29 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so15166649edd.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678823965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr3yddhQQtiym6t4yIk1m3Wt6qYddFKcJfpTIfvkXJU=;
        b=n38EiUE6zuRBbBH2Xn5szv+hHVZi+Ibu+eQuUuWLzCks8g2OyaGeWDKxa5alYz7TeD
         yYRxo6OfA4V9yzpMhZlLrtdl8pAH0jppon3DEHl6mrqORgHhQ9jD9cc8Mlqlnk45iwNS
         sR/PjUmC2yFXe9gbW+usnh3vIkG0U+B8GYPEAFnEeceQC9nH3PTMMQgCTNgQT2tbGekS
         j3k04lOAFQir4MAznrLbliKoP9+64T+EW71Hao0sVG8BIFCSV1zsC5VD9lLtJAlZcjmL
         MxJ0B0TLDILrAmO4qTrvfyzFjX+cCttv9dEtoFo68vebB1V71whh1SNKNJSjA1tbASPa
         zb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr3yddhQQtiym6t4yIk1m3Wt6qYddFKcJfpTIfvkXJU=;
        b=mgJwDKexiaw65KSru3mt/awxG6RGv4Gi0znqaFSLMlJd0PUefh/tWEy67wCKmWyK+c
         Nc4x0bMvesoeyUKH+0kK7onXexTeAD+AwT/UkoymmQ03RmIK7dXRQkGe4cpiuaQ/ExQC
         hYSPdQa2oDILwFDY7UuZYxh/G4hY+ByDBwdh4bQOqMBaHSTaYSQuHr9/wr8U04JDGXwk
         SbhUroAlgKP0QYgjtidRvz8v5uOMa5UPOAFHlJtfwjeLhfHyf0H6UZHgVmhOb5KOGsmD
         9YBAUlVbSgR2eAoWg1/DkaBMEUP/z9cFHFw54PgKmMD4pXAHihSGy5hLsjQxfCtPyFI0
         Qc7g==
X-Gm-Message-State: AO0yUKWioD2AsM7uooMDDFE0medYVITAl3KnPl8vIgQS8UoJ7fPjRN6v
	cyT73cubTyVlbmAafb2vSqthkw==
X-Google-Smtp-Source: AK7set/+SCbFFrf18h4uJ8Q3iCIWWPTZZqUrG2OIJLrLkO06zFXJ2cKWTBMvXIGRdjKGZ7sQKU4qdA==
X-Received: by 2002:a17:906:950b:b0:8b1:77bf:3bdd with SMTP id u11-20020a170906950b00b008b177bf3bddmr4250199ejx.36.1678823965144;
        Tue, 14 Mar 2023 12:59:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709060b0b00b008e22978b98bsm1540234ejg.61.2023.03.14.12.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 12:59:24 -0700 (PDT)
Message-ID: <3d34e35f-fb5a-7522-9717-dd3402dd88d3@linaro.org>
Date: Tue, 14 Mar 2023 20:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
 <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
 <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
 <ad56ca5e-03f7-5e3d-6547-91c64fdb08d3@linaro.org>
 <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
 <a7fbaea5-927a-e4e8-d990-66b53d586d47@linaro.org>
 <b7f45fc2-85f5-ad29-2dc4-bc059cac022e@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b7f45fc2-85f5-ad29-2dc4-bc059cac022e@seco.com>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/03/2023 20:52, Sean Anderson wrote:
> On 3/14/23 15:45, Krzysztof Kozlowski wrote:
>> On 14/03/2023 19:50, Sean Anderson wrote:
>>> On 3/14/23 14:32, Krzysztof Kozlowski wrote:
>>>> On 14/03/2023 19:09, Sean Anderson wrote:
>>>>> On 3/14/23 13:56, Krzysztof Kozlowski wrote:
>>>>>> On 13/03/2023 17:11, Sean Anderson wrote:
>>>>>> +  reg-names:
>>>>>>> +    minItems: 1
>>>>>>> +    maxItems: 5
>>>>>>> +    items:
>>>>>>> +      enum:
>>>>>>
>>>>>> Why this is in any order? Other bindings were here specific, your 'reg'
>>>>>> is also specific/fixed.
>>>>>
>>>>> Some devicetrees have dirout first, and other have dat first. There is no
>>>>> mandatory order, and some registers can be included or left out as is
>>>>> convenient to the devicetree author.
>>>>>
>>>>> reg is not specific/fixed either. It is just done that way for
>>>>> convenience (and to match the names here).
>>>>
>>>> The items have order and usually we require strict order from DTS,
>>>> unless there is a reason. If there is no reason, use fixed order and
>>>> then fix the DTS.
>>>
>>> The items do not have order. That is the whole point of having a
>>> separate names property. The DTs are not "broken" for taking advantage
>>> of a longstanding feature. There is no advantage to rewriting them to
>>> use a fixed order, especially when there is no precedent. This is just
>>> an area where json schema cannot completely validate devicetrees.
>>
>> I don't understand "there is no precedent".There is - we rewrite
>> hundreds of DTS. Just look at mine and other people commits.
> 
> There is no precedent for a fixed order of registers for this device.
> We have always used reg-names to interpret regs.

And who is "we"? Bootloader? Firmware? BSD? Because they all matter. It
does not matter that one particular driver uses reg-names. The common
rule is always the same - entries are ordered and fixed (with exceptions).

> 
>> The reg-names are helper and entries were always expected to be ordered
> 
> This is not the case for this device. Registers may be in any order, and

Their physical order does not determine the order of entries in DT.

> some registers may be omitted (and not always the same ones).

OK, that's the reason.

> reg-names is the
> only way to determine which registers are present.


Best regards,
Krzysztof

