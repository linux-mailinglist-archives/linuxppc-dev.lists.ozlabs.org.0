Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715744CA601
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 14:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7w2b3z0nz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QzpX5LMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QzpX5LMm; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7w1v3Qplz3bWf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 00:29:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 559EFB81FEE
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 13:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79140C36AE3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646227742;
 bh=O3BNyp0SXlmJR1Jycf/uZBggE8XPLSOoEcbdZGpRAeI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QzpX5LMmPjwe/60nRzGFwnRWc8u7vnhUvX/5abA4MrgaDat6NgPXcZGnnSGiQu2Rq
 1QdWEZB8wDqZ9NgkEvOeGBWa76W6OCc+S0FU+PeJomiwU9v1JQUgvCo1t0Nc/R1i/D
 Jq0YNKKHoSTYF3mbyXT7wrsXNMbCssOWrzGsJB5QVIml1Qo+YbGVOb57IFqMjJemMZ
 vXfWigpk+O2d3tg6x5nCJzMChJpBBuwwarbhrcsCtmNjeIR3eibBwud369Rbw/Hfw+
 sZimi6OBS5lrA0xDsADc5Xjz0w2dZjLL1dTcQ9ESVT+a4x2dMYaN7GMyvdcWIvpa2q
 bsEjNrt61W1ew==
Received: by mail-ej1-f54.google.com with SMTP id hw13so3720618ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 05:29:02 -0800 (PST)
X-Gm-Message-State: AOAM53251O0wqVOgB9yHW4DWqOl+4B1PIhz4FaoSXOE14VFVZGSHVF8D
 MviqPg2gWKla5lsAybigyOnvyYlVaDwJ6lyFCw==
X-Google-Smtp-Source: ABdhPJx4UbEgelUCyNWw+FBC0GAz2gzCQi+QNMVRkpjaoBEUQ7zQKjAQgnbQDa01sl4qqRtzAzenN8Ov8eHc3V701zM=
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr7735026ejz.20.1646227740577; Wed, 02 Mar
 2022 05:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-2-ash@heyquark.com>
In-Reply-To: <20220302044406.63401-2-ash@heyquark.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Mar 2022 07:28:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKyBCM9ERB8xHpg3Rog6gZUmp+r0dTskUur8PnD6rNCHg@mail.gmail.com>
Message-ID: <CAL_JsqKyBCM9ERB8xHpg3Rog6gZUmp+r0dTskUur8PnD6rNCHg@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: wiiu: Document the Nintendo Wii U
 devicetree
To: Ash Logan <ash@heyquark.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 1, 2022 at 10:44 PM Ash Logan <ash@heyquark.com> wrote:
>
> Adds schema for the various Wii U devicetree nodes used.

Please resend to the DT list if you want this reviewed and so that checks run.

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
> +      - description: Nintendo Wii U "Espresso" interrupt controller
> +        items:
> +          - const: nintendo,espresso-pic
> +  '#interrupt-cells':
> +    # Interrupt numbers 0-32 in one cell
> +    const: 1
> +  interrupt-controller: true
> +  reg:
> +    items:
> +      - description: Core registers
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    espresso_pic: pic@c000078 {
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +
> +            compatible = "nintendo,espresso-pic";
> +            reg = <0x0c000078 0x18>;
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
> +
> +# This will likely get bound to the Radeon driver one day, which will neccesitate extra properties
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    gpu7@c200000 {
> +            compatible = "nintendo,latte-gpu7";
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
> +  interrupts:
> +    items:
> +      - description: Main HBA interrupt
> +      - description: Vendor debugging interrupt
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sata: ahci@d160400 {
> +          compatible = "nintendo,latte-ahci";
> +          reg = <0x0d160400 0x408>;
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sdcard_0: sdhci@d070000 {
> +          compatible = "nintendo,latte-sdhci","sdhci";
> +          reg = <0x0d070000 0x200>;
> +          interrupts = <7>;
> +          interrupt-parent = <&latte_pic>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> new file mode 100644
> index 000000000000..6ae86d198fa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> @@ -0,0 +1,25 @@
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
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Nintendo Wii U "Latte" SoC
> +        items:
> +          - const: nintendo,latte
> +
> +additionalProperties: true
> +
> +...
> --
> 2.35.1
>
