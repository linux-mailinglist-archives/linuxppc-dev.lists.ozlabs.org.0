Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA955FC67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 11:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXxbV0k28z3drP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 19:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wpGThOR7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wpGThOR7;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXxZt4rNDz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 19:52:19 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id cw10so31479128ejb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6tZawx/9KvgNGCX+RaVKaFvJ//Nr2mQ3IUwBnbuxxrE=;
        b=wpGThOR7zN3wwT1G2udwoIdQi3m58vQp7umRdMIx588ZgebigGNDUD/zA11XpwQTV6
         oBuXQgAqo2ZGDl3YOO1FTBClcdj2VeDsGwQ41Ki+NLYlXK3p17N/w0sgXowVLAz6gj9G
         mHqfzGyVdq/ksdFMf/+szPdeY/H4L7rx6kpx/B8ViMwvPKTiEUZHc288fxH8aSLGsVQ0
         hqgDJvcDhDQCIuu398z7aVpp/Rt4/He4PF31L12FbgJYzzVoxUpNDXXU48Q4/Oz09EAA
         Wx2mPuE5Z6H1RtdjjjvWyhYtwSnzXUd96bjq6z/426dI02NIxRbNzHLe1uU61m1HYwHM
         VCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6tZawx/9KvgNGCX+RaVKaFvJ//Nr2mQ3IUwBnbuxxrE=;
        b=YhoS6HDgHO54WaC6BznFmD/hLsEzsidsH/klhoZY1vegIFI9bbaSpbcFX6BIVeL0U6
         JnfZ8P/ZczeAducsqcidaShldbUNZMiPZRz3UuhdurmLiNav4Of45vqwUbXKO7zaQliZ
         V692gmRpspXf+/UXVzT+iZnJWf4jDTlZ3Fw/EPJ0pUNzK5INzxcI2dQJuf8bO2Egd+az
         Ri06Kop+fcTkccgFZfkxjPiaRVEIdEk/LZYKOT4bVaML2v92BPp9sfrHF2tg/O9On65J
         fPwzELFXRv7u2A1xyzt/nNWcXqFG4YsDS+6GKTECYFxV+tOz076kavTOk3dKMy/QyZwu
         i29w==
X-Gm-Message-State: AJIora99uJZKb+l4iRG/Gf+MefCKYd2V9cRa1ozTCaH0ydfaev5Dbcnf
	jVACSXcrKZhjBPP0RUVRHiKzQA==
X-Google-Smtp-Source: AGRyM1sHNVbuwC4B5+16VAXfgwwzgpSOVD1kaQyMjso1TU2vM8rQdVwy+kmEX8zb8+gkUaUloHag4w==
X-Received: by 2002:a17:906:7a0b:b0:722:dac6:a8ff with SMTP id d11-20020a1709067a0b00b00722dac6a8ffmr2390293ejo.593.1656496329142;
        Wed, 29 Jun 2022 02:52:09 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c20-20020a056402101400b004358cec9ce1sm11009012edu.65.2022.06.29.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:52:08 -0700 (PDT)
Message-ID: <86a4814f-e881-d8dd-f338-48583363af53@linaro.org>
Date: Wed, 29 Jun 2022 11:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/12] dt-bindings: wiiu: Document the Nintendo Wii U
 devicetree
Content-Language: en-US
To: Ash Logan <ash@heyquark.com>, krzysztof.kozlowski+dt@linaro.org,
 paulus@samba.org, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 robh+dt@kernel.org, benh@kernel.crashing.org
References: <20220622131037.57604-1-ash@heyquark.com>
 <20220628133144.142185-1-ash@heyquark.com>
 <20220628133144.142185-2-ash@heyquark.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628133144.142185-2-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/06/2022 15:31, Ash Logan wrote:
> Adds schema for the various Wii U devicetree nodes used.
> 
> Signed-off-by: Ash Logan <ash@heyquark.com>
> ---
>  .../bindings/powerpc/nintendo/wiiu.yaml       | 28 +++++++++++
>  .../powerpc/nintendo/wiiu/espresso-pic.yaml   | 42 +++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/gpu7.yaml  | 41 +++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-ahci.yaml     | 43 +++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-dsp.yaml      | 35 ++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-pic.yaml      | 46 +++++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-sdhci.yaml    | 40 ++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/latte.yaml | 25 ++++++++++
>  8 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
> new file mode 100644
> index 000000000000..5824b07928f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U bindings
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Nintendo Wii U video game console binding.
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U video game console
> +        items:
> +          - const: nintendo,wiiu
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
> new file mode 100644
> index 000000000000..878a81595f5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/espresso-pic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U "Espresso" interrupt controller
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Interrupt controller found on the Nintendo Wii U for the "Espresso" processor.
> +
> +properties:
> +  compatible:
> +    oneOf:

No need for oneOf, just const.

> +      - description: Nintendo Wii U "Espresso" interrupt controller

No need for description.

