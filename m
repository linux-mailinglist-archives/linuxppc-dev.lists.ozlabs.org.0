Return-Path: <linuxppc-dev+bounces-418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1595C750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt0v0DbTz2ynR;
	Fri, 23 Aug 2024 18:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400335;
	cv=none; b=H6iSlqc4ogLG35AABxtIYQAk6IV0tw2Lg6T+9fRDQc2Nab7Uf9ElGnBiQLU/j1onzOiGZjuq3pawIOVco7LEqWiY/nvIUPPWOj3vctOOJ6zWx3a98YpIqzxqR1UDZCwTq0a8NnXeAvXVgopPh5r65EdIDBuJsT6iL3ZqR4kvg+xSz6bl+iHORb3IJAooD9EbMVy+1SCxrQgaISiu3T9NDOhHa9PE7atgfMPC6L3S+19A5Kveh/ohkl/XPfdsBBnGaGfk8dKcwafowVxS7DVBXy82Iknt/kh76rmZD2DRL5soFH4yj9U3iz7jC8rC5dlPbcmQu7M+COAzKZ5+yAItKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400335; c=relaxed/relaxed;
	bh=9zjm9Bh92EkSz6fdMt083js8Gxk5HEkOtnfjsqiE5NQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=SuVKkOgxPd/gbTx5GFcKcPPymvdZ2UuNS3b29VGlPXEFPm87y/F1dd6ZvLm5/yT2s9EyXP7Hx+fgkH/RAFMITxnwf4QfPI6RfGRiaLQurYIYl4HDvdh7FR1TH75FBRh0EIjcmQosulpgINPrCn6QdmkCG8JQ75jzFh+OBfn/+V3UYiIicrZ253Sf9MgQExVRT4rFq872vvfNpFgXfj/TSJGCqvg2G7UXbd4GJcNWMLWe1SKF8mMZ1M6x3a38jffxfXPufsHMQzUd51Mzyy1kTO6PMjuJAoG+0w9CwShA80W6M6EzgunjU6+hGfPON6l26505wXSKVtWU6R3MG4/+Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt0t56lVz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:05:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt0q6LRlz9sRs;
	Fri, 23 Aug 2024 10:05:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzyRRiTli6KD; Fri, 23 Aug 2024 10:05:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt0q5GMwz9sRr;
	Fri, 23 Aug 2024 10:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A4A448B763;
	Fri, 23 Aug 2024 10:05:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id heZRVxhmEN5X; Fri, 23 Aug 2024 10:05:26 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD2198B77D;
	Fri, 23 Aug 2024 10:05:25 +0200 (CEST)
Message-ID: <86dc965c-002c-49f1-b419-49c719e388ac@csgroup.eu>
Date: Fri, 23 Aug 2024 10:05:24 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine
 (QE) TSA controller
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-8-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-8-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml   | 210 ++++++++++++++++++
>   include/dt-bindings/soc/qe-fsl,tsa.h          |  13 ++
>   2 files changed, 223 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
>   create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
> new file mode 100644
> index 000000000000..3b50e0a003ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
> @@ -0,0 +1,210 @@
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
> +          frame.
> +
> +      fsl,tx-frame-sync-delay-bits:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Transmit frame sync delay in number of bits.
> +          Indicates the delay between the Tx sync and the first bit of the Tx
> +          frame.
> +
> +      fsl,clock-falling-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Data is sent on falling edge of the clock (and received on the rising
> +          edge). If not present, data is sent on the rising edge (and received
> +          on the falling edge).
> +
> +      fsl,fsync-rising-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync pulses are sampled with the rising edge of the channel
> +          clock. If not present, pulses are sampled with the falling edge.
> +
> +      fsl,fsync-active-low:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync signals are active on low logic level.
> +          If not present, sync signals are active on high level.
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

