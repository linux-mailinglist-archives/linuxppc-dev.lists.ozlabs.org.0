Return-Path: <linuxppc-dev+bounces-6138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78CA32FF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 20:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtTJm6ckbz30VP;
	Thu, 13 Feb 2025 06:43:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739389432;
	cv=none; b=KrNIka+peg6ZA5zgPdPHV4sW4Yg/3p7TcteDfK5aqA5YwoXS5ZAkyXn93J+0GhnJ7QwPK6Bi0TcrUFw8dhomwTPyCHTBkJU1YVMWmNIOkpk1N0AhW7VOGskPvSItCOSqSFOt45zmI+vXPWCsba+Nb9kyPFKLWshxYtJWjpwG3FdeRy9FMSANg0f/m4yXQp3xWE57sjVY08eg9GqIuzPv0iJFYjXJ/QcS3Q0h8FGz+zLQWg507jDkqPDSnUSusGSsfnLm6FkUNcp858pQfFi3Le+XdyfopuQHCrskDBHLN2BMnXrwTlz2TZMZConshQoOh8a0a+iZH941m3g5NgAdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739389432; c=relaxed/relaxed;
	bh=qCAz+yx++DNVS76vwD+Tb4qvtuaUA8QBkgye5L4cl9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsNiEz2/Fo2axmBd8THVGBDyhc05jwL4TnF0HOf/LmjmARXUhjOlivZNfMpR1U98E+jqaoJnMqHnRy2eNdrvBnuypdegxi8qM+YzxV+j6LmRwnj+99pHT20txbKyInpz60Zc/vQc3DGehZWanYch4fw2QNcvqJBDA2a6urwKjCVWw7gXMUHH43lK1jdGa9P+4kMiINPStYoVTfeQEAq5vHdoDDWz1/15DT2hyoKgPCrzy8wJ8cPj7FKKQcsEwxgQ9goa28PbH8t/2yLAeavlZUQgBDgBN1YIwpSJHhnsZaWG/6obQ1rjCfYnSvLkvanQ5oO5voCDIHy2QIlOzqxX1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l3nluVDj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l3nluVDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtTJm0bjbz30VJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 06:43:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1179A419C9;
	Wed, 12 Feb 2025 19:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEFC4CEDF;
	Wed, 12 Feb 2025 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389428;
	bh=J53gut3FCEvv7QNmL9a0iiaxDFCqQSjC2O6Ihu/AJ84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3nluVDjmkhujiS09PDYmKWR8ZpL1NvZ673ie95nbqovNihUcry7wp4RhxDaIcW4C
	 WzALgu8RqrEf8AEKXJa1NQN36127tWGpqtfMt+ceF8qkKxFUatwJV8mWOCXDA7c8U6
	 5c6mvpzQn7EtvSK26FGhsTxvo9nA5pW5qx8gSDuBJ7zl/wl5WF+1A0qzlo/GtstEyq
	 UpvxdrPQwjDAE3IeNXfcspWaobaAE2jMqkTwrZPDdD8R5k2k0xPPuMTtHZRy6guNwr
	 J6A5CGOXSwgZePq4BouABSV8KVXF9QiPXKh5Adk1Oyuh6/Hd8f5WNo1Hpr1RY3Eam1
	 dqgSlb5voTSKg==
Date: Wed, 12 Feb 2025 13:43:47 -0600
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
Subject: Re: [PATCH v2 08/12] dt-bindings: spi: Convert Freescale SPI
 bindings to YAML
Message-ID: <20250212194347.GA119448-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
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
In-Reply-To: <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:25PM +0100, J. Neuschäfer wrote:
> fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> contollers. Convert them to YAML.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - add missing end-of-document ("...") markers
> - add missing constraints to interrupts, fsl,espi-num-chipselects,
>   fsl,csbef and fsl,csaft properties
> - remove unnecessary type from clock-frequency property
> - fix property order to comply with dts coding style
> ---
>  .../devicetree/bindings/spi/fsl,espi.yaml          | 64 +++++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 73 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 ------------------
>  3 files changed, 137 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c504b7957dde39086ef7d7a7550d6169cf5ec407
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,espi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale eSPI (Enhanced Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,mpc8536-espi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,espi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: The number of the chipselect signals.
> +
> +  fsl,csbef:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select assertion time in bits before frame starts
> +
> +  fsl,csaft:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select negation time in bits after frame ends
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - fsl,espi-num-chipselects
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@110000 {
> +        compatible = "fsl,mpc8536-espi";
> +        reg = <0x110000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <53 0x2>;
> +        interrupt-parent = <&mpic>;

Drop interrupt-parent. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +        fsl,espi-num-chipselects = <4>;
> +        fsl,csbef = <1>;
> +        fsl,csaft = <1>;
> +    };
> +
> +...

