Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E724B6314E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 16:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFZHd4v5wz3f4r
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 02:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.53; helo=mail-oa1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFZH229nHz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 02:30:52 +1100 (AEDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-141ca09c2fbso11215948fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 07:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVXsWKmUu84AHlrYVgKd8m6jeh7lnHZqLNxGPaZlsRo=;
        b=dbsRTPg6BjRws/WRJx7Pbp+vAuaDA/7fgNyPFT30756DWYI03K92EztpcHE5ihTvkD
         IYV5db1Bb9v8xqtI/9ndP2LwU3q8/vfEoCMh6wl6WNZfdIUkhTjgywvovCghpKPMVL2W
         IJzs5fJgpjMVQS4oa0mGOoH+WkD5IJvnFAQ5dYWWvdRBl9A1ei9WKfEUtCzI4wXNhUJh
         xHL240o8rkDlwWP+xLp+ST+UVBwmG8PNGmrMUmEnx3nhBP5M890i1l4NhgnLScRje57y
         7nTtWSzzd3JtWtOAhE+LH2cDJq6yBOFC2OktDf7d9dnnJ/InN/prUgqqNN3376BUmR9Q
         ehlw==
X-Gm-Message-State: ANoB5pmxshjCaJphgh9pcdw5n3XIHX2gN59C0YGhziOfc0aqsoUluOgu
	DjIXJbfm7H/ZH1S4JIr/Og==
X-Google-Smtp-Source: AA0mqf6VfeJvk+z6L9WRgBnkJFM21HtxaOk/a6KyEBk+TdNGXuE9m7pjso+JVkWxi/wjwZ8ESSgz9Q==
X-Received: by 2002:a05:6870:ab06:b0:142:d9b9:c4ae with SMTP id gu6-20020a056870ab0600b00142d9b9c4aemr1120231oab.179.1668958249285;
        Sun, 20 Nov 2022 07:30:49 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f6:1a48:29f6:113d:266f:a78e])
        by smtp.gmail.com with ESMTPSA id a18-20020a056870d61200b0012b298699dbsm4808953oaq.1.2022.11.20.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 07:30:48 -0800 (PST)
Received: (nullmailer pid 3092241 invoked by uid 1000);
	Sun, 20 Nov 2022 15:30:49 -0000
Date: Sun, 20 Nov 2022 09:30:49 -0600
From: Rob Herring <robh@kernel.org>
To: Ash Logan <ash@heyquark.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: wiiu: Document the Nintendo Wii U
 devicetree
Message-ID: <20221120153049.GA3081277-robh@kernel.org>
References: <20220628133144.142185-1-ash@heyquark.com>
 <20221119113041.284419-1-ash@heyquark.com>
 <20221119113041.284419-2-ash@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221119113041.284419-2-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, paulus@samba.org, rw-r-r-0644@protonmail.com, krzysztof.kozlowski+dt@linaro.org, pali@kernel.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 19, 2022 at 10:30:31PM +1100, Ash Logan wrote:
> Adds schema for the various Wii U devicetree nodes used.
> 
> Signed-off-by: Ash Logan <ash@heyquark.com>
> ---
> v3->v4: Rework to match expected style and conciceness.
> 
>  .../bindings/powerpc/nintendo/wiiu.yaml       | 25 +++++++++
>  .../powerpc/nintendo/wiiu/espresso-pic.yaml   | 48 ++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/gpu7.yaml  | 42 ++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-ahci.yaml     | 50 +++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-dsp.yaml      | 35 ++++++++++++
>  .../powerpc/nintendo/wiiu/latte-pic.yaml      | 55 +++++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-sdhci.yaml    | 46 ++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/latte.yaml | 31 +++++++++++
>  .../devicetree/bindings/usb/generic-ehci.yaml |  1 +
>  9 files changed, 333 insertions(+)
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
> index 000000000000..23703b1052d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nintendo Wii U bindings

Everything is a binding, so drop 'bindings'. 

> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |

Don't need '|' if no formatting.

> +  Nintendo Wii U video game console binding.
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +
> +  compatible:
> +    const: nintendo,wiiu
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
> new file mode 100644
> index 000000000000..476a8ccda7a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
> @@ -0,0 +1,48 @@
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
> +allOf:
> +  - $ref: "/schemas/interrupt-controller.yaml#"

Drop quotes.

