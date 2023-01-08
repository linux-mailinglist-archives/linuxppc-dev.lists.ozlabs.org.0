Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0166160B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 16:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqgXK3cb4z3cC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 02:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPbR0cqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPbR0cqH;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqgWJ1TPnz3c6F
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 02:10:49 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so7187553wmb.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jan 2023 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bg8R7GNb5drrHJYQqW2GJwB+W4AiceVnD28th+/uo4I=;
        b=kPbR0cqHsrH02VTzykoBoOZCWg/Qo7jWwHGb24NzLeE+k8v/8cUUVookffg+H9koUS
         hA++KI8we94rOez+6Q+dFA2OcORLMzaK+hWMBrKCl1K4GaJJpdAvy4pWykjyBvEFwHgr
         9UM8sib62v69Fw5gHxwiJQi6qrjDoboGq7IjVFHg3aDbo7xqEvqDs2UwtkAzoZDDZ5l4
         J+ZtYMCGr8yfRRTvgAm1BqVnUaoaFUjUBwjsbx4OkrqpryARZ3P06OyI1nVxGy5uNYJU
         s/q3IwN5ojBVgO6103bZr3LVK7Rfe1sweFRYVYzvn/jk0H/+TIX6k+UslLFX+xKUpGvy
         ORFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg8R7GNb5drrHJYQqW2GJwB+W4AiceVnD28th+/uo4I=;
        b=o4QcDjx/V9EWsPkhDdsM8JCYFBAcmYSPrSEWfTkNs+hkcVq4yDwscaVkEC2LCIRYg/
         c8fkE21QniZV7e6+5juDLOWrVyxNFTAO7e9kSKWH3AazUb4CTDeg1LRDDQBUMa1wzVJa
         H5TU2Z9JKjXmu3X1HB9Dbq+ydmknU4SUYZQ4EJngh2qSBM5DM/gdAW7QynXRKlxqD9cU
         Py7u8VEpfG6I0OvTN6iZ37yLK5B0RmIALNW9zHO8XxVLevTE4lDbFfzCnRc3lcBZRi8/
         5oZp0IqXV3xzyyQPFAEGYZK0AEKHubZstJSU4X9mIqAnfJLHKJ/6bnJBPlJIVnY5AZBx
         KV3w==
X-Gm-Message-State: AFqh2kpCkF/1XI6LpvDxA4NSbM45Ao8d0zYML5HGM0VigGxdZ7hohQhd
	oQK+vNcMbUDcZNuwiQ+xDyn1sQ==
X-Google-Smtp-Source: AMrXdXvR04b9qmXw5LXVzZsXI3/3ZWLWhpukdXTXq+q6vSHTfrly72adgYlRcwhjYZblERHSvEyXbQ==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id t11-20020a1c770b000000b003cfa18d399cmr46344225wmi.1.1673190642554;
        Sun, 08 Jan 2023 07:10:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003c701c12a17sm12412741wmp.12.2023.01.08.07.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:10:41 -0800 (PST)
Message-ID: <427e0775-c576-e293-f590-b9840b936884@linaro.org>
Date: Sun, 8 Jan 2023 16:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106163746.439717-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/01/2023 17:37, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 262 ++++++++++++++++++
>  include/dt-bindings/soc/fsl-tsa.h             |  15 +
>  2 files changed, 277 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
>  create mode 100644 include/dt-bindings/soc/fsl-tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> new file mode 100644
> index 000000000000..7542c0fd8435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> @@ -0,0 +1,262 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,tsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC CPM Time-slot assigner (TSA) controller
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The TSA is the time-slot assigner that can be found on some
> +  PowerQUICC SoC.
> +  Its purpose is to route some TDM time-slots to other internal
> +  serial controllers.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc885-tsa
> +          - fsl,mpc866-tsa
> +      - const: fsl,cpm1-tsa
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
> +  "^tdm@[0-1]$":

Use consistent quotes - either ' or "

> +    description:
> +      The TDM managed by this controller
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1
> +        description:
> +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
> +
> +      fsl,common-rxtx-pins:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Use common pins for both transmit and receive

What are the "common" pins? Without this property device is using
uncommon pins? This does not make sense...

> +
> +      clocks: true
> +      clock-names: true

Both need constraints.

> +
> +      fsl,mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum: [normal, echo, internal-loopback, control-loopback]
> +        default: normal
> +        description: |
> +          Operational mode:
> +            - normal:
> +                Normal operation
> +            - echo:
> +                Automatic echo. Rx data is resent on Tx
> +            - internal-loopback:
> +                The TDM transmitter is connected to the receiver.
> +                Data appears on Tx pin.
> +            - control-loopback:
> +                The TDM transmitter is connected to the receiver.
> +                The Tx pin is disconnected.
> +
> +      fsl,rx-frame-sync-delay:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Receive frame sync delay.

Delay in what units?

> +          Indicates the delay between the Rx sync and the first bit of the
> +          Rx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
> +
> +      fsl,tx-frame-sync-delay:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Transmit frame sync delay.
> +          Indicates the delay between the Tx sync and the first bit of the
> +          Tx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
> +
> +      fsl,clock-falling-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: |
> +          Data is sent on falling edge of the clock (and received on the
> +          rising edge).
> +          If 'clock-falling-edge' is not present, data is sent on the
> +          rising edge (and received on the falling edge).
> +
> +      fsl,fsync-rising-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync pulses are sampled with the rising edge of the channel
> +          clock. If 'fsync-rising-edge' is not present, pulses are sample
> +          with e falling edge.
> +
> +      fsl,double-speed-clock:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The channel clock is twice the data rate.
> +
> +      fsl,grant-mode:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Grant mode enabled.