> +        items:
> +          - const: nintendo,espresso-pic
> +  '#interrupt-cells':
> +    # Interrupt numbers 0-32 in one cell
> +    const: 1

Blank line between each property.

> +  interrupt-controller: true
> +  reg:
> +    items:
> +      - description: Core registers

Just maxItems:1. Description is not helpful.

Missing required properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    espresso_pic: pic@c000078 {

Generic node name, so "interrupt-controller"

> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +
> +            compatible = "nintendo,espresso-pic";
> +            reg = <0x0c000078 0x18>;

compatible and reg by convention go first in list of properties. This
applies everywhere, also to your DTS.

> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
> new file mode 100644
> index 000000000000..e54d49015f36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/gpu7.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U Latte "GPU7" graphics processor
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  GPU7 graphics processor, also known as "GX2", found in the Latte multifunction chip of the
> +  Nintendo Wii U.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U Latte "GPU7" graphics processor
> +        items:
> +          - const: nintendo,latte-gpu7
> +  reg:
> +    items:
> +      - description: GpuF0MMReg registers
> +  interrupts:
> +    items:
> +      - description: Main interrupt, connected via Espresso PIC

Same comments as your interrupt controller patch. I guess these comments
apply everywhere here.

Missing required properties.

> +
> +# This will likely get bound to the Radeon driver one day, which will neccesitate extra properties
> +additionalProperties: true

No, it must be false. It's okay to extend the binding later.

> +
> +examples:
> +  - |
> +    gpu7@c200000 {

Generic node name, so "gpu".

> +            compatible = "nintendo,latte-gpu7";

Wrong indentation. Use four spaces for DTS example.

> +            reg = <0x0c200000 0x80000>;
> +            interrupts = <2>;
> +            interrupt-parent = <&espresso_pic>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
> new file mode 100644
> index 000000000000..7b9de4effcb0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-ahci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U Latte AHCI controller
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Nintendo Wii U AHCI SATA controller, as found in the Latte chip.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U Latte AHCI controller
> +        items:
> +          - const: nintendo,latte-ahci
> +  reg:
> +    items:
> +      - description: |
> +          HBA memory registers. Note that unlike the spec, space for only 6 ports exist, with 2 vendor
> +          registers afterwards, thus register space should be 0x408 long (0x100+0x80*6+0x8).

Here description can stay, so no need for maxItems.


> +  interrupts:
> +    items:
> +      - description: Main HBA interrupt
> +      - description: Vendor debugging interrupt
> +

This should also reference ahci schema (I think it is ready).

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sata: ahci@d160400 {
> +          compatible = "nintendo,latte-ahci";
> +          reg = <0x0d160400 0x408>;

Fix indentation.

> +
> +          interrupt-parent = <&latte_pic>;
> +          interrupts = <38>, <28>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
> new file mode 100644
> index 000000000000..ed0b4c28ce48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U Latte DSP
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Nintendo Wii U digital signal processor, as found in the Latte chip.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U Latte DSP
> +        items:
> +          - const: nintendo,latte-dsp
> +  reg:
> +    items:
> +      - description: DSP registers
> +
> +# Once more is known about this device more properties will likely be added
> +additionalProperties: true

Again, no. All other comments also apply.

> +
> +examples:
> +  - |
> +    latte_dsp: dsp@c005000 {
> +         compatible = "nintendo,latte-dsp";
> +         reg = <0x0c005000 0x200>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
> new file mode 100644
> index 000000000000..a2df71fb9964
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-pic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U Latte interrupt controller
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Interrupt controller found on the Nintendo Wii U for the "Latte" devices.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U Latte interrupt controller
> +        items:
> +          - const: nintendo,latte-pic
> +  '#interrupt-cells':
> +    # Interrupt numbers 0-64 in one cell.
> +    const: 1
> +  interrupt-controller: true
> +  reg:
> +    items:
> +      - description: Core registers
> +  interrupts:
> +    items:
> +      - description: Cascade interrupt for Espresso PIC
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    latte_pic: pic@d800440 {

interrupt-controller.

All other comments apply.

> +         #interrupt-cells = <1>;
> +         interrupt-controller;
> +
> +         compatible = "nintendo,latte-pic";
> +         reg = <0x0d800440 0x30>;
> +         interrupt-parent = <&espresso_pic>;
> +         interrupts = <24>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
> new file mode 100644
> index 000000000000..4b9b0820edc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U Latte SD Host controller
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  SDHCI hosts found on the Nintendo Wii U's Latte SoC for SD cards and SDIO devices.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U Latte SDHCI
> +        items:
> +          - const: nintendo,latte-sdhci
> +          - const: sdhci
> +  reg:
> +    items:
> +      - description: Core registers
> +  interrupts:
> +    items:
> +      - description: SDHCI interrupt

You need to reference mmc-controller bindings in allOf.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sdcard_0: sdhci@d070000 {

Node name: mmc

The bindings look poor, several easy to fix mistakes. I suggest to open
example-schema.yaml and start from there.

Best regards,
Krzysztof