> +
> +properties:
> +  compatible:
> +    const: nintendo,espresso-pic
> +
> +  '#interrupt-cells':
> +    # Interrupt numbers 0-32 in one cell
> +    const: 1
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@c000078 {
> +        compatible = "nintendo,espresso-pic";
> +        reg = <0x0c000078 0x18>;
> +        #interrupt-cells = <1>;
> +        interrupt-controller;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
> new file mode 100644
> index 000000000000..d44ebe0d866c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
> @@ -0,0 +1,42 @@
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

Wrap lines at 80 unless some advantage to 100.

> +  Nintendo Wii U.
> +
> +properties:
> +  compatible:
> +    const: nintendo,latte-gpu7
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpu@c200000 {
> +        compatible = "nintendo,latte-gpu7";
> +        reg = <0x0c200000 0x80000>;
> +        interrupts = <2>;
> +        interrupt-parent = <&espresso_pic>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
> new file mode 100644
> index 000000000000..a53971a11e89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
> @@ -0,0 +1,50 @@
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
> +allOf:
> +  - $ref: "/schemas/ata/ahci-common.yaml#"
> +
> +properties:
> +  compatible:
> +    const: nintendo,latte-ahci
> +
> +  reg:
> +    items:
> +      - description: |
> +          HBA memory registers. Note that unlike the spec, space for only 6 ports exist, with 2 vendor
> +          registers afterwards, thus register space should be 0x408 long (0x100+0x80*6+0x8).
> +
> +  interrupts:
> +    items:
> +      - description: Main HBA interrupt
> +      - description: Vendor debugging interrupt
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sata@d160400 {
> +        compatible = "nintendo,latte-ahci";
> +        reg = <0x0d160400 0x408>;
> +
> +        interrupt-parent = <&latte_pic>;
> +        interrupts = <38>, <28>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
> new file mode 100644
> index 000000000000..772afe0c298c
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
> +    const: nintendo,latte-dsp
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsp@c005000 {
> +        compatible = "nintendo,latte-dsp";
> +        reg = <0x0c005000 0x200>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
> new file mode 100644
> index 000000000000..4b71d6b9b14d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
> @@ -0,0 +1,55 @@
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
> +allOf:
> +  - $ref: "/schemas/interrupt-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    const: nintendo,latte-pic
> +
> +  '#interrupt-cells':
> +    # Interrupt numbers 0-64 in one cell.
> +    const: 1
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Cascade interrupt for Espresso PIC
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@d800440 {
> +        compatible = "nintendo,latte-pic";
> +        #interrupt-cells = <1>;
> +        interrupt-controller;
> +        reg = <0x0d800440 0x30>;
> +
> +        interrupt-parent = <&espresso_pic>;
> +        interrupts = <24>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
> new file mode 100644
> index 000000000000..25d474fca679
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
> @@ -0,0 +1,46 @@
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
> +allOf:
> +  - $ref: "/schemas/mmc/mmc-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nintendo,latte-sdhci
> +      - const: sdhci

Just 'sdhci' is not too useful. *All* SDHCI controllers have quirks.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mmc@d070000 {
> +        compatible = "nintendo,latte-sdhci", "sdhci";
> +        reg = <0x0d070000 0x200>;
> +        interrupts = <7>;
> +        interrupt-parent = <&latte_pic>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> new file mode 100644
> index 000000000000..6fdf93622fcc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Latte system bus
> +
> +maintainers:
> +  - Ash Logan <ash@heyquark.com>
> +  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> +
> +description: |
> +  Latte multi-function SoC, containing many of the devices found on the Nintendo Wii U.
> +
> +allOf:
> +  - $ref: "/schemas/simple-bus.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nintendo,latte
> +      - const: simple-bus

If truly 'simple', then you don't need 'nintendo,latte'.

Otherwise, you need a custom 'select' schema to not select all cases of 
'simple-bus'.

> +
> +

one blank line

> +required:
> +  - compatible
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index c5f629c5bc61..9f69b5ab21ff 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -69,6 +69,7 @@ properties:
>                - ibm,usb-ehci-440epx
>                - ibm,usb-ehci-460ex
>                - nintendo,hollywood-usb-ehci
> +              - nintendo,latte-ehci
>                - st,spear600-ehci
>            - const: usb-ehci
>        - enum:
> -- 
> 2.38.1
> 
> 
