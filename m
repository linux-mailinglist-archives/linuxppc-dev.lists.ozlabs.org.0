Return-Path: <linuxppc-dev+bounces-5582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CFBA1D071
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:47:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhGB60NYdz304f;
	Mon, 27 Jan 2025 15:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737953261;
	cv=none; b=kM3liatBliz+eAzLJi3MNh4D6QipZIkzmKCdLefKSX5Q+xwY+ecRHNI6mvFWYHvgg6jc78mBWzeN37qq57Z8IgqbXH2D1e70R7EKC7skVSvNdoJSuEHE/uH/3GQdMncE3aI47QSt8UWgc1nJmBCoCAvcFS+616f+HtDO1skS9X7yDelQ+/PPx9YV7hRe6JVUrjb3W3Zy75/LObXuGpiHrDxwxboPVXNorZqKGC9zfq1TNOh9oJ8iJOz9luGk9HRHrgyZBa5LZsUP7W0aJ9aOpFdupYVqwBIcax48AG+EoUGPL1hUu+7RwTjlqekH7TU4WW32yS7TZnkELLF4bMFLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737953261; c=relaxed/relaxed;
	bh=8s7Ds60gjtQnD2YHryZNmmtpHeK8QNHCFd5vCouw/5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDicjkkfoXW8+riJiUw6w176fLc/a43t0Fjh4GP1IyhT5xHRhivuC7GsvsoF9XbEOgHxnKr8XEEl3iolzaHohlISfrv95dENT9Q9ZhjlC6anT5oLZh6G7zzHiRdq68dwbB+t1dUYHzsM3qM5gXD3m3AyLMzror4/yxluFzuh8ZSDF+xU8Hh13AnsY+C3m3Mkl1D7fIUHTrvoY8bXJv7IYsY34CyROOn2UIQ9vVnNODB/0JguKX5QGAq8nnmZ2NcBDVMC1Lo2Aeza7c+bG3SI7PgdRg3/+UdqMCaDyZGlAE/o1JsSS/hkpBB2UsU8h16g7JXbt4qU8xV/FJXVX2ZJjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oLDGLEQC; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oLDGLEQC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhGB43mwcz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:47:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EDF1A403D5;
	Mon, 27 Jan 2025 04:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B37C4CED2;
	Mon, 27 Jan 2025 04:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953257;
	bh=4jEpreMdOqSVobpv5nr5v8UoKZu1pgFXAImK+PlYJ/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLDGLEQCx8r2aEmuePy6OIimus9lYmMLRPucajM5lpal1zBL/l5fBoz4yE1UkMo6f
	 16A5FqWSdOC6dQP65QNmFbSvp9uGGqEynVyuddKUkk94Hw1SwlsHbHXn8iLzGr+eQz
	 iDozUBQvH/5SsZLU73X6UeavDc3Q6c2MmR+3YxoB1CK1PsY+JLiHqDooY2fdpGocpA
	 jxii+k1H+qq+qLAWLIUpm6Mt2F+y8UbJ3H/2JB2FFLy3JwGoad8VKgFXNzjBumqKMw
	 ZaCGr/DpMuIR28JX7NsV6jBU+4DH3H9lySeSZ4RizTNHpcI8F7LJ96y1xBMDAMbhDg
	 BSSd0w0uiZ+xw==
Date: Sun, 26 Jan 2025 22:47:35 -0600
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
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <20250127044735.GD3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  4 files changed, 354 insertions(+), 204 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d1f4978a672c1217c322c27f243470b2de8c99d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,129 @@
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
> +description: |
> +  This is a little-endian 4-channel DMA controller, used in Freescale mpc83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any
> +  DMA channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See
> +  ssi.txt for more information.
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
> +  ranges: true
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

(The tools should have highlighted this)

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8315-dma-channel
> +              - fsl,mpc8323-dma-channel
> +              - fsl,mpc8347-dma-channel
> +              - fsl,mpc8349-dma-channel
> +              - fsl,mpc8360-dma-channel
> +              - fsl,mpc8377-dma-channel
> +              - fsl,mpc8378-dma-channel
> +              - fsl,mpc8379-dma-channel
> +          - const: fsl,elo-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true

