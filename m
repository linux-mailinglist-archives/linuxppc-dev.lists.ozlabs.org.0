Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D510665859
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 10:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsNQp393tz3f9t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 20:57:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NzYr9WZv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NzYr9WZv;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsNPr07dXz2y32
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 20:57:03 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id m3so10708664wmq.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 01:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZrK9lXyFzrE/eivw3OcCooHt4NoTEPjrW6/dIApfWI=;
        b=NzYr9WZvB0yPX9hmesMv0hgjDwjPXJutQ420ENuuA9rzr/TQWrsMDcym9eYFiFgdGI
         naPSBbWitrpZKZCx0vELymwzFkMspdu+Dlsap6Mxeh5+O0zR+tMzz+1bmNzADbvSiYxH
         dNr97ZXrfPxm8W0qoh0JM1wDMcbDddc8uOAMflrjpxZ5LlenxI4MCjd0zOoGjJLCLcjq
         YFgE2RKtVeBT+dwfGwj5KDpEGeTsHfb0zSTv6aulHloiytjxY0CVuM/aodJXMm6Wp129
         mlYgw97MwPSwerW/Ty1mMGlZd3O2cqPqsp7bvEqIqKMh6NmWkV15o7ZAluVXGyOKhaTR
         +sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZrK9lXyFzrE/eivw3OcCooHt4NoTEPjrW6/dIApfWI=;
        b=wCvI8m/17BkCIBMvKrJ6Se3WwvLatitfeaMkmWNZ6kCpVw0cv5L0lOZGA/jw9KLL9j
         rBbr44cIT2ZNowAJl8in4PklxjtaqiXmATH+FV0Amso8UxD2ilZ3BGxGFNybdAludAN6
         WC4twr/KW7hlRSycRCT9dIWCObaSn+3n9LK+rCujmIBX1nl2ld9wCrJ9D6aA+DjAuFjA
         kHvFB/9jbDCteitWJCeXlIPrtbBd8Sa9Ed7b5v8OSbPCZOnKNkKMs/imkSu6hEJHUl1C
         ej3p26wYFPxv2Zpdu+csvC/AAegqEzp7bnwbgPeQ1xCas2lll1zDN+tkESByVGxct6Eq
         SGBQ==
X-Gm-Message-State: AFqh2kp9agEtRAShcyASHQMUPQWw1omqpZMFvhR9WSWGJOHHqUsWC3vP
	/2e6CdsPZ8UVL8+3WCMOSIhd8g==
X-Google-Smtp-Source: AMrXdXtnjRK0dM2PKFvDPnK0ZNqW9OOfaNRQsXHtWzxpQraFJ2OLkK1Td920Jou43ys0vpMsTSfiYA==
X-Received: by 2002:a05:600c:4e46:b0:3d2:3761:b717 with SMTP id e6-20020a05600c4e4600b003d23761b717mr52118078wmq.37.1673431019418;
        Wed, 11 Jan 2023 01:56:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s23-20020a1cf217000000b003d1e3b1624dsm22268979wmc.2.2023.01.11.01.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:56:59 -0800 (PST)
Message-ID: <c1b07878-4cbc-bb79-3635-03f15df8a658@linaro.org>
Date: Wed, 11 Jan 2023 10:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-2-herve.codina@bootlin.com>
 <427e0775-c576-e293-f590-b9840b936884@linaro.org>
 <20230110090445.2dc61b51@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110090445.2dc61b51@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/01/2023 09:04, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Sun, 8 Jan 2023 16:10:38 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> [...]
> 
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^tdm@[0-1]$":  
>>
>> Use consistent quotes - either ' or "
> 
> Ok, I will change on v3.
> I will also change them on the other bindings present in the
> series.
> 
>>
>>> +    description:
>>> +      The TDM managed by this controller
>>> +    type: object
>>> +
>>> +    properties:
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 1
>>> +        description:
>>> +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
>>> +
>>> +      fsl,common-rxtx-pins:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          Use common pins for both transmit and receive  
>>
>> What are the "common" pins? Without this property device is using
>> uncommon pins? This does not make sense...
> 
> Common in the "shared" sense.
> The hardware can use dedicated pins for Tx clock, Tx sync,
> Rx clock and Rx sync or use only 2 pins, Tx/Rx clock and
> Rx/Rx sync.
> 
> Without the property, we use the 4 pins and with the property,
> we use 2 pins.

