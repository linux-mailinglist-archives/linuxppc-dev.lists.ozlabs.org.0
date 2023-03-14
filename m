Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD06B9EC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:39:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbj415sl3z3cjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 05:39:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YMxIwVKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YMxIwVKW;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbj35631Cz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 05:38:40 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so65904248edb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQb9xNYiO/iqB9yTe53F4I/BNv5rnpqkcJdJqgkN/yI=;
        b=YMxIwVKW+ORVLq770f0gA4lET5jzOSy3ZQh4AlznVyWFNrVXfFtPVGs6/teC4bLGRU
         RJI9YCGObjhFCt271jml89Z5L/ua/DXnkPDIyouI5l/HzkOZ5NYwUlyoevrL/OoTbBdD
         H5eq2YAdPWhtwtqF5Eo0mWfvQLsHJpzRinpGBeLBTg/XDm+wx0FWPmJTvtboa+uLKIBX
         YpoUL534ITudo0gHSmUWj6/gLmHRzTRu54yzL4/lxlqr47vVP/j63XubJp+80yN3fdGa
         lsijvqc7NkixFdz48dZRxopNlgSoVAwyIHAaghbA4l7RQO7lIuZCbBDmPMhheW1O/6fF
         jbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQb9xNYiO/iqB9yTe53F4I/BNv5rnpqkcJdJqgkN/yI=;
        b=ZRnMytlopXEosU8FWl3ojUUIOz+7BxAID0fUzZk0HikXLs2IqqDJ1lD5EjlwGu0u1Z
         f2L/S5m28I8wQWUzJFJ3KqQlWIB+Txv5yJyjn3cuLCvZzOWfWDgm1aCf7zCPpu/6YIjL
         SqWiDthTVLb0LJVj5mDt4oxJnqD3xeQc/6odzbq0uz6hUQAsXQtVpt6p2yklnY9xHRCT
         0pJS4OzkcaIcFxqF5irtR4Y2XWtC0n0p/3hh1BRdMukunIWu/TH8ubuvNPBoAkCw+HR5
         D4DgnTQcbOh28CiQn8fjV8Wjxqf430s3o/tQXAdCoO5G3Iuc23we+h/G5DbkdPVDEmUK
         Mu5A==
X-Gm-Message-State: AO0yUKUuc2oUGbtP7WB2tNKRh7D+dMxia+H8I2RHBZGAvzE0vz0g+tEW
	+I4iAz80vEjJVPWFsuspf/ZC8nXq/Y8/xOeN9Xk=
X-Google-Smtp-Source: AK7set8E16Uwl1ox24Ycdl24SNjfY/EOBbiAWVFUEt7rR6u2ZMYnWft2fxxQv0yKGXq/Uqerghj//A==
X-Received: by 2002:a17:906:fa15:b0:92b:a3fe:53ca with SMTP id lo21-20020a170906fa1500b0092ba3fe53camr3166775ejb.30.1678818770388;
        Tue, 14 Mar 2023 11:32:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906848a00b008def483cf79sm1442158ejx.168.2023.03.14.11.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:32:49 -0700 (PDT)
Message-ID: <ad56ca5e-03f7-5e3d-6547-91c64fdb08d3@linaro.org>
Date: Tue, 14 Mar 2023 19:32:48 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
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

On 14/03/2023 19:09, Sean Anderson wrote:
> On 3/14/23 13:56, Krzysztof Kozlowski wrote:
>> On 13/03/2023 17:11, Sean Anderson wrote:
>>> This is a generic binding for simple MMIO GPIO controllers. Although we
>>> have a single driver for these controllers, they were previously spread
>>> over several files. Consolidate them. The register descriptions are
>>> adapted from the comments in the source. There is no set order for the
>>> registers, so I have not specified one.
>>>
>>> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
>>> has moved.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>> Linus or Bartosz, feel free to pick this up as the rest of this series
>>> may not be merged any time soon.
>>>
>>> Changes in v11:
>>> - Keep empty (or almost-empty) properties on a single line
>>> - Don't use | unnecessarily
>>> - Use gpio as the node name for examples
>>> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
>>>
>>> Changes in v10:
>>> - New
>>>
>>>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 134 ++++++++++++++++++
>>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>>  4 files changed, 135 insertions(+), 91 deletions(-)
>>>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>>> similarity index 78%
>>> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>>> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>>> index 4d69f79df859..e11f4af49c52 100644
>>> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>>
>>
>>> +
>>> +description:
>>> +  Some simple GPIO controllers may consist of a single data register or a pair
>>> +  of set/clear-bit registers. Such controllers are common for glue logic in
>>> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
>>> +  NAND-style parallel busses.
>>> +
>>> +properties:
>>> +  big-endian: true
>>> +
>>> +  compatible:
>>
>> Keep compatible as first property.
> 
> I thought it was alphabetical.

