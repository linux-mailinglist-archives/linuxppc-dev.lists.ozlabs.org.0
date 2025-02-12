Return-Path: <linuxppc-dev+bounces-6137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD99A32FE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 20:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtTBN3pkWz30Tf;
	Thu, 13 Feb 2025 06:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739389100;
	cv=none; b=KQNbQU/Ihim6Lm6al/f80TpLCUq3pIJVSwBX/dwxCyWqplhkN9heTp4j4UdT1tw4HcCg9o33s7Mo6pdnLQjiSQJVPkxu41BvH9N6LaUgCq2jvfxb6WX1Evg0y+PrU+D2NgOCcZgw/+4ICokwLAnihNeoSTzktb431kvi/kTgULcFtvpIiy+81zm3RgZ11YMK+Pzg23/qPptld5rGQjZQz54WWcIdSX2XHhWNih9lNBUYFuLkmY7dLvN/X+fYjzMaICHRfNBNsVtnBJ4sFhYQnObs4HA5aebY9jN1l6Tvij9i3kEVXEMkryUzIdpZD7Spe+xpExwVmPlRPkeWp7Z/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739389100; c=relaxed/relaxed;
	bh=AVwnURfB83+MEYwwkNTDLHQX1IhzoitUiamqdcn6kho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEVAsw3ISNwNIRKy9U5Q0hlgtq1aO+YcNF7G+37v3cnXCy4Tsflf1+jAj7gXOXSpTggO75tz+AW+WmcMllNFmIpGoiuahnVqrSEaPToI/mAs2tptgCORElo843EVjplZE7pvFoJ4HxqfUjtEL8cMqQQCedZDY1K21nMJABsHvS13dLb8cV4YL7HfbOS175BE6QTjvWU25yzOklAHCwUWSCGsvHqRfcVAd9Pz3cqkOQj0+lbgTOeyCAFiCkWjVUIqnX3iNi/ZP3CewrYimaC/GmA9utYuGpuHy8c7XKvTwjrN26hllXi3Zb6uYYySK86lxKeL92dzcBMvaNJC6T+yBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mQBWoZm9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mQBWoZm9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtTBM4pNVz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 06:38:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D96EA40F73;
	Wed, 12 Feb 2025 19:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642E5C4CEDF;
	Wed, 12 Feb 2025 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389096;
	bh=pq9uKQvjFYwDm1Q4B6BmedrGAyc5w91dQwDdbRZBMW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQBWoZm9pBkAJzBWRz85ZCMTj9IvaY3BA0rxBDDYNpPHMJZ17i09UNxwChFyw0hVZ
	 mbBIuzakROKILvDV5vGDjyN1gMB2TYRWqQYBR/NF21saMN5npe5HC205R2hRIW+xEJ
	 WNMFsM4kAklYkc3yn8/eKUkVaJUPLrYOT0ROBS+XvncYTfQTtAvKtOISkDXenE24NQ
	 6wa3y+6po0NoVWWK2jUywFmF+27+PJBC6jKh0tBUWtlCctbBKKTKQ7EMqk3FyYliyM
	 C7NHhBicFH74iUz86RYpL6uWHOkMzY1SyHEKxjDgogi/QjGlEPpfqSM/yW6mc8gl9J
	 kGVNNVKgf+GQQ==
Date: Wed, 12 Feb 2025 13:38:15 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <20250212193815.GA113049-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
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
In-Reply-To: <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 140 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 123 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 134 ++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 397 insertions(+), 204 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d8be9973fb98891a73cb701c1f983a63f444837
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description:
> +  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8313-dma
> +          - fsl,mpc8315-dma
> +          - fsl,mpc8323-dma
> +          - fsl,mpc8347-dma
> +          - fsl,mpc8349-dma
> +          - fsl,mpc8360-dma
> +          - fsl,mpc8377-dma
> +          - fsl,mpc8378-dma
> +          - fsl,mpc8379-dma
> +      - const: fsl,elo-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains status for
> +      all the 4 DMA channels.
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Controller interrupt.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^dma-channel@.*$":

You need to define the unit-address format.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          # native DMA channel
> +          - items:
> +              - enum:
> +                  - fsl,mpc8315-dma-channel
> +                  - fsl,mpc8323-dma-channel
> +                  - fsl,mpc8347-dma-channel
> +                  - fsl,mpc8349-dma-channel
> +                  - fsl,mpc8360-dma-channel
> +                  - fsl,mpc8377-dma-channel
> +                  - fsl,mpc8378-dma-channel
> +                  - fsl,mpc8379-dma-channel
> +              - const: fsl,elo-dma-channel
> +
> +          # audio DMA channel, see fsl,ssi.yaml
> +          - const: fsl,ssi-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Per-channel interrupt. Only necessary if no controller interrupt has
> +          been provided.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma@82a8 {

dma-controller@...

> +        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg = <0x82a8 4>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x8100 0x1a4>;
> +        interrupt-parent = <&ipic>;

Drop interrupt-parent everywhere.

> +        interrupts = <71 8>;
> +        cell-index = <0>;
> +
> +        dma-channel@0 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0 0x80>;
> +            cell-index = <0>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +
> +        dma-channel@80 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x80 0x80>;
> +            cell-index = <1>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x100 0x80>;
> +            cell-index = <2>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            reg = <0x180 0x80>;
> +            cell-index = <3>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +    };
> +
> +...

Similar comments on the others.

Rob

