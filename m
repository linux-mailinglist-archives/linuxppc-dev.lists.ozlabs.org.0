Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC194209C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 21:29:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IP4rd+uy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYQKP5FQGz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 05:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IP4rd+uy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYQJj70Trz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 05:29:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BC396204B;
	Tue, 30 Jul 2024 19:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D09C32782;
	Tue, 30 Jul 2024 19:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722367745;
	bh=EoFGqnleFFXGhsQ7/OGQ6TXuSKG/xH/9la5t0olCg4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IP4rd+uyFw/hOrD8wXX9RsFZnGP2BmkJNGJO0TB8uqpEDm8yEpYRfQQ7rMbMu798m
	 xdu1zLdOr6rNfJmDZJhnhlFltpQOIwQq4aKLgEQ/+1u3ytGshg3p3bIvPBC5MyeQ59
	 JE2k87TmjZ3kfEZcBxFanuIQn+k8TqWTNsILnDabDodp7etjIlEP1tIvfO4kM7rPlF
	 RHGUHm7TLaS/t3zmmu5DLeTy0aolFj/FGcW91GooiLcyC2xqKdXTGhXKSzInA8RaTC
	 E6EUC6BgO+2TknGITXaMdtWt+mRH1ctTVKDZ9xYEJq3bQVMYYHf3knhSW915i5T3N/
	 HoNBRkD3wExOA==
Date: Tue, 30 Jul 2024 13:29:04 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v1 07/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine
 (QE) TSA controller
Message-ID: <20240730192904.GA2009629-robh@kernel.org>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
 <20240729142107.104574-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729142107.104574-8-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024 at 04:20:36PM +0200, Herve Codina wrote:
> Add support for the time slot assigner (TSA) available in some
> PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.
> 
> This QE TSA is similar to the CPM TSA except that it uses UCCs (Unified
> Communication Controllers) instead of SCCs (Serial Communication
> Controllers). Also, compared against the CPM TSA, this QE TSA can handle
> up to 4 TDMs instead of 2 and allows to configure the logic level of
> sync signals.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml   | 212 ++++++++++++++++++
>  include/dt-bindings/soc/qe-fsl,tsa.h          |  13 ++
>  2 files changed, 225 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
>  create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
> new file mode 100644
> index 000000000000..569a4d2e0cab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-tsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC QE Time-slot assigner (TSA) controller
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
> +  Its purpose is to route some TDM time-slots to other internal serial
> +  controllers.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8321-tsa
> +      - const: fsl,qe-tsa
> +
> +  reg:
> +    items:
> +      - description: SI (Serial Interface) register base
> +      - description: SI RAM base
> +
> +  reg-names:
> +    items:
> +      - const: si_regs
> +      - const: si_ram
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^tdm@[0-3]$':
> +    description:
> +      The TDM managed by this controller
> +    type: object
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +        description:
> +          The TDM number for this TDM, 0 for TDMa, 1 for TDMb, 2 for TDMc and 3
> +          for TDMd.
> +
> +      fsl,common-rxtx-pins:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The hardware can use four dedicated pins for Tx clock, Tx sync, Rx
> +          clock and Rx sync or use only two pins, Tx/Rx clock and Tx/Rx sync.
> +          Without the 'fsl,common-rxtx-pins' property, the four pins are used.
> +          With the 'fsl,common-rxtx-pins' property, two pins are used.
> +
> +      clocks:
> +        minItems: 2
> +        items:
> +          - description: Receive sync clock
> +          - description: Receive data clock
> +          - description: Transmit sync clock
> +          - description: Transmit data clock
> +
> +      clock-names:
> +        minItems: 2
> +        items:
> +          - const: rsync
> +          - const: rclk
> +          - const: tsync
> +          - const: tclk
> +
> +      fsl,rx-frame-sync-delay-bits:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Receive frame sync delay in number of bits.
> +          Indicates the delay between the Rx sync and the first bit of the Rx
> +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.

The last 2 sentences seem redundant to me.

> +
> +      fsl,tx-frame-sync-delay-bits:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Transmit frame sync delay in number of bits.
> +          Indicates the delay between the Tx sync and the first bit of the Tx
> +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
> +
> +      fsl,clock-falling-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Data is sent on falling edge of the clock (and received on the rising
> +          edge). If 'clock-falling-edge' is not present, data is sent on the