There is no clear rule, except that compatible is always first. In the
DTS reg is second, in bindings usually as well but not always.

> 
>>> +    enum:
>>> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
>>> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
>>> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
>>
>> I think you got comment that these comments are making things
>> unreadable. I don't see here improvement.
> 
> That was not the comment I got.

OK

> 
> | I think you can inline description: statements in the enum instead of
> | the # hash comments, however IIRC you have to use oneOf and
> | const: to do it, like I do in
> | Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
> | but don't overinvest in this if it is cumbersome.
> 
> I investigated this and determined it was cumbersome.

So just :

     # Western Digital MyBook Live memory-mapped GPIO controller
     - wd,mbl-gpio

> 
>> For example first comment is useless - you say the same as compatible.
>> Same with last one. So only remaining WD comment should be made in new
>> line so everything is nicely readable.
> 
> I don't understand what you mean by "made in new line". Anyway, I will
> leave just the WD comment.
> 
>> BTW, order the enum by name.
> 
> OK
> 
>>> +
>>> +  '#gpio-cells':
>>> +    const: 2
>>> +
>>> +  gpio-controller:
>>> +    true
>>
>> I am sure I saw comments here...
>>
>> https://lore.kernel.org/all/20230308231018.GA4039466-robh@kernel.org/
> 
> OK
> 
>>> +
>>> +  reg:
>>> +    minItems: 1
>>> +    description:
>>> +      A list of registers in the controller. The width of each register is
>>> +      determined by its size.
>>
>> I don't understand this comment. Aren't you describing now what 'reg' is
>> in DT spec? If so, drop. If not, please share more.
> 
> Each register describes exactly one hardware register. In some other
> device, when you see `regs = <0x8000000 0x100>`, then you may have 64
> 32-bit registers. But for this device, it would be one 2048-bit
> register.

Ah, so you do not mean here address space size? OK then, thanks for
clarification.

> 
>>>  All registers must have the same width. The number
>>> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
>>> +    items:
>>> +      - description:
>>> +          Register to READ the value of the GPIO lines. If GPIO line is high,
>>> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
>>> +          This register may also be used to drive GPIOs if the SET register is
>>> +          omitted.
>>> +      - description:
>>> +          Register to SET the value of the GPIO lines. Setting a bit in this
>>> +          register will drive the GPIO line high.
>>> +      - description:
>>> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
>>> +          register will drive the GPIO line low. If this register is omitted,
>>> +          the SET register will be used to clear the GPIO lines as well, by
>>> +          actively writing the line with 0.
>>> +      - description:
>>> +          Register to set the line as OUTPUT. Setting a bit in this register
>>> +          will turn that line into an output line. Conversely, clearing a bit
>>> +          will turn that line into an input.
>>> +      - description:
>>> +          Register to set this line as INPUT. Setting a bit in this register
>>> +          will turn that line into an input line. Conversely, clearing a bit
>>> +          will turn that line into an output.
>>> +
>>> +  reg-names:
>>> +    minItems: 1
>>> +    maxItems: 5
>>> +    items:
>>> +      enum:
>>
>> Why this is in any order? Other bindings were here specific, your 'reg'
>> is also specific/fixed.
> 
> Some devicetrees have dirout first, and other have dat first. There is no
> mandatory order, and some registers can be included or left out as is
> convenient to the devicetree author.
> 
> reg is not specific/fixed either. It is just done that way for
> convenience (and to match the names here).

The items have order and usually we require strict order from DTS,
unless there is a reason. If there is no reason, use fixed order and
then fix the DTS.

> 
>>> +        - dat
>>> +        - set
>>> +        - clr
>>> +        - dirout
>>> +        - dirin
>>> +
>>> +  native-endian: true
>>> +
>>> +  no-output:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description:
>>> +      If this property is present, the controller cannot drive the GPIO lines.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - '#gpio-cells'
>>> +  - gpio-controller
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    gpio@1f300010 {
>>> +      compatible = "ni,169445-nand-gpio";
>>> +      reg = <0x1f300010 0x4>;
>>> +      reg-names = "dat";
>>> +      gpio-controller;
>>> +      #gpio-cells = <2>;
>>> +    };
>>> +
>>> +    gpio@1f300014 {
>>> +      compatible = "ni,169445-nand-gpio";
>>> +      reg = <0x1f300014 0x4>;
>>> +      reg-names = "dat";
>>> +      gpio-controller;
>>> +      #gpio-cells = <2>;
>>> +      no-output;
>>> +    };
>>
>> No need to duplicate examples. Keep only one.
> 
> OK
> 
>> Everything is the same.
> 
> Except no-output.

I would argue that even one example with no-output is enough, but sure,
can be two in total.



Best regards,
Krzysztof

