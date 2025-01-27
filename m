Return-Path: <linuxppc-dev+bounces-5579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9367EA1D03F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:38:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhFyt0KKhz301v;
	Mon, 27 Jan 2025 15:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737952677;
	cv=none; b=WxQSUaJNNCHd0IuV5qE44NuQmnhgdiOehmjwbmR4Rh3l4lHWr1gBjOttXlYboPcHVQe4sol0Vt0dC9IZeF91fmKtYKhdAoSdFu+6qJ1CPA94sQUxPxEQFOpu1SIDiL0mjqSNOX/kh2ys0Wfh8AFXWd5wQZo/IuFHiEysHyTRGA1BWHQ+O4fnkfTfR10sC49+9XlZ+6g7ip6xpgyBX0f47efBZLZBaRwV23O97EOu/sO2f4RMVCelOuXxHed6rHW7vG29MyAliWN8BXn+gvuO19OrcaU2LV6zW2TlEzLgHlChsSrq6hHplLNdYQvUmOo+DjaFxro0I/9/qrPtYgTUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737952677; c=relaxed/relaxed;
	bh=l0pf/5ygGJRawS2ReBSFZS/MSSiqSQajw1RqzIRU2i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ/4A0RpwL8Uyu+db8XnQutaBhJe6vYYSiDifYdriKPSGMu3ONgi9lQCOgCmG9caK4H9RlXnuyHI4hZgpmr2Abt2kO5e4oScgSOJSrs13PnG0IfPCcHw4ojpwyB2tfC0bXMD1NOE9+NFr/HgnTZH2r6uO5+cl60nSR9f6mnbw+9L8zdR4H5Q2u9G4uD2Ygr8gpUpLmJo0moo5I9uic/ZybB+Lju0HZMDhl1HAmtIAo5pa+7ArcUdzbowOmG/PCzwgHx8ryT9gKSo2sAPa9Z4HlzbG2UBd/vztc0i2PnW24ZslwNmaHHxXSPqkhHCqPsS+yH6yGw1TaNvzBlf//3h/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJ9lfx76; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJ9lfx76;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhFys0Ns2z301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:37:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B21D65C01E4;
	Mon, 27 Jan 2025 04:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5ECC4CED2;
	Mon, 27 Jan 2025 04:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952674;
	bh=F9bBtsJ1KzgqRgAbiENeTT+ePJ6pc5Uo5r/32gnqo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJ9lfx76rD0U07xq8rbih+/wr60rWK8TxZPR5e+pLbFiBv03167ZPvDRf90EzUhyn
	 rNSLC5Hve6b+hN58lF98zDv5XLEfmRNDGBiYlfrwKLULuhCAqDMy3y4CwwbLTfVGz8
	 450Vqhn2L2E+dVj0xpa9Z0LrvRxrEaWO5eCaQ03lbRb9ug1YOsdxJZsG6y/KhNyTlX
	 msGBmtnecHgGa8SKyGigtvf8R/4DueQRCtuOa7jsKX7X9bAn81zX36GA+MCQcZnGyY
	 t0NbE55uvlNOCzRxbyp21R1kfT0TQsKY9kNnzeC9xpNZv4NgXScgNh6KMAbWiu5NBE
	 xpiBxfHM1Auvg==
Date: Sun, 26 Jan 2025 22:37:53 -0600
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
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
Message-ID: <20250127043753.GA3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:58:57PM +0100, J. Neuschäfer wrote:
> Convert the Freescale PowerQUICC SATA controller binding from text form
> to YAML. The list of compatible strings reflects current usage.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/ata/fsl,pq-sata.yaml       | 59 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/ata/fsl-sata.txt | 28 ----------
>  2 files changed, 59 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6af31ffbcad5e9cc83118a0bd8eaf45351a2823f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale 8xxx/3.0 Gb/s SATA nodes
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |

Don't need '|'

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +  SATA nodes are defined to describe on-chip Serial ATA controllers.
> +  Each SATA port should have its own node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8377-sata
> +              - fsl,mpc8536-sata
> +              - fsl,mpc8315-sata
> +              - fsl,mpc8379-sata
> +          - const: fsl,pq-sata
> +      - const: fsl,pq-sata-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4]
> +    description: |
> +      1 for controller @ 0x18000
> +      2 for controller @ 0x19000
> +      3 for controller @ 0x1a000
> +      4 for controller @ 0x1b000
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - cell-index
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    sata@18000 {
> +        compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
> +        reg = <0x18000 0x1000>;
> +        cell-index = <1>;
> +        interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-parent = <&ipic>;
> +    };
> diff --git a/Documentation/devicetree/bindings/ata/fsl-sata.txt b/Documentation/devicetree/bindings/ata/fsl-sata.txt
> deleted file mode 100644
> index fd63bb3becc9363c520a8fd06629fdc52c4d4299..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/ata/fsl-sata.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Freescale 8xxx/3.0 Gb/s SATA nodes
> -
> -SATA nodes are defined to describe on-chip Serial ATA controllers.
> -Each SATA port should have its own node.
> -
> -Required properties:
> -- compatible        : compatible list, contains 2 entries, first is
> -		 "fsl,CHIP-sata", where CHIP is the processor
> -		 (mpc8315, mpc8379, etc.) and the second is
> -		 "fsl,pq-sata"
> -- interrupts        : <interrupt mapping for SATA IRQ>
> -- cell-index        : controller index.
> -                          1 for controller @ 0x18000
> -                          2 for controller @ 0x19000
> -                          3 for controller @ 0x1a000
> -                          4 for controller @ 0x1b000
> -
> -Optional properties:
> -- reg               : <registers mapping>
> -
> -Example:
> -	sata@18000 {
> -		compatible = "fsl,mpc8379-sata", "fsl,pq-sata";
> -		reg = <0x18000 0x1000>;
> -		cell-index = <1>;
> -		interrupts = <2c 8>;
> -		interrupt-parent = < &ipic >;
> -	};
> 
> -- 
> 2.48.0.rc1.219.gb6b6757d772
> 