You have to define how many interrupts and what they are.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    dma@82a8 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg = <0x82a8 4>;
> +        ranges = <0 0x8100 0x1a4>;
> +        interrupt-parent = <&ipic>;
> +        interrupts = <71 8>;
> +        cell-index = <0>;
> +        dma-channel@0 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <0>;
> +            reg = <0 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +        dma-channel@80 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <1>;
> +            reg = <0x80 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <2>;
> +            reg = <0x100 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8349-dma-channel", "fsl,elo-dma-channel";
> +            cell-index = <3>;
> +            reg = <0x180 0x80>;
> +            interrupt-parent = <&ipic>;
> +            interrupts = <71 8>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d4853ffd40dc75c7fcdc0dfb15e497ec56f3e1ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo3 DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  DMA controller which has same function as EloPlus except that Elo3 has 8
> +  channels while EloPlus has only 4, it is used in Freescale Txxx and Bxxx
> +  series chips, such as t1040, t4240, b4860.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    const: fsl,elo3-dma
> +
> +  reg:
> +    maxItems: 2
> +    description: |
> +      contains two entries for DMA General Status Registers, i.e. DGSR0 which
> +      includes status for channel 1~4, and DGSR1 for channel 5~8
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

> +
> +    properties:
> +      compatible:
> +        const: fsl,eloplus-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts: true

You have to define how many interrupts.

> +
> +examples:
> +  - |
> +    dma@100300 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,elo3-dma";
> +        reg = <0x100300 0x4>,
> +              <0x100600 0x4>;
> +        ranges = <0x0 0x100100 0x500>;
> +        dma-channel@0 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x0 0x80>;
> +            interrupts = <28 2 0 0>;
> +        };
> +        dma-channel@80 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x80 0x80>;
> +            interrupts = <29 2 0 0>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x100 0x80>;
> +            interrupts = <30 2 0 0>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x180 0x80>;
> +            interrupts = <31 2 0 0>;
> +        };
> +        dma-channel@300 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x300 0x80>;
> +            interrupts = <76 2 0 0>;
> +        };
> +        dma-channel@380 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x380 0x80>;
> +            interrupts = <77 2 0 0>;
> +        };
> +        dma-channel@400 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x400 0x80>;
> +            interrupts = <78 2 0 0>;
> +        };
> +        dma-channel@480 {
> +            compatible = "fsl,eloplus-dma-channel";
> +            reg = <0x480 0x80>;
> +            interrupts = <79 2 0 0>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..680d64332ddf4d6d68ee8c607ac71211a7e19e6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale EloPlus DMA Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +description: |
> +  This is a 4-channel DMA controller with extended addresses and chaining,
> +  mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such as
> +  mpc8540, mpc8641 p4080, bsc9131 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property must say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the Elo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by another
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore, any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drivers, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-dma
> +              - fsl,mpc8541-dma
> +              - fsl,mpc8548-dma
> +              - fsl,mpc8555-dma
> +              - fsl,mpc8560-dma
> +              - fsl,mpc8572-dma
> +              - fsl,mpc8641-dma
> +          - const: fsl,eloplus-dma
> +      - const: fsl,eloplus-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains
> +      status for all the 4 DMA channels
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      controller index.  0 for controller @ 0x21000, 1 for controller @ 0xc000
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8540-dma-channel
> +              - fsl,mpc8541-dma-channel
> +              - fsl,mpc8548-dma-channel
> +              - fsl,mpc8555-dma-channel
> +              - fsl,mpc8560-dma-channel
> +              - fsl,mpc8572-dma-channel
> +          - const: fsl,eloplus-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true

How many?

> +
> +examples:
> +  - |
> +    dma@21300 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8540-dma", "fsl,eloplus-dma";
> +        reg = <0x21300 4>;
> +        ranges = <0 0x21100 0x200>;
> +        cell-index = <0>;
> +        dma-channel@0 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0 0x80>;
> +            cell-index = <0>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <20 2>;
> +        };
> +        dma-channel@80 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x80 0x80>;
> +            cell-index = <1>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <21 2>;
> +        };
> +        dma-channel@100 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x100 0x80>;
> +            cell-index = <2>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <22 2>;
> +        };
> +        dma-channel@180 {
> +            compatible = "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-channel";
> +            reg = <0x180 0x80>;
> +            cell-index = <3>;
> +            interrupt-parent = <&mpic>;
> +            interrupts = <23 2>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...

