Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DDE6797EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 13:25:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1R5P2j5Fz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 23:25:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yshX5LVf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yshX5LVf;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1R4R4kVjz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 23:24:54 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id l8so11301360wms.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 04:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXlY6d84cdDKWem0q3VudkJf3bezWEcgaKMh2EVVNTk=;
        b=yshX5LVfelCZT3Fz0BnGm7SsS9jy0waJoSge507dcSisDup5h/ABso0CdkDfrqsEIs
         iQmy0vR3t8Ph4qtrPcZaOd905M50h8l7YslYTD8KTF2e4AILuC8LTHyz26RanfSIu/eK
         7cVpAw/Rt0X8l7coTYT1FrFQa37DhulX8Bodsp5uj6mwfhl6WawDlnmbZ0DQxH2J66uQ
         Qs55hWz87iVLm7kXT13fPb3nZlmnFkSuzgRdcpYPnSvEjD+A7sHd2uaOk7J+UERhqmHA
         GuLH0ER8fghA+ktwkspHjWiJI/TJ8OuIWep19q/aScDe8vg9dkPSd/d7Zte9ceKjwjrA
         sCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXlY6d84cdDKWem0q3VudkJf3bezWEcgaKMh2EVVNTk=;
        b=D1MLdkPSUZ/qi64F7Er5qELnODDXhwk0m0wqo6WKEKAFKQQjw0IAvBWSZJYPAPa5NT
         bxmccfdmvOGsN+Qcluwol9Gj3IRDVpWJcz0x/2PZKFSBg/8RAELUVqL8k0DcgWKZM1Zb
         8AG6ZRrDVhraBK23AmfCDIA3wNbAo53NZvh+ixoxjRD1LDnE3mnph6FluNecKGPWbOWA
         NE42FgrfscR2jL+DJmvgO8vVqsBt4CR2ul5Ft6cgfB96fXmBmjct9bEaCgMCfioaI26X
         /fsj0Me0E//WG8dnk5aTvrspFvme4n/aeWZVWsebf5ucK2aKknYL2Rr1oD3XFxY22RbU
         6JXw==
X-Gm-Message-State: AFqh2kozAB6pusHcV9/d3kpgh6+2LtiuOSDlu3hPdDe1uP79sb6rDm6d
	1ovgICarHFwQzadr6UYnCNJb6w==
X-Google-Smtp-Source: AMrXdXsJmuXVSoGbM30Ol21fX64ZHpWAegmpYeRztTdbiwGjGch6tL1FmYHfN1pkyNcJ2QozVYDswA==
X-Received: by 2002:a05:600c:35d0:b0:3db:c4c:9224 with SMTP id r16-20020a05600c35d000b003db0c4c9224mr25931357wmq.3.1674563090763;
        Tue, 24 Jan 2023 04:24:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k16-20020a7bc410000000b003d99469ece1sm13200111wmi.24.2023.01.24.04.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:24:50 -0800 (PST)
Message-ID: <81f80190-a05c-5d0d-11b2-a80573b86e1c@linaro.org>
Date: Tue, 24 Jan 2023 13:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-6-herve.codina@bootlin.com>
 <316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
 <20230124104232.183cc9ff@bootlin.com>
 <37a95380-ee68-5c3a-3b96-48cc8b525f19@linaro.org>
 <20230124122347.1a531d0f@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124122347.1a531d0f@bootlin.com>
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

On 24/01/2023 12:23, Herve Codina wrote:
> On Tue, 24 Jan 2023 11:02:52 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 24/01/2023 10:42, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, 17 Jan 2023 12:31:09 +0100
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>   
>>>> On 13/01/2023 11:37, Herve Codina wrote:  
>>>>> Add support for the QMC (QUICC Multichannel Controller)
>>>>> available in some PowerQUICC SoC such as MPC885 or MPC866.
>>>>>
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> ---
>>>>>  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 164 ++++++++++++++++++
>>>>>  1 file changed, 164 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3ec52f1635c8
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
>>>>> @@ -0,0 +1,164 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qmc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Herve Codina <herve.codina@bootlin.com>
>>>>> +
>>>>> +description: |
>>>>> +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within
>>>>> +  one serial controller using the same TDM physical interface routed from
>>>>> +  TSA.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - fsl,mpc885-scc-qmc
>>>>> +          - fsl,mpc866-scc-qmc
>>>>> +      - const: fsl,cpm1-scc-qmc
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: SCC (Serial communication controller) register base
>>>>> +      - description: SCC parameter ram base
>>>>> +      - description: Dual port ram base
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: scc_regs
>>>>> +      - const: scc_pram
>>>>> +      - const: dpram
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +    description: SCC interrupt line in the CPM interrupt controller
>>>>> +
>>>>> +  fsl,tsa:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description: phandle to the TSA
>>>>> +
>>>>> +  fsl,tsa-cell-id:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [1, 2, 3]
>>>>> +    description: |
>>>>> +      TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
>>>>> +       - 1: SCC2
>>>>> +       - 2: SCC3
>>>>> +       - 3: SCC4    
>>>>
>>>> Is this used as argument to tsa? If so, this should be part of fsl,tsa
>>>> property, just like we do for all syscon-like phandles.  
>>>
>>> Yes, indeed.
>>> I will move 'fsl,tsa' to 'fsl,tsa-cell' with 'fsl,tsa-cell' a phandle/number
>>> pair (the phandle to TSA node and the TSA cell id to use)  
>>
>> Move to fsl,tsa, not from.
> 
> Well, I plan to remove both fsl,tsa and fsl,tsa-cell-id and use this:
>   fsl,tsa-cell:
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     items:
>       - items:
>           - description: phandle to TSA node
>           - enum: [1, 2, 3]
>             description: |
>               TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
>                - 1: SCC2
>                - 2: SCC3
>                - 3: SCC4
>     description:
>       Should be a phandle/number pair. The phandle to TSA node and the TSA
>       cell ID to use.
> 
> Is that what you were thinking about ?

Yes, except again, so third time, why calling this "cell"? Move it to
fsl,tsa.

Best regards,
Krzysztof

