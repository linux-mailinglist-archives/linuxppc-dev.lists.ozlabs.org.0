Return-Path: <linuxppc-dev+bounces-5577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C8A1D00A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:23:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhFf75DqJz2ykC;
	Mon, 27 Jan 2025 15:23:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737951807;
	cv=none; b=KROYYcHxGLbqVWoIh/goBDdQvM5Tqh9UvfwJJ1it6mck60s2YWqjOYwcEa3BZGUWts8a6zW5go/PkZOHEhW5lSwg0sgV7aFmYvPJTLUR/p8io7fVj7Zqd+l3yWeUrf+olDpOjKQ74mHwLhiHiFfCBLwSyDLBDRTF3LtvK65UfFLxgoaduraeTmxHVhUk3XeEFOLIGUJ1Sct7n2/TUKqNuVAzl1d4kuWexPTIl4ObsLf3ljhlZz5a4qbcY+xFOk1XowyqNBFdnY3LH+TQGuZJNBkfuK0ZOIbc5WWFxFYxzek0ExS9aGVlMpRK/LtFdAquZPJUh2D6tuWhRodJLc++kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737951807; c=relaxed/relaxed;
	bh=TcV45AFI3CoNpYYFXrDVzOUfC3sypZgwZs/edZhOv9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR8iftUqTK2hoW/B8xKYEoaCjRL6GltOdTFl1Wvx10r1/BqDx3pSwg1C9f/LKOjBqE61vxGjRrNvG2vuZqpadXAsFDoa1edDbItF9tfJPO8MKYG6Yy2ayf/xu3vfJybtF89bRJ3Ux8pthGRjXClx/WDvqZvsEccsK+eI1NGPcl+Gai4zQiyT/3udJpVlMU8xqY3vB7jt6VGg2BJCMwH9GK5HLbKkWtJswzDE/O/leoI6utVL+qZRQXnQoyIiUNWzoneQfN0tqfaZG3cSqYClq8EGNgwNxa3N8hBCo2gXif6ILBmmZDDb6FIsF7kKT6EoIJXPSlerze0ZW2FvcTky0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uacdKVg7; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uacdKVg7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhFf52VsJz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:23:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B1E35C0308;
	Mon, 27 Jan 2025 04:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC394C4CED2;
	Mon, 27 Jan 2025 04:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737951802;
	bh=r3912NCLroYD2LW1ysyQFU0iSq2gWZvcOI8hej1zQio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uacdKVg79LfyXCYcX7f1LdfSoaEsVB8rtYPT212E664BtNFWV5+oBCaW+iMcPij8d
	 i41dxwZhUfpFt9OxE+ekjBuuUqFL7XoveTYn/hQDzilLlSDhXW6m/kqg4xrej4rkwK
	 puWKrQqEVNMgUcQ5QfwvXBN2b9FFxkUuatL2xA4GStd470aloVuYtGA0qLxpkkVTC6
	 6XxGSSe1cH5380BJ0VEl+11QoZc8boWxYQT3NMZV0+F18bu1NG0+nrZbIZ4Y3tc2Bp
	 KXDh3gi5ud7kTBfrbd91suY394v1aMF9lIVWX8oHEn7p9pBatINx7dO6PRNk1loQCw
	 0EQWzmJuLh6cw==
Date: Sun, 26 Jan 2025 22:23:21 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <20250127042321.GA3067818-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:04PM +0100, J. Neuschäfer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. The list of compatible strings reflects current usage.
> 
> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
> 
> Remaining issues:
>  - The localbus is not really a simple-bus: Unit addresses are not simply
>    addresses on a memory bus. Instead, they have a format: The first cell
>    is a chip select number, the remaining one or two cells are bus
>    addresses.

That's every external parallel bus. See bindings/memory-controllers/*

Probably fine to leave 'simple-bus' if that's your question. It's more 
that there is configuration for the chipselect timings that make's this 
not a simple-bus. But the address translation should work just fine.

> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
>  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++
>  .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  4 files changed, 266 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..127f164443972bbaf50fd9daa80c504577ddd7bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND flash attached to Freescale eLBC
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +allOf:
> +  - $ref: nand-chip.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

Don't need oneOf.

> +      - items:
> +          - enum:
> +              - fsl,mpc8313-fcm-nand
> +              - fsl,mpc8315-fcm-nand
> +              - fsl,mpc8377-fcm-nand
> +              - fsl,mpc8378-fcm-nand
> +              - fsl,mpc8379-fcm-nand
> +              - fsl,mpc8536-fcm-nand
> +              - fsl,mpc8569-fcm-nand
> +              - fsl,mpc8572-fcm-nand
> +              - fsl,p1020-fcm-nand
> +              - fsl,p1021-fcm-nand
> +              - fsl,p1025-fcm-nand
> +              - fsl,p2020-fcm-nand
> +          - const: fsl,elbc-fcm-nand
> +      - const: fsl,elbc-fcm-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

If you use anything from nand-chip.yaml, then you need 
unevaluatedProperties here.

> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        nand@1,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg = <0x1 0x0 0x2000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..60f849b79c11a4060f2fa4ab163f9fa9317df130
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc-gpcm-uio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Userspace I/O interface for Freescale eLBC devices
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,elbc-gpcm-uio
> +
> +  reg:
> +    maxItems: 1
> +
> +  elbc-gpcm-br:
> +    description: Base Register (BR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  elbc-gpcm-or:
> +    description: Option Register (OR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  device_type: true

This should be dropped.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  uio_name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - elbc-gpcm-br
> +  - elbc-gpcm-or
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6bbceb82c77826499abe85879e9189b18d396eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Enhanced Local Bus Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^localbus@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-elbc
> +              - fsl,mpc8315-elbc
> +              - fsl,mpc8377-elbc
> +              - fsl,mpc8378-elbc
> +              - fsl,mpc8379-elbc
> +              - fsl,mpc8536-elbc
> +              - fsl,mpc8569-elbc
> +              - fsl,mpc8572-elbc
> +              - fsl,p1020-elbc
> +              - fsl,p1021-elbc
> +              - fsl,p1023-elbc
> +              - fsl,p2020-elbc
> +              - fsl,p2041-elbc
> +              - fsl,p3041-elbc
> +              - fsl,p4080-elbc
> +              - fsl,p5020-elbc
> +              - fsl,p5040-elbc
> +          - const: fsl,elbc
> +          - const: simple-bus
> +
> +      - items:
> +          - const: fsl,mpc8272-localbus
> +          - const: fsl,pq2-localbus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8247-localbus
> +              - fsl,mpc8248-localbus
> +              - fsl,mpc8360-localbus
> +          - const: fsl,pq2pro-localbus
> +          - const: simple-bus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-localbus
> +              - fsl,mpc8544-lbc
> +              - fsl,mpc8544-localbus
> +              - fsl,mpc8548-lbc
> +              - fsl,mpc8548-localbus
> +              - fsl,mpc8560-localbus
> +              - fsl,mpc8568-localbus
> +          - const: fsl,pq3-localbus
> +          - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [2, 3]
> +    description: |

Don't need '|' unless there's some formatting.

> +      The first cell is the chipselect number, and the remaining cells are the
> +      offset into the chipselect.
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +    description: |
> +      Either one or two, depending on how large each chipselect can be.
> +
> +  ranges:
> +    description: |
> +      Each range corresponds to a single chipselect, and covers the entire
> +      access window as configured.
> +
> +patternProperties:
> +  "^.*@.*$":

You should define the unit-address format here: @<chipselect>,<offset>

> +    type: object
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus@f0010100 {
> +        compatible = "fsl,mpc8272-localbus",
> +                     "fsl,pq2-localbus";
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        reg = <0xf0010100 0x40>;
> +
> +        ranges = <0x0 0x0 0xfe000000 0x02000000
> +                  0x1 0x0 0xf4500000 0x00008000
> +                  0x2 0x0 0xfd810000 0x00010000>;
> +
> +        flash@0,0 {
> +            compatible = "jedec-flash";
> +            reg = <0x0 0x0 0x2000000>;
> +            bank-width = <4>;
> +            device-width = <1>;
> +        };
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };
> +    };
> +
> +  - |
> +    localbus@e0005000 {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
> +        reg = <0xe0005000 0x1000>;
> +        interrupts = <77 0x8>;
> +        interrupt-parent = <&ipic>;
> +
> +        ranges = <0x0 0x0 0xfe000000 0x00800000
> +                  0x1 0x0 0xe0600000 0x00002000
> +                  0x2 0x0 0xf0000000 0x00020000
> +                  0x3 0x0 0xfa000000 0x00008000>;
> +
> +        flash@0,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "cfi-flash";
> +            reg = <0x0 0x0 0x800000>;
> +            bank-width = <2>;
> +            device-width = <1>;
> +        };
> +
> +        nand@1,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg = <0x1 0x0 0x2000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt b/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
> deleted file mode 100644
> index 1c80fcedebb52049721fbd61c4dd4c57133bd47c..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -* Chipselect/Local Bus
> -
> -Properties:
> -- name : Should be localbus
> -- #address-cells : Should be either two or three.  The first cell is the
> -                   chipselect number, and the remaining cells are the
> -                   offset into the chipselect.
> -- #size-cells : Either one or two, depending on how large each chipselect
> -                can be.
> -- ranges : Each range corresponds to a single chipselect, and cover
> -           the entire access window as configured.
> -
> -Example:
> -	localbus@f0010100 {
> -		compatible = "fsl,mpc8272-localbus",
> -			   "fsl,pq2-localbus";
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		reg = <0xf0010100 0x40>;
> -
> -		ranges = <0x0 0x0 0xfe000000 0x02000000
> -			  0x1 0x0 0xf4500000 0x00008000
> -			  0x2 0x0 0xfd810000 0x00010000>;
> -
> -		flash@0,0 {
> -			compatible = "jedec-flash";
> -			reg = <0x0 0x0 0x2000000>;
> -			bank-width = <4>;
> -			device-width = <1>;
> -		};
> -
> -		board-control@1,0 {
> -			reg = <0x1 0x0 0x20>;
> -			compatible = "fsl,mpc8272ads-bcsr";
> -		};
> -
> -		simple-periph@2,0 {
> -			compatible = "fsl,elbc-gpcm-uio";
> -			reg = <0x2 0x0 0x10000>;
> -			elbc-gpcm-br = <0xfd810800>;
> -			elbc-gpcm-or = <0xffff09f7>;
> -		};
> -	};
> 
> -- 
> 2.48.0.rc1.219.gb6b6757d772
> 

