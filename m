Return-Path: <linuxppc-dev+bounces-5583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88264A1D07B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 05:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhGDy0XLLz304l;
	Mon, 27 Jan 2025 15:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737953410;
	cv=none; b=bq0mdldgs2rf8+tYWqj+lgqUtWIl+UlEg6mYRwh+0sl1qPSn3T6ld3wnM70EaXa2REchE+k3V68LgslyQjJUSj9//SMTE98IvT2uqTs5JnQ9fSZiIr4UyF1I1Suph+TEc1pgYPaFCph5Tfih3fp1G2xGpVDkC/saU+gNJxD/W9LLat0o14rNcyGwsnTERiJG/DcL6BNQuGeo0C0C9Sh92luncbWD8JK0S4YzCYqHobipJ4yEE4zmPq1SEQcbzBxaq3U2UYCrkX3IQuAfkFqsuVstVL0pbmWFSU8PwVZ52wPjo7fbKfsf7XLHSHSAdPATWo5h3/8rE+J1Ao748vY8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737953410; c=relaxed/relaxed;
	bh=Ztzj0WYxcXLUyKf0cI8LrFuIn6cVoVKw2NRWBiLF3Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+yUKSiiDAU/YJmKOqfzlXZ+KqOq7iBDXJBsBr1M5nXpZHda6NSTvVGNQpLyP0exfeijUoo8r80utJtLit3KaULnST35bOOvWgzlnI/3hTF8h/6ZosTKBMYssBIZVhpF56xFkUD+5UzHpcitdAlDNWliWBqx7jpc6Bo9oVUfTqKpqZG/7A33e8JPyrLT0+8C8Xg8HFmvzHQccJCj5dswQ5FQqTS93vhlmSwJKXLGX+Lg5vOjo3+3iGYI7dBZDm8L/c3IZCfUyph2ZspX98DJWmMunQi1EHfHbtlpc4vVnRqkty+vTY76aD+TrbPZnB5674GjXXUN1FfLF4D4u4qDJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWYqiZrY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWYqiZrY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhGDx1Rkxz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 15:50:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33629A400E8;
	Mon, 27 Jan 2025 04:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF808C4CED2;
	Mon, 27 Jan 2025 04:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953405;
	bh=2rLaEDPfSm/lD1nBxwCCwk3Yv0BG6rIKmqNgHO3hz5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWYqiZrY+ksbAukgBdboA4rOwSDA7l9d0vK5NMllSgNphdmB4L8Ft8u3pveYKT9mj
	 tWDtm2DwGmqOrTEVyUtSMBVneEU+O8mOz+phBh9ynODjnHUUEuOtnEpZg5oWWNsDx8
	 KD+mru9ihYDAqIbMWA6/6mLuAQMyVafqABUL8Mrpmljgisn40M2gHd2eeIMltsVq0Y
	 IYzCI+YRYSyWQ8ANrG2oM9vcjCYR4VdIx7b+UMAB0tUvIbEqx6iDYFdWrn5+WyOdmk
	 O5CzfmfhSy94avSidgCA1x2o1IDX7bGQlVZZiaI23jXiF+cvyVh/6MdCVgsl2W64t1
	 d+tntyEwJohSQ==
Date: Sun, 26 Jan 2025 22:50:04 -0600
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
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <20250127045004.GE3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
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
In-Reply-To: <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:01PM +0100, J. Neuschäfer wrote:
> Supplement Documentation/devicetree/bindings/pci/fsl,pci.txt with a more
> formal binding in YAML format.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..12e86a9c20dfe2362d11f085bd9ae47238c4a37f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> +
> +description: |
> +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt

Can you move that information here.

> +
> +maintainers:
> +  - J. Neuschäfer <j.neuschaefer@gmx.net>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8308-pcie
> +              - fsl,mpc8315-pcie
> +              - fsl,mpc8377-pcie
> +              - fsl,mpc8378-pcie
> +          - const: fsl,mpc8314-pcie
> +      - const: fsl,mpc8314-pcie
> +      - items:
> +          - const: fsl,mpc8360-pci
> +          - const: fsl,mpc8349-pci
> +      - const: fsl,mpc8349-pci
> +      - items:
> +          - const: fsl,mpc8540-pcix
> +          - const: fsl,mpc8540-pci
> +      - const: fsl,mpc8540-pci
> +      - items:
> +          - const: fsl,mpc8540-pcix
> +          - const: fsl,mpc8540-pci
> +      - const: fsl,mpc8548-pcie
> +      - const: fsl,mpc8548-pcie
> +      - const: fsl,mpc8641-pcie

Move all the single 'const' to 1 enum entry.

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: internal registers
> +      - description: config space access registers
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type for this.

> +
> +required:
> +  - reg
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pci1: pcie@e0009000 {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        #interrupt-cells = <1>;
> +        device_type = "pci";
> +        compatible = "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
> +        reg = <0xe0009000 0x00001000>;
> +        ranges = <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
> +                  0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
> +        bus-range = <0 255>;
> +        interrupt-map-mask = <0xf800 0 0 7>;
> +        interrupt-map = <0 0 0 1 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 2 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
> +        clock-frequency = <0>;
> +    };
> +
> +...
> 
> -- 
> 2.48.0.rc1.219.gb6b6757d772
> 