Just use this as description.

> 
>>
>>> +
>>> +      clocks: true
>>> +      clock-names: true  
>>
>> Both need constraints.
> 
> The constraints are present later in the file as the number
> of clocks depends on the 'fsl,common-rxtx-pins' property.

OK, but still top level properties need widest constraints.

> 
> I will remove these two lines in the v3 series as they are
> not needed. 'clocks' and 'clock-names' are handled in the
> conditional part.

No, top level properties must contain them.

> 
>>
> [...]
>>> +
>>> +      fsl,rx-frame-sync-delay:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2, 3]
>>> +        default: 0
>>> +        description: |
>>> +          Receive frame sync delay.  
>>
>> Delay in what units?
> 
> The unit is a number of bits.
> I will rename to fsl,rx-frame-sync-delay-bits and change the description
> to 'Receive frame sync delay in number of bits'
> 
> I will do also the same for fsl,tx-frame-sync-delay property.

OK

> 
>>
>>> +          Indicates the delay between the Rx sync and the first bit of the
>>> +          Rx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
>>> +
>>> +      fsl,tx-frame-sync-delay:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        enum: [0, 1, 2, 3]
>>> +        default: 0
>>> +        description: |
>>> +          Transmit frame sync delay.
>>> +          Indicates the delay between the Tx sync and the first bit of the
>>> +          Tx frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
>>> +
>>> +      fsl,clock-falling-edge:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description: |
>>> +          Data is sent on falling edge of the clock (and received on the
>>> +          rising edge).
>>> +          If 'clock-falling-edge' is not present, data is sent on the
>>> +          rising edge (and received on the falling edge).
>>> +
>>> +      fsl,fsync-rising-edge:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          Frame sync pulses are sampled with the rising edge of the channel
>>> +          clock. If 'fsync-rising-edge' is not present, pulses are sample
>>> +          with e falling edge.
>>> +
>>> +      fsl,double-speed-clock:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          The channel clock is twice the data rate.
>>> +
>>> +      fsl,grant-mode:
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          Grant mode enabled.  
>>
>> This we know from property name. You need to describe what it is and
>> what it does.
> 
> Instead of describing it, I will simply remove the property (I should
> have done already).
> I cannot test the 'grant mode' enabled with my hardware and so
> I prefer keeping it disabled.
> This property, if needed, could be add later setting it optional
> with default to 'disabled'.
> 
>>
>>> +
>>> +      tx_ts_routes:  
>>
>> No underscores, missing vendor prefix.
> 
> Indeed, will be change to fsl,tx-ts-routes (idem for rx_ts_routes).
> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>> +        description: |
>>> +          A list of tupple that indicates the Tx time-slots routes.
>>> +            tx_ts_routes =
>>> +               < 2 0 0>, /* The first 2 time slots are not used */
>>> +               < 3 1 0>, /* The next 3 ones are route to SCC2 */
>>> +               < 4 0 0>, /* The next 4 ones are not used */
>>> +               < 2 2 0>; /* The nest 2 ones are route to SCC3 */
>>> +        items:
>>> +          items:
>>> +            - description:
>>> +                The number of time-slots
>>> +              minimum: 1
>>> +              maximum: 64
>>> +            - description: |
>>> +                The source serial interface (dt-bindings/soc/fsl-tsa.h
>>> +                defines these values)
>>> +                 - 0: No destination
>>> +                 - 1: SCC2
>>> +                 - 2: SCC3
>>> +                 - 3: SCC4
>>> +                 - 4: SMC1
>>> +                 - 5: SMC2
>>> +              enum: [0, 1, 2, 3, 4, 5]
>>> +            - description:
>>> +                The route flags (reserved)  
>>
>> Why part of binding is reserved?
> 
> The 'reserved' part will be removed in v3.
> Same for the rx route table.
> 
>>
>>> +              const: 0
>>> +        minItems: 1
>>> +        maxItems: 64
>>> +
>>> +      rx_ts_routes:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>> +        description: |
>>> +          A list of tupple that indicates the Rx time-slots routes.
>>> +            tx_ts_routes =
>>> +               < 2 0 0>, /* The first 2 time slots are not used */
>>> +               < 3 1 0>, /* The next 3 ones are route from SCC2 */
>>> +               < 4 0 0>, /* The next 4 ones are not used */
>>> +               < 2 2 0>; /* The nest 2 ones are route from SCC3 */
>>> +        items:
>>> +          items:
>>> +            - description:
>>> +                The number of time-slots
>>> +              minimum: 1
>>> +              maximum: 64
>>> +            - description: |
>>> +                The destination serial interface (dt-bindings/soc/fsl-tsa.h
>>> +                defines these values)
>>> +                 - 0: No destination
>>> +                 - 1: SCC2
>>> +                 - 2: SCC3
>>> +                 - 3: SCC4
>>> +                 - 4: SMC1
>>> +                 - 5: SMC2
>>> +              enum: [0, 1, 2, 3, 4, 5]
>>> +            - description:
>>> +                The route flags (reserved)
>>> +              const: 0
>>> +        minItems: 1
>>> +        maxItems: 64
>>> +
>>> +    allOf:
>>> +      - if:
>>> +          properties:
>>> +            fsl,common-rxtx-pins:
>>> +              type: 'null'  
>>
>> What is this exactly? If check for property present, it's wrong. Should
>> be test if it is in required.
> 
> Yes, it was a check for the property presence.
> 
> If we not use the 'fsl,common-rxtx-pins', we need 4 clocks.
> If we use the 'fsl,common-rxtx-pins', we need 2 clocks (Rx part and Tx
> part use the same CLK and SYNC clocks).