No such property 'clock-falling-edge'. I don't think you need to repeat 
the property name anyways.

> +          rising edge (and received on the falling edge).
> +
> +      fsl,fsync-rising-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync pulses are sampled with the rising edge of the channel
> +          clock. If 'fsync-rising-edge' is not present, pulses are sampled with

And same here.

> +          the falling edge.
> +
> +      fsl,fsync-active-low:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync signals are active on low logic level.
> +          If 'fsync-active-low' is not present, sync signals are active on high

And here...

> +          level.
> +
> +      fsl,double-speed-clock:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The channel clock is twice the data rate.
> +
> +    patternProperties:
> +      '^fsl,[rt]x-ts-routes$':
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          A list of tuple that indicates the Tx or Rx time-slots routes.
> +        items:
> +          items:
> +            - description:
> +                The number of time-slots
> +              minimum: 1
> +              maximum: 64
> +            - description: |
> +                The source (Tx) or destination (Rx) serial interface
> +                (dt-bindings/soc/qe-fsl,tsa.h defines these values)
> +                 - 0: No destination
> +                 - 1: UCC1
> +                 - 2: UCC2
> +                 - 3: UCC3
> +                 - 4: UCC4
> +                 - 5: UCC5
> +              enum: [0, 1, 2, 3, 4, 5]
> +        minItems: 1
> +        maxItems: 64
> +
> +    allOf:
> +      # If fsl,common-rxtx-pins is present, only 2 clocks are needed.
> +      # Else, the 4 clocks must be present.
> +      - if:
> +          required:
> +            - fsl,common-rxtx-pins
> +        then:
> +          properties:
> +            clocks:
> +              maxItems: 2
> +            clock-names:
> +              maxItems: 2
> +        else:
> +          properties:
> +            clocks:
> +              minItems: 4
> +            clock-names:
> +              minItems: 4
> +
> +    required:
> +      - reg
> +      - clocks
> +      - clock-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qe-fsl,tsa.h>
> +
> +    tsa@ae0 {
> +        compatible = "fsl,mpc8321-tsa", "fsl,qe-tsa";
> +        reg = <0xae0 0x10>,
> +              <0xc00 0x200>;
> +        reg-names = "si_regs", "si_ram";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tdm@0 {
> +            /* TDMa */
> +            reg = <0>;
> +
> +            clocks = <&clk_l1rsynca>, <&clk_l1rclka>;
> +            clock-names = "rsync", "rclk";
> +
> +            fsl,common-rxtx-pins;
> +            fsl,fsync-rising-edge;
> +
> +            fsl,tx-ts-routes = <2 0>,             /* TS 0..1 */
> +                           <24 FSL_QE_TSA_UCC4>, /* TS 2..25 */
> +                           <1 0>,                 /* TS 26 */
> +                           <5 FSL_QE_TSA_UCC3>;  /* TS 27..31 */
> +
> +            fsl,rx-ts-routes = <2 0>,             /* TS 0..1 */
> +                           <24 FSL_QE_TSA_UCC4>, /* 2..25 */
> +                           <1 0>,                 /* TS 26 */
> +                           <5 FSL_QE_TSA_UCC3>;  /* TS 27..31 */
> +        };
> +    };
> diff --git a/include/dt-bindings/soc/qe-fsl,tsa.h b/include/dt-bindings/soc/qe-fsl,tsa.h
> new file mode 100644
> index 000000000000..3cf3df9c0968
> --- /dev/null
> +++ b/include/dt-bindings/soc/qe-fsl,tsa.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef __DT_BINDINGS_SOC_FSL_QE_TSA_H
> +#define __DT_BINDINGS_SOC_FSL_QE_TSA_H
> +
> +#define FSL_QE_TSA_NU		0
> +#define FSL_QE_TSA_UCC1		1
> +#define FSL_QE_TSA_UCC2		2
> +#define FSL_QE_TSA_UCC3		3
> +#define FSL_QE_TSA_UCC4		4
> +#define FSL_QE_TSA_UCC5		5
> +
> +#endif
> -- 
> 2.45.0
> 
