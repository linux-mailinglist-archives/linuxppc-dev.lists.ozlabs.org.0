Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694126B9DAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 18:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbh7q59ncz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 04:57:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IQfJITGI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IQfJITGI;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbh6r45xDz3cKm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 04:56:50 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id z21so133862edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678816602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBAdudaa5OwS68f0uZK/unstmFHq5M3zw+2tcO53Zq8=;
        b=IQfJITGI5ZNI33OajIaXutN5rC2BX75h5a7QWvvS7cs+Bsd6qzJI8DIKrMv3iICbBL
         VgyYu6jTKZedQHe3vQ7bXK9gqO/IT5LkTGA/lSNTLq8Vwtb9qJyAaChDD8v3vTBF3EkZ
         fqY3FSWFi3DyJDtzlNjMcrZgHq6ohEC50aePxaHLZr9VDf/jdMGadDQKaRZ7s95sSxDR
         ohvTlInGPaHJjFal0b6r/nRn+ezWiYRAyQV8b0yup8DjXt266T16rPY1w+hhs6Z+mYnh
         LUUIs5HOzI2rT84gq0uu395D9OjbnmRgTRfB6OR4GthfN4uesaxKIqVSp/sIJkmToc21
         ryzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678816602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBAdudaa5OwS68f0uZK/unstmFHq5M3zw+2tcO53Zq8=;
        b=B2OmORL9VCcPrlfybLmCvn2sO7xdak1MjAc85Lq1nBfMj5usHyPEHhBkskBjjKLvsf
         Rw/WpTwOEh9unEP2cUFbAO+pmX3CNKPHoQ5P8u0ki+MPsl1bwghmxNk111tU53Y7d9cz
         +yTYzIZd98eOJ/i5i9tpEMzbuTJJ+hClA1X6ffTNk4aSJFuaKb5sVcNH3PUZ3odDvbvv
         TI2FwRjzplhsyU0fFJhYpa2zSabq2n9fdGEVa2LNNFs9oKykigP3BldfjeqqPNKqLunL
         AEn5EHLxEbs+rldT6WcU4pbXviDrmh5dN+NWoE95g+MZDMqUzURugO94nHi8+Ar1MICn
         AHrw==
X-Gm-Message-State: AO0yUKVUsGt/zTRMnFkLMLB0bVcJbtT6C/Sx6aNgyMYcT311auXIhG2g
	opAy8rpGVxcnsZg9AqKI3jJezw==
X-Google-Smtp-Source: AK7set/VmYsgH6FiXcXVlsj6D3W7RyTlZ0vFACe6rXBooAVbxkCIYcdML6pkyiokc3OU1DDaaYwUAg==
X-Received: by 2002:aa7:c508:0:b0:4ad:7a9f:a9f0 with SMTP id o8-20020aa7c508000000b004ad7a9fa9f0mr35568684edq.22.1678816602556;
        Tue, 14 Mar 2023 10:56:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id i19-20020a508713000000b004af62273b66sm1392473edb.18.2023.03.14.10.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 10:56:42 -0700 (PDT)
Message-ID: <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
Date: Tue, 14 Mar 2023 18:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
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

On 13/03/2023 17:11, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 134 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 135 insertions(+), 91 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> similarity index 78%
> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml


> +
> +description:
> +  Some simple GPIO controllers may consist of a single data register or a pair
> +  of set/clear-bit registers. Such controllers are common for glue logic in
> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
> +  NAND-style parallel busses.
> +
> +properties:
> +  big-endian: true
> +
> +  compatible:

Keep compatible as first property.

> +    enum:
> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller

I think you got comment that these comments are making things
unreadable. I don't see here improvement.

For example first comment is useless - you say the same as compatible.
Same with last one. So only remaining WD comment should be made in new
line so everything is nicely readable.

BTW, order the enum by name.


> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller:
> +    true

I am sure I saw comments here...

https://lore.kernel.org/all/20230308231018.GA4039466-robh@kernel.org/

> +
> +  reg:
> +    minItems: 1
> +    description:
> +      A list of registers in the controller. The width of each register is
> +      determined by its size.

I don't understand this comment. Aren't you describing now what 'reg' is
in DT spec? If so, drop. If not, please share more.

>  All registers must have the same width. The number
> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
> +    items:
> +      - description:
> +          Register to READ the value of the GPIO lines. If GPIO line is high,
> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
> +          This register may also be used to drive GPIOs if the SET register is
> +          omitted.
> +      - description:
> +          Register to SET the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line high.
> +      - description:
> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line low. If this register is omitted,
> +          the SET register will be used to clear the GPIO lines as well, by
> +          actively writing the line with 0.
> +      - description:
> +          Register to set the line as OUTPUT. Setting a bit in this register
> +          will turn that line into an output line. Conversely, clearing a bit
> +          will turn that line into an input.
> +      - description:
> +          Register to set this line as INPUT. Setting a bit in this register
> +          will turn that line into an input line. Conversely, clearing a bit
> +          will turn that line into an output.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:

Why this is in any order? Other bindings were here specific, your 'reg'
is also specific/fixed.

> +        - dat
> +        - set
> +        - clr
> +        - dirout
> +        - dirin
> +
> +  native-endian: true
> +
> +  no-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If this property is present, the controller cannot drive the GPIO lines.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@1f300010 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300010 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +    gpio@1f300014 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300014 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      no-output;
> +    };

No need to duplicate examples. Keep only one. Everything is the same.


Best regards,
Krzysztof