https://elixir.bootlin.com/linux/v6.2-rc3/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174

> 
> How can I describe this ?
> Is the check for the property presence incorrect ?
> 
> Should I always describe 4 clocks even if only 2 are used ?
> 

>>
>>> +        then:
>>> +          properties:
>>> +            clocks:
>>> +              items:
>>> +                - description: External clock connected to L1RSYNC pin
>>> +                - description: External clock connected to L1RCLK pin
>>> +                - description: External clock connected to L1TSYNC pin
>>> +                - description: External clock connected to L1TCLK pin
>>> +            clock-names:
>>> +              items:
>>> +                - const: l1rsync
>>> +                - const: l1rclk
>>> +                - const: l1tsync
>>> +                - const: l1tclk
>>> +        else:
>>> +          properties:
>>> +            clocks:
>>> +              items:
>>> +                - description: External clock connected to L1RSYNC pin
>>> +                - description: External clock connected to L1RCLK pin
>>> +            clock-names:
>>> +              items:
>>> +                - const: l1rsync
>>> +                - const: l1rclk
>>> +
>>> +    required:
>>> +      - reg
>>> +      - clocks
>>> +      - clock-names
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - '#address-cells'
>>> +  - '#size-cells'
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/soc/fsl-tsa.h>
>>> +
>>> +    tsa@ae0 {
>>> +        compatible = "fsl,mpc885-tsa", "fsl,cpm1-tsa";
>>> +        reg = <0xae0 0x10>,
>>> +              <0xc00 0x200>;
>>> +        reg-names = "si_regs", "si_ram";
>>> +
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        tdm@0 {
>>> +            /* TDMa */
>>> +            reg = <0>;
>>> +
>>> +            clocks = <&clk_l1rsynca>, <&clk_l1rclka>;
>>> +            clock-names = "l1rsync", "l1rclk";
>>> +
>>> +            fsl,common-rxtx-pins;
>>> +            fsl,fsync-rising-edge;
>>> +
>>> +            tx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
>>> +                           < 24 FSL_CPM_TSA_SCC4 0>, /* TS 2..25 */
>>> +                           < 1 0 0>,                 /* TS 26 */
>>> +                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
>>> +
>>> +            rx_ts_routes = < 2 0 0>,                 /* TS 0..1 */
>>> +                           < 24 FSL_CPM_TSA_SCC4 0>, /* 2..25 */
>>> +                           < 1 0 0>,                 /* TS 26 */
>>> +                           < 5 FSL_CPM_TSA_SCC3 0>;  /* TS 27..31 */
>>> +        };
>>> +    };
>>> diff --git a/include/dt-bindings/soc/fsl-tsa.h b/include/dt-bindings/soc/fsl-tsa.h
>>> new file mode 100644
>>> index 000000000000..9d09468694a2
>>> --- /dev/null
>>> +++ b/include/dt-bindings/soc/fsl-tsa.h  
>>
>> Filename should match binding filename.
> 
> Right, I will rename to fsl,tsa.h

If your binding was fsl,tsa.yaml.

Best regards,
Krzysztof

