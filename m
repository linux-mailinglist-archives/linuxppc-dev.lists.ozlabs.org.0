Return-Path: <linuxppc-dev+bounces-435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45BA95C794
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt7L6PlHz2ynn;
	Fri, 23 Aug 2024 18:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400670;
	cv=none; b=f++kGL3OnquXHBhQPEw1j7wECzBTp1cM/YLG+60F3G1JQNMDwIpfaIsR1/Ew2S6EJSR/fX4BJzoQwCbrsgq0SWhnks6A1zX8qKYBEInzdVBl1RH7UG6q3EenkQrV33bRjQcrIIUsIHfA0THVPjbPtclf+HW4TxA/74iBDDbLvjPgewzBOecItaadyXOzGwi4SCiSem/q58f/sVsuKlCqOrZVrYxHdM/nm/oTmEYE77mEGAbFo3llL1klLgnbhWRqhRG3t4cCCrPa4JeZ51WEmFWshPZ+h1TEhRNGN9LEkFegGHi0u9Fd3GOZNKYZiS0AdR7q7dx9srGX/eXaPF+HHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400670; c=relaxed/relaxed;
	bh=IoKJjVSwXlckTtQPIf16r/GF5I59VapeDR8TYXPRLCo=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=c3+gP7ZxBx8SCyak7R8HJ4cLlzg4VqIVprId9DY/BiWhBi4UU/TNlyBaYI/9P4Iom3vi8arg6J1OsE111XvmrgCd5g08INtbSqL/DghXgafYmpGEKzex4qb52xPdmj9gxcPbFkR8Uw+s9zo2J91yqH+69fzxv1MYgvEHcN6ShwDJUEo2BHBvGf+T6ExBobmXnp55dviSBTxSv+3tMj4fTnePAOR+x3cDVy+CNHVYe93n7jQQfvtrs4j3tF/EnWngtZronIQH58TZT08SAyRKX8gxRbhBgAEm/SW84l3EkfQF8hTLcEiE3qYmiFhbMcHJl7F1+X/sqNcp7PyCN0kzoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt7L4G6sz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:11:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt7H6F4rz9sSK;
	Fri, 23 Aug 2024 10:11:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6MhOJflBwDU; Fri, 23 Aug 2024 10:11:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt7D5v6Tz9sSH;
	Fri, 23 Aug 2024 10:11:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B73798B77D;
	Fri, 23 Aug 2024 10:11:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id a-bcPQCJYbO1; Fri, 23 Aug 2024 10:11:04 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CCB18B763;
	Fri, 23 Aug 2024 10:11:04 +0200 (CEST)