This we know from property name. You need to describe what it is and
what it does.

> +
> +      tx_ts_routes:

No underscores, missing vendor prefix.

> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          A list of tupple that indicates the Tx time-slots routes.
> +            tx_ts_routes =
> +               < 2 0 0>, /* The first 2 time slots are not used */
> +               < 3 1 0>, /* The next 3 ones are route to SCC2 */
> +               < 4 0 0>, /* The next 4 ones are not used */
> +               < 2 2 0>; /* The nest 2 ones are route to SCC3 */
> +        items:
> +          items:
> +            - description:
> +                The number of time-slots
> +              minimum: 1
> +              maximum: 64
> +            - description: |
> +                The source serial interface (dt-bindings/soc/fsl-tsa.h
> +                defines these values)
> +                 - 0: No destination
> +                 - 1: SCC2
> +                 - 2: SCC3
> +                 - 3: SCC4
> +                 - 4: SMC1
> +                 - 5: SMC2
> +              enum: [0, 1, 2, 3, 4, 5]
> +            - description:
> +                The route flags (reserved)

Why part of binding is reserved?

> +              const: 0
> +        minItems: 1
> +        maxItems: 64
> +
> +      rx_ts_routes:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          A list of tupple that indicates the Rx time-slots routes.
> +            tx_ts_routes =
> +               < 2 0 0>, /* The first 2 time slots are not used */
> +               < 3 1 0>, /* The next 3 ones are route from SCC2 */
> +               < 4 0 0>, /* The next 4 ones are not used */
> +               < 2 2 0>; /* The nest 2 ones are route from SCC3 */
> +        items:
> +          items:
> +            - description:
> +                The number of time-slots
> +              minimum: 1
> +              maximum: 64
> +            - description: |
> +                The destination serial interface (dt-bindings/soc/fsl-tsa.h
> +                defines these values)
> +                 - 0: No destination
> +                 - 1: SCC2
> +                 - 2: SCC3
> +                 - 3: SCC4
> +                 - 4: SMC1
> +                 - 5: SMC2
> +              enum: [0, 1, 2, 3, 4, 5]
> +            - description:
> +                The route flags (reserved)
> +              const: 0
> +        minItems: 1
> +        maxItems: 64
> +
> +    allOf:
> +      - if:
> +          properties:
> +            fsl,common-rxtx-pins:
> +              type: 'null'

What is this exactly? If check for property present, it's wrong. Should
be test if it is in required.

> +        then:
> +          properties:
> +            clocks:
> +              items:
> +                - description: External clock connected to L1RSYNC pin
> +                - description: External clock connected to L1RCLK pin
> +                - description: External clock connected to L1TSYNC pin
> +                - description: External clock connected to L1TCLK pin
> +            clock-names:
> +              items:
> +                - const: l1rsync
> +                - const: l1rclk
> +                - const: l1tsync
> +                - const: l1tclk
> +        else:
> +          properties:
> +            clocks:
> +              items:
> +                - description: External clock connected to L1RSYNC pin
> +                - description: External clock connected to L1RCLK pin
> +            clock-names:
> +              items:
> +                - const: l1rsync
> +                - const: l1rclk
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
> +    #include <dt-bindings/soc/fsl-tsa.h>
> +
> +    tsa@ae0 {
> +        compatible = "fsl,mpc885-tsa", "fsl,cpm1-tsa";
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
> +            clock-names = "l1rsync", "l1rclk";
> +
> +            fsl,common-rxtx-pins;
> +            fsl,fsync-rising-edge;
> +
> +            tx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
> +                           < 24 FSL_CPM_TSA_SCC4 0>, /* TS 2..25 */
> +                           < 1 0 0>,                 /* TS 26 */
> +                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
> +
> +            rx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
> +                           < 24 FSL_CPM_TSA_SCC4 0>, /* 2..25 */
> +                           < 1 0 0>,                 /* TS 26 */
> +                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
> +        };
> +    };
> diff --git a/include/dt-bindings/soc/fsl-tsa.h b/include/dt-bindings/soc/fsl-tsa.h
> new file mode 100644
> index 000000000000..9d09468694a2
> --- /dev/null
> +++ b/include/dt-bindings/soc/fsl-tsa.h

Filename should match binding filename.

> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR MIT */

A bit weird license... cannot be the same as binding?

> +
> +#ifndef __DT_BINDINGS_SOC_FSL_TSA_H
> +#define __DT_BINDINGS_SOC_FSL_TSA_H
> +
> +#define FSL_CPM_TSA_NU		0	/* Pseuso Cell Id for not used item */

Why defining unused IDs in binding header? These are IDs, not some
hardware/register values.

> +#define FSL_CPM_TSA_SCC2	1
> +#define FSL_CPM_TSA_SCC3	2
> +#define FSL_CPM_TSA_SCC4	3
> +#define FSL_CPM_TSA_SMC1	4
> +#define FSL_CPM_TSA_SMC2	5
> +
> +#define FSL_CPM_TSA_NBCELL	6

Drop.

> +
> +#endif

Best regards,
Krzysztof

