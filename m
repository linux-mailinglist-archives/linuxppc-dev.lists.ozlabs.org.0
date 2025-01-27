Return-Path: <linuxppc-dev+bounces-5585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A399A1D096
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 06:09:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhGfp6xz3z305D;
	Mon, 27 Jan 2025 16:09:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737954546;
	cv=none; b=oJErSGz7nkqeYIsNPN4Yuak4J770AGUhHa4fR3kisI9ulGguNqVksvfv/1QzBOvq9RNFb0vWnnnXstv2nYyrKemXuxIezz5ssiUk+8X59hgGwJsg69dMGX/k7IAPLeVsDRmi0FE9NXFJ9iv4IttTwN6MrTeo2wa2mQ+vf6eofXNM6t7sk5SZd+cgtcVYiSQ/C/RO+VDAU0QSF7JRy7XKE+oudz55pDdbiDj7V9r5ut76ZV3at8zQe5WMQWcbSPcsS0p6zCexDjy0RRrJWTUyTrJBTm+SdzZQ2oGrTE07OP08Gd2ZfoLE1Z/pfXmLmphZlBiVVc6HKcMz4QlcWAfjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737954546; c=relaxed/relaxed;
	bh=RvJ8rBrk7OqINXwwnV5u0+Kf0ZKc4aA8McFH8XCmR2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQR2uycrECgH+mc+HHuilmxDhgzvSnZ/ji9KZU6G16N45ItgCAlQFNVUzswhkeKi+rM+wWPKNZ5ovVw7CepBrP14WtqD1DMSY1L0i59GW8dKssgEe2LHnaceUzcR4h0hX3RDraMAHt7dqFOfP9CwwQopgaZ6ldHuALKXMgdKiJ8vO23hfb5zlUrEw2AjFyvRSDTx/uipU8T3ewCFZl2D5hzAgJQ/TcPcPXOsa+Z4FVWwnNbNl5rwzoWssvmvU4eerX5TF7HdsYoXQVfC3caeKEZI7+TU8dPQ9rZeBu/G29vzMi/hk5nzcmcmmmjDUh1ZJTmi87sGaDio7nb6nkJFJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCXssLii; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCXssLii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhGfn6pwhz304C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 16:09:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BA01A40473;
	Mon, 27 Jan 2025 05:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EBCC4CED2;
	Mon, 27 Jan 2025 05:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737954543;
	bh=SRnaJ7NOhy1yqtMSuRpVYvCRnbZCyG9ICmKcrEhZu1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCXssLii/zSRuNLuQUKKGyPENsQBo8Sn5CnYY3O3FxYVAjvruFGyZ57EqKUguv/ra
	 S1h9azhs45cKCSaEPcpsFRa1xKUdQaiOE1O3mn5BZdEeVFQfTlDF7bD3TDraPrBc+3
	 nPr1oEW2dfuaWfsgk5bejmSntOo7SnDsTmo+1COoCYTPp06T7kKbcFbJdDA8zzvyNe
	 x/H0vNeh34Ov9EMHHnfnz+3OUzplGfUJFvMSQcKI5nvKJbwxbMBt6ha/ffzx8jCdb9
	 hCqZ+eanBhx2pBGe+B8aQ+DqKIv74Gk+cWfnDnM6BJFAzTM3tPgAH3xzHh4Ww7eGxN
	 yKnd77AdR7MFA==
Date: Sun, 26 Jan 2025 23:09:01 -0600
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
Subject: Re: [PATCH 8/9] dt-bindings: spi: Convert Freescale SPI bindings to
 YAML
Message-ID: <20250127050901.GB3127337-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:03PM +0100, J. Neuschäfer wrote:
> fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> contollers. Convert them to YAML.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/spi/fsl,espi.yaml          | 56 +++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 71 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 -------------------
>  3 files changed, 127 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..350275760210c5763af0c7b1e1522ccbfb97eec7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> @@ -0,0 +1,56 @@
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
> +  interrupts: true

How many?

> +
> +  fsl,espi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of the chipselect signals.

Constraints?

> +
> +  fsl,csbef:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Chip select assertion time in bits before frame starts

Constraints?

> +
> +  fsl,csaft:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Chip select negation time in bits after frame ends

Constraints?

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
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,mpc8536-espi";
> +        reg = <0x110000 0x1000>;
> +        interrupts = <53 0x2>;
> +        interrupt-parent = <&mpic>;
> +        fsl,espi-num-chipselects = <4>;
> +        fsl,csbef = <1>;
> +        fsl,csaft = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8efa971b5954a93665cb624345774f2966bb5648
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SPI (Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,spi
> +      - aeroflexgaisler,spictrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      QE SPI subblock index.
> +      0: QE subblock SPI1
> +      1: QE subblock SPI2
> +
> +  mode:
> +    description: SPI operation mode
> +    enum:
> +      - cpu
> +      - cpu-qe
> +
> +  interrupts: true
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type.

> +    description: input clock frequency to non FSL_SOC cores
> +
> +  cs-gpios: true
> +
> +  fsl,spisel_boot:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      For the MPC8306 and MPC8309, specifies that the SPISEL_BOOT signal is used
> +      as chip select for a slave device. Use reg = <number of gpios> in the
> +      corresponding child node, i.e. 0 if the cs-gpios property is not present.
> +
> +required:
> +  - compatible
> +  - reg
> +  - mode
> +  - interrupts
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@4c0 {
> +        cell-index = <0>;
> +        compatible = "fsl,spi";
> +        reg = <0x4c0 0x40>;
> +        interrupts = <82 0>;
> +        interrupt-parent = <&intc>;
> +        mode = "cpu";
> +        cs-gpios = <&gpio 18 1          // device reg=<0>
> +                    &gpio 19 1>;        // device reg=<1>
> +    };