Message-ID: <0f17974a-58c8-4243-b160-fc0aef98a803@csgroup.eu>
Date: Fri, 23 Aug 2024 10:11:03 +0200
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
Subject: Re: [PATCH v2 23/36] dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine
 (QE) QMC controller
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-24-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-24-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Add support for the QMC (QUICC Multichannel Controller) available in
> some PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.
> 
> This QE QMC is similar to the CPM QMC except that it uses UCCs (Unified
> Communication Controllers) instead of SCCs (Serial Communication
> Controllers). Also, compared against the CPM QMC, this QE QMC does not
> use a fixed area for the UCC/SCC parameters area but it uses a dynamic
> area allocated and provided to the hardware at runtime.
> Last point, the QE QMC can use a firmware to have the QMC working in
> 'soft-qmc' mode.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   .../soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml        | 197 ++++++++++++++++++
>   1 file changed, 197 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
> new file mode 100644
> index 000000000000..71ae64cb8a4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
> @@ -0,0 +1,197 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC QE QUICC Multichannel Controller (QMC)
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within one
> +  serial controller using the same TDM physical interface routed from TSA.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8321-ucc-qmc
> +      - const: fsl,qe-ucc-qmc
> +
> +  reg:
> +    items:
> +      - description: UCC (Unified communication controller) register base
> +      - description: Dual port ram base
> +
> +  reg-names:
> +    items:
> +      - const: ucc_regs
> +      - const: dpram
> +
> +  interrupts:
> +    maxItems: 1
> +    description: UCC interrupt line in the QE interrupt controller
> +
> +  fsl,tsa-serial:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to TSA node
> +          - enum: [1, 2, 3, 4, 5]
> +            description: |
> +              TSA serial interface (dt-bindings/soc/qe-fsl,tsa.h defines these
> +              values)
> +               - 1: UCC1
> +               - 2: UCC2
> +               - 3: UCC3
> +               - 4: UCC4
> +               - 5: UCC5
> +    description:
> +      Should be a phandle/number pair. The phandle to TSA node and the TSA
> +      serial interface to use.
> +
> +  fsl,soft-qmc:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Soft QMC firmware name to load. If this property is omitted, no firmware
> +      are used.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
> +    description:
> +      A channel managed by this controller
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8321-ucc-qmc-hdlc
> +          - const: fsl,qe-ucc-qmc-hdlc
> +          - const: fsl,qmc-hdlc
> +
> +      reg:
> +        minimum: 0
> +        maximum: 63
> +        description:
> +          The channel number
> +
> +      fsl,operational-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum: [transparent, hdlc]
> +        default: transparent
> +        description: |
> +          The channel operational mode
> +            - hdlc: The channel handles HDLC frames
> +            - transparent: The channel handles raw data without any processing
> +
> +      fsl,reverse-data:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The bit order as seen on the channels is reversed,
> +          transmitting/receiving the MSB of each octet first.
> +          This flag is used only in 'transparent' mode.
> +
> +      fsl,tx-ts-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint64
> +        description:
> +          Channel assigned Tx time-slots within the Tx time-slots routed by the
> +          TSA to this cell.
> +
> +      fsl,rx-ts-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint64
> +        description:
> +          Channel assigned Rx time-slots within the Rx time-slots routed by the
> +          TSA to this cell.
> +
> +      fsl,framer:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle to the framer node. The framer is in charge of an E1/T1 line
> +          interface connected to the TDM bus. It can be used to get the E1/T1 line
> +          status such as link up/down.
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              not:
> +                contains:
> +                  const: fsl,qmc-hdlc
> +        then:
> +          properties:
> +            fsl,framer: false
> +
> +    required:
> +      - reg
> +      - fsl,tx-ts-mask
> +      - fsl,rx-ts-mask
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - fsl,tsa-serial
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qe-fsl,tsa.h>
> +
> +    qmc@a60 {
> +        compatible = "fsl,mpc8321-ucc-qmc", "fsl,qe-ucc-qmc";
> +        reg = <0x3200 0x200>,
> +              <0x10000 0x1000>;
> +        reg-names = "ucc_regs", "dpram";
> +        interrupts = <35>;
> +        interrupt-parent = <&qeic>;
> +        fsl,soft-qmc = "fsl_qe_ucode_qmc_8321_11.bin";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fsl,tsa-serial = <&tsa FSL_QE_TSA_UCC4>;
> +
> +        channel@16 {
> +            /* Ch16 : First 4 even TS from all routed from TSA */
> +            reg = <16>;
> +            fsl,operational-mode = "transparent";
> +            fsl,reverse-data;
> +            fsl,tx-ts-mask = <0x00000000 0x000000aa>;
> +            fsl,rx-ts-mask = <0x00000000 0x000000aa>;
> +        };
> +
> +        channel@17 {
> +            /* Ch17 : First 4 odd TS from all routed from TSA */
> +            reg = <17>;
> +            fsl,operational-mode = "transparent";
> +            fsl,reverse-data;
> +            fsl,tx-ts-mask = <0x00000000 0x00000055>;
> +            fsl,rx-ts-mask = <0x00000000 0x00000055>;
> +        };
> +
> +        channel@19 {
> +            /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
> +            compatible = "fsl,mpc8321-ucc-qmc-hdlc",
> +                         "fsl,qe-ucc-qmc-hdlc",
> +                         "fsl,qmc-hdlc";
> +            reg = <19>;
> +            fsl,operational-mode = "hdlc";
> +            fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
> +            fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
> +            fsl,framer = <&framer>;
> +        };
> +    };

