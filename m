Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF86B163F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 00:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX7N01c3Yz3f6s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.49; helo=mail-oo1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX7MP3Vvpz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 10:10:23 +1100 (AEDT)
Received: by mail-oo1-f49.google.com with SMTP id p6-20020a4ab386000000b005252182b0e0so27047ooo.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 15:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678317020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XD0ikGmSsZrvW4Icaq2NiBnGVE41WkYau9ANqfCeE4g=;
        b=bDk6c/G9jdGgINT+SPGZSFLzkAjqXbG8IsmBMaENPWVFkn/6DfNeqNR950h5ez3bA7
         xTyamMMFoieuRRsIaxXSsfxOs6pB0anzJA7XL475heNt9Gzvug8j9zannMjHj+uqt0t2
         wqEkuod+jefMaPNlLv8wFj0WFWebPmV6kpbr8E+tW81tW4vNwqmq/MXP+yPkDW/TUTkA
         JEp/R/tV8T870h9jTcZtyvxC/5bvJQl4ryRflz852YMmvriCLzbfhiv8ufqp2Q3vrbe+
         O7HKm6pufqzdq9I7AyDNai09u6Kmo22/OkifYE98rCKggWKokD/7yFLxU0PQjBx00JqO
         LHCg==
X-Gm-Message-State: AO0yUKUxAk6Ot4Orr3/wCe2RDzSqf4i68ZninBvMjj2z3p5crCijibwf
	Obh6LFxhm6esKNKqnvNymw==
X-Google-Smtp-Source: AK7set8A0SF0DbY+UQqrMG/aKU7uVszgRiyuv7wgsb0tBBXkzXbyyzJllVMOKOb47Lq8JItYy/gAMw==
X-Received: by 2002:a4a:8685:0:b0:525:4b8b:8f38 with SMTP id x5-20020a4a8685000000b005254b8b8f38mr46622ooh.3.1678317019733;
        Wed, 08 Mar 2023 15:10:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d29-20020a9d72dd000000b0068bcef4f543sm3066374otk.21.2023.03.08.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:10:19 -0800 (PST)
Received: (nullmailer pid 4046807 invoked by uid 1000);
	Wed, 08 Mar 2023 23:10:18 -0000
Date: Wed, 8 Mar 2023 17:10:18 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Message-ID: <20230308231018.GA4039466-robh@kernel.org>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 06, 2023 at 02:15:25PM -0500, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v10:
> - New
> 
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 137 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Broadcom BCM6345 GPIO controller
> +title: Broadcom BCM63xx GPIO controller
>  
>  maintainers:
>    - Álvaro Fernández Rojas <noltari@gmail.com>
> @@ -18,8 +18,6 @@ description: |+
>  
>    BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
>    and/or written, and the direction changed from input to output.
> -  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
> -  and/or written, and the direction changed from input to output.
>    BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
>    and dirout registers, where GPIO state can be read and/or written, and the
>    direction changed from input to output.
> @@ -29,7 +27,6 @@ properties:
>      enum:
>        - brcm,bcm6318-gpio
>        - brcm,bcm6328-gpio
> -      - brcm,bcm6345-gpio
>        - brcm,bcm6358-gpio
>        - brcm,bcm6362-gpio
>        - brcm,bcm6368-gpio
> @@ -63,17 +60,6 @@ required:
>  additionalProperties: false
>  
>  examples:
> -  - |
> -    gpio@fffe0406 {
> -      compatible = "brcm,bcm6345-gpio";
> -      reg-names = "dirout", "dat";
> -      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> -      native-endian;
> -
> -      gpio-controller;
> -      #gpio-cells = <2>;
> -    };
> -
>    - |
>      gpio@0 {
>        compatible = "brcm,bcm63268-gpio";
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> new file mode 100644
> index 000000000000..fd5c7055d542
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MMIO GPIO
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +  - Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +description: |

Don't need '|' unless you want line endings preserved. Elsewhere too.

> +  Some simple GPIO controllers may consist of a single data register or a pair
> +  of set/clear-bit registers. Such controllers are common for glue logic in
> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
> +  NAND-style parallel busses.
> +
> +properties:
> +  big-endian:
> +    true

big-endian: true

> +
> +  compatible:
> +    enum:
> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller:
> +    true

ditto.

> +
> +  reg:
> +    minItems: 1
> +    description: |
> +      A list of registers in the controller. The width of each register is
> +      determined by its size. All registers must have the same width. The number
> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
> +    items:
> +      - description: |
> +          Register to READ the value of the GPIO lines. If GPIO line is high,
> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
> +          This register may also be used to drive GPIOs if the SET register is
> +          omitted.
> +      - description: |
> +          Register to SET the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line high.
> +      - description: |
> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line low. If this register is omitted,
> +          the SET register will be used to clear the GPIO lines as well, by
> +          actively writing the line with 0.
> +      - description: |
> +          Register to set the line as OUTPUT. Setting a bit in this register
> +          will turn that line into an output line. Conversely, clearing a bit
> +          will turn that line into an input.
> +      - description: |
> +          Register to set this line as INPUT. Setting a bit in this register
> +          will turn that line into an input line. Conversely, clearing a bit
> +          will turn that line into an output.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:
> +        - dat
> +        - set
> +        - clr
> +        - dirout
> +        - dirin
> +
> +  native-endian:
> +    true
> +
> +  no-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
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
> +    nand-gpio-out@1f300010 {

Use generic node name:

gpio@...

> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300010 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +    nand-gpio-in@1f300014 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300014 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      no-output;
> +    };
> +
> +    gpio0@e0000000 {
> +      compatible = "wd,mbl-gpio";
> +      reg-names = "dat";
> +      reg = <0xe0000000 0x1>;
> +      #gpio-cells = <2>;
> +      gpio-controller;
> +    };
> +
> +    gpio1@e0100000 {
> +      compatible = "wd,mbl-gpio";
> +      reg-names = "dat";
> +      reg = <0xe0100000 0x1>;
> +      #gpio-cells = <2>;
> +      gpio-controller;
> +      no-output;
> +    };
> +
> +    gpio@fffe0406 {
> +      compatible = "brcm,bcm6345-gpio";
> +      reg-names = "dirout", "dat";
> +      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> +      native-endian;
> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> deleted file mode 100644
> index ca2f8c745a27..000000000000
> --- a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the National Instruments 169445 GPIO NAND controller
> -
> -The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
> -for input (the ready signal) and one for output (control signals).  It is
> -intended to be used with the GPIO NAND driver.
> -
> -Required properties:
> -	- compatible: should be "ni,169445-nand-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: disables driving output on the pins
> -
> -Examples:
> -	gpio1: nand-gpio-out@1f300010 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300010 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> -
> -	gpio2: nand-gpio-in@1f300014 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300014 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		no-output;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> deleted file mode 100644
> index 038c3a6a1f4d..000000000000
> --- a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
> -
> -The Western Digital MyBook Live has two memory-mapped GPIO controllers.
> -Both GPIO controller only have a single 8-bit data register, where GPIO
> -state can be read and/or written.
> -
> -Required properties:
> -	- compatible: should be "wd,mbl-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: GPIOs are read-only.
> -
> -Examples:
> -	gpio0: gpio0@e0000000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0000000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	gpio1: gpio1@e0100000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0100000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		no-output;
> -	};
> -- 
> 2.35.1.1320.gc452695387.dirty
> 
